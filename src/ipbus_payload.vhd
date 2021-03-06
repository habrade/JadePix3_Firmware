library IEEE;
use IEEE.STD_LOGIC_1164.all;
use work.ipbus.all;
use work.ipbus_reg_types.all;
use work.ipbus_decode_payload.all;

use work.jadepix_defines.all;


entity ipbus_payload is
  generic(
    N_SS : positive := 8
    );
  port(
    ipb_clk : in  std_logic;
    ipb_rst : in  std_logic;
    ipb_in  : in  ipb_wbus;
    ipb_out : out ipb_rbus;

    -- Chip System Clock
    clk : in std_logic;
    rst : in std_logic;

    -- Global
    nuke     : out std_logic;
    soft_rst : out std_logic;

    -- DAC70004
    DACCLK     : in  std_logic;
    DACCLK_RST : in  std_logic;
    DAC_BUSY   : in  std_logic;
    DAC_WE     : out std_logic;
    DAC_DATA   : out std_logic_vector(31 downto 0);

    -- JadePix
    -- chip config fifo
    cfg_start : out std_logic;
    cfg_busy  : in  std_logic;

    INQUIRY       : out std_logic_vector(1 downto 0);
    CACHE_BIT_SET : out std_logic_vector(3 downto 0);

    hitmap_col_low  : out std_logic_vector(COL_WIDTH-1 downto 0);
    hitmap_col_high : out std_logic_vector(COL_WIDTH-1 downto 0);
    hitmap_en       : out std_logic;
    hitmap_num      : out std_logic_vector(3 downto 0);

    rs_busy          : in  std_logic;
    rs_start         : out std_logic;
    rs_frame_num_set : out std_logic_vector(FRAME_CNT_WIDTH-1 downto 0);

    gs_start      : out std_logic;
    gs_sel_pulse  : out std_logic;
    gs_busy       : in  std_logic;
    gs_col        : out std_logic_vector(COL_WIDTH-1 downto 0);
    gshutter_soft : out std_logic;
    aplse_soft    : out std_logic;
    dplse_soft    : out std_logic;

    gs_pulse_delay_cnt      : out std_logic_vector(8 downto 0);
    gs_pulse_width_cnt_low  : out std_logic_vector(31 downto 0);
    gs_pulse_width_cnt_high : out std_logic_vector(1 downto 0);
    gs_pulse_deassert_cnt   : out std_logic_vector(8 downto 0);
    gs_deassert_cnt         : out std_logic_vector(8 downto 0);

    anasel_en_soft : out std_logic;
    digsel_en_soft : out std_logic;
    load_soft      : out std_logic;

    spi_trans_end : out std_logic;

    PDB            : out std_logic;
    SN_OEn         : out std_logic;
    POR            : out std_logic;
    EN_diff        : out std_logic;
    Ref_clk_1G_f   : out std_logic;
    CLK_SEL        : out std_logic;
    D_RST          : out std_logic;
    SERIALIZER_RST : out std_logic;

    -- FIFO
    slow_ctrl_fifo_rd_clk        : in  std_logic;
    slow_ctrl_fifo_rd_en         : in  std_logic;
    slow_ctrl_fifo_valid         : out std_logic;
    slow_ctrl_fifo_empty         : out std_logic;
    slow_ctrl_fifo_prog_full     : out std_logic;
    slow_ctrl_fifo_wr_data_count : out std_logic_vector(CFG_FIFO_COUNT_WITDH-1 downto 0);
    slow_ctrl_fifo_rd_dout       : out std_logic_vector(31 downto 0);
    data_fifo_rst                : in  std_logic;
    data_fifo_wr_clk             : in  std_logic;
    data_fifo_wr_en              : in  std_logic;
    data_fifo_wr_din             : in  std_logic_vector(31 downto 0);
    data_fifo_full               : out std_logic;
    data_fifo_almost_full        : out std_logic;

    -- SPI Master
    ss   : out std_logic_vector(N_SS - 1 downto 0);
    mosi : out std_logic;
    miso : in  std_logic;
    sclk : out std_logic;

    -- DEBUG
    debug                : out std_logic;
    hit_rst              : out std_logic;
    ca_en                : out std_logic;
    sel_chip_clk         : out std_logic;
    ca_soft              : out std_logic_vector(COL_WIDTH-1 downto 0);
    matrix_grst_soft     : out std_logic;
    rx_fpga_oe           : out std_logic;
    digsel_en_manually   : out std_logic;
    anasel_en_manually   : out std_logic;
    dplse_manually       : out std_logic;
    aplse_manually       : out std_logic;
    matrix_grst_manually : out std_logic;
    gshutter_manually    : out std_logic;
    ca_soft_manually     : out std_logic;
    ca_en_manually       : out std_logic;
    hit_rst_manually     : out std_logic;

    cfg_add_factor_t0 : out std_logic_vector(7 downto 0);
    cfg_add_factor_t1 : out std_logic_vector(15 downto 0);
    cfg_add_factor_t2 : out std_logic_vector(7 downto 0)

    );

end ipbus_payload;

architecture rtl of ipbus_payload is

  signal ipbw : ipb_wbus_array(N_SLAVES - 1 downto 0);
  signal ipbr : ipb_rbus_array(N_SLAVES - 1 downto 0);

  signal spi_rst  : std_logic;          -- from ipbus control module
  signal rst_spi  : std_logic;          -- to SPI module
  signal spi_busy : std_logic;

begin

-- ipbus address decode
  fabric : entity work.ipbus_fabric_sel
    generic map(
      NSLV      => N_SLAVES,
      SEL_WIDTH => IPBUS_SEL_WIDTH)
    port map(
      ipb_in          => ipb_in,
      ipb_out         => ipb_out,
      sel             => ipbus_sel_payload(ipb_in.ipb_addr),
      ipb_to_slaves   => ipbw,
      ipb_from_slaves => ipbr
      );

  slave0 : entity work.ipbus_global_device
    port map(
      ipb_clk  => ipb_clk,
      ipb_rst  => ipb_rst,
      ipb_in   => ipbw(N_SLV_GLOBAL),
      ipb_out  => ipbr(N_SLV_GLOBAL),
      nuke     => nuke,
      soft_rst => soft_rst
      );

  slave1 : entity work.ipbus_dac70004_device
    port map(
      ipb_clk => ipb_clk,
      ipb_rst => ipb_rst,
      ipb_in  => ipbw(N_SLV_DAC70004),
      ipb_out => ipbr(N_SLV_DAC70004),

      DACCLK     => DACCLK,
      DACCLK_RST => DACCLK_RST,
      DAC_BUSY   => DAC_BUSY,
      DAC_WE     => DAC_WE,
      DAC_DATA   => DAC_DATA
      );


  rst_spi <= spi_rst or ipb_rst;
  slave2 : entity work.ipbus_spi
    generic map(
      N_SS => N_SS
      )
    port map(
      clk           => ipb_clk,
      rst           => rst_spi,
      ipb_in        => ipbw(N_SLV_SPI),
      ipb_out       => ipbr(N_SLV_SPI),
      spi_busy      => spi_busy,
      spi_trans_end => spi_trans_end,
      ss            => ss,
      mosi          => mosi,
      miso          => miso,
      sclk          => sclk
      );


  slave3 : entity work.ipbus_jadepix_device
    port map(
      ipb_clk => ipb_clk,
      ipb_rst => ipb_rst,
      ipb_in  => ipbw(N_SLV_JADEPIX),
      ipb_out => ipbr(N_SLV_JADEPIX),

      clk => clk,
      rst => rst,

      spi_rst  => spi_rst,
      spi_busy => spi_busy,

      cfg_start => cfg_start,
      cfg_busy  => cfg_busy,

      INQUIRY       => INQUIRY,
      CACHE_BIT_SET => CACHE_BIT_SET,

      hitmap_col_low  => hitmap_col_low,
      hitmap_col_high => hitmap_col_high,
      hitmap_en       => hitmap_en,
      hitmap_num      => hitmap_num,

      rs_busy          => rs_busy,
      rs_start         => rs_start,
      rs_frame_num_set => rs_frame_num_set,

      gs_sel_pulse => gs_sel_pulse,
      gs_start     => gs_start,
      gs_col       => gs_col,
      gs_busy      => gs_busy,

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

      PDB               => PDB,
      SN_OEn            => SN_OEn,
      POR               => POR,
      EN_diff           => EN_diff,
      Ref_clk_1G_f      => Ref_clk_1G_f,
      CLK_SEL           => CLK_SEL,
      D_RST             => D_RST,
      SERIALIZER_RST    => SERIALIZER_RST,
      sel_chip_clk      => sel_chip_clk,
      cfg_add_factor_t0 => cfg_add_factor_t0,
      cfg_add_factor_t1 => cfg_add_factor_t1,
      cfg_add_factor_t2 => cfg_add_factor_t2,

      --FIFO
      slow_ctrl_fifo_rd_clk        => slow_ctrl_fifo_rd_clk,
      slow_ctrl_fifo_rd_en         => slow_ctrl_fifo_rd_en,
      slow_ctrl_fifo_valid         => slow_ctrl_fifo_valid,
      slow_ctrl_fifo_empty         => slow_ctrl_fifo_empty,
      slow_ctrl_fifo_prog_full     => slow_ctrl_fifo_prog_full,
      slow_ctrl_fifo_wr_data_count => slow_ctrl_fifo_wr_data_count,
      slow_ctrl_fifo_rd_dout       => slow_ctrl_fifo_rd_dout,
      data_fifo_rst                => data_fifo_rst,
      data_fifo_wr_clk             => data_fifo_wr_clk,
      data_fifo_wr_en              => data_fifo_wr_en,
      data_fifo_full               => data_fifo_full,
      data_fifo_almost_full        => data_fifo_almost_full,
      data_fifo_wr_din             => data_fifo_wr_din,
      ca_en                        => ca_en,
      ca_soft                      => ca_soft,
      hit_rst                      => hit_rst,
      matrix_grst_soft             => matrix_grst_soft,
      rx_fpga_oe                   => rx_fpga_oe,

      digsel_en_manually   => digsel_en_manually,
      anasel_en_manually   => anasel_en_manually,
      dplse_manually       => dplse_manually,
      aplse_manually       => aplse_manually,
      matrix_grst_manually => matrix_grst_manually,
      gshutter_manually    => gshutter_manually,
      ca_soft_manually     => ca_soft_manually,
      ca_en_manually       => ca_en_manually,
      hit_rst_manually     => hit_rst_manually
      );

end rtl;

