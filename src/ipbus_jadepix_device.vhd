--------------------------------------------------------------------------------
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
use IEEE.NUMERIC_STD.all;

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

    -- SPI Reset
    spi_rst  : out std_logic;
    spi_busy : in  std_logic;

    -- Chip config fifo
    cfg_start : out std_logic;
    cfg_busy  : in  std_logic;

    CACHE_BIT_SET : out std_logic_vector(3 downto 0);
    INQUIRY       : out std_logic_vector(1 downto 0);

    hitmap_col_low  : out std_logic_vector(COL_WIDTH-1 downto 0);
    hitmap_col_high : out std_logic_vector(COL_WIDTH-1 downto 0);
    hitmap_en       : out std_logic;
    hitmap_num      : out std_logic_vector(3 downto 0);


    rs_busy          : in  std_logic;
    rs_start         : out std_logic;
    rs_frame_num_set : out std_logic_vector(FRAME_CNT_WIDTH-1 downto 0);

    gs_start      : out std_logic;
    gshutter_soft : out std_logic;
    aplse_soft    : out std_logic;
    dplse_soft    : out std_logic;
    gs_col        : out std_logic_vector(COL_WIDTH-1 downto 0);

    gs_sel_pulse            : out std_logic;
    gs_busy                 : in  std_logic;
    gs_pulse_delay_cnt      : out std_logic_vector(8 downto 0);
    gs_pulse_width_cnt_low  : out std_logic_vector(31 downto 0);
    gs_pulse_width_cnt_high : out std_logic_vector(1 downto 0);
    gs_pulse_deassert_cnt   : out std_logic_vector(8 downto 0);
    gs_deassert_cnt         : out std_logic_vector(8 downto 0);

    anasel_en_soft : out std_logic;
    digsel_en_soft : out std_logic;
    load_soft      : out std_logic;

    PDB               : out std_logic;
    SN_OEn            : out std_logic;
    POR               : out std_logic;
    EN_diff           : out std_logic;
    Ref_clk_1G_f      : out std_logic;
    CLK_SEL           : out std_logic;
    D_RST             : out std_logic;
    SERIALIZER_RST    : out std_logic;
    sel_chip_clk      : out std_logic;
    blk_sel_def       : out std_logic_vector(1 downto 0);
    cfg_add_factor_t0 : out std_logic_vector(7 downto 0);
    cfg_add_factor_t1 : out std_logic_vector(15 downto 0);
    cfg_add_factor_t2 : out std_logic_vector(7 downto 0);

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

    -- DEBUG
    debug   : out std_logic;
    hit_rst : out std_logic;
    ca_en   : out std_logic;
    ca_soft : out std_logic_vector(COL_WIDTH-1 downto 0)
    );
end ipbus_jadepix_device;

architecture behv of ipbus_jadepix_device is
  -- IPbus reg
  constant SYNC_REG_ENA               : boolean := false;
  constant N_STAT                     : integer := 2;
  constant N_CTRL                     : integer := 10;
  constant N_WFIFO                    : integer := 1;
  constant N_RFIFO                    : integer := 1;
  signal stat                         : ipb_reg_v(N_STAT-1 downto 0);
  signal ctrl                         : ipb_reg_v(N_CTRL-1 downto 0);
  signal ctrl_reg_stb, ctrl_reg_stb_r : std_logic_vector(N_CTRL-1 downto 0);
  signal stat_reg_stb, stat_reg_stb_r : std_logic_vector(N_STAT-1 downto 0);

  --IPbus slave fifo
  signal cfg_fifo_rst : std_logic;

  signal rfifo_wr_din                                             : std_logic_vector(32*integer_max(N_RFIFO, 1)-1 downto 0);
  signal rfifo_wr_clk, rfifo_wr_en, rfifo_full, rfifo_almost_full : std_logic_vector(integer_max(N_RFIFO, 1)-1 downto 0);

  signal wfifo_rd_clk, wfifo_rd_en, wfifo_valid, wfifo_empty, wfifo_prog_full : std_logic_vector(integer_max(N_WFIFO, 1)-1 downto 0);
  signal wfifo_wr_data_count                                                  : std_logic_vector(18*integer_max(N_WFIFO, 1)-1 downto 0);

  signal wfifo_rd_dout : std_logic_vector(32*integer_max(N_WFIFO, 1)-1 downto 0);

  signal cfg_start_tmp     : std_logic;
  signal rs_start_tmp      : std_logic;
  signal gs_start_tmp      : std_logic;
  signal cache_bit_set_tmp : std_logic_vector(3 downto 0);
  signal hitmap_en_tmp     : std_logic;
  signal load_tmp          : std_logic;

  signal rst_rfifo : std_logic := '0';

  -- IPbus drp
--  signal ram_rst : std_logic_vector(N_FIFO-1 downto 0);

  -- DEBUG
  attribute mark_debug                    : string;
  attribute mark_debug of load_soft       : signal is "true";
  attribute mark_debug of CACHE_BIT_SET   : signal is "true";
  attribute mark_debug of PDB             : signal is "true";
  attribute mark_debug of SN_OEn          : signal is "true";
  attribute mark_debug of POR             : signal is "true";
  attribute mark_debug of D_RST           : signal is "true";
  attribute mark_debug of SERIALIZER_RST  : signal is "true";
  attribute mark_debug of CLK_SEL         : signal is "true";
  attribute mark_debug of EN_diff         : signal is "true";
  attribute mark_debug of Ref_clk_1G_f    : signal is "true";
  attribute mark_debug of hitmap_col_low  : signal is "true";
  attribute mark_debug of hitmap_col_high : signal is "true";
  attribute mark_debug of hitmap_en       : signal is "true";
  attribute mark_debug of spi_rst         : signal is "true";
  attribute mark_debug of spi_busy        : signal is "true";

  attribute mark_debug of rfifo_full        : signal is "true";
  attribute mark_debug of rfifo_wr_en       : signal is "true";
  attribute mark_debug of rfifo_almost_full : signal is "true";
  attribute mark_debug of rfifo_wr_din      : signal is "true";

  attribute mark_debug of anasel_en_soft : signal is "true";
  attribute mark_debug of digsel_en_soft : signal is "true";
  attribute mark_debug of gs_sel_pulse   : signal is "true";

  attribute mark_debug of debug             : signal is "true";
  attribute mark_debug of ca_en             : signal is "true";
  attribute mark_debug of ca_soft           : signal is "true";
  attribute mark_debug of blk_sel_def       : signal is "true";
  attribute mark_debug of sel_chip_clk      : signal is "true";
  attribute mark_debug of cfg_add_factor_t0 : signal is "true";
  attribute mark_debug of cfg_add_factor_t1 : signal is "true";
  attribute mark_debug of cfg_add_factor_t2 : signal is "true";


begin
  --------------------------------------------------------------
  -- fifo signals and registers
  --------------------------------------------------------------

  wfifo_rd_clk(WFIFO_ADDR_SLOW_CTRL_CMD) <= slow_ctrl_fifo_rd_clk;
  wfifo_rd_en(WFIFO_ADDR_SLOW_CTRL_CMD)  <= slow_ctrl_fifo_rd_en;
  slow_ctrl_fifo_valid                   <= wfifo_valid(WFIFO_ADDR_SLOW_CTRL_CMD);
  slow_ctrl_fifo_empty                   <= wfifo_empty(WFIFO_ADDR_SLOW_CTRL_CMD);
  slow_ctrl_fifo_prog_full               <= wfifo_prog_full(WFIFO_ADDR_SLOW_CTRL_CMD);
  slow_ctrl_fifo_wr_data_count           <= wfifo_wr_data_count((WFIFO_ADDR_SLOW_CTRL_CMD+1)*18-1 downto WFIFO_ADDR_SLOW_CTRL_CMD*18);
  slow_ctrl_fifo_rd_dout                 <= wfifo_rd_dout((WFIFO_ADDR_SLOW_CTRL_CMD+1)*32-1 downto WFIFO_ADDR_SLOW_CTRL_CMD*32);

  rfifo_wr_clk(RFIFO_ADDR_DATA_FIFO)                                         <= data_fifo_wr_clk;
  rfifo_wr_en(RFIFO_ADDR_DATA_FIFO)                                          <= data_fifo_wr_en;
  data_fifo_full                                                             <= rfifo_full(RFIFO_ADDR_DATA_FIFO);
  data_fifo_almost_full                                                      <= rfifo_almost_full(RFIFO_ADDR_DATA_FIFO);
  rfifo_wr_din((RFIFO_ADDR_DATA_FIFO+1)*32-1 downto RFIFO_ADDR_DATA_FIFO*32) <= data_fifo_wr_din;

  ipbus_slave_reg_fifo : entity work.ipbus_slave_reg_fifo
    generic map(
      SYNC_REG_ENA => SYNC_REG_ENA,
      N_STAT       => N_STAT,
      N_CTRL       => N_CTRL,
      N_WFIFO      => N_WFIFO,
      N_RFIFO      => N_RFIFO
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
      stat_reg_stb => open,

      -- FIFO
      wfifo_rst           => cfg_fifo_rst,
      wfifo_rd_clk        => wfifo_rd_clk,
      wfifo_rd_en         => wfifo_rd_en,
      wfifo_valid         => wfifo_valid,
      wfifo_empty         => wfifo_empty,
      wfifo_prog_full     => wfifo_prog_full,
      wfifo_wr_data_count => wfifo_wr_data_count,
      wfifo_rd_dout       => wfifo_rd_dout,
      rfifo_rst           => data_fifo_rst or rst_rfifo,
      rfifo_wr_clk        => rfifo_wr_clk,
      rfifo_wr_en         => rfifo_wr_en,
      rfifo_full          => rfifo_full,
      rfifo_almost_full   => rfifo_almost_full,
      rfifo_wr_din        => rfifo_wr_din
      );

  -- control
  process(clk)
  begin
    if rising_edge(clk) then
      cfg_start_tmp  <= ctrl(0)(0);
      rs_start_tmp   <= ctrl(0)(1);
      gs_start_tmp   <= ctrl(0)(2);
      spi_rst        <= ctrl(0)(3);
      CLK_SEL        <= ctrl(0)(4);
      PDB            <= ctrl(0)(5);
      load_tmp       <= ctrl(0)(6);
      cfg_fifo_rst   <= ctrl(0)(7);
      cache_bit_set  <= ctrl(0)(11 downto 8);
      D_RST          <= ctrl(0)(12);
      gs_col         <= ctrl(0)(21 downto 13);
      anasel_en_soft <= ctrl(0)(22);
      digsel_en_soft <= ctrl(0)(23);
      gs_sel_pulse   <= ctrl(0)(24);
      aplse_soft     <= ctrl(0)(25);
      dplse_soft     <= ctrl(0)(26);
      gshutter_soft  <= ctrl(0)(27);
      SN_OEn         <= ctrl(0)(28);
      POR            <= ctrl(0)(29);
      EN_diff        <= ctrl(0)(30);
      Ref_clk_1G_f   <= ctrl(0)(31);

      rs_frame_num_set <= ctrl(1)(FRAME_CNT_WIDTH-1 downto 0);

      hitmap_col_low  <= ctrl(2)(8 downto 0);
      hitmap_col_high <= ctrl(2)(17 downto 9);
      hitmap_en       <= ctrl(2)(18);
      hitmap_num      <= ctrl(2)(22 downto 19);

      gs_pulse_delay_cnt      <= ctrl(3)(8 downto 0);
      gs_pulse_width_cnt_low  <= ctrl(4);
      gs_pulse_width_cnt_high <= ctrl(5)(1 downto 0);
      gs_pulse_deassert_cnt   <= ctrl(6)(8 downto 0);
      gs_deassert_cnt         <= ctrl(7)(8 downto 0);

      rst_rfifo      <= ctrl(8)(0);
      SERIALIZER_RST <= ctrl(8)(1);
      INQUIRY        <= ctrl(8)(3 downto 2);
      debug          <= ctrl(8)(4);
      ca_soft        <= ctrl(8)(13 downto 5);
      ca_en          <= ctrl(8)(14);
      hit_rst        <= ctrl(8)(15);
      sel_chip_clk   <= ctrl(8)(16);
      blk_sel_def    <= ctrl(8)(18 downto 17);

      cfg_add_factor_t0 <= ctrl(9)(7 downto 0);
      cfg_add_factor_t1 <= ctrl(9)(23 downto 8);
      cfg_add_factor_t2 <= ctrl(9)(31 downto 24);

      ctrl_reg_stb_r <= ctrl_reg_stb;
      stat_reg_stb_r <= stat_reg_stb;
    end if;
  end process;

  sync_ctrl_signals : process(clk)
  begin
    if rising_edge(clk) then

      if ctrl_reg_stb_r(0) = '1' then
        cfg_start <= cfg_start_tmp;
        rs_start  <= rs_start_tmp;
        gs_start  <= gs_start_tmp;
        load_soft <= load_tmp;
      else
        cfg_start <= '0';
        rs_start  <= '0';
        gs_start  <= '0';
        load_soft <= '0';
      end if;
    end if;
  end process;

  -- status
  process(clk)
  begin
    if rising_edge(clk) then
      stat(0)(0) <= cfg_busy;
      stat(0)(1) <= rs_busy;
      stat(0)(2) <= gs_busy;
      stat(0)(3) <= spi_busy;

      stat(1)(0)           <= wfifo_empty(WFIFO_ADDR_SLOW_CTRL_CMD);
      stat(1)(1)           <= wfifo_prog_full(WFIFO_ADDR_SLOW_CTRL_CMD);
      stat(1)(19 downto 2) <= wfifo_wr_data_count((WFIFO_ADDR_SLOW_CTRL_CMD+1)*18-1 downto WFIFO_ADDR_SLOW_CTRL_CMD*18);

    end if;
  end process;


end behv;
