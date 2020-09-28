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


entity tb_fifo_monitor is
end entity;

architecture behv of tb_fifo_monitor is


  signal clk : std_logic := '1';
  signal rst : std_logic := '0';

  signal clk_cache : std_logic := '0';

  signal fifo_index_in : integer := 0;

  signal fifo_valid_in  : std_logic := '0';
  signal fifo_counters  : sector_counters;
  signal fifo_status    : sector_status;
  signal fifo_read_en   : std_logic := '0';
  signal fifo_index_out : std_logic_vector(BLK_SELECT_WIDTH-1 downto 0);

  constant SYS_PERIOD : time := 12 ns;

  signal clk_cache_cnt : integer range 0 to 15 := 0;

  procedure gen_valid(
    signal clk_cache     : in  std_logic;
    constant delay_num   : in  real;
    constant valid_num   : in  integer;
    signal fifo_valid_in : out std_logic) is
  begin
    wait on clk_cache until clk_cache = '1';
    wait for delay_num*SYS_PERIOD;
    fifo_valid_in <= '1';
    wait for valid_num*SYS_PERIOD;
    fifo_valid_in <= '0';
  end procedure;

begin

  clk       <= not clk       after SYS_PERIOD/2;

  process (all) begin
	if rising_edge(clk) then
		if clk_cache_cnt = 15 then
			clk_cache_cnt <= 0;
			clk_cache <= '1';
		else
			clk_cache_cnt <= clk_cache_cnt + 1;
			clk_cache <= '0';
		end if;
	end if;
  end process;

  -- clk_cache <= not clk_cache after 16*SYS_PERIOD/2;

  fifo_monitor_index : entity work.jadepix_fifo_monitor
    port map(
      clk            => clk,
      rst            => rst,
      clk_cache      => clk_cache,
      fifo_index_in  => fifo_index_in,
      FIFO_READ_EN   => fifo_read_en,
      fifo_valid_in  => fifo_valid_in,
      fifo_counters  => fifo_counters,
      fifo_status    => fifo_status,
      fifo_index_out => fifo_index_out
      );

  main : process
  begin
    wait for 2*SYS_PERIOD;
    gen_pulse(rst, 2 * SYS_PERIOD, "Reset ipbus pulse");

    gen_valid(clk_cache, 2.2, 6, fifo_valid_in);
    gen_valid(clk_cache, 0.0, 32, fifo_valid_in);

	
	wait on clk_cache until clk_cache='1';
	wait for 8.8*SYS_PERIOD;
	fifo_valid_in <= '1';
	wait for 4*SYS_PERIOD;
	fifo_valid_in <= '0';
	

    gen_valid(clk_cache, 0.8, 14, fifo_valid_in);


    wait for 4*SYS_PERIOD;

    fifo_read_en <= '1';
    wait for 1*SYS_PERIOD;
    fifo_read_en <= '0';
    wait for 1*SYS_PERIOD;
    fifo_read_en <= '1';
    wait for 1*SYS_PERIOD;
    fifo_read_en <= '0';
    wait for 3*SYS_PERIOD;
    fifo_read_en <= '1';
    wait for 1*SYS_PERIOD;
    fifo_read_en <= '0';
    wait for 1*SYS_PERIOD;
    fifo_read_en <= '1';
    wait for 1*SYS_PERIOD;
    fifo_read_en <= '0';
    wait for 2*SYS_PERIOD;
    fifo_read_en <= '1';
    wait for 1*SYS_PERIOD;
    fifo_read_en <= '0';
    wait for 2*SYS_PERIOD;

    wait for 10*SYS_PERIOD;
    std.env.stop;


  end process;


end behv;
