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

    -- chip config fifo
    cfg_sync       : out jadepix_cfg;
    cfg_fifo_rst   : out std_logic;
    cfg_busy       : in  std_logic;
    rs_busy        : in  std_logic;
    cfg_fifo_empty : in  std_logic;
    cfg_fifo_pfull : in  std_logic;
    cfg_fifo_count : in  std_logic_vector(CFG_FIFO_COUNT_WITDH-1 downto 0);

    CACHE_BIT_SET : out std_logic_vector(3 downto 0);
    MATRIX_GRST   : out std_logic;

    matrix_col_low  : out std_logic_vector(COL_WIDTH-1 downto 0);
    matrix_col_high : out std_logic_vector(COL_WIDTH-1 downto 0);

    cfg_start : out std_logic;
    rs_start  : out std_logic;
    gs_start  : out std_logic;

    apulse : out std_logic;
    dpulse : out std_logic;

    PDB  : out std_logic;
    LOAD : out std_logic
    );
end ipbus_jadepix_device;

architecture behv of ipbus_jadepix_device is
  -- IPbus reg
  constant SYNC_REG_ENA               : boolean := false;
  constant N_STAT                     : integer := 2;
  constant N_CTRL                     : integer := 3;
  constant N_RAM                      : integer := 0;
  signal stat                         : ipb_reg_v(N_STAT-1 downto 0);
  signal ctrl                         : ipb_reg_v(N_CTRL-1 downto 0);
  signal ctrl_reg_stb, ctrl_reg_stb_r : std_logic_vector(N_CTRL-1 downto 0);
  signal stat_reg_stb, stat_reg_stb_r : std_logic_vector(N_STAT-1 downto 0);

  signal cfg_start_tmp       : std_logic;
  signal rs_start_tmp        : std_logic;
  signal gs_start_tmp        : std_logic;
  signal cache_bit_set_tmp   : std_logic_vector(3 downto 0);
  signal matrix_grst_tmp     : std_logic;
  signal matrix_col_low_tmp  : std_logic_vector(COL_WIDTH-1 downto 0);
  signal matrix_col_high_tmp : std_logic_vector(COL_WIDTH-1 downto 0);
  signal load_tmp            : std_logic;
  signal pdb_tmp             : std_logic;

  -- IPbus drp
  signal ram_rst : std_logic_vector(N_RAM-1 downto 0);

  signal cfg : jadepix_cfg;

  -- DEBUG
  attribute mark_debug                  : string;
  attribute mark_debug of LOAD          : signal is "true";
  attribute mark_debug of CACHE_BIT_SET : signal is "true";
  attribute mark_debug of MATRIX_GRST   : signal is "true";
  attribute mark_debug of PDB           : signal is "true";

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
  process(clk)
  begin
    if rising_edge(clk) then
      cfg.wr_en           <= ctrl(0)(3);
      cfg.din             <= ctrl(0)(2 downto 0);
      cfg_start_tmp       <= ctrl(1)(0);
      rs_start_tmp        <= ctrl(1)(1);
      gs_start_tmp        <= ctrl(1)(2);
      apulse              <= ctrl(1)(3);
      dpulse              <= ctrl(1)(4);
      pdb_tmp             <= ctrl(1)(5);
      load_tmp            <= ctrl(1)(6);
      cfg_fifo_rst        <= ctrl(1)(7);
      cache_bit_set_tmp   <= ctrl(1)(11 downto 8);
      matrix_grst_tmp     <= ctrl(1)(12);
      matrix_col_low_tmp  <= ctrl(2)(8 downto 0);
      matrix_col_high_tmp <= ctrl(2)(17 downto 9);
      ctrl_reg_stb_r      <= ctrl_reg_stb;
      stat_reg_stb_r      <= stat_reg_stb;
    end if;
  end process;

  sync_ctrl_signals : process(clk)
  begin
    if rising_edge(clk) then
      if ctrl_reg_stb_r(0) = '1' then
        cfg_sync <= cfg;
      else
        cfg_sync <= JADEPIX_CFG_NULL;
      end if;

      if ctrl_reg_stb_r(1) = '1' then
        cfg_start     <= cfg_start_tmp;
        rs_start      <= rs_start_tmp;
        gs_start      <= gs_start_tmp;
        CACHE_BIT_SET <= cache_bit_set_tmp;
        MATRIX_GRST   <= matrix_grst_tmp;
        PDB           <= pdb_tmp;
        LOAD          <= load_tmp;
      else
        cfg_start     <= '0';
        rs_start      <= '0';
        gs_start      <= '0';
        CACHE_BIT_SET <= (others => '0');
        MATRIX_GRST   <= '0';
        PDB           <= '0';
        LOAD          <= '0';
      end if;
      
      if ctrl_reg_stb_r(2) = '1' then
        matrix_col_low  <= matrix_col_low_tmp;
        matrix_col_high <= matrix_col_high_tmp;
      else
        matrix_col_low  <= (others => '0');
        matrix_col_high <= (others => '0');
      end if;

    end if;
  end process;


  -- status
  process(clk)
  begin
    if rising_edge(clk) then
      stat(0)(1)           <= cfg_busy;
      stat(1)(0)           <= cfg_fifo_empty;
      stat(1)(1)           <= cfg_fifo_pfull;
      stat(1)(18 downto 2) <= cfg_fifo_count;
      stat(1)(19)          <= rs_busy;
    end if;
  end process;


end behv;
