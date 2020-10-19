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

    clk_wfifo     : in std_logic;
    clk_wfifo_rst : in std_logic;

    clk_cache       : in std_logic;
    clk_cache_delay : in std_logic;
    frame_num       : in std_logic_vector(FRAME_CNT_WIDTH-1 downto 0);
    row             : in std_logic_vector(ROW_WIDTH-1 downto 0);

    VALID_IN : in std_logic_vector(SECTOR_NUM-1 downto 0);
    DATA_IN  : in std_logic_vector(7 downto 0);

    FIFO_READ_EN : out std_logic;
    BLK_SELECT   : out std_logic_vector(BLK_SELECT_WIDTH-1 downto 0);
    INQUIRY      : out std_logic_vector(BLK_SELECT_WIDTH-1 downto 0);

    -- DATA FIFO
    data_fifo_rst    : out std_logic;
    data_fifo_wr_clk : out std_logic;
    data_fifo_wr_en  : out std_logic;
    data_fifo_wr_din : out std_logic_vector(31 downto 0);
    data_fifo_full   : in  std_logic
    );

end jadepix_read_data;

architecture behv of jadepix_read_data is
--  signal fifo_read_en_reg : std_logic;
  signal fifo_read_en_v : std_logic_vector(SECTOR_NUM-1 downto 0);
  signal blk_select_reg : std_logic_vector(BLK_SELECT_WIDTH-1 downto 0);

  signal sector_counters_v : sector_counters_v (SECTOR_NUM-1 downto 0);
  signal fifo_status_v     : sector_status_v (SECTOR_NUM-1 downto 0)(BLK_SELECT_WIDTH-1 downto 0);

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

  signal fifo_data_valid : std_logic;
  
  signal data_frame : buffer_data_frame;


  signal fifo_oc : std_logic_vector(OC_WIDTH-1 downto 0);
--  signal rbof    : std_logic_vector(RBOF_WIDTH-1 downto 0);

begin
  BLK_SELECT  <= blk_select_reg;
--  FIFO_READ_EN <= fifo_read_en_reg;
  buffer_w_en <= clk_cache_delay;

  fabric_sector : entity work.fabric_sector
    port map(
      clk => clk,
      rst => rst,

      fifo_read_en_v    => fifo_read_en_v,
      sector_counters_v => sector_counters_v,
      blk_select        => blk_select_reg,
      fifo_read_en      => FIFO_READ_EN,
      fifo_data_valid   => fifo_data_valid,
      fifo_oc           => fifo_oc
      );

  fifo_monitor_wrapper : entity work.fifo_monitor_wrapper
    port map(
      clk => clk,
      rst => rst,

      clk_cache         => clk_cache,
      fifo_read_en_v    => fifo_read_en_v,
      VALID_IN          => VALID_IN,
      sector_counters_v => sector_counters_v,
      fifo_status_v     => fifo_status_v
      );

  fifo_status_buffer : entity work.jadepix_status_buffer
    port map(
      clk => clk,
      rst => rst,

      -- Buffer write
      buffer_w_en       => buffer_w_en,
      sector_counters_v => sector_counters_v,
      frame_num         => frame_num,
      row               => row,

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
      
--      rbof => rbof
      );

  fifo_ctrl : entity work.jadepix_fifo_ctrl
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

      fifo_read_en_v => fifo_read_en_v,
      blk_select     => blk_select_reg,

      INQUIRY => INQUIRY,
      
			data_frame        => data_frame

      );

  fifo_data : entity work.jadepix_fifo_data
    port map(
      clk        => clk_wfifo,
      rst        => clk_wfifo_rst,
      blk_select => blk_select,

      data_frame        => data_frame,

--      frame_num     => frame_num,
--      row           => row,
      fifo_status_v => fifo_status_v,
      fifo_oc       => fifo_oc,
--      rbof          => rbof,

      fifo_data_valid => fifo_data_valid,
      DATA_IN         => DATA_IN,

      data_fifo_rst    => data_fifo_rst,
      data_fifo_wr_clk => data_fifo_wr_clk,
      data_fifo_wr_en  => data_fifo_wr_en,
      data_fifo_wr_din => data_fifo_wr_din,
      data_fifo_full   => data_fifo_full
      );


end behv;
