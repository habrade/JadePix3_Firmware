----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/12/2020 03:10:11 PM
-- Design Name: 
-- Module Name: fabric_sector - behv
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

entity fabric_sector is
  port(
    clk : in std_logic;
    rst : in std_logic;

    fifo_read_en_v    : in  std_logic_vector(SECTOR_NUM-1 downto 0);
    sector_counters_v : in  sector_counters_v (SECTOR_NUM-1 downto 0);
    blk_select        : in  std_logic_vector(BLK_SELECT_WIDTH-1 downto 0);
    fifo_read_en      : out std_logic;
    fifo_data_valid   : out std_logic;
    fifo_oc           : out std_logic_vector(OC_WIDTH-1 downto 0)
    );
end fabric_sector;

architecture behv of fabric_sector is
  signal fifo_index : integer := 0;

begin

  fifo_index   <= 0 when blk_select = "ZZ" else to_integer(unsigned(blk_select));
  fifo_read_en <= fifo_read_en_v(fifo_index);
  fifo_oc      <= sector_counters_v(fifo_index).overflow_counter;


  process(all)
  begin
    if rising_edge(clk) then
      if ?? rst then
        fifo_data_valid  <= '0';
      else
        fifo_data_valid  <= fifo_read_en;
      end if;
    end if;
  end process;

end behv;
