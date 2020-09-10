----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/16/2020 08:41:41 PM
-- Design Name: 
-- Module Name: jadepix_ctrl - behv
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

use work.jadepix_defines.all;


entity jadepix_ctrl is
  port(
    clk : in std_logic;
    rst : in std_logic;

    cfg_start : in std_logic;
    rs_start  : in std_logic;
    gs_start  : in std_logic;

    RA    : out std_logic_vector(ROW_WIDTH-1 downto 0);
    RA_EN : out std_logic;
    CA    : out std_logic_vector(COL_WIDTH-1 downto 0);
    CA_EN : out std_logic;

    CON_SELM : out std_logic;
    CON_SELP : out std_logic;
    CON_DATA : out std_logic;

    -- chip config fifo
    cfg_sync       : in  jadepix_cfg;
    cfg_fifo_rst   : in  std_logic;
    cfg_busy       : out std_logic;
    cfg_fifo_empty : out std_logic;
    cfg_fifo_pfull : out std_logic;
    cfg_fifo_count : out std_logic_vector(16 downto 0);

    digsel_en_rs : out std_logic;
    anasel_en_gs : out std_logic;

    -- Rolling shutter
    rs_busy         : out std_logic;
    rs_frame_number : in  std_logic_vector(31 downto 0);

    HIT_RST     : out std_logic;
    RD_EN       : out std_logic;
    MATRIX_GRST : out std_logic;


    clk_cache     : in std_logic;
    clk_cache_rst : in std_logic;

    hitmap_col_low  : in std_logic_vector(COL_WIDTH-1 downto 0);
    hitmap_col_high : in std_logic_vector(COL_WIDTH-1 downto 0);
    hitmap_en       : in std_logic;
    hitmap_num      : in std_logic_vector(3 downto 0);
--    MATRIX_DIN : in std_logic_vector(15 downto 0);

    -- Global shutter
    aplse_gs    : out std_logic;
    dplse_gs    : out std_logic;
    gshutter_gs : out std_logic;

    gs_busy : out std_logic;

    gs_sel_pulse : in std_logic;
    gs_col       : in std_logic_vector(COL_WIDTH-1 downto 0);

    gs_pulse_delay_cnt      : in std_logic_vector(8 downto 0);
    gs_pulse_width_cnt_low  : in std_logic_vector(31 downto 0);
    gs_pulse_width_cnt_high : in std_logic_vector(1 downto 0);
    gs_pulse_deassert_cnt   : in std_logic_vector(8 downto 0);
    gs_deassert_cnt         : in std_logic_vector(8 downto 0)

    );
end jadepix_ctrl;

architecture behv of jadepix_ctrl is

  type JADEPIX_STATE is (IDLE,
                         CFG_GO, CFG_GET_DATA, CFG_EN_DATA, CFG_EN_SEL, CFG_DIS_SEL, CFG_NEXT_PIX, CFG_STOP,
                         RS_GO, RS_SET_ROW, RS_RD_EN, RS_SET_COL, RS_HOLD_COL,
                         RS_HITMAP_START, RS_HITMAP, RS_HITMAP_END_COL, RS_HITMAP_NEXT_COL, RS_HITMAP_STOP,
                         RS_HIT_RST, RS_END_ROW, RS_NEXT_ROW, RS_DIE,
                         GS_GO, GS_PULSE_DELAY, GS_PULSE_WIDTH, GS_PULSE_DEASSERT, GS_DEASSERT, GS_STOP);
  signal state_reg, state_next : JADEPIX_STATE;

  signal rs_finished : std_logic;

  -- FIFO
  signal empty, prog_full, fifo_rst : std_logic;
  signal cfg_dout                   : std_logic_vector(2 downto 0);
  signal cfg_rd_en, cfg_dout_valid  : std_logic;
  signal pix_cnt                    : integer range 0 to (N_ROW * N_COL - 1) := 0;
  signal cfg_cnt                    : integer range 0 to JADEPIX_CFG_CNT_MAX := 0;

  -- RS
  signal rs_frame_cnt              : integer range 0 to integer'high                 := 0;
  signal rs_cnt                    : integer range 0 to JADEPIX_RS_CNT_MAX           := 0;
  signal rs_hitmap_cnt             : integer range 0 to JADEPIX_HITMAP_CNT_MAX       := 0;
  signal hitmap_cnt                : integer range 0 to (JADEPIX_HITMAP_CHN_MAX + 1) := 0;
  signal hitmap_num_int            : integer range 0 to JADEPIX_HITMAP_CHN_MAX       := 0;
  -- Hitmap
  signal CE                        : std_logic;
  -- GS
  signal gs_width_counter          : unsigned(33 downto 0);
  signal gs_pulse_delay_counter    : unsigned(8 downto 0);
  signal gs_pulse_deassert_counter : unsigned(8 downto 0);
  signal gs_deassert_counter       : unsigned(8 downto 0);
  signal pulse_out                 : std_logic;
  signal is_gs                     : std_logic;

  -- DEBUG
  attribute mark_debug                   : string;
  attribute mark_debug of cfg_fifo_empty : signal is "true";
  attribute mark_debug of cfg_fifo_pfull : signal is "true";
  attribute mark_debug of fifo_rst       : signal is "true";
  attribute mark_debug of cfg_fifo_count : signal is "true";
  attribute mark_debug of cfg_sync       : signal is "true";
  attribute mark_debug of CON_SELM       : signal is "true";
  attribute mark_debug of CON_SELP       : signal is "true";
  attribute mark_debug of CON_DATA       : signal is "true";
  attribute mark_debug of RA             : signal is "true";
  attribute mark_debug of CA             : signal is "true";
  attribute mark_debug of RA_EN          : signal is "true";
  attribute mark_debug of CA_EN          : signal is "true";
  attribute mark_debug of state_next     : signal is "true";
  attribute mark_debug of state_reg      : signal is "true";
  attribute mark_debug of cfg_rd_en      : signal is "true";
  attribute mark_debug of cfg_dout       : signal is "true";
  attribute mark_debug of cfg_dout_valid : signal is "true";
  attribute mark_debug of pix_cnt        : signal is "true";
  attribute mark_debug of cfg_cnt        : signal is "true";
  attribute mark_debug of rs_cnt         : signal is "true";
  attribute mark_debug of cfg_busy       : signal is "true";
  attribute mark_debug of rs_busy        : signal is "true";
  attribute mark_debug of cfg_start      : signal is "true";
  attribute mark_debug of rs_start       : signal is "true";
  attribute mark_debug of gs_start       : signal is "true";
  attribute mark_debug of HIT_RST        : signal is "true";
  attribute mark_debug of RD_EN          : signal is "true";
  attribute mark_debug of hitmap_num     : signal is "true";

  attribute mark_debug of pulse_out                 : signal is "true";
  attribute mark_debug of gs_deassert_counter       : signal is "true";
  attribute mark_debug of gs_pulse_deassert_counter : signal is "true";
  attribute mark_debug of gs_pulse_delay_counter    : signal is "true";
  attribute mark_debug of gs_width_counter          : signal is "true";

  attribute mark_debug of gs_sel_pulse            : signal is "true";
  attribute mark_debug of gs_col                  : signal is "true";
  attribute mark_debug of aplse_gs                : signal is "true";
  attribute mark_debug of dplse_gs                : signal is "true";
  attribute mark_debug of gshutter_gs             : signal is "true";
  attribute mark_debug of gs_pulse_delay_cnt      : signal is "true";
  attribute mark_debug of gs_pulse_width_cnt_low  : signal is "true";
  attribute mark_debug of gs_pulse_width_cnt_high : signal is "true";
  attribute mark_debug of gs_pulse_deassert_cnt   : signal is "true";
  attribute mark_debug of gs_deassert_cnt         : signal is "true";

begin

  process(all)
  begin
    if rst = '1' then
      dplse_gs <= '0';
      aplse_gs <= '0';
    else
      if gs_sel_pulse = '1' then
        dplse_gs <= pulse_out;
        aplse_gs <= '0';
      else
        dplse_gs <= '0';
        aplse_gs <= pulse_out;
      end if;
    end if;
  end process;


  update_hitmap_num : process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        hitmap_num_int <= 0;
      else
        hitmap_num_int <= to_integer(unsigned(hitmap_num));
      end if;
    end if;
  end process;


  process(clk, rst)
  begin
    if rst = '1' then
      state_reg <= IDLE;
    elsif rising_edge(clk) then
      state_reg <= state_next;
    end if;
  end process;

  process(all)
  begin

    state_next <= state_reg;

    case state_reg is
      when IDLE =>
        if cfg_start = '1' then
          state_next <= CFG_GO;
        elsif rs_start = '1' then
          state_next <= RS_GO;
        elsif gs_start = '1' then
          state_next <= GS_GO;
        else
          state_next <= IDLE;
        end if;

      when CFG_GO =>
        state_next <= CFG_GET_DATA;

      when CFG_GET_DATA =>
        if cfg_dout_valid = '1' then
          state_next <= CFG_EN_DATA;
        else
          state_next <= CFG_GET_DATA;
        end if;

      when CFG_EN_DATA =>
        if cfg_cnt = 2 then
          state_next <= CFG_EN_SEL;
        else
          state_next <= CFG_EN_DATA;
        end if;

      when CFG_EN_SEL =>
        if cfg_cnt = 14 then
          state_next <= CFG_DIS_SEL;
        else
          state_next <= CFG_EN_SEL;
        end if;

      when CFG_DIS_SEL =>
        if cfg_cnt = (JADEPIX_CFG_CNT_MAX) then
          state_next <= CFG_NEXT_PIX;
        else
          state_next <= CFG_DIS_SEL;
        end if;

      when CFG_NEXT_PIX =>
        if cfg_fifo_empty = '1' and cfg_fifo_count = CFG_FIFO_COUNT_ZERO then
          state_next <= CFG_STOP;
        else
          state_next <= CFG_GO;
        end if;

      when CFG_STOP =>
        state_next <= IDLE;

      when RS_GO =>
        state_next <= RS_SET_ROW;

      when RS_SET_ROW =>
        if rs_cnt = 2 then
          state_next <= RS_RD_EN;
        else
          state_next <= RS_SET_ROW;
        end if;

      when RS_RD_EN =>
        state_next <= RS_SET_COL;

      when RS_SET_COL =>
        if rs_cnt = 12 then
          state_next <= RS_HOLD_COL;
          if hitmap_en = '1' then
            state_next <= RS_HITMAP_START;
          else
            state_next <= RS_HOLD_COL;
          end if;
        else
          state_next <= RS_SET_COL;
        end if;

      when RS_HOLD_COL =>
        if rs_cnt = 14 then
          state_next <= RS_HIT_RST;
        else
          state_next <= RS_HOLD_COL;
        end if;

      when RS_HITMAP_START =>
        state_next <= RS_HITMAP;

      when RS_HITMAP =>
        if rs_hitmap_cnt = JADEPIX_HITMAP_CNT_MAX then
          state_next <= RS_HITMAP_END_COL;
        else
          state_next <= RS_HITMAP;
        end if;

      when RS_HITMAP_END_COL =>
        if hitmap_cnt = hitmap_num_int - 1 then
          state_next <= RS_HITMAP_STOP;
        else
          state_next <= RS_HITMAP_NEXT_COL;
        end if;

      when RS_HITMAP_NEXT_COL =>
        state_next <= RS_HITMAP;

      when RS_HITMAP_STOP =>
        state_next <= RS_HIT_RST;

      when RS_HIT_RST =>
        if rs_cnt = JADEPIX_RS_CNT_MAX then
          state_next <= RS_END_ROW;
        else
          state_next <= RS_HIT_RST;
        end if;

      when RS_END_ROW =>
        if RA = "111111111" then
          if rs_frame_cnt = to_integer(unsigned(rs_frame_number)) or is_gs = '1' then
            state_next <= RS_DIE;
          else
            state_next <= RS_NEXT_ROW;
          end if;
        else
          state_next <= RS_NEXT_ROW;
        end if;

      when RS_NEXT_ROW =>
        state_next <= RS_SET_ROW;

      when RS_DIE =>
        state_next <= IDLE;

      when GS_GO =>
        if gs_pulse_delay_cnt = "000000000" then
          state_next <= GS_PULSE_WIDTH;
        else
          state_next <= GS_PULSE_DELAY;
        end if;

      when GS_PULSE_DELAY =>
        if gs_pulse_delay_counter = unsigned(gs_pulse_delay_cnt) then
          state_next <= GS_PULSE_WIDTH;
        else
          state_next <= GS_PULSE_DELAY;
        end if;

      when GS_PULSE_WIDTH =>
        if gs_width_counter = unsigned((gs_pulse_width_cnt_high & gs_pulse_width_cnt_low)) then
          if gs_pulse_deassert_cnt = "000000000" then
            if gs_deassert_cnt = "000000000" then
              state_next <= GS_STOP;
            else
              state_next <= GS_DEASSERT;
            end if;
          else
            state_next <= GS_PULSE_DEASSERT;
          end if;
        else
          state_next <= GS_PULSE_WIDTH;
        end if;

      when GS_PULSE_DEASSERT =>
        if gs_pulse_deassert_cnt = "000000000" then
          state_next <= GS_STOP;
        else
          if gs_pulse_deassert_counter = unsigned(gs_pulse_deassert_cnt) then
            state_next <= GS_DEASSERT;
          else
            state_next <= GS_PULSE_DEASSERT;
          end if;
        end if;

      when GS_DEASSERT =>
        if gs_deassert_counter = unsigned(gs_deassert_cnt) then
          state_next <= GS_STOP;
        else
          state_next <= GS_DEASSERT;
        end if;

      when GS_STOP =>
        state_next <= RS_GO;

      when others =>
        state_next <= IDLE;
    end case;
  end process;

  process(clk)
  begin
    if rising_edge(clk) then

      case(state_next) is
        when IDLE =>
          RD_EN   <= '0';
          HIT_RST <= '0';

          gshutter_gs <= '0';

          RA_EN <= '0';
          CA_EN <= '0';
          RA    <= (others => '0');
          CA    <= (others => '0');

          cfg_rd_en <= '0';
          cfg_busy  <= '0';
          pix_cnt   <= 0;
          cfg_cnt   <= 0;
          CON_SELM  <= '0';
          CON_SELP  <= '0';
          CON_DATA  <= '0';

          MATRIX_GRST  <= '1';
          digsel_en_rs <= '0';
          anasel_en_gs <= '0';

          rs_hitmap_cnt <= 0;
          rs_frame_cnt  <= 0;

          gs_width_counter          <= (others => '0');
          gs_pulse_delay_counter    <= (others => '0');
          gs_pulse_deassert_counter <= (others => '0');
          gs_deassert_counter       <= (others => '0');

          is_gs <= '0';

          pulse_out <= '0';
          rs_busy   <= '0';

        when CFG_GO =>
          cfg_rd_en   <= '1';
          cfg_busy    <= '1';
          MATRIX_GRST <= '1';

        when CFG_GET_DATA =>
          cfg_rd_en <= '0';

        when CFG_EN_DATA =>
          cfg_cnt <= cfg_cnt + 1;

          RA_EN <= '1';
          CA_EN <= '1';
          RA    <= std_logic_vector(to_unsigned(pix_cnt / N_COL, ROW_WIDTH));
          CA    <= std_logic_vector(to_unsigned(pix_cnt rem N_COL, COL_WIDTH));

          CON_DATA <= cfg_dout(0);

        when CFG_EN_SEL =>
          cfg_cnt  <= cfg_cnt + 1;
          CON_SELM <= cfg_dout(2);
          CON_SELP <= cfg_dout(1);

        when CFG_DIS_SEL =>
          cfg_cnt  <= cfg_cnt + 1;
          CON_SELM <= '0';
          CON_SELP <= '0';

        when CFG_NEXT_PIX =>
          pix_cnt  <= pix_cnt + 1;
          cfg_cnt  <= 0;
          CON_DATA <= '0';
          RA_EN    <= '0';
          CA_EN    <= '0';
          RA       <= (others => '0');
          CA       <= (others => '0');

        when CFG_STOP =>
          RA_EN       <= '0';
          CA_EN       <= '0';
          RA          <= (others => '0');
          CA          <= (others => '0');
          cfg_rd_en   <= '0';
          cfg_busy    <= '0';
          pix_cnt     <= 0;
          cfg_cnt     <= 0;
          CON_SELM    <= '0';
          CON_SELP    <= '0';
          CON_DATA    <= '0';
          MATRIX_GRST <= '0';

        when RS_GO =>
          rs_busy      <= '1';
          RA           <= (others => '0');
          digsel_en_rs <= '1';

        when RS_SET_ROW =>
          RA_EN        <= '1';
          rs_cnt       <= rs_cnt + 1;
          rs_frame_cnt <= rs_frame_cnt + 1;

        when RS_RD_EN =>
          RD_EN <= '1';

        when RS_SET_COL =>
          rs_cnt <= rs_cnt + 1;

        when RS_HOLD_COL =>
          rs_cnt <= rs_cnt + 1;

        when RS_HITMAP_START =>
          CA_EN <= '1';
          CA    <= hitmap_col_low;

        when RS_HITMAP =>
          rs_hitmap_cnt <= rs_hitmap_cnt + 1;

        when RS_HITMAP_END_COL =>
          rs_hitmap_cnt <= 0;

        when RS_HITMAP_NEXT_COL =>
          CA         <= std_logic_vector(unsigned (CA) + 1);
          hitmap_cnt <= hitmap_cnt + 1;

        when RS_HITMAP_STOP =>
          hitmap_cnt <= 0;
          CA_EN      <= '0';
          CA         <= (others => '0');

        when RS_HIT_RST =>
          rs_cnt  <= rs_cnt + 1;
          RD_EN   <= '0';
          HIT_RST <= '1';

        when RS_END_ROW =>
          HIT_RST <= '0';
          RA_EN   <= '0';

        when RS_NEXT_ROW =>
          rs_cnt <= 0;
          RA     <= std_logic_vector(unsigned (RA) + 1);

        when RS_DIE =>
          rs_cnt       <= 0;
          rs_busy      <= '0';
          RA           <= (others => '0');
          digsel_en_rs <= '0';
          rs_frame_cnt <= 0;
          is_gs        <= '0';

        when GS_GO =>
          CA           <= gs_col;
          anasel_en_gs <= '1';
          gs_busy      <= '1';
          is_gs        <= '1';
          MATRIX_GRST  <= '0';

        when GS_PULSE_DELAY =>
          gshutter_gs            <= '1';
          gs_pulse_delay_counter <= gs_pulse_delay_counter + 1;

        when GS_PULSE_WIDTH =>
          gshutter_gs      <= '1';
          gs_width_counter <= gs_width_counter + 1;
          pulse_out        <= '1';

        when GS_PULSE_DEASSERT =>
          gs_pulse_deassert_counter <= gs_pulse_deassert_counter + 1;
          pulse_out                 <= '0';

        when GS_DEASSERT =>
          gs_deassert_counter <= gs_deassert_counter + 1;
          pulse_out           <= '0';
          gshutter_gs         <= '0';

        when GS_STOP =>
          pulse_out    <= '0';
          anasel_en_gs <= '0';
          gshutter_gs  <= '0';

          gs_busy <= '0';

          gs_width_counter          <= (others => '0');
          gs_pulse_delay_counter    <= (others => '0');
          gs_pulse_deassert_counter <= (others => '0');
          gs_deassert_counter       <= (others => '0');

          CA <= (others => '0');

        when others => null;
      end case;
    end if;
  end process;


  fifo_rst_gen : process(clk)
  begin
    if rising_edge(clk) then
      fifo_rst <= rst or cfg_fifo_rst;
    end if;
  end process;

  conf_fifo : entity work.fifo_generator_0
    port map (
      clk        => clk,
      srst       => fifo_rst,
      din        => cfg_sync.din,
      wr_en      => cfg_sync.wr_en,
      rd_en      => cfg_rd_en,
      dout       => cfg_dout,
      full       => open,
      empty      => cfg_fifo_empty,
      valid      => cfg_dout_valid,
      data_count => cfg_fifo_count,
      prog_full  => cfg_fifo_pfull
      );

end behv;
