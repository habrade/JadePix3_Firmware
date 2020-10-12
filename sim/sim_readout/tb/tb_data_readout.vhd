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


entity tb_data_readout is
end entity;

architecture behv of tb_data_readout is
  signal clk : std_logic := '1';
  signal rst : std_logic := '0';

  signal clk_cache       : std_logic := '0';
  signal clk_cache_delay : std_logic := '0';

  signal frame_num : std_logic_vector(FRAME_CNT_WIDTH-1 downto 0) := (others => '0');
  signal row       : std_logic_vector(ROW_WIDTH-1 downto 0)       := "000000001";

  signal VALID_IN : std_logic_vector(SECTOR_NUM-1 downto 0) := (others => '0');
  signal DATA_IN  : std_logic_vector(7 downto 0)            := (others => '0');

  signal FIFO_READ_EN : std_logic;
  signal BLK_SELECT   : std_logic_vector(BLK_SELECT_WIDTH-1 downto 0) := "00";
  signal INQUIRY      : std_logic_vector(BLK_SELECT_WIDTH-1 downto 0) := "00";

  constant SYS_PERIOD : time := 12 ns;

  signal clk_cache_cnt : integer range 0 to 15 := 0;

  procedure gen_valid(
    signal clk_cache     : in  std_logic;
    constant delay_num   : in  real;
    constant valid_num   : in  integer;
    constant channel     : in  integer;
    signal fifo_valid_in : out std_logic_vector(SECTOR_NUM-1 downto 0)) is
  begin
    fifo_valid_in(channel) <= '0';
    wait on clk_cache until clk_cache = '1';
    wait for delay_num*SYS_PERIOD;

	if valid_num > 0 then
      fifo_valid_in(channel) <= '1';
	end if;

    wait for valid_num*SYS_PERIOD;
    fifo_valid_in(channel) <= '0';
  end procedure;

begin

  clk <= not clk after SYS_PERIOD/2;

  process (all)
  begin
    if rising_edge(clk) then
      if clk_cache_cnt = 15 then
        clk_cache_cnt <= 0;
        clk_cache     <= '1';
      else
        clk_cache_cnt <= clk_cache_cnt + 1;
        clk_cache     <= '0';
      end if;
    end if;
  end process;

  gen_clk_cache_delay : entity work.gen_clk_cache_delay
    port map(
      clk => clk,
      rst => rst,

      hitmap_en  => '0',
      hitmap_num => "0000",

      clk_cache       => clk_cache,
      clk_cache_delay => clk_cache_delay
      );


  jadepix_read_data : entity work.jadepix_read_data
    port map(

      clk => clk,
      rst => rst,

      clk_cache       => clk_cache,
      clk_cache_delay => clk_cache_delay,

      frame_num => frame_num,
      row       => row,

      VALID_IN => VALID_IN,
      DATA_IN  => DATA_IN,

      FIFO_READ_EN => FIFO_READ_EN,
      BLK_SELECT   => BLK_SELECT,
      INQUIRY      => INQUIRY
      );


  main : process
  begin
    wait for 2*SYS_PERIOD;
    gen_pulse(rst, 2 * SYS_PERIOD, "Reset ipbus pulse");

    -- channel 0
    gen_valid(clk_cache, 2.0, 6, 0, VALID_IN);
    gen_valid(clk_cache, 0.0, 0, 0, VALID_IN);
    gen_valid(clk_cache, 0.0, 30, 0, VALID_IN);
    gen_valid(clk_cache, 1.0, 14, 0, VALID_IN);

    -- channel 1
    gen_valid(clk_cache, 1.0, 14, 1, VALID_IN);

    wait for 200*SYS_PERIOD;
    std.env.stop;
  end process;

end architecture behv;
