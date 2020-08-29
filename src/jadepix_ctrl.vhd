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
    apulse_in : in std_logic;
    dpulse_in : in std_logic;

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
    cfg_fifo_count : out std_logic_vector(17 downto 0);

--    MATRIX_DIN : in std_logic_vector(15 downto 0);

--    CACHE_CLK     : out std_logic;
    CACHE_BIT_SEL : out std_logic_vector(3 downto 0);
    HIT_RST       : out std_logic;
    RD_EN         : out std_logic;

    MATRIX_GRST : out std_logic;
    DIGSEL_EN   : out std_logic;
    ANASEL_EN   : out std_logic;
    GSHUTTER    : out std_logic;
    DPLSE       : out std_logic;
    APLSE       : out std_logic

    );
end jadepix_ctrl;

architecture behv of jadepix_ctrl is

  type JADEPIX_STATE is (IDLE, CFG_GO, CFG, RS, GS);
  signal state_reg, state_next : JADEPIX_STATE;

  signal rs_finished : std_logic;

  -- FIFO
  signal empty, prog_full, fifo_rst : std_logic;
  signal cfg_dout                   : std_logic_vector(2 downto 0);
  signal cfg_rd_en, cfg_dout_valid  : std_logic;
  signal pix_cnt                    : integer range 0 to (N_ROW * N_COL - 1);

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
  attribute mark_debug of cfg_busy       : signal is "true";

begin

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
          state_next <= RS;
        elsif gs_start = '1' then
          state_next <= GS;
        else
          state_next <= IDLE;
        end if;

      when CFG_GO =>
        state_next <= CFG;

      when CFG =>
        if cfg_fifo_empty = '1' and cfg_fifo_count = CFG_FIFO_COUNT_ZERO then
          state_next <= IDLE;
        else
          state_next <= CFG;
        end if;

      when RS => null;
      when GS => null;
      when others =>
        state_next <= IDLE;
    end case;
  end process;

  process(clk)
  begin
    if rising_edge(clk) then

      case(state_next) is
        when IDLE =>
          RD_EN       <= '0';
          HIT_RST     <= '0';
          MATRIX_GRST <= '0';
          DIGSEL_EN   <= '0';
          ANASEL_EN   <= '0';
          GSHUTTER    <= '0';
          DPLSE       <= '0';
          APLSE       <= '0';
          RA_EN       <= '0';
          CA_EN       <= '0';
          RA          <= (others => '0');
          CA          <= (others => '0');
          cfg_rd_en   <= '0';
          pix_cnt     <= 0;
          cfg_busy    <= '0';

          CON_SELM <= '0';
          CON_SELP <= '0';
          CON_DATA <= '0';

        when CFG_GO =>
          cfg_rd_en <= '1';

        when CFG =>
          cfg_busy <= '1';
          pix_cnt  <= pix_cnt + 1;
          -- Because FIFO need one clock period to readout, so make a clock period here          
          RA_EN    <= '1';
          CA_EN    <= '1';
          RA       <= std_logic_vector(to_unsigned(pix_cnt / N_COL, ROW_WIDTH));
          CA       <= std_logic_vector(to_unsigned(pix_cnt rem N_COL, COL_WIDTH));

          if cfg_dout_valid = '1' then
            CON_SELM <= cfg_dout(2);
            CON_SELP <= cfg_dout(1);
            CON_DATA <= cfg_dout(0);
          end if;

        when others => null;
      end case;
    end if;
  end process;


  process(clk)
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
