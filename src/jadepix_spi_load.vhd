----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/12/2020 06:23:52 PM
-- Design Name: 
-- Module Name: jadepix_spi_load - behv
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

entity jadepix_spi_load is
  port(
    clk           : in std_logic;
    rst           : in std_logic;
    spi_trans_end : in std_logic;
    load_soft     : in std_logic;

    LOAD : out std_logic
    );
end jadepix_spi_load;

architecture behv of jadepix_spi_load is
  signal spi_trans_end_reg1 : std_logic;
  signal spi_trans_end_reg2 : std_logic;

begin

  spi_load_logic : process (clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        LOAD               <= '0';
        spi_trans_end_reg1 <= '0';
        spi_trans_end_reg2 <= '0';
      else
        spi_trans_end_reg1 <= spi_trans_end;
        spi_trans_end_reg2 <= spi_trans_end_reg1;
        LOAD               <= spi_trans_end_reg2 or load_soft;
      end if;
    end if;
  end process;

end behv;
