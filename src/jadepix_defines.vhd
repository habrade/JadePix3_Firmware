----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/16/2020 08:46:22 PM
-- Design Name: 
-- Module Name: jadepix_defines - behv
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

--use IEEE.MATH_REAL.ALL;
--use ieee.std_logic_arith.all;

package JADEPIX_DEFINES is

  constant N_ROW     : integer := 512;
  constant N_COL     : integer := 192;
  constant ROW_WIDTH : integer := 9;
  constant COL_WIDTH : integer := 9;

  constant DACCLK_PERIOD      : real := 20.0;  -- unit: ns
  constant JADEPIX_SYS_PERIOD : real := 50.0;  -- unit: ns
  constant JADEPIX_REF_PERIOD : real := 25.0;  -- unit: ns

  constant JADEPIX_CFG_CNT_MAX    : integer := 16;
  constant JADEPIX_RS_CNT_MAX     : integer := 16;
  constant JADEPIX_HITMAP_CNT_MAX : integer := 4;


--  constant JADEPIX_CFG_PERIOD          : real := JADEPIX_SYS_PERIOD * JADEPIX_CFG_CNT_MAX;  -- unit: ns
--  constant JADEPIX_RS_NO_HITMAP_PERIOD : real := JADEPIX_SYS_PERIOD * JADEPIX_RS_CNT_MAX;  -- unit: ns

  type jadepix_cfg is
  record
    wr_en : std_logic;
    din   : std_logic_vector(2 downto 0);
  end record;

  constant JADEPIX_HITMAP_CHN_MAX : integer                                           := 12;  -- COL Address from 340 to 351
  constant HITMAP_NUM_WIDTH       : integer                                           := 4;  -- COL Address from 340 to 351
  constant JADEPIX_CFG_NULL       : jadepix_cfg                                       := ('0', (others => '0'));
  constant CFG_FIFO_COUNT_WITDH   : integer                                           := 17;
  constant CFG_FIFO_COUNT_ZERO    : std_logic_vector(CFG_FIFO_COUNT_WITDH-1 downto 0) := (others       => '0');
  constant JADEPIX_SUBSECTOR_NUM  : integer                                           := 16;

  -- FIFO in chip
  constant FIFO_DEPTH      : integer := 48;
  constant FIFO_STATUS_TH1 : integer := FIFO_DEPTH*1/4;
  constant FIFO_STATUS_TH2 : integer := FIFO_DEPTH*2/4;
  constant FIFO_STATUS_TH3 : integer := FIFO_DEPTH*3/4;

  constant DATA_MAX_PER_VALID : integer := 3;
  constant VALID_MAX          : integer := 16;
  constant FIFO_OVERFLOW_MAX  : integer := 31;  -- Because the width is set to 5, val = 2**5 - 1, not sure this value should be set like this.

  -- DATA readout
  constant BLK_SELECT_WIDTH        : integer := 2;
  constant SECTOR_NUM              : integer := 2**BLK_SELECT_WIDTH;
  constant VC_WIDTH                : integer := 5;
  constant OC_WIDTH                : integer := 5;
  constant FRAME_CNT_WIDTH         : integer := 22;
  constant RBOF_WIDTH              : integer := 15;
  constant BUFFER_DATA_FRAME_WIDTH : integer := FRAME_CNT_WIDTH + ROW_WIDTH + (SECTOR_NUM*(VC_WIDTH+OC_WIDTH)) + RBOF_WIDTH;
  constant BUFFER_DATA_DEPTH_WIDTH : integer := 8;
  constant BUFFER_DATA_DEPTH       : integer := 192;

  -- IPbus reg fifo slave
  constant WFIFO_ADDR_SLOW_CTRL_CMD : integer := 0;
  constant RFIFO_ADDR_DATA_FIFO     : integer := 0;

  type sector_counters is
  record
    valid_counter    : std_logic_vector(VC_WIDTH-1 downto 0);
    overflow_counter : std_logic_vector(OC_WIDTH-1 downto 0);
  end record;

  type sector_counters_v is array(natural range <>) of sector_counters;
  type sector_status_v is array(natural range <>) of std_logic_vector;

  type buffer_data_frame is
  record
    frame_num : std_logic_vector(FRAME_CNT_WIDTH-1 downto 0);
    row       : std_logic_vector(ROW_WIDTH-1 downto 0);
    sectors   : sector_counters_v (SECTOR_NUM-1 downto 0);
    rbof      : std_logic_vector(RBOF_WIDTH-1 downto 0);
  end record;

end JADEPIX_DEFINES;

