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
    cfg_start      : out std_logic;
    cfg_sync       : out jadepix_cfg;
    cfg_fifo_rst   : out std_logic;
    cfg_busy       : in  std_logic;
    cfg_fifo_empty : in  std_logic;
    cfg_fifo_pfull : in  std_logic;
    cfg_fifo_count : in  std_logic_vector(CFG_FIFO_COUNT_WITDH-1 downto 0);

    CACHE_BIT_SET : out std_logic_vector(3 downto 0);

    hitmap_col_low  : out std_logic_vector(COL_WIDTH-1 downto 0);
    hitmap_col_high : out std_logic_vector(COL_WIDTH-1 downto 0);
    hitmap_en       : out std_logic;
    hitmap_num      : out std_logic_vector(3 downto 0);

    rs_busy             : in  std_logic;
    rs_start            : out std_logic;
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

    PDB : out std_logic;

    -- SPI Master
    ss   : out std_logic_vector(N_SS - 1 downto 0);
    mosi : out std_logic;
    miso : in  std_logic;
    sclk : out std_logic
    );

end ipbus_payload;

architecture rtl of ipbus_payload is

  signal ipbw : ipb_wbus_array(N_SLAVES - 1 downto 0);
  signal ipbr : ipb_rbus_array(N_SLAVES - 1 downto 0);

  signal spi_rst  : std_logic;
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

  slave2 : entity work.ipbus_spi
    generic map(
      N_SS => N_SS
      )
    port map(
      clk           => ipb_clk,
      rst           => ipb_rst or spi_rst,
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

      cfg_start      => cfg_start,
      cfg_sync       => cfg_sync,
      cfg_fifo_rst   => cfg_fifo_rst,
      cfg_busy       => cfg_busy,
      cfg_fifo_empty => cfg_fifo_empty,
      cfg_fifo_pfull => cfg_fifo_pfull,
      cfg_fifo_count => cfg_fifo_count,

      CACHE_BIT_SET => CACHE_BIT_SET,

      hitmap_col_low  => hitmap_col_low,
      hitmap_col_high => hitmap_col_high,
      hitmap_en       => hitmap_en,
      hitmap_num      => hitmap_num,

      rs_busy             => rs_busy,
      rs_start            => rs_start,
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

      PDB => PDB

      );

end rtl;

