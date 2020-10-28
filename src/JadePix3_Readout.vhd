library IEEE;
use IEEE.STD_LOGIC_1164.all;

library UNISIM;
use UNISIM.vcomponents.all;

use work.ipbus.all;
use work.drp_decl.all;

use work.global_defines.all;
use work.jadepix_defines.all;


entity JadePix3_Readout is port(
  sysclk_p     : in  std_logic;
  sysclk_n     : in  std_logic;
  leds         : out std_logic_vector(3 downto 0);  -- status LEDs
  dip_sw       : in  std_logic_vector(3 downto 0);  -- switches
  gmii_gtx_clk : out std_logic;
  gmii_tx_en   : out std_logic;
  gmii_tx_er   : out std_logic;
  gmii_txd     : out std_logic_vector(7 downto 0);
  gmii_rx_clk  : in  std_logic;
  gmii_rx_dv   : in  std_logic;
  gmii_rx_er   : in  std_logic;
  gmii_rxd     : in  std_logic_vector(7 downto 0);
  phy_rst      : out std_logic;

  --  In-chip fifo
  VALID_IN     : in  std_logic_vector(3 downto 0);
  FIFO_READ_EN : out std_logic;
  BLK_SELECT   : out std_logic_vector(BLK_SELECT_WIDTH-1 downto 0);
  INQUIRY      : out std_logic_vector(1 downto 0);
  DATA_IN      : in  std_logic_vector(7 downto 0);
  --MATRIX_DIN : in std_logic_vector(15 downto 0);

  -- SDRAM
--  ddr3_dq    : inout std_logic_vector(63 downto 0);
--  ddr3_dqs_p : inout std_logic_vector(7 downto 0);
--  ddr3_dqs_n : inout std_logic_vector(7 downto 0);

--  ddr3_addr    : out std_logic_vector(13 downto 0);
--  ddr3_ba      : out std_logic_vector(2 downto 0);
--  ddr3_ras_n   : out std_logic;
--  ddr3_cas_n   : out std_logic;
--  ddr3_we_n    : out std_logic;
--  ddr3_reset_n : out std_logic;
--  ddr3_ck_p    : out std_logic_vector(0 downto 0);
--  ddr3_ck_n    : out std_logic_vector(0 downto 0);
--  ddr3_cke     : out std_logic_vector(0 downto 0);
--  ddr3_cs_n    : out std_logic_vector(0 downto 0);
--  ddr3_dm      : out std_logic_vector(7 downto 0);
--  ddr3_odt     : out std_logic_vector(0 downto 0);

  -- DAC70004
  DAC_SCLK : out std_logic;
  DAC_LOAD : out std_logic;
  DAC_SYNC : out std_logic;
  DAC_SDIN : out std_logic;
  DAC_CLR  : out std_logic;
--  DAC_BUSY : out std_logic

  -- JadePix3
  REFCLK        : out std_logic;
  CACHE_CLK     : out std_logic;
  RX_CLK        : out std_logic;
  
--  LVDS_RX_OUT_P : out std_logic;
--  LVDS_RX_OUT_N : out std_logic;

  RA    : out std_logic_vector(ROW_WIDTH-1 downto 0);
  RA_EN : out std_logic;
  CA    : out std_logic_vector(COL_WIDTH-1 downto 0);
  CA_EN : out std_logic;

  CON_SELM : out std_logic;
  CON_SELP : out std_logic;
  CON_DATA : out std_logic;

  CACHE_BIT_SET : out std_logic_vector(3 downto 0);
  HIT_RST       : out std_logic;
  RD_EN         : out std_logic;

  MATRIX_GRST : out std_logic;
  DIGSEL_EN   : out std_logic;
  ANASEL_EN   : out std_logic;
  GSHUTTER    : out std_logic;
  DPLSE       : out std_logic;
  APLSE       : out std_logic;

  PDB  : out std_logic;
  LOAD : out std_logic;

  -- SPI Master
  ss   : out std_logic_vector(N_SS - 1 downto 0);
  mosi : out std_logic;
  miso : in  std_logic;
  sclk : out std_logic
  );
end JadePix3_Readout;

architecture rtl of JadePix3_Readout is

  signal sysclk                                               : std_logic;
  signal clk_sys                                              : std_logic;
  signal clk_rx                                               : std_logic;
  signal clk_wfifo                                            : std_logic;
  signal clk_ref_rst, clk_dac_rst, clk_sys_rst, clk_wfifo_rst : std_logic;

  -- IPbus
  signal clk_ipb, rst_ipb, clk_125M, clk_aux, rst_aux, locked_ipbus_mmcm, nuke, soft_rst, phy_rst_e, userled : std_logic;
  signal mac_addr                                                                                            : std_logic_vector(47 downto 0);
  signal ip_addr                                                                                             : std_logic_vector(31 downto 0);
  signal ipb_out                                                                                             : ipb_wbus;
  signal ipb_in                                                                                              : ipb_rbus;

  -- DAC70004
  signal DACCLK   : std_logic;
  signal DAC_BUSY : std_logic;
  signal DAC_WE   : std_logic;
  signal DAC_DATA : std_logic_vector(31 downto 0);

  attribute mark_debug             : string;
  attribute mark_debug of DAC_BUSY : signal is "true";
  attribute mark_debug of DAC_WE   : signal is "true";
  attribute mark_debug of DAC_DATA : signal is "true";
  attribute mark_debug of ipb_out  : signal is "true";
  attribute mark_debug of ipb_in   : signal is "true";

  -- JadePix
  signal locked_jadepix_mmcm : std_logic;
  signal cfg_busy            : std_logic;
  signal rs_busy             : std_logic;
  signal cfg_start           : std_logic;
  signal rs_start            : std_logic;
  signal gs_start            : std_logic;
  signal rs_frame_start      : std_logic;
  signal rs_frame_num_set    : std_logic_vector(FRAME_CNT_WIDTH-1 downto 0);
  signal rs_frame_cnt        : std_logic_vector(FRAME_CNT_WIDTH-1 downto 0);


  signal hitmap_col_low  : std_logic_vector(COL_WIDTH-1 downto 0);
  signal hitmap_col_high : std_logic_vector(COL_WIDTH-1 downto 0);
  signal hitmap_en       : std_logic;
  signal hitmap_num      : std_logic_vector(HITMAP_NUM_WIDTH-1 downto 0);

  signal gs_sel_pulse : std_logic;

  signal gs_col  : std_logic_vector(COL_WIDTH-1 downto 0);
  signal gs_busy : std_logic;

  signal gs_pulse_delay_cnt      : std_logic_vector(8 downto 0);
  signal gs_pulse_width_cnt_low  : std_logic_vector(31 downto 0);
  signal gs_pulse_width_cnt_high : std_logic_vector(1 downto 0);
  signal gs_pulse_deassert_cnt   : std_logic_vector(8 downto 0);
  signal gs_deassert_cnt         : std_logic_vector(8 downto 0);

  signal start_cache   : std_logic;
  signal clk_cache     : std_logic;
  signal is_busy_cache : std_logic;

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

  -- FIFOs
  signal ctrl_fifo_rst, data_fifo_rst : std_logic;
  signal slow_ctrl_fifo_rd_clk        : std_logic;
  signal slow_ctrl_fifo_rd_en         : std_logic;
  signal slow_ctrl_fifo_valid         : std_logic;
  signal slow_ctrl_fifo_empty         : std_logic;
  signal slow_ctrl_fifo_rd_dout       : std_logic_vector(31 downto 0);

  signal data_fifo_wr_clk : std_logic;
  signal data_fifo_wr_en  : std_logic;
  signal data_fifo_wr_din : std_logic_vector(31 downto 0);
  signal data_fifo_full   : std_logic;

  -- Readout
  signal clk_cache_delay : std_logic;
  signal row_num         : std_logic_vector(ROW_WIDTH-1 downto 0);
  signal rd_data_rst     : std_logic;

  -- SPI 
  signal load_soft     : std_logic;
  signal spi_trans_end : std_logic;

begin

  OBUFDS_CACHE_CLK : OBUF
    generic map (
      DRIVE      => 12,
      IOSTANDARD => "DEFAULT",
      SLEW       => "SLOW")
    port map (
      O => CACHE_CLK,  -- Buffer output (connect directly to top-level port)
      I => clk_cache                    -- Buffer input 
      );

   OBUF_RX_CLK : OBUF
   generic map (
      DRIVE => 12,
      IOSTANDARD => "DEFAULT",
      SLEW => "SLOW")
   port map (
      O => RX_CLK,     -- Buffer output (connect directly to top-level port)
      I => clk_rx      -- Buffer input 
   );


  ibufgds0 : IBUFGDS port map(
    i  => sysclk_p,
    ib => sysclk_n,
    o  => sysclk
    );

  jadepix_clocks : entity work.jadepix_clock_gen
    port map(
      sysclk      => sysclk,
      clk_ref     => REFCLK,
      clk_dac     => DACCLK,
      clk_sys     => clk_sys,
      clk_rx      => clk_rx,
      clk_dac_rst => clk_dac_rst,
      clk_ref_rst => clk_ref_rst,
      clk_sys_rst => clk_sys_rst,
      locked      => locked_jadepix_mmcm
      );

  ipbus_infra : entity work.ipbus_gmii_infra
    generic map(
      CLK_AUX_FREQ => 50.0
      )
    port map(
      sysclk       => sysclk,
      clk_ipb_o    => clk_ipb,
      rst_ipb_o    => rst_ipb,
      clk_125_o    => clk_125M,
      rst_125_o    => phy_rst_e,
      clk_aux_o    => clk_aux,
      rst_aux_o    => rst_aux,
      locked_o     => locked_ipbus_mmcm,
      nuke         => nuke,
      soft_rst     => soft_rst,
      leds         => leds(1 downto 0),
      gmii_gtx_clk => gmii_gtx_clk,
      gmii_txd     => gmii_txd,
      gmii_tx_en   => gmii_tx_en,
      gmii_tx_er   => gmii_tx_er,
      gmii_rx_clk  => gmii_rx_clk,
      gmii_rxd     => gmii_rxd,
      gmii_rx_dv   => gmii_rx_dv,
      gmii_rx_er   => gmii_rx_er,
      mac_addr     => mac_addr,
      ip_addr      => ip_addr,
      ipb_in       => ipb_in,
      ipb_out      => ipb_out
      );

  leds(3 downto 2) <= '0' & locked_jadepix_mmcm;
  phy_rst          <= not phy_rst_e;

  mac_addr <= X"020ddba1151" & dip_sw;  -- Careful here, arbitrary addresses do not always work
  ip_addr  <= X"c0a8031" & dip_sw;      -- 192.168.3.16+n (n:0-15)

-- ipbus slaves live in the entity below, and can expose top-level ports
-- The ipbus fabric is instantiated within.

  ipbus_payload : entity work.ipbus_payload
    generic map(
      N_SS => N_SS
      )
    port map(
      ipb_clk => clk_ipb,
      ipb_rst => rst_ipb,
      ipb_in  => ipb_out,
      ipb_out => ipb_in,

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


  dac70004 : entity work.DAC_refresh
    port map(
      CLK_50M    => DACCLK,
      DLL_LOCKED => locked_jadepix_mmcm,
      DAC_WE     => DAC_WE,
      DAC_DATA   => DAC_DATA,
      DAC_SCLK   => DAC_SCLK,
      DAC_LOAD   => DAC_LOAD,
      DAC_SYNC   => DAC_SYNC,
      DAC_SDIN   => DAC_SDIN,
      DAC_CLR    => DAC_CLR,
      DAC_BUSY   => DAC_BUSY
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

      start_cache     => start_cache,
      clk_cache       => clk_cache,
      clk_cache_delay => clk_cache_delay,
      is_busy_cache   => is_busy_cache,

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
  
	rd_data_rst <= rs_start or gs_start or clk_sys_rst; -- when start rolling shutter or global shutter, reset data readout
  jadepix_read_data : entity work.jadepix_read_data
    port map(
      clk => clk_sys,
      rst => rd_data_rst,
			
			clk_rx => clk_rx,
			
      start_cache     => start_cache,
      clk_cache       => clk_cache,
      clk_cache_delay => clk_cache_delay,
			is_busy_cache   => is_busy_cache,

      frame_num => rs_frame_cnt,
      row       => row_num,

      VALID_IN => VALID_IN,
      DATA_IN  => DATA_IN,

      FIFO_READ_EN => FIFO_READ_EN,
      BLK_SELECT   => BLK_SELECT,
--      INQUIRY      => INQUIRY,

      -- DATA FIFO
      data_fifo_rst    => data_fifo_rst,
      data_fifo_wr_clk => data_fifo_wr_clk,
      data_fifo_wr_en  => data_fifo_wr_en,
      data_fifo_wr_din => data_fifo_wr_din,
      data_fifo_full   => data_fifo_full
      );


--  u_mig_7series_0 : entity work.mig_7series_0_1
--    port map (
--      -- Memory interface ports
--      ddr3_addr           => ddr3_addr,
--      ddr3_ba             => ddr3_ba,
--      ddr3_cas_n          => ddr3_cas_n,
--      ddr3_ck_n           => ddr3_ck_n,
--      ddr3_ck_p           => ddr3_ck_p,
--      ddr3_cke            => ddr3_cke,
--      ddr3_ras_n          => ddr3_ras_n,
--      ddr3_reset_n        => ddr3_reset_n,
--      ddr3_we_n           => ddr3_we_n,
--      ddr3_dq             => ddr3_dq,
--      ddr3_dqs_n          => ddr3_dqs_n,
--      ddr3_dqs_p          => ddr3_dqs_p,
--      init_calib_complete => init_calib_complete,
--      ddr3_cs_n           => ddr3_cs_n,
--      ddr3_dm             => ddr3_dm,
--      ddr3_odt            => ddr3_odt,
--      -- Application interface ports
--      app_addr            => app_addr,
--      app_cmd             => app_cmd,
--      app_en              => app_en,
--      app_wdf_data        => app_wdf_data,
--      app_wdf_end         => app_wdf_end,
--      app_wdf_wren        => app_wdf_wren,
--      app_rd_data         => app_rd_data,
--      app_rd_data_end     => app_rd_data_end,
--      app_rd_data_valid   => app_rd_data_valid,
--      app_rdy             => app_rdy,
--      app_wdf_rdy         => app_wdf_rdy,
--      app_sr_req          => app_sr_req,
--      app_ref_req         => app_ref_req,
--      app_zq_req          => app_zq_req,
--      app_sr_active       => app_sr_active,
--      app_ref_ack         => app_ref_ack,
--      app_zq_ack          => app_zq_ack,
--      ui_clk              => ui_clk,
--      ui_clk_sync_rst     => ui_clk_sync_rst,
--      app_wdf_mask        => app_wdf_mask,
--      -- System Clock Ports
--      sys_clk_p           => sysclk_p,
--      sys_clk_n           => sysclk_n,
--      device_temp_i       => device_temp_i,
--      sys_rst             => open
--      );

end rtl;
