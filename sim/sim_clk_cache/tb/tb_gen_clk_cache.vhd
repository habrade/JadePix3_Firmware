library IEEE;
use IEEE.STD_LOGIC_1164.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

library uvvm_util;
context uvvm_util.uvvm_util_context;

use work.jadepix_defines.all;


entity tb_gen_clk_cache is
end entity;

architecture behv of tb_gen_clk_cache is

  signal clk : std_logic := '1';
  signal rst : std_logic := '0';

  signal hitmap_en  : std_logic                                     := '0';
  signal hitmap_num : std_logic_vector(HITMAP_NUM_WIDTH-1 downto 0) := "0000";

  signal clk_cache_tmp : std_logic := '0';
  signal clk_cache     : std_logic := '0';

  signal clk_cache_cnt : integer range 0 to 15 := 0;

  constant SYS_PERIOD : time := 12 ns;

begin

  clk <= not clk after SYS_PERIOD/2;

  process (all)
  begin
    if rising_edge(clk) then
      if clk_cache_cnt = 15 then
        clk_cache_cnt <= 0;
        clk_cache_tmp <= '1';
      else
        clk_cache_cnt <= clk_cache_cnt + 1;
        clk_cache_tmp <= '0';
      end if;
    end if;
  end process;

  -- clk_cache <= not clk_cache after 16*SYS_PERIOD/2;

  inst_gen_clk : entity work.gen_clk_cache
    port map(
      clk => clk,
      rst => rst,

      hitmap_en  => hitmap_en,
      hitmap_num => hitmap_num,

      clk_cache_tmp => clk_cache_tmp,
      clk_cache     => clk_cache
      );

  main : process
  begin
    wait for 2*SYS_PERIOD;
    gen_pulse(rst, 2 * SYS_PERIOD, "Reset pulse");

    hitmap_en  <= '0';
    hitmap_num <= "0001";
    wait for 100*SYS_PERIOD;

    hitmap_en <= '1';
    wait for 100*SYS_PERIOD;

    std.env.stop;


  end process;


end behv;
