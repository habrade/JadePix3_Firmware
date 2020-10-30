----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/17/2020 01:37:44 PM
-- Design Name: 
-- Module Name: jadepix_status_buffer - behv
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
--use IEEE.NUMERIC_STD.all;
use IEEE.NUMERIC_STD_unsigned.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

use work.jadepix_defines.all;

entity jadepix_status_buffer is
  port(
    clk : in std_logic;
    rst : in std_logic;

    -- Buffer write
    buffer_w_en       : in std_logic;
    frame_num         : in std_logic_vector(FRAME_CNT_WIDTH-1 downto 0);
    row               : in std_logic_vector(ROW_WIDTH-1 downto 0);
    sector_counters_v : in sector_counters_v (SECTOR_NUM-1 downto 0);

    -- Buffer read
    buffer_read_en    : in  std_logic;
    buffer_data_valid : out std_logic;
    buffer_data_flat  : out std_logic_vector(BUFFER_DATA_FRAME_WIDTH-1 downto 0);

    -- Buffer status
    buffer_empty      : out std_logic;
    buffer_empty_next : out std_logic;
    buffer_full       : out std_logic;
    buffer_full_next  : out std_logic;
    -- The number of elements in the FIFO
    buffer_fill_count : out integer range BUFFER_DATA_DEPTH - 1 downto 0

    );
end jadepix_status_buffer;

architecture behv of jadepix_status_buffer is

  type BUF_STATE is (INITIAL, IDLE, W_RECORD);

  signal state_reg, state_next : BUF_STATE;

  signal wr_en   : std_logic;
  signal wr_data : std_logic_vector(BUFFER_DATA_FRAME_WIDTH-1 downto 0);
  signal rd_en   : std_logic;

  signal buf_cnt : integer range 0 to BUFFER_DATA_DEPTH := 0;

  signal rbof : std_logic_vector(RBOF_WIDTH-1 downto 0) := (others => '0');

  signal row_in_data   : std_logic_vector(ROW_WIDTH-1 downto 0)       := (others => '0');
  signal frame_in_data : std_logic_vector(FRAME_CNT_WIDTH-1 downto 0) := (others => '0');

  signal buffer_full_reg : std_logic := '0';

  -- DEBUG
  attribute mark_debug                      : string;
  attribute mark_debug of state_reg         : signal is "true";
  attribute mark_debug of state_next        : signal is "true";
  attribute mark_debug of buffer_read_en    : signal is "true";
  attribute mark_debug of buffer_data_valid : signal is "true";
  attribute mark_debug of buffer_data_flat  : signal is "true";
  attribute mark_debug of buffer_w_en       : signal is "true";
  attribute mark_debug of frame_num         : signal is "true";
  attribute mark_debug of row               : signal is "true";
  attribute mark_debug of sector_counters_v : signal is "true";
  attribute mark_debug of buffer_empty      : signal is "true";
  attribute mark_debug of buffer_full       : signal is "true";
  attribute mark_debug of buffer_fill_count : signal is "true";


begin

	row_in_data <= row - 1;             -- Write operation happens at next row

  process(all)
  begin  
	if row_in_data = N_ROW-1 and frame_num > 0 then
      frame_in_data <= frame_num - 1;
    else
      frame_in_data <= frame_num;
    end if;
  end process;

  wr_en   <= '0' when buffer_full else buffer_w_en;
  wr_data <= frame_in_data &
             row_in_data &
             sector_counters_v(0).valid_counter & sector_counters_v(0).overflow_counter &
             sector_counters_v(1).valid_counter & sector_counters_v(1).overflow_counter &
             sector_counters_v(2).valid_counter & sector_counters_v(2).overflow_counter &
             sector_counters_v(3).valid_counter & sector_counters_v(3).overflow_counter &
             rbof;

  rd_en <= buffer_read_en;

  buffer_full <= buffer_full_reg;

  process(all)
  begin
    if ?? rst then
      rbof <= (others => '0');
    elsif falling_edge(clk) then
      if buffer_full_reg and buffer_w_en then
        rbof <= rbof + 1;
      end if;
    end if;
  end process;


  ring_buffer : entity work.ring_buffer
    generic map (
      RAM_WIDTH => BUFFER_DATA_FRAME_WIDTH,
      RAM_DEPTH => BUFFER_DATA_DEPTH
      )
    port map (
      clk => clk,
      rst => rst,

      -- Write port
      wr_en   => wr_en,
      wr_data => wr_data,

      -- Read port
      rd_en    => rd_en,
      rd_valid => buffer_data_valid,
      rd_data  => buffer_data_flat,

      -- Flags
      empty      => buffer_empty,
      empty_next => buffer_empty_next,
      full       => buffer_full_reg,
      full_next  => buffer_full_next,

      -- The number of elements in the FIFO
      fill_count => buffer_fill_count
      );


end behv;
