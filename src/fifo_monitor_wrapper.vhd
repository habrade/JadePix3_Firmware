----------------------------------------------------------------------------------
-- Company: CCNU
-- Engineer: s.dong@mails.ccnu.edu.cn
-- 
-- Create Date: 10/08/2020 10:33:43 AM
-- Design Name: 
-- Module Name: fifo_monitor_wrapper - behv
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


entity fifo_monitor_wrapper is
  port(
    clk : in std_logic;
    rst : in std_logic;

    clk_fpga : in std_logic;

    start_cache     : in std_logic;
    clk_cache       : in std_logic;
    clk_cache_delay : in std_logic;
    is_busy_cache   : in std_logic;

    fifo_read_en_v : in std_logic_vector(SECTOR_NUM-1 downto 0);

    VALID_IN : in std_logic_vector(SECTOR_NUM-1 downto 0);

    sector_counters_v : out sector_counters_v(SECTOR_NUM-1 downto 0);
    fifo_status_v     : out sector_status_v(SECTOR_NUM-1 downto 0)(BLK_SELECT_WIDTH-1 downto 0)
    );
end fifo_monitor_wrapper;

architecture behv of fifo_monitor_wrapper is
begin

  fifo_monitor : for index in SECTOR_NUM-1 downto 0 generate
    fifo_monitor_index : entity work.jadepix_fifo_monitor
      port map(
        clk             => clk,
        rst             => rst,
        clk_fpga        => clk_fpga,
        clk_cache       => clk_cache,
        clk_cache_delay => clk_cache_delay,
        start_cache     => start_cache,
        is_busy_cache   => is_busy_cache,
        fifo_read_en    => fifo_read_en_v(index),
        fifo_valid_in   => VALID_IN(index),
        fifo_counters   => sector_counters_v(index),
        fifo_status     => fifo_status_v(index)
        );
  end generate;

end behv;
