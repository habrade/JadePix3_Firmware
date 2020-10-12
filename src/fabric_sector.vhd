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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

use work.jadepix_defines.all;


entity fabric_sector is
  port(
    fifo_read_en_v : in  std_logic_vector(SECTOR_NUM-1 downto 0);
    blk_select     : in  std_logic_vector(BLK_SELECT_WIDTH-1 downto 0);
    FIFO_READ_EN   : out std_logic
    );
end fabric_sector;

architecture behv of fabric_sector is
begin

  process(all)
  begin
    case blk_select is
      when "00"   => FIFO_READ_EN <= fifo_read_en_v(0);
      when "01"   => FIFO_READ_EN <= fifo_read_en_v(1);
      when "10"   => FIFO_READ_EN <= fifo_read_en_v(2);
      when "11"   => FIFO_READ_EN <= fifo_read_en_v(3);
      when others => FIFO_READ_EN <= '0';
    end case;
  end process;

end behv;
