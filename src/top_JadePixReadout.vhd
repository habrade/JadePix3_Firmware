library IEEE;
use IEEE.STD_LOGIC_1164.all;

library UNISIM;
use UNISIM.vcomponents.all;

use work.ipbus.all;
use work.drp_decl.all;

use work.global_defines.all;


entity top is port(
  sysclk_p     : in  std_logic;
  sysclk_n     : in  std_logic;
  leds         : out std_logic_vector(3 downto 0); -- status LEDs
  dip_sw       : in  std_logic_vector(3 downto 0); -- switches
  gmii_gtx_clk : out std_logic;
  gmii_tx_en   : out std_logic;
  gmii_tx_er   : out std_logic;
  gmii_txd     : out std_logic_vector(7 downto 0);
  gmii_rx_clk  : in  std_logic;
  gmii_rx_dv   : in  std_logic;
  gmii_rx_er   : in  std_logic;
  gmii_rxd     : in  std_logic_vector(7 downto 0);
  phy_rst      : out std_logic;

  -- DAC70004
  DAC_SCLK : out std_logic;
  DAC_LOAD : out std_logic;
  DAC_SYNC : out std_logic;
  DAC_SDIN : out std_logic;
  DAC_CLR  : out std_logic;
--  DAC_BUSY : out std_logic

  -- SPI Master
  ss: out std_logic_vector(N_SS - 1 downto 0);
  mosi: out std_logic;
  miso: in std_logic;
  sclk: out std_logic
  );
end top;

architecture rtl of top is

  -- IPbus
  signal clk_ipb, rst_ipb, clk_125M, clk_aux, rst_aux, locked, nuke, soft_rst, phy_rst_e, userled : std_logic;
  signal mac_addr                                                                         : std_logic_vector(47 downto 0);
  signal ip_addr                                                                          : std_logic_vector(31 downto 0);
  signal ipb_out                                                                          : ipb_wbus;
  signal ipb_in                                                                           : ipb_rbus;

  -- DAC70004
  signal DAC_BUSY : std_logic;
  signal DAC_WE   : std_logic;
  signal DAC_DATA : std_logic_vector(31 downto 0);


begin

-- Infrastructure

  ipbus_infra : entity work.ipbus_gmii_infra
    generic map(
     CLK_AUX_FREQ  => 50.0 -- 50 MHz clock for DAC70004
    )
    port map(
      sysclk_p     => sysclk_p,
      sysclk_n     => sysclk_n,
      clk_ipb_o    => clk_ipb,
      rst_ipb_o    => rst_ipb,
      clk_125_o    => clk_125M,
      rst_125_o    => phy_rst_e,
      clk_aux_o    => clk_aux,
      rst_aux_o    => rst_aux,
      locked_o     => locked,
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

  leds(3 downto 2) <= '0' & userled;
  phy_rst          <= not phy_rst_e;

  mac_addr <= X"020ddba1151" & dip_sw; -- Careful here, arbitrary addresses do not always work
  ip_addr <= X"c0a8031" & dip_sw; -- 192.168.3.16+n (n:0-15)

-- ipbus slaves live in the entity below, and can expose top-level ports
-- The ipbus fabric is instantiated within.

  ipbus_payload : entity work.ipbus_payload
    generic map(
      N_SS => N_SS
    )
    port map(
      ipb_clk  => clk_ipb,
      ipb_rst  => rst_ipb,
      ipb_in   => ipb_out,
      ipb_out  => ipb_in,
      -- Global
      nuke     => nuke,
      soft_rst => soft_rst,
      -- DAC70004
      DAC_BUSY => DAC_BUSY,
      DAC_WE   => DAC_WE,
      DAC_DATA => DAC_DATA,
      -- SPI master
      ss   => ss,
      mosi => mosi,
	  miso => miso,
	  sclk => sclk
      );

  inst_dac70004 : entity work.DAC_refresh
    port map(
      CLK_50M    => clk_aux,
      DLL_LOCKED => locked,
      DAC_WE     => DAC_WE,
      DAC_DATA   => DAC_DATA,
      DAC_SCLK   => DAC_SCLK,
      DAC_LOAD   => DAC_LOAD,
      DAC_SYNC   => DAC_SYNC,
      DAC_SDIN   => DAC_SDIN,
      DAC_CLR    => DAC_CLR,
      DAC_BUSY   => DAC_BUSY
      );


end rtl;
