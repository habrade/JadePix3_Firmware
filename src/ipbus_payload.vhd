library IEEE;
use IEEE.STD_LOGIC_1164.all;
use work.ipbus.all;
use work.ipbus_reg_types.all;
use work.ipbus_decode_payload.all;
--use work.drp_decl.all;
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

    -- Payload Clock
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
    cfg_out   : out jadepix_cfg;
    cfg_start : out std_logic;
    rs_start  : out std_logic;
    gs_start  : out std_logic;
    apulse    : out std_logic;
    dpulse    : out std_logic;
    pdb       : out std_logic;
    load      : out std_logic;

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

  --Debug
  attribute mark_debug         : string;
  attribute mark_debug of miso : signal is "true";
  attribute mark_debug of mosi : signal is "true";
  attribute mark_debug of ss   : signal is "true";
  attribute mark_debug of sclk : signal is "true";
  attribute mark_debug of load : signal is "true";

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
      clk     => ipb_clk,
      rst     => ipb_rst,
      ipb_in  => ipbw(N_SLV_SPI),
      ipb_out => ipbr(N_SLV_SPI),
      ss      => ss,
      mosi    => mosi,
      miso    => miso,
      sclk    => sclk
      );


  slave3 : entity work.ipbus_jadepix_device
    port map(
      ipb_clk => ipb_clk,
      ipb_rst => ipb_rst,
      ipb_in  => ipbw(N_SLV_JADEPIX),
      ipb_out => ipbr(N_SLV_JADEPIX),

      clk => clk,
      rst => rst,

      cfg_out   => cfg_out,
      cfg_start => cfg_start,
      rs_start  => rs_start,
      gs_start  => gs_start,
      apulse    => apulse,
      dpulse    => dpulse,
      pdb       => pdb,
      load      => load

      );

end rtl;

