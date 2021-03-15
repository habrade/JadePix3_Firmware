----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/16/2020 12:36:11 PM
-- Design Name: 
-- Module Name: jadepix_fifo_data - behv
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


entity jadepix_fifo_data is
  port (
    clk : in std_logic;
    rst : in std_logic;

    blk_select_delay : in std_logic_vector(BLK_SELECT_WIDTH-1 downto 0);

    buffer_data_record : in buffer_data_frame;

    fifo_status_v : in sector_status_v (SECTOR_NUM-1 downto 0);
    fifo_oc       : in std_logic_vector(OC_WIDTH-1 downto 0);

    fifo_data_valid : in std_logic;
    DATA_IN         : in std_logic_vector(7 downto 0);
    
    is_chip_fifo_readable: out std_logic;

    -- DATA FIFO
    data_fifo_rst         : out std_logic;
    data_fifo_wr_clk      : out std_logic;
    data_fifo_wr_en       : out std_logic;
    data_fifo_wr_din      : out std_logic_vector(31 downto 0);
    data_fifo_full        : in  std_logic;
    data_fifo_almost_full : in  std_logic
    );
end jadepix_fifo_data;

architecture behv of jadepix_fifo_data is

  signal wfifo_ov_cnt : unsigned(22 downto 0)         := (others => '0');
  signal data_send    : std_logic_vector(15 downto 0) := (others => '0');

  type WRITE_FIFO_STATE is (INITIAL, IDLE, W_HEAD, GET_DATA_LOW, W_DATA, W_TAIL, W_ERROR);
  signal state_reg, state_next : WRITE_FIFO_STATE := IDLE;

  constant FRAME_WIDTH : integer                                     := 25;
  constant FRAME_RSV   : std_logic_vector(32-FRAME_WIDTH-1 downto 0) := (others => '0');

  signal read_frame_start : std_logic := '0';
  signal read_frame_stop  : std_logic := '0';

  signal row_in_data        : std_logic_vector(ROW_WIDTH-1 downto 0)       := (others => '0');
  signal frame_in_data      : std_logic_vector(FRAME_CNT_WIDTH-1 downto 0) := (others => '0');
  signal frame_in_data_reg1 : std_logic_vector(FRAME_CNT_WIDTH-1 downto 0) := (others => '0');
  signal frame_in_data_reg2 : std_logic_vector(FRAME_CNT_WIDTH-1 downto 0) := (others => '0');

  -- DEBUG
  attribute mark_debug                          : string;
  attribute mark_debug of read_frame_start      : signal is "true";
  attribute mark_debug of read_frame_stop       : signal is "true";
  attribute mark_debug of blk_select_delay      : signal is "true";
  attribute mark_debug of buffer_data_record    : signal is "true";
  attribute mark_debug of fifo_status_v         : signal is "true";
  attribute mark_debug of fifo_oc               : signal is "true";
  attribute mark_debug of fifo_data_valid       : signal is "true";
  attribute mark_debug of data_fifo_rst         : signal is "true";
  attribute mark_debug of data_fifo_wr_en       : signal is "true";
  attribute mark_debug of data_fifo_wr_din      : signal is "true";
  attribute mark_debug of data_fifo_full        : signal is "true";
  attribute mark_debug of data_fifo_almost_full : signal is "true";
  attribute mark_debug of frame_in_data         : signal is "true";
  attribute mark_debug of frame_in_data_reg1    : signal is "true";
  attribute mark_debug of frame_in_data_reg2    : signal is "true";


begin

  data_fifo_wr_clk <= clk;
  data_fifo_rst    <= rst;

  row_in_data   <= buffer_data_record.row;
  frame_in_data <= buffer_data_record.frame_num;
  
  is_chip_fifo_readable <= not (read_frame_start or read_frame_stop);

  process(all)
  begin
    if ?? rst then
      frame_in_data_reg1 <= (others => '0');
      frame_in_data_reg2 <= (others => '0');
    elsif rising_edge(clk) then
      frame_in_data_reg1 <= frame_in_data;
      frame_in_data_reg2 <= frame_in_data_reg1;
    end if;
  end process;

  process(all)
  begin
    if ?? rst then
      read_frame_start <= '0';
      read_frame_stop  <= '0';
    elsif rising_edge(clk) then
      if frame_in_data > 22X"0" then
        read_frame_stop  <= '1' when (frame_in_data_reg1 > frame_in_data_reg2) else '0';
        read_frame_start <= read_frame_stop;
      end if;
    end if;
  end process;


  process(all)
  begin
    if rst = '1' then
      state_reg <= INITIAL;
    elsif rising_edge(clk) then
      state_reg <= state_next;
    end if;
  end process;

  process(all)
  begin

    state_next <= state_reg;

    case state_reg is
      when INITIAL =>
        state_next <= IDLE;

      when IDLE =>
        if ?? data_fifo_almost_full then
          state_next <= IDLE;
        else
          if ?? read_frame_start then
            state_next <= W_HEAD;
          elsif ?? read_frame_stop then
            state_next <= W_TAIL;
          elsif ?? fifo_data_valid then
            state_next <= GET_DATA_LOW;
          end if;
        end if;

      when W_HEAD =>
        if ?? data_fifo_almost_full then
          state_next <= W_ERROR;
        elsif ?? fifo_data_valid then
          state_next <= GET_DATA_LOW;
        else
          state_next <= IDLE;
        end if;

      when GET_DATA_LOW =>
        state_next <= W_DATA;

      when W_DATA =>
        if ?? data_fifo_almost_full then
          state_next <= W_ERROR;
        elsif ?? fifo_data_valid then
          state_next <= GET_DATA_LOW;
        elsif read_frame_stop then
          state_next <= W_TAIL;
        else
          state_next <= IDLE;
        end if;

      when W_TAIL =>
        if ?? data_fifo_almost_full then
          state_next <= W_ERROR;
        elsif ?? read_frame_start then
          state_next <= W_HEAD;
        else
          state_next <= IDLE;
        end if;

      when W_ERROR =>
        state_next <= IDLE;

      when others =>
        state_next <= IDLE;

    end case;
  end process;

  process(all)
  begin
    if rising_edge(clk) then
      case(state_next) is
        when INITIAL =>
          wfifo_ov_cnt     <= (others => '0');
          data_fifo_wr_en  <= '0';
          data_fifo_wr_din <= (others => '0');

        when IDLE =>
          data_fifo_wr_en  <= '0';
          data_fifo_wr_din <= (others => '0');

        when W_HEAD =>
          data_fifo_wr_en  <= '1';
          data_fifo_wr_din <= FRAME_RSV &
                              "01" &    -- flag
                              fifo_status_v(0) &
                              fifo_status_v(1) &
                              fifo_status_v(2) &
                              fifo_status_V(3) &
                              buffer_data_record.rbof;


        when GET_DATA_LOW =>
          data_fifo_wr_en <= '0';
          data_send       <= 8x"00" & DATA_IN;

        when W_DATA =>
          data_fifo_wr_en  <= '1';
          data_fifo_wr_din <= FRAME_RSV &
                              "10" &    -- flag
                              fifo_oc &
                              blk_select_delay &
                              DATA_IN & data_send(7 downto 0);

        when W_TAIL =>
          data_fifo_wr_en  <= '1';
          data_fifo_wr_din <= FRAME_RSV &
                              "00" &    -- flag
                              "0" &
                              std_logic_vector(unsigned(buffer_data_record.frame_num) - 1);

        when W_ERROR =>
          wfifo_ov_cnt     <= wfifo_ov_cnt + 1;
          data_fifo_wr_en  <= '1';
          data_fifo_wr_din <= FRAME_RSV &
                              "11" &    -- flag 
                              std_logic_vector(wfifo_ov_cnt);

        when others =>
          null;

      end case;
    end if;
  end process;

end behv;
