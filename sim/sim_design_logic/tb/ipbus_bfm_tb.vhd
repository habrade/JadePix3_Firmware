--========================================================================================================================
-- Copyright (c) 2017 by Bitvis AS.  All rights reserved.

-- You should have received a copy of the license file containing the MIT License (see LICENSE.TXT), if not,
-- contact Bitvis AS <support@bitvis.no>.
--========================================================================================================================
-- Copyright (c) 2019 by Micha?? Kruszewski. All rights reserved.
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
library OSVVM ; 
  use OSVVM.RandomBasePkg.all ; 
  use OSVVM.RandomPkg.all ;

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

  constant CLK_IPB_PERIOD : time := C_IPBUS_USUAL_CLK_PERIOD;  -- 31.25 MHz
  constant SYS_CLK_PERIOD : time := 5.0 ns;                    -- 200 MHz

  signal clk_ipb : std_logic := '0';
  signal rst_ipb : std_logic := '0';

  signal sysclk    : std_logic := '0';

  signal clk_sys       : std_logic := '0';
  signal clk_rx        : std_logic := '0';
  signal clk_sys_rst   : std_logic := '0';
  signal clk_dac_rst   : std_logic := '0';

  signal clk_cache_delay : std_logic := '0';

  -- IPbus
  signal nuke, soft_rst : std_logic;

  signal ipbus_transactor_inputs  : t_ipbus_transactor_inputs := C_IPBUS_TRANSACTOR_INPUTS_DEFAULT;
  signal ipbus_transactor_outputs : t_ipbus_transactor_outputs;

  signal ipb_status_regs : ipb_reg_v(NUM_IPBUS_STAT_REGISTERS-1 downto 0) := (0 => X"FFFFFF00",
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

  --constant C_WRITE_DATA : t_ipbus_slv_array(0 to 1)
  --         := (0 => X"00000007", 1 => X"00000004");

  constant C_WRITE_RST : t_ipbus_slv_array(0 to 2)
    := (0 => X"00000000", 1 => X"00000002", 2 => X"00000000");

  constant C_START_RS : t_ipbus_slv_array(0 to 0)
    := (0 => X"00000002");

  constant C_START_GS : t_ipbus_slv_array(0 to 2)
    := (0 => X"00000000", 1 => X"00000004", 2 => X"00000000");

  constant C_HITMAP : t_ipbus_slv_array(0 to 0)
    := (0 => X"0016ab54");
  constant C_FRAME_NUM : t_ipbus_slv_array(0 to 0)
    := (0 => X"00000002");
  constant C_GS_PULSE_DELAY_CNT : t_ipbus_slv_array(0 to 0)
    := (0 => X"00000001");
  constant C_GS_PULSE_WIDTH_CNT_LOW : t_ipbus_slv_array(0 to 0)
    := (0 => X"00000011");
  constant C_GS_PULSE_WIDTH_CNT_HIGH : t_ipbus_slv_array(0 to 0)
    := (0 => X"00000000");
  constant C_GS_PULSE_DEASSERT_CNT : t_ipbus_slv_array(0 to 0)
    := (0 => X"00000004");
  constant C_GS_DEASSERT_CNT : t_ipbus_slv_array(0 to 0)
    := (0 => X"00000002");

  constant C_READ_RFIFO_LEN : t_ipbus_slv_array(0 to 0)
    := (0 => X"00000000");

  signal read_rfifo_len : t_ipbus_transaction(bodyy(0 to 1))
    := ipbus_non_inc_write_transaction(X"60000024", 1, C_READ_RFIFO_LEN);

  signal write_rst_transaction : t_ipbus_transaction(bodyy(0 to 3))
    := ipbus_non_inc_write_transaction(X"00000000", 3, C_WRITE_RST);

  signal start_rs_transaction : t_ipbus_transaction(bodyy(0 to 1))
    := ipbus_non_inc_write_transaction(X"60000011", 1, C_START_RS);

  signal start_gs_transaction : t_ipbus_transaction(bodyy(0 to 3))
    := ipbus_non_inc_write_transaction(X"60000011", 3, C_START_GS);

  signal frame_num_transaction : t_ipbus_transaction(bodyy(0 to 1))
    := ipbus_non_inc_write_transaction(X"60000012", 1, C_FRAME_NUM);

  signal hitmap_transaction : t_ipbus_transaction(bodyy(0 to 1))
    := ipbus_non_inc_write_transaction(X"60000013", 1, C_HITMAP);

  signal gs_pulse_delay_transaction : t_ipbus_transaction(bodyy(0 to 1))
    := ipbus_non_inc_write_transaction(X"60000014", 1, C_GS_PULSE_DELAY_CNT);
  signal gs_pulse_width_low_transaction : t_ipbus_transaction(bodyy(0 to 1))
    := ipbus_non_inc_write_transaction(X"60000015", 1, C_GS_PULSE_WIDTH_CNT_LOW);
  signal gs_pulse_width_high_transaction : t_ipbus_transaction(bodyy(0 to 1))
    := ipbus_non_inc_write_transaction(X"60000016", 1, C_GS_PULSE_WIDTH_CNT_HIGH);
  signal gs_pulse_deassert_transaction : t_ipbus_transaction(bodyy(0 to 1))
    := ipbus_non_inc_write_transaction(X"60000017", 1, C_GS_PULSE_DEASSERT_CNT);
  signal gs_deassert_transaction : t_ipbus_transaction(bodyy(0 to 1))
    := ipbus_non_inc_write_transaction(X"60000018", 1, C_GS_DEASSERT_CNT);

  --signal write_request_transaction : t_ipbus_transaction(bodyy(0 to 1))
  --       := ipbus_write_transaction(X"00000000", 2, C_WRITE_DATA);

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
  signal DACCLK   : std_logic := '0';
  signal DAC_BUSY : std_logic;
  signal DAC_WE   : std_logic;
  signal DAC_DATA : std_logic_vector(31 downto 0);

  -- JadePix
  signal REFCLK      : std_logic := '0';
  signal clk_ref_rst : std_logic := '0';

  signal RA    : std_logic_vector(8 downto 0);
  signal RA_EN : std_logic;
  signal CA    : std_logic_vector(8 downto 0);
  signal CA_EN : std_logic;

  signal CON_SELM : std_logic;
  signal CON_SELP : std_logic;
  signal CON_DATA : std_logic;

  signal CACHE_BIT_SET : std_logic_vector(3 downto 0);
  signal HIT_RST       : std_logic;
  signal RD_EN         : std_logic;

  signal MATRIX_GRST : std_logic;
  signal DIGSEL_EN   : std_logic;
  signal ANASEL_EN   : std_logic;
  signal GSHUTTER    : std_logic;
  signal DPLSE       : std_logic;
  signal APLSE       : std_logic;

  signal PDB  : std_logic;
  signal LOAD : std_logic;

  -- SPI Master
  signal ss   : std_logic_vector(N_SS - 1 downto 0);
  signal mosi : std_logic;
  signal miso : std_logic;
  signal sclk : std_logic;

  signal locked_jadepix_mmcm : std_logic;
  signal cfg_busy            : std_logic;
  signal rs_busy             : std_logic;
  signal cfg_start           : std_logic;
  signal rs_start            : std_logic;
  signal gs_start            : std_logic;

  signal rs_frame_num_set : std_logic_vector(FRAME_CNT_WIDTH-1 downto 0);
  signal rs_frame_cnt     : std_logic_vector(FRAME_CNT_WIDTH-1 downto 0);

  signal hitmap_col_low  : std_logic_vector(COL_WIDTH-1 downto 0);
  signal hitmap_col_high : std_logic_vector(COL_WIDTH-1 downto 0);
  signal hitmap_en       : std_logic;
  signal hitmap_num      : std_logic_vector(3 downto 0);

  signal gs_sel_pulse : std_logic;
  signal gs_col       : std_logic_vector(COL_WIDTH-1 downto 0);
  signal gs_busy      : std_logic;


  signal gs_pulse_delay_cnt      : std_logic_vector(8 downto 0);
  signal gs_pulse_width_cnt_low  : std_logic_vector(31 downto 0);
  signal gs_pulse_width_cnt_high : std_logic_vector(1 downto 0);
  signal gs_pulse_deassert_cnt   : std_logic_vector(8 downto 0);
  signal gs_deassert_cnt         : std_logic_vector(8 downto 0);

  -- FIFOs
  signal ctrl_fifo_rst, data_fifo_rst : std_logic                     := '0';
  signal slow_ctrl_fifo_rd_clk        : std_logic                     := '0';
  signal slow_ctrl_fifo_rd_en         : std_logic                     := '0';
  signal slow_ctrl_fifo_valid         : std_logic                     := '0';
  signal slow_ctrl_fifo_empty         : std_logic                     := '0';
  signal slow_ctrl_fifo_rd_dout       : std_logic_vector(31 downto 0) := (others => '0');

  signal data_fifo_wr_clk : std_logic                     := '0';
  signal data_fifo_wr_en  : std_logic                     := '0';
  signal data_fifo_full   : std_logic                     := '0';
  signal data_fifo_wr_din : std_logic_vector(31 downto 0) := (others => '0');

  signal clk_cache     : std_logic;
  signal start_cache   : std_logic;
  signal is_busy_cache : std_logic := '0';

  -- config FIFO signals
  signal cfg_sync       : jadepix_cfg;
  signal cfg_fifo_rst   : std_logic;
  signal cfg_fifo_empty : std_logic;
  signal cfg_fifo_pfull : std_logic;
  signal cfg_fifo_count : std_logic_vector(CFG_FIFO_COUNT_WITDH-1 downto 0);

  signal anasel_en_gs : std_logic;
  signal digsel_en_rs : std_logic;
  signal aplse_gs     : std_logic;
  signal dplse_gs     : std_logic;
  signal gshutter_gs  : std_logic;

  signal digsel_en_soft : std_logic;
  signal anasel_en_soft : std_logic;
  signal aplse_soft     : std_logic;
  signal dplse_soft     : std_logic;
  signal gshutter_soft  : std_logic;

  signal load_soft     : std_logic;
  signal spi_trans_end : std_logic;

  -- data readout
  signal frame_num      : std_logic_vector(FRAME_CNT_WIDTH-1 downto 0) := (others => '0');
  signal row_num        : std_logic_vector(ROW_WIDTH-1 downto 0)       := (others => '0');

  signal VALID_IN : std_logic_vector(SECTOR_NUM-1 downto 0) := (others => '0');
  signal DATA_IN  : std_logic_vector(7 downto 0)            := (others => '0');

  signal FIFO_READ_EN : std_logic;
  signal BLK_SELECT   : std_logic_vector(BLK_SELECT_WIDTH-1 downto 0) := "00";
  signal INQUIRY      : std_logic_vector(BLK_SELECT_WIDTH-1 downto 0) := "00";

  constant SYS_PERIOD : time := 12 ns;
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

  clk_ipb <= not clk_ipb after CLK_IPB_PERIOD/2;
  sysclk  <= not sysclk  after SYS_CLK_PERIOD/2;

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


  jadepix_clocks : entity work.jadepix_clock_gen
    port map(
      sysclk        => sysclk,
      clk_ref       => REFCLK,
      clk_dac       => DACCLK,
      clk_sys       => clk_sys,
      clk_rx        => clk_rx,
      clk_dac_rst   => clk_dac_rst,
      clk_ref_rst   => clk_ref_rst,
      clk_sys_rst   => clk_sys_rst,
      locked        => locked_jadepix_mmcm
      );


  ipbus_payload : entity work.ipbus_payload
    generic map(
      N_SS => N_SS
      )
    port map(
      ipb_clk => clk_ipb,
      ipb_rst => rst_ipb,
      ipb_in  => ipbus_transactor_outputs.ipb_out,
      ipb_out => ipbus_transactor_inputs.ipb_in,

      -- Chip system clock
      clk => clk_sys,
      rst => clk_sys_rst,

      -- Global
      nuke     => nuke,
      soft_rst => soft_rst,

      -- DAC70004
      DACCLK     => DACCLK,
      DACCLK_RST => clk_dac_rst,
      DAC_BUSY   => DAC_BUSY,
      DAC_WE     => DAC_WE,
      DAC_DATA   => DAC_DATA,

      -- JadePix
      cfg_start      => cfg_start,
      cfg_sync       => cfg_sync,
      cfg_fifo_rst   => cfg_fifo_rst,
      cfg_busy       => cfg_busy,
      cfg_fifo_empty => cfg_fifo_empty,
      cfg_fifo_pfull => cfg_fifo_pfull,
      cfg_fifo_count => cfg_fifo_count,

      CACHE_BIT_SET => CACHE_BIT_SET,

      rs_start         => rs_start,
      rs_busy          => rs_busy,
      rs_frame_num_set => rs_frame_num_set,


      hitmap_col_low  => hitmap_col_low,
      hitmap_col_high => hitmap_col_high,
      hitmap_en       => hitmap_en,
      hitmap_num      => hitmap_num,

      gs_start     => gs_start,
      gs_busy      => gs_busy,
      gs_sel_pulse => gs_sel_pulse,
      gs_col       => gs_col,

      gshutter_soft => gshutter_soft,
      aplse_soft    => aplse_soft,
      dplse_soft    => dplse_soft,

      gs_pulse_delay_cnt      => gs_pulse_delay_cnt,
      gs_pulse_width_cnt_low  => gs_pulse_width_cnt_low,
      gs_pulse_width_cnt_high => gs_pulse_width_cnt_high,
      gs_pulse_deassert_cnt   => gs_pulse_deassert_cnt,
      gs_deassert_cnt         => gs_deassert_cnt,

      anasel_en_soft => anasel_en_soft,
      digsel_en_soft => digsel_en_soft,
      load_soft      => load_soft,

      spi_trans_end => spi_trans_end,


      PDB => PDB,

      -- FIFOs
      ctrl_fifo_rst          => ctrl_fifo_rst,
      slow_ctrl_fifo_rd_clk  => slow_ctrl_fifo_rd_clk,
      slow_ctrl_fifo_rd_en   => slow_ctrl_fifo_rd_en,
      slow_ctrl_fifo_valid   => slow_ctrl_fifo_valid,
      slow_ctrl_fifo_empty   => slow_ctrl_fifo_empty,
      slow_ctrl_fifo_rd_dout => slow_ctrl_fifo_rd_dout,
      data_fifo_rst          => data_fifo_rst,
      data_fifo_wr_clk       => data_fifo_wr_clk,
      data_fifo_wr_en        => data_fifo_wr_en,
      data_fifo_full         => data_fifo_full,
      data_fifo_wr_din       => data_fifo_wr_din,

      -- SPI master
      ss   => open,
      mosi => mosi,
      miso => miso,
      sclk => sclk
      );

  jadepix_ctrl_wrapper : entity work.jadepix_ctrl_wrapper
    port map(

      clk           => clk_sys,
      rst           => clk_sys_rst,
      clk_ipb       => clk_ipb,
      rst_ipb       => rst_ipb,
      spi_trans_end => spi_trans_end,
      load_soft     => load_soft,
      LOAD          => LOAD,

      cfg_sync       => cfg_sync,
      cfg_fifo_rst   => cfg_fifo_rst,
      cfg_fifo_empty => cfg_fifo_empty,
      cfg_fifo_pfull => cfg_fifo_pfull,
      cfg_fifo_count => cfg_fifo_count,
      cfg_busy       => cfg_busy,
      cfg_start      => cfg_start,

      clk_cache       => clk_cache,
      start_cache     => start_cache,
      clk_cache_delay => clk_cache_delay,
      is_busy_cache   => is_busy_cache,

      hitmap_col_low  => hitmap_col_low,
      hitmap_col_high => hitmap_col_high,
      hitmap_en       => hitmap_en,
      hitmap_num      => hitmap_num,

      RA       => row_num,
      RA_EN    => RA_EN,
      CA       => CA,
      CA_EN    => CA_EN,
      CON_SELM => CON_SELM,
      CON_SELP => CON_SELP,
      CON_DATA => CON_DATA,

      rs_busy          => rs_busy,
      rs_start         => rs_start,
      rs_frame_num_set => rs_frame_num_set,
      rs_frame_cnt     => rs_frame_cnt,

      HIT_RST => HIT_RST,
      RD_EN   => RD_EN,

      MATRIX_GRST => MATRIX_GRST,

      gshutter_gs => gshutter_gs,
      aplse_gs    => aplse_gs,
      dplse_gs    => dplse_gs,

      gs_start     => gs_start,
      gs_busy      => gs_busy,
      gs_sel_pulse => gs_sel_pulse,
      gs_col       => gs_col,

      gs_pulse_delay_cnt      => gs_pulse_delay_cnt,
      gs_pulse_width_cnt_low  => gs_pulse_width_cnt_low,
      gs_pulse_width_cnt_high => gs_pulse_width_cnt_high,
      gs_pulse_deassert_cnt   => gs_pulse_deassert_cnt,
      gs_deassert_cnt         => gs_deassert_cnt,

      digsel_en_rs => digsel_en_rs,
      anasel_en_gs => anasel_en_gs
      );

  DIGSEL_EN <= digsel_en_rs and digsel_en_soft;
  ANASEL_EN <= anasel_en_gs and anasel_en_soft;
  GSHUTTER  <= gshutter_gs or gshutter_soft;
  APLSE     <= aplse_gs and aplse_soft;
  DPLSE     <= dplse_gs and dplse_soft;

  RA <= row_num;

  jadepix_read_data : entity work.jadepix_read_data
    port map(

      clk => clk_sys,
      rst => clk_sys_rst,

	  clk_rx => clk_rx,

      start_cache     => start_cache,
      clk_cache       => clk_cache,
      clk_cache_delay => clk_cache_delay,
      is_busy_cache   => is_busy_cache,

      frame_num      => rs_frame_cnt,
      row            => row_num,

      VALID_IN => VALID_IN,
      DATA_IN  => DATA_IN,

      FIFO_READ_EN     => FIFO_READ_EN,
      BLK_SELECT       => BLK_SELECT,
      INQUIRY          => INQUIRY,
      -- DATA FIFO
      data_fifo_rst    => data_fifo_rst,
      data_fifo_wr_clk => data_fifo_wr_clk,
      data_fifo_wr_en  => data_fifo_wr_en,
      data_fifo_wr_din => data_fifo_wr_din,
      data_fifo_full   => data_fifo_full
      );

  -- Instantiate the IPbus transactor wrapper. It is necessary.
  ipbus_transactor_wrapper_0 : entity work.ipbus_transactor_wrapper
    port map (
      clk                      => clk_ipb,
      rst                      => rst_ipb,
      ipbus_transactor_inputs  => ipbus_transactor_inputs,
      ipbus_transactor_outputs => ipbus_transactor_outputs
      );

  main : process
	variable RV : RandomPType ;
    variable RV_SLV : std_logic_vector(7 downto 0) ;
  begin
    wait for 2*CLK_IPB_PERIOD;

    gen_pulse(rst_ipb, 2 * CLK_IPB_PERIOD, "Reset ipbus pulse");
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
/*
    ipbus_transact(hitmap_transaction,
                   response_transaction,
                   ipbus_transactor_inputs,
                   ipbus_transactor_outputs,
                   clk_ipb);
*/

    wait for 5*CLK_IPB_PERIOD;
    ipbus_transact(frame_num_transaction,
                   response_transaction,
                   ipbus_transactor_inputs,
                   ipbus_transactor_outputs,
                   clk_ipb);

    wait for CLK_IPB_PERIOD;
    ipbus_transact(start_rs_transaction,
                   response_transaction,
                   ipbus_transactor_inputs,
                   ipbus_transactor_outputs,
                   clk_ipb);




    --ipbus_transact(gs_pulse_delay_transaction,
    --               response_transaction,
    --               ipbus_transactor_inputs,
    --               ipbus_transactor_outputs,
    --               clk_ipb);
    --ipbus_transact(gs_pulse_width_low_transaction,
    --               response_transaction,
    --               ipbus_transactor_inputs,
    --               ipbus_transactor_outputs,
    --               clk_ipb);
    --ipbus_transact(gs_pulse_width_high_transaction,
    --               response_transaction,
    --               ipbus_transactor_inputs,
    --               ipbus_transactor_outputs,
    --               clk_ipb);
    --ipbus_transact(gs_pulse_deassert_transaction,
    --               response_transaction,
    --               ipbus_transactor_inputs,
    --               ipbus_transactor_outputs,
    --               clk_ipb);
    --ipbus_transact(gs_deassert_transaction,
    --               response_transaction,
    --               ipbus_transactor_inputs,
    --               ipbus_transactor_outputs,
    --               clk_ipb);
    --ipbus_transact(start_gs_transaction,
    --               response_transaction,
    --               ipbus_transactor_inputs,
    --               ipbus_transactor_outputs,
    --               clk_ipb);

    ----check_value(ipb_control_regs(0), C_WRITE_DATA(0), FAILURE,
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

	--RV.InitSeed (RV'instance_name) ;
	--RV_SLV := RV.RandSlv(0, 255, 8) ;
	--DATA_IN <= RV_SLV;

    --wait for 15*SYS_CLK_PERIOD;
    ---- channel 0
    --gen_valid(clk_cache, 0.2, 6, 0, VALID_IN);
	--
	--RV_SLV := RV.RandSlv(0, 255, 8) ;
	--DATA_IN <= RV_SLV;
    --gen_valid(clk_cache, 0.1, 12, 0, VALID_IN);

	--RV_SLV := RV.RandSlv(0, 255, 8) ;
	--DATA_IN <= RV_SLV;
    --gen_valid(clk_cache, 0.1, 16, 0, VALID_IN);

	--RV_SLV := RV.RandSlv(0, 255, 8) ;
	--DATA_IN <= RV_SLV;
    --gen_valid(clk_cache, 0.1, 16, 0, VALID_IN);

	--RV_SLV := RV.RandSlv(0, 255, 8) ;
	--DATA_IN <= RV_SLV;
    --gen_valid(clk_cache, 0.2, 14, 0, VALID_IN);

    ---- channel 1
	--RV_SLV := RV.RandSlv(0, 255, 8) ;
	--DATA_IN <= RV_SLV;
    --gen_valid(clk_cache, 0.3, 14, 1, VALID_IN);


	VALID_IN <= 4X"F";
	DATA_IN <= 8X"FF";

    wait for 15*CLK_IPB_PERIOD;
	wait on clk_cache until clk_cache = '1';
	wait for 0.1*SYS_PERIOD;
    wait on rs_busy until rs_busy = '0';
    wait for 15*CLK_IPB_PERIOD;

	
    ipbus_transact(read_rfifo_len,
                   response_transaction,
                   ipbus_transactor_inputs,
                   ipbus_transactor_outputs,
                   clk_ipb);

    wait for 15*CLK_IPB_PERIOD;

    std.env.stop;
  end process;

end behavioral;
