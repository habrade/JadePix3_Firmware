#-------------------------------------------------------------------------------
#
#   Copyright 2017 - Rutherford Appleton Laboratory and University of Bristol
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
#
#                                     - - -
#
#   Additional information about ipbus-firmare and the list of ipbus-firmware
#   contacts are available at
#
#       https://ipbus.web.cern.ch/ipbus
#
#-------------------------------------------------------------------------------


set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]

# System clock (200MHz)
create_clock -period 5.000 -name sysclk [get_ports sysclk_p]

set_false_path -through [get_pins ipbus_infra/clocks/rst_reg/Q]
set_false_path -through [get_nets ipbus_infra/clocks/nuke_i]


set_property IOSTANDARD LVDS [get_ports {sysclk_*}]
set_property PACKAGE_PIN AD12 [get_ports sysclk_p]
set_property PACKAGE_PIN AD11 [get_ports sysclk_n]

set_property IOSTANDARD LVCMOS15 [get_ports {leds[*]}]
set_property SLEW SLOW [get_ports {leds[*]}]
set_property PACKAGE_PIN AB8 [get_ports {leds[0]}]
set_property PACKAGE_PIN AA8 [get_ports {leds[1]}]
set_property PACKAGE_PIN AC9 [get_ports {leds[2]}]
set_property PACKAGE_PIN AB9 [get_ports {leds[3]}]
false_path {leds[*]} sysclk

set_property IOSTANDARD LVCMOS25 [get_ports {dip_sw[*]}]
set_property PACKAGE_PIN Y29 [get_ports {dip_sw[0]}]
set_property PACKAGE_PIN W29 [get_ports {dip_sw[1]}]
set_property PACKAGE_PIN AA28 [get_ports {dip_sw[2]}]
set_property PACKAGE_PIN Y28 [get_ports {dip_sw[3]}]
false_path {dip_sw[*]} sysclk

set_property IOSTANDARD LVCMOS25 [get_ports {gmii* phy_rst}]
set_property PACKAGE_PIN K30 [get_ports {gmii_gtx_clk}]
set_property PACKAGE_PIN M27 [get_ports {gmii_tx_en}]
set_property PACKAGE_PIN N29 [get_ports {gmii_tx_er}]
set_property PACKAGE_PIN N27 [get_ports {gmii_txd[0]}]
set_property PACKAGE_PIN N25 [get_ports {gmii_txd[1]}]
set_property PACKAGE_PIN M29 [get_ports {gmii_txd[2]}]
set_property PACKAGE_PIN L28 [get_ports {gmii_txd[3]}]
set_property PACKAGE_PIN J26 [get_ports {gmii_txd[4]}]
set_property PACKAGE_PIN K26 [get_ports {gmii_txd[5]}]
set_property PACKAGE_PIN L30 [get_ports {gmii_txd[6]}]
set_property PACKAGE_PIN J28 [get_ports {gmii_txd[7]}]
set_property PACKAGE_PIN U27 [get_ports {gmii_rx_clk}]
set_property PACKAGE_PIN R28 [get_ports {gmii_rx_dv}]
set_property PACKAGE_PIN V26 [get_ports {gmii_rx_er}]
set_property PACKAGE_PIN U30 [get_ports {gmii_rxd[0]}]
set_property PACKAGE_PIN U25 [get_ports {gmii_rxd[1]}]
set_property PACKAGE_PIN T25 [get_ports {gmii_rxd[2]}]
set_property PACKAGE_PIN U28 [get_ports {gmii_rxd[3]}]
set_property PACKAGE_PIN R19 [get_ports {gmii_rxd[4]}]
set_property PACKAGE_PIN T27 [get_ports {gmii_rxd[5]}]
set_property PACKAGE_PIN T26 [get_ports {gmii_rxd[6]}]
set_property PACKAGE_PIN T28 [get_ports {gmii_rxd[7]}]
set_property PACKAGE_PIN L20 [get_ports {phy_rst}]


# DAC70004
set_property IOSTANDARD LVCMOS25 [get_ports {DAC_*}]
set_property PACKAGE_PIN L15 [get_ports {DAC_SCLK}]
set_property PACKAGE_PIN E13 [get_ports {DAC_LOAD}]
set_property PACKAGE_PIN K15 [get_ports {DAC_SYNC}]
set_property PACKAGE_PIN K16 [get_ports {DAC_SDIN}]
set_property PACKAGE_PIN K13 [get_ports {DAC_CLR}]

## JadePix3
# SPI
set_property PACKAGE_PIN AE23 [get_ports {mosi}]
set_property IOSTANDARD LVCMOS25 [get_ports {mosi}]
set_property IOSTANDARD LVCMOS25 [get_ports {miso}]
set_property PACKAGE_PIN D26 [get_ports {miso}]
set_property PACKAGE_PIN A25 [get_ports {sclk}]
set_property IOSTANDARD LVCMOS25 [get_ports {sclk}]
set_property PACKAGE_PIN C19 [get_ports {ss[0]}]
set_property IOSTANDARD LVCMOS25 [get_ports {ss[0]}]
set_property PACKAGE_PIN AK24 [get_ports LOAD]
set_property IOSTANDARD LVCMOS25 [get_ports LOAD]

# CHIP
set_property PACKAGE_PIN F11 [get_ports REFCLK]
set_property IOSTANDARD LVCMOS25 [get_ports REFCLK]
set_property PACKAGE_PIN B15 [get_ports CACHE_CLK]
set_property IOSTANDARD LVCMOS25 [get_ports CACHE_CLK]
set_property IOSTANDARD LVCMOS25 [get_ports CACHE_BIT_SET[*]]
set_property PACKAGE_PIN C15 [get_ports CACHE_BIT_SET[0]]
set_property PACKAGE_PIN E15 [get_ports CACHE_BIT_SET[1]]
set_property PACKAGE_PIN E14 [get_ports CACHE_BIT_SET[2]]
set_property PACKAGE_PIN E11 [get_ports CACHE_BIT_SET[3]]

set_property IOSTANDARD LVCMOS25 [get_ports {RA*}]
set_property PACKAGE_PIN E16 [get_ports RA_EN]
set_property PACKAGE_PIN B30 [get_ports RA[0]]
set_property PACKAGE_PIN AH22 [get_ports RA[1]]
set_property PACKAGE_PIN AG22 [get_ports RA[2]]
set_property PACKAGE_PIN AE21 [get_ports RA[3]]
set_property PACKAGE_PIN AD21 [get_ports RA[4]]
set_property PACKAGE_PIN C30 [get_ports RA[5]]
set_property PACKAGE_PIN D29 [get_ports RA[6]]
set_property PACKAGE_PIN AK21 [get_ports RA[7]]
set_property PACKAGE_PIN AK20 [get_ports RA[8]]

set_property IOSTANDARD LVCMOS25 [get_ports {CA*}]
set_property PACKAGE_PIN AJ22 [get_ports CA_EN]
set_property PACKAGE_PIN H27 [get_ports CA[0]]
set_property PACKAGE_PIN H26 [get_ports CA[1]]
set_property PACKAGE_PIN AC29 [get_ports CA[2]]
set_property PACKAGE_PIN AA30 [get_ports CA[3]]
set_property PACKAGE_PIN Y30 [get_ports CA[4]]
set_property PACKAGE_PIN C22 [get_ports CA[5]]
set_property PACKAGE_PIN D22 [get_ports CA[6]]
set_property PACKAGE_PIN AF30 [get_ports CA[7]]
set_property PACKAGE_PIN AE30 [get_ports CA[8]]
  
set_property IOSTANDARD LVCMOS25 [get_ports {CON_*}]
set_property PACKAGE_PIN H12 [get_ports CON_SELM]
set_property PACKAGE_PIN H11 [get_ports CON_SELP]
set_property PACKAGE_PIN AH27 [get_ports CON_DATA]

set_property PACKAGE_PIN H15 [get_ports HIT_RST]
set_property IOSTANDARD LVCMOS25 [get_ports HIT_RST]
set_property PACKAGE_PIN G15 [get_ports RD_EN]
set_property IOSTANDARD LVCMOS25 [get_ports RD_EN]


set_property PACKAGE_PIN AH26 [get_ports MATRIX_GRST]
set_property IOSTANDARD LVCMOS25 [get_ports MATRIX_GRST]
set_property PACKAGE_PIN E30 [get_ports DIGSEL_EN]
set_property IOSTANDARD LVCMOS25 [get_ports DIGSEL_EN]
set_property PACKAGE_PIN AA20 [get_ports ANASEL_EN]
set_property IOSTANDARD LVCMOS25 [get_ports ANASEL_EN]
set_property PACKAGE_PIN AF23 [get_ports GSHUTTER]
set_property IOSTANDARD LVCMOS25 [get_ports GSHUTTER]
set_property PACKAGE_PIN AK29 [get_ports DPLSE]
set_property IOSTANDARD LVCMOS25 [get_ports DPLSE]
set_property PACKAGE_PIN AK30 [get_ports APLSE]
set_property IOSTANDARD LVCMOS25 [get_ports APLSE]


set_property PACKAGE_PIN G15 [get_ports RD_EN]
set_property IOSTANDARD LVCMOS25 [get_ports RD_EN]
set_property PACKAGE_PIN F12 [get_ports PDB]
set_property IOSTANDARD LVCMOS25 [get_ports PDB]
  
#set_property IOSTANDARD LVCMOS25 [get_ports {DATA_IN*}]
#set_property PACKAGE_PIN H27 [get_ports DATA_IN[0]]
#set_property PACKAGE_PIN H26 [get_ports DATA_IN[1]]
#set_property PACKAGE_PIN AC29 [get_ports DATA_IN[2]]
#set_property PACKAGE_PIN AA30 [get_ports DATA_IN[3]]
#set_property PACKAGE_PIN Y30 [get_ports DATA_IN[4]]
#set_property PACKAGE_PIN C22 [get_ports DATA_IN[5]]
#set_property PACKAGE_PIN D22 [get_ports DATA_IN[6]]
#set_property PACKAGE_PIN AF30 [get_ports DATA_IN[7]]

# IPbus clock
create_generated_clock -name ipbus_clk -source [get_pins ipbus_infra/clocks/mmcm/CLKIN1] [get_pins ipbus_infra/clocks/mmcm/CLKOUT3]

# Other derived clocks
create_generated_clock -name clk_aux -source [get_pins ipbus_infra/clocks/mmcm/CLKIN1] [get_pins ipbus_infra/clocks/mmcm/CLKOUT4]

# DAC Clock
create_generated_clock -name dac_clk -source [get_pins jadepix_clocks/mmcm/CLKIN1] [get_pins jadepix_clocks/mmcm/CLKOUT1]

## JAdepix clocks
create_generated_clock -name ref_clk -source [get_pins jadepix_clocks/mmcm/CLKIN1] [get_pins jadepix_clocks/mmcm/CLKOUT2]
create_generated_clock -name clk_sys -source [get_pins jadepix_clocks/mmcm/CLKIN1] [get_pins jadepix_clocks/mmcm/CLKOUT0]


set_clock_groups -asynchronous -group [get_clocks ipbus_clk] -group [get_clocks -include_generated_clocks [get_clocks clk_aux]]
set_clock_groups -asynchronous -group [get_clocks ipbus_clk] -group [get_clocks -include_generated_clocks [get_clocks dac_clk]]
set_clock_groups -asynchronous -group [get_clocks ipbus_clk] -group [get_clocks -include_generated_clocks [get_clocks clk_sys]]
set_clock_groups -asynchronous -group [get_clocks dac_clk] -group [get_clocks -include_generated_clocks [get_clocks ref_clk]]
set_clock_groups -asynchronous -group [get_clocks clk_sys] -group [get_clocks -include_generated_clocks [get_clocks ref_clk]]
set_clock_groups -asynchronous -group [get_clocks clk_sys] -group [get_clocks -include_generated_clocks [get_clocks dac_clk]]
