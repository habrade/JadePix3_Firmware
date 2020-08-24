----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/16/2020 10:56:40 PM
-- Design Name: 
-- Module Name: ipbus_slave_reg_ram - behv
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

use work.ipbus.all;
use work.ipbus_reg_types.all;
use work.ipbus_reg_types_new.all;


entity ipbus_slave_reg_ram is
  generic(
    SYNC_REG_ENA : boolean := false;
    N_STAT       : integer := 1;
    N_CTRL       : integer := 1;
    N_RAM        : integer := 1
    );
  port(
    ipb_clk : in  std_logic;
    ipb_rst : in  std_logic;
    ipb_in  : in  ipb_wbus;
    ipb_out : out ipb_rbus;

    clk : in std_logic;
    rst : in std_logic;

    ctrl         : out ipb_reg_v(integer_max(N_CTRL, 1)-1 downto 0);
    ctrl_reg_stb : out std_logic_vector(integer_max(N_CTRL, 1)-1 downto 0);
    stat         : in  ipb_reg_v(integer_max(N_STAT, 1)-1 downto 0);
    stat_reg_stb : out std_logic_vector(integer_max(N_STAT, 1)-1 downto 0)
    );
end ipbus_slave_reg_ram;

architecture behv of ipbus_slave_reg_ram is

  constant REG_NSLV : integer  := reg_slave_num(N_STAT, N_CTRL);
  constant NSLV     : positive := REG_NSLV+N_RAM;

  signal ipbw : ipb_wbus_array(NSLV-1 downto 0);
  signal ipbr : ipb_rbus_array(NSLV-1 downto 0);

  signal rst_r   : std_logic;
  signal rst_ram : std_logic_vector(N_RAM-1 downto 0);

begin

  rst_r <= ipb_rst or rst;

  inst_device_fabric : entity work.ipbus_fabric_inside_device
    generic map(
      N_CTRL => N_CTRL,                 --the control register number
      N_STAT => N_STAT,                 --the status register number
      N_RAM  => N_RAM
      )
    port map(
      ipb_in          => ipb_in,
      ipb_out         => ipb_out,
      ipb_to_slaves   => ipbw,
      ipb_from_slaves => ipbr,
      debug           => open
      );


  gen_reg : if REG_NSLV = 1 generate
    reg_gen_0 : if SYNC_REG_ENA = true generate
      inst_ipbus_slave_0 : entity work.ipbus_ctrlreg_v
        generic map(
          N_CTRL     => N_CTRL,
          N_STAT     => N_STAT,
          SWAP_ORDER => true
          )
        port map(
          clk       => ipb_clk,
          reset     => rst_r,
          ipbus_in  => ipbw(0),
          ipbus_out => ipbr(0),
          d         => stat,
          q         => ctrl,
          stb       => ctrl_reg_stb
          );
    end generate;

    reg_gen_1 : if SYNC_REG_ENA = false generate
      inst_ipbus_slave_1 : entity work.ipbus_syncreg_v
        generic map(
          N_CTRL     => N_CTRL,
          N_STAT     => N_STAT,
          SWAP_ORDER => true
          )
        port map (
          clk     => ipb_clk,
          rst     => rst_r,
          ipb_in  => ipbw(0),
          ipb_out => ipbr(0),
          slv_clk => clk,
          d       => stat,
          q       => ctrl,
          stb     => ctrl_reg_stb(N_CTRL-1 downto 0),
          rstb    => stat_reg_stb(N_STAT-1 downto 0)
          );
    end generate;

  end generate;


end behv;
