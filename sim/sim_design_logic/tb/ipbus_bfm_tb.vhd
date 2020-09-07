--========================================================================================================================
-- Copyright (c) 2017 by Bitvis AS.  All rights reserved.

-- You should have received a copy of the license file containing the MIT License (see LICENSE.TXT), if not,
-- contact Bitvis AS <support@bitvis.no>.
--========================================================================================================================
-- Copyright (c) 2019 by Michał Kruszewski. All rights reserved.
--
-- All IPbus Bus Functional Model files are provided with the same MIT License as the rest of the UVVM infrastrucutre.
--=======================================================================================================================
-- UVVM AND ANY PART THEREOF ARE PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
-- WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS
-- OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
-- OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH UVVM OR THE USE OR OTHER DEALINGS IN UVVM.
--========================================================================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--library ipbus;
use work.ipbus.all;
use work.ipbus_trans_decl.all;
use work.ipbus_reg_types.all;

library uvvm_util;
context uvvm_util.uvvm_util_context;

library work;
use work.ipbus_bfm_pkg.all;

use work.global_defines.all;
use work.jadepix_defines.all;

entity ipbus_bfm_tb is
  generic (
    NUM_IPBUS_CTRL_REGISTERS : positive := 4;
    NUM_IPBUS_STAT_REGISTERS : positive := 4
  );
end entity;

architecture behavioral of ipbus_bfm_tb is

  constant CLK_IPB_PERIOD : time := C_IPBUS_USUAL_CLK_PERIOD; -- 31.25 MHz

  signal clk_ipb : std_logic := '0';
  signal rst_ipb : std_logic := '0';

  signal clk_sys : std_logic;
  signal clk_dac_rst, clk_sys_rst : std_logic;

  -- IPbus
  signal nuke, soft_rst: std_logic;

  signal ipbus_transactor_inputs  : t_ipbus_transactor_inputs := C_IPBUS_TRANSACTOR_INPUTS_DEFAULT;
  signal ipbus_transactor_outputs : t_ipbus_transactor_outputs;

  signal ipb_status_regs  : ipb_reg_v(NUM_IPBUS_STAT_REGISTERS-1 downto 0) := (0 => X"FFFFFF00",
                                                                               1 => X"FFFFFF01",
                                                                               2 => X"FFFFFF02",
                                                                               3 => X"FFFFFF03");
  signal ipb_control_regs : ipb_reg_v(NUM_IPBUS_CTRL_REGISTERS-1 downto 0);
  signal ipb_control_stbs : std_logic_vector(NUM_IPBUS_CTRL_REGISTERS-1 downto 0);

  --===============================================================================================
  -- Examples showing how to define IPbus transaction signals.
  --
  -- Note that the direction of ranges for transaction bodyy is "to"!
  --
  -- Unfortunately user has to explicitly define length of the bodyy.
  -- Length of the bodyy always equals to the length of the data user sends + 1.
  -- If you know how to define request transaction signals in more
  -- user friendly way please submit an issue on github!
  -- In case of insufficient bodyy length you will get some error at runtime.
  --===============================================================================================
  signal read_request_transaction : t_ipbus_transaction(bodyy(0 to 0))
         := ipbus_read_transaction(X"00000006", 1);

  constant C_WRITE_DATA : t_ipbus_slv_array(0 to 1)
           := (0 => X"00000007", 1 => X"00000004");
  
  constant C_WRITE_RST : t_ipbus_slv_array(0 to 2)
           := (0 => X"00000000", 1 => X"00000002", 2 => X"00000000");

  constant C_START_RS : t_ipbus_slv_array(0 to 2)
           := (0 => X"00000000", 1 => X"00000002", 2 => X"00000000");

  signal write_rst_transaction : t_ipbus_transaction(bodyy(0 to 3))
         := ipbus_write_transaction(X"00000000", 3, C_WRITE_RST);

  signal start_rs_transaction : t_ipbus_transaction(bodyy(0 to 3))
         := ipbus_write_transaction(X"60000005", 3, C_START_RS);

  signal write_request_transaction : t_ipbus_transaction(bodyy(0 to 2))
         := ipbus_write_transaction(X"00000000", 2, C_WRITE_DATA);

  signal non_inc_read_request_transaction : t_ipbus_transaction(bodyy(0 to 0))
         := ipbus_non_inc_read_transaction(X"00000007", 3);

  constant C_NON_INC_WRITE_DATA : t_ipbus_slv_array(0 to 3)
           := (0 => X"11111111", 1 => X"22222222", 2 => X"33333333", 3 => X"44444444");
  signal non_inc_write_request_transaction : t_ipbus_transaction(bodyy(0 to 4))
         := ipbus_non_inc_write_transaction(X"00000002", 4, C_NON_INC_WRITE_DATA);

  signal rmw_bits_request_transaction : t_ipbus_transaction(bodyy(0 to 2))
         := ipbus_rmw_bits_transaction(X"00000000", X"00000004", X"F0000000");

  signal rmw_sum_request_transaction : t_ipbus_transaction(bodyy(0 to 1))
         := ipbus_rmw_sum_transaction(X"00000003", X"00000003");

  signal response_transaction : t_ipbus_transaction(bodyy(0 to 2));

  -- DAC70004
  signal DACCLK   : std_logic;
  signal DAC_BUSY : std_logic;
  signal DAC_WE   : std_logic;
  signal DAC_DATA : std_logic_vector(31 downto 0);

  -- JadePix
  signal RA    :  std_logic_vector(8 downto 0);
  signal RA_EN :  std_logic;
  signal CA    :  std_logic_vector(8 downto 0);
  signal CA_EN :  std_logic;

  signal CON_SELM :  std_logic;
  signal CON_SELP :  std_logic;
  signal CON_DATA :  std_logic;

  signal CACHE_BIT_SET :  std_logic_vector(3 downto 0);
  signal HIT_RST       :  std_logic;
  signal RD_EN         :  std_logic;

  signal MATRIX_GRST :  std_logic;
  signal DIGSEL_EN   :  std_logic;
  signal ANASEL_EN   :  std_logic;
  signal GSHUTTER    :  std_logic;
  signal DPLSE       :  std_logic;
  signal APLSE       :  std_logic;

  signal PDB  :  std_logic;
  signal LOAD :  std_logic;

  -- SPI Master
  signal ss   :  std_logic_vector(N_SS - 1 downto 0);
  signal mosi :  std_logic;
  signal miso :  std_logic;
  signal sclk :  std_logic;

  signal locked_jadepix_mmcm : std_logic;
  signal cfg_busy            : std_logic;
  signal rs_busy             : std_logic;
  signal cfg_start           : std_logic;
  signal rs_start            : std_logic;
  signal gs_start            : std_logic;
  signal apulse_tmp          : std_logic;
  signal dpulse_tmp          : std_logic;

  signal hitmap_col_low  : std_logic_vector(COL_WIDTH-1 downto 0);
  signal hitmap_col_high : std_logic_vector(COL_WIDTH-1 downto 0);
  signal hitmap_en       : std_logic;
  signal hitmap_num      : std_logic_vector(3 downto 0);


  signal clk_cache     : std_logic;
  signal clk_cache_rst : std_logic;

  -- config FIFO signals
  signal cfg_sync       : jadepix_cfg;
  signal cfg_fifo_rst   : std_logic;
  signal cfg_fifo_empty : std_logic;
  signal cfg_fifo_pfull : std_logic;
  signal cfg_fifo_count : std_logic_vector(CFG_FIFO_COUNT_WITDH-1 downto 0);

begin

  clk_ipb <= not clk_ipb after CLK_IPB_PERIOD/2;
  DACCLK  <= not DACCLK  after (DACCLK_PERIOD/2.0) * 1 ns;
  clk_sys <= not clk_sys after (JADEPIX_SYS_PERIOD/2.0) * 1 ns;

 -- ipbus_ctrlreg_v_0 : entity work.ipbus_ctrlreg_v
 --     generic map (
 --         N_CTRL => NUM_IPBUS_CTRL_REGISTERS,
 --         N_STAT => NUM_IPBUS_STAT_REGISTERS,
 --         SWAP_ORDER => false
 --     )
 --     port map (
 --         clk => clk_ipb,
 --         reset => rst,
 --         ipbus_in => ipbus_transactor_outputs.ipb_out,
 --         ipbus_out => ipbus_transactor_inputs.ipb_in,
 --         d => ipb_status_regs,
 --         q => ipb_control_regs,
 --         qmask => open,
 --         stb => ipb_control_stbs
 --     );

  ipbus_payload : entity work.ipbus_payload
    generic map(
      N_SS => N_SS
      )
    port map(
      ipb_clk        => clk_ipb,
      ipb_rst        => rst_ipb,
      ipb_in         => ipbus_transactor_outputs.ipb_out,
      ipb_out        => ipbus_transactor_inputs.ipb_in,
      -- Chip system clock
      clk            => clk_sys,
      rst            => clk_sys_rst,
      -- Global
      nuke           => nuke,
      soft_rst       => soft_rst,
      -- DAC70004
      DACCLK         => DACCLK,
      DACCLK_RST     => clk_dac_rst,
      DAC_BUSY       => DAC_BUSY,
      DAC_WE         => DAC_WE,
      DAC_DATA       => DAC_DATA,
      -- JadePix
      cfg_sync       => cfg_sync,
      cfg_fifo_rst   => cfg_fifo_rst,
      cfg_busy       => cfg_busy,
      rs_busy        => rs_busy,
      cfg_fifo_empty => cfg_fifo_empty,
      cfg_fifo_pfull => cfg_fifo_pfull,
      cfg_fifo_count => cfg_fifo_count,

      CACHE_BIT_SET => CACHE_BIT_SET,
      MATRIX_GRST   => MATRIX_GRST,

      hitmap_col_low  => hitmap_col_low,
      hitmap_col_high => hitmap_col_high,
      hitmap_en       => hitmap_en,

      cfg_start => cfg_start,
      rs_start  => rs_start,
      gs_start  => gs_start,
      apulse    => apulse_tmp,
      dpulse    => dpulse_tmp,
      PDB       => PDB,
      LOAD      => LOAD,
      -- SPI master
      ss        => open,
      mosi      => mosi,
      miso      => miso,
      sclk      => sclk
      );

  jadepix_ctrl : entity work.jadepix_ctrl
    port map(

      clk => clk_sys,
      rst => clk_sys_rst,

      cfg_sync       => cfg_sync,
      cfg_fifo_rst   => cfg_fifo_rst,
      cfg_fifo_empty => cfg_fifo_empty,
      cfg_fifo_pfull => cfg_fifo_pfull,
      cfg_fifo_count => cfg_fifo_count,

      cfg_busy  => cfg_busy,
      cfg_start => cfg_start,
      rs_start  => rs_start,
      gs_start  => gs_start,
      apulse_in => apulse_tmp,
      dpulse_in => dpulse_tmp,

      clk_cache       => clk_cache,
      clk_cache_rst   => clk_cache_rst,
      hitmap_col_low  => hitmap_col_low,
      hitmap_col_high => hitmap_col_high,
      hitmap_en       => hitmap_en,
      hitmap_num      => hitmap_num,

      RA       => RA,
      RA_EN    => RA_EN,
      CA       => CA,
      CA_EN    => CA_EN,
      CON_SELM => CON_SELM,
      CON_SELP => CON_SELP,
      CON_DATA => CON_DATA,


      rs_busy => rs_busy,

--        DATA_IN     =>  DATA_IN,

      HIT_RST => HIT_RST,
      RD_EN   => RD_EN,

      ANASEL_EN => ANASEL_EN,
      GSHUTTER  => GSHUTTER,
      DPLSE     => DPLSE,
      APLSE     => APLSE
      );


  -- Instantiate the IPbus transactor wrapper. It is necessary.
  ipbus_transactor_wrapper_0 : entity work.ipbus_transactor_wrapper
      port map (
          clk => clk_ipb,
          rst => rst_ipb,
          ipbus_transactor_inputs => ipbus_transactor_inputs,
          ipbus_transactor_outputs => ipbus_transactor_outputs
      );

  main: process
  begin
    wait for 2*CLK_IPB_PERIOD;

    gen_pulse(rst_ipb, 2 * CLK_IPB_PERIOD, "Reset ipbus pulse");
    gen_pulse(clk_sys_rst, 2 * CLK_IPB_PERIOD, "Reset clk_sys pulse");
    gen_pulse(clk_dac_rst, 2 * CLK_IPB_PERIOD, "Reset clk_dac pulse");
    wait for 2*CLK_IPB_PERIOD;

    --ipbus_transact(read_request_transaction,
    --               response_transaction,
    --               ipbus_transactor_inputs,
    --               ipbus_transactor_outputs,
    --               clk_ipb);
    --check_value(response_transaction.bodyy(0), X"FFFFFF02", FAILURE,
    --            "Checking read transaction.");

    ipbus_transact(write_rst_transaction,
                   response_transaction,
                   ipbus_transactor_inputs,
                   ipbus_transactor_outputs,
                   clk_ipb);

	wait for 5*CLK_IPB_PERIOD;

    ipbus_transact(start_rs_transaction,
                   response_transaction,
                   ipbus_transactor_inputs,
                   ipbus_transactor_outputs,
                   clk_ipb);

    --check_value(ipb_control_regs(0), C_WRITE_DATA(0), FAILURE,
    --            "Checking write transaction.");
    --check_value(ipb_control_regs(1), C_WRITE_DATA(1), FAILURE,
    --            "Checking write transaction.");

    --ipbus_transact(non_inc_read_request_transaction,
    --               response_transaction,
    --               ipbus_transactor_inputs,
    --               ipbus_transactor_outputs,
    --               clk_ipb);
    --check_value(response_transaction.bodyy(0), X"FFFFFF03", FAILURE,
    --            "Checking non-incrementing read transaction.");
    --check_value(response_transaction.bodyy(1), X"FFFFFF03", FAILURE,
    --            "Checking non-incrementing read transaction.");
    --check_value(response_transaction.bodyy(2), X"FFFFFF03", FAILURE,
    --            "Checking non-incrementing read transaction.");

    --ipbus_transact(non_inc_write_request_transaction,
    --               response_transaction,
    --               ipbus_transactor_inputs,
    --               ipbus_transactor_outputs,
    --               clk_ipb);
    --check_value(ipb_control_regs(2), C_NON_INC_WRITE_DATA(3), FAILURE,
    --            "Checking non-incrementing write transaction.");

    --ipbus_transact(rmw_bits_request_transaction,
    --               response_transaction,
    --               ipbus_transactor_inputs,
    --               ipbus_transactor_outputs,
    --               clk_ipb);
    --check_value(ipb_control_regs(0), X"F0000004", FAILURE,
    --            "Checking read/modify/write bits transaction.");

    --ipbus_transact(rmw_sum_request_transaction,
    --               response_transaction,
    --               ipbus_transactor_inputs,
    --               ipbus_transactor_outputs,
    --               clk_ipb);
    --check_value(ipb_control_regs(3), X"00000003", FAILURE,
    --            "Checking read/modify/write sum transaction.");

    wait for 15*CLK_IPB_PERIOD;
    std.env.stop;
  end process;

end behavioral;
