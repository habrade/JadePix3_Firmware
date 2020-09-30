----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/28/2020 04:38:29 PM
-- Design Name: 
-- Module Name: gen_clk_cache - behv
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


entity gen_clk_cache_delay is
  port(

    clk : in std_logic;
    rst : in std_logic;

    hitmap_en  : in std_logic;
    hitmap_num : in std_logic_vector(HITMAP_NUM_WIDTH-1 downto 0);

    clk_cache : in std_logic;

    clk_cache_delay : out std_logic
    );

end gen_clk_cache_delay;

architecture behv of gen_clk_cache_delay is


  constant n_rs_period : integer := natural(JADEPIX_RS_NO_HITMAP_PERIOD/JADEPIX_SYS_PERIOD);

  signal n_delay_unit : integer                       := n_rs_period;
  signal tmp          : std_logic_vector(64 downto 0) := (others => '0');

begin

  process(all)
  begin
    if hitmap_en = '1' then
      n_delay_unit <= to_integer(unsigned(hitmap_num)*4) + n_rs_period;
    else
      n_delay_unit <= n_rs_period;
    end if;
  end process;

  process(clk)
  begin
    if rising_edge(clk) then
      for i in 0 to (tmp'length-2) loop
        tmp(i+1) <= tmp(i);
      end loop;
      tmp(0) <= clk_cache;
    end if;
  end process;

  process(all)
  begin
    if rst = '1' then
      clk_cache_delay <= '0';
    else
      clk_cache_delay <= tmp(n_delay_unit-1);
    end if;
  end process;

end behv;
