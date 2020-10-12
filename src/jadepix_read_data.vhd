----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/15/2020 08:13:03 PM
-- Design Name: 
-- Module Name: jadepix_read_data - behv
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

use work.jadepix_defines.all;


entity jadepix_read_data is
  port (
    clk : in std_logic;
    rst : in std_logic;

    clk_cache       : in std_logic;
    clk_cache_delay : in std_logic;
    frame_num       : in std_logic_vector(FRAME_CNT_WIDTH-1 downto 0);
    row             : in std_logic_vector(ROW_WIDTH-1 downto 0);

    VALID_IN : in std_logic_vector(SECTOR_NUM-1 downto 0);
    DATA_IN  : in std_logic_vector(7 downto 0);

    FIFO_READ_EN : out std_logic;
    BLK_SELECT   : out std_logic_vector(BLK_SELECT_WIDTH-1 downto 0);
    INQUIRY      : out std_logic_vector(BLK_SELECT_WIDTH-1 downto 0)
    );

end jadepix_read_data;

architecture behv of jadepix_read_data is
  signal fifo_read_en_reg : std_logic;
  signal fifo_read_en_v   : std_logic_vector(SECTOR_NUM-1 downto 0);
  signal blk_select_reg   : std_logic_vector(BLK_SELECT_WIDTH-1 downto 0);

--  signal sectors_readout_num : sector_readout_num_v(SECTOR_NUM-1 downto 0);
  signal sectors_row_read_end : std_logic;

--      signal is_fifo_writing_v  : boolean_vector(SECTOR_NUM-1 downto 0);

  signal sectors_counters : sector_counters_v (SECTOR_NUM-1 downto 0);
  signal fifo_status      : sector_status_v (SECTOR_NUM-1 downto 0);

--  signal blk_index : std_logic_vector(BLK_SELECT_WIDTH-1 downto 0);

  signal buffer_read_en    : std_logic;
  signal buffer_data_valid : std_logic;
  signal buffer_data       : std_logic_vector(DATA_FRAME_WIDTH-1 downto 0);

  signal buffer_empty      : std_logic;
  signal buffer_empty_next : std_logic;
  signal buffer_full       : std_logic;
  signal buffer_full_next  : std_logic;
  -- The number of elements in the FIFO
  signal buffer_fill_count : integer range DATA_BUF_DEPTH - 1 downto 0;

  signal buffer_w_en : std_logic;


begin
  FIFO_READ_EN <= fifo_read_en_reg;
  BLK_SELECT   <= blk_select_reg;
  buffer_w_en  <= clk_cache_delay;


  fifo_monitor_wrapper : entity work.fifo_monitor_wrapper
    port map(
      clk                  => clk,
      rst                  => rst,
      clk_cache            => clk_cache,
      fifo_read_en_v       => fifo_read_en_v,
      VALID_IN             => VALID_IN,
      sectors_counters     => sectors_counters,
      fifo_status          => fifo_status
      );

  fifo_read : entity work.jadepix_fifo_read
    port map(
      clk => clk,
      rst => rst,

      buffer_read_en    => buffer_read_en,
      buffer_data_valid => buffer_data_valid,
      buffer_data       => buffer_data,

      buffer_empty      => buffer_empty,
      buffer_empty_next => buffer_empty_next,
      buffer_full       => buffer_full,
      buffer_full_next  => buffer_full_next,
      buffer_fill_count => buffer_fill_count,

      DATA_IN => DATA_IN,

      fifo_read_en_v => fifo_read_en_v,
      BLK_SELECT     => BLK_SELECT,

      INQUIRY => INQUIRY,

      sectors_row_read_end => sectors_row_read_end

      );

  data_buffer : entity work.jadepix_data_buffer
    port map(
      clk => clk,
      rst => rst,

      -- Buffer write
      buffer_w_en      => buffer_w_en,
      sectors_counters => sectors_counters,
      frame_num        => frame_num,
      row              => row,

      -- Buffer read
      buffer_read_en    => buffer_read_en,
      buffer_data_valid => buffer_data_valid,
      buffer_data       => buffer_data,

      -- Buffer status
      buffer_empty      => buffer_empty,
      buffer_empty_next => buffer_empty_next,
      buffer_full       => buffer_full,
      buffer_full_next  => buffer_full_next,
      buffer_fill_count => buffer_fill_count
      );

end behv;
