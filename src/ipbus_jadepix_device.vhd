----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/16/2020 08:48:44 PM
-- Design Name: 
-- Module Name: ipbus_jadepix_device - behv
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
use IEEE.STD_LOGIC_1164.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

use work.ipbus.all;
use work.ipbus_reg_types.all;

use work.jadepix_defines.all;

entity ipbus_jadepix_device is
  port(
    ipb_clk : in  std_logic;
    ipb_rst : in  std_logic;
    ipb_in  : in  ipb_wbus;
    ipb_out : out ipb_rbus;

    clk : in std_logic;
    rst : in std_logic;

    cfg_out   : out jadepix_cfg;
    cfg_start : out std_logic;
    rs_start  : out std_logic;
    gs_start  : out std_logic;

    apulse : out std_logic;
    dpulse : out std_logic;

    pdb : out std_logic;
    load : out std_logic

    );
end ipbus_jadepix_device;

architecture behv of ipbus_jadepix_device is
  -- IPbus reg
  constant SYNC_REG_ENA : boolean := true;
  constant N_STAT       : integer := 1;
  constant N_CTRL       : integer := 2;
  constant N_RAM        : integer := 0;
  signal stat           : ipb_reg_v(N_STAT-1 downto 0);
  signal ctrl           : ipb_reg_v(N_CTRL-1 downto 0);
  signal ctrl_reg_stb   : std_logic_vector(N_CTRL-1 downto 0);
  signal stat_reg_stb   : std_logic_vector(N_STAT-1 downto 0);

  -- IPbus drp
  signal ram_rst : std_logic_vector(N_RAM-1 downto 0);
begin

  inst_ipbus_slave_reg_ram : entity work.ipbus_slave_reg_ram
    generic map(
      SYNC_REG_ENA => SYNC_REG_ENA,
      N_STAT       => N_STAT,
      N_CTRL       => N_CTRL,
      N_RAM        => N_RAM
      )
    port map(

      ipb_clk => ipb_clk,
      ipb_rst => ipb_rst,
      ipb_in  => ipb_in,
      ipb_out => ipb_out,

      clk => clk,
      rst => rst,

      -- control/state registers
      ctrl         => ctrl,
      ctrl_reg_stb => ctrl_reg_stb,
      stat         => stat,
      stat_reg_stb => open

      );

  -- control
  process(ipb_clk)
  begin
    if rising_edge(clk) then
      cfg_out.row  <= ctrl(0)(20 downto 12);
      cfg_out.col  <= ctrl(0)(11 downto 3);
      cfg_out.data <= ctrl(0)(2 downto 0);
      cfg_start    <= ctrl(1)(0);
      rs_start     <= ctrl(1)(1);
      gs_start     <= ctrl(1)(2);
      apulse       <= ctrl(1)(3);
      dpulse       <= ctrl(1)(4);
      pdb          <= ctrl(1)(5);
      load         <= ctrl(1)(6);
    end if;
  end process;

  -- status
  process(ipb_clk)
  begin
    if rising_edge(clk) then
      stat(0)(1 downto 0) <= "00";
    end if;
  end process;

end behv;
