----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/18/2020 12:26:36 PM
-- Design Name: 
-- Module Name: jadepix_ctrl_wrapper - behv
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

use work.jadepix_defines.all;


entity jadepix_ctrl_wrapper is
  port(
    clk     : in std_logic;
    rst     : in std_logic;
    clk_ipb : in std_logic;
    rst_ipb : in std_logic;

    --SPI load
    spi_trans_end : in  std_logic;
    load_soft     : in  std_logic;
    LOAD          : out std_logic;

    cfg_start : in std_logic;
    rs_start  : in std_logic;
    gs_start  : in std_logic;

    RA    : out std_logic_vector(ROW_WIDTH-1 downto 0);
    RA_EN : out std_logic;
    CA    : out std_logic_vector(COL_WIDTH-1 downto 0);
    CA_EN : out std_logic;

    CON_SELM : out std_logic;
    CON_SELP : out std_logic;
    CON_DATA : out std_logic;

    -- chip config fifo
    cfg_fifo_dout       : in  std_logic_vector(2 downto 0);
    cfg_fifo_dout_valid : in  std_logic;
    cfg_busy            : out std_logic;
    cfg_fifo_rd_en      : out std_logic;
    cfg_fifo_empty      : in  std_logic;
    cfg_fifo_pfull      : in  std_logic;
    cfg_fifo_count      : in  std_logic_vector(CFG_FIFO_COUNT_WITDH-1 downto 0);
    cfg_add_factor_t0   : in  std_logic_vector(7 downto 0);
    cfg_add_factor_t1   : in  std_logic_vector(15 downto 0);
    cfg_add_factor_t2   : in  std_logic_vector(7 downto 0);

    digsel_en_rs : out std_logic;
    anasel_en_gs : out std_logic;

    -- Rolling shutter
    rs_frame_num_set : in  std_logic_vector(FRAME_CNT_WIDTH-1 downto 0);
    rs_busy          : out std_logic;
    rs_frame_cnt     : out std_logic_vector(FRAME_CNT_WIDTH-1 downto 0);

    HIT_RST     : out std_logic;
    RD_EN       : out std_logic;
    MATRIX_GRST : out std_logic;

    start_cache     : out std_logic;
    clk_cache       : out std_logic;
    clk_cache_delay : out std_logic;
    is_busy_cache   : out std_logic;


    hitmap_col_low  : in std_logic_vector(COL_WIDTH-1 downto 0);
    hitmap_col_high : in std_logic_vector(COL_WIDTH-1 downto 0);
    hitmap_en       : in std_logic;
    hitmap_num      : in std_logic_vector(HITMAP_NUM_WIDTH-1 downto 0);
--    MATRIX_DIN : in std_logic_vector(15 downto 0);

    -- Global shutter
    aplse_gs    : out std_logic;
    dplse_gs    : out std_logic;
    gshutter_gs : out std_logic;

    gs_busy : out std_logic;

    gs_sel_pulse : in std_logic;
    gs_col       : in std_logic_vector(COL_WIDTH-1 downto 0);

    gs_pulse_delay_cnt      : in std_logic_vector(8 downto 0);
    gs_pulse_width_cnt_low  : in std_logic_vector(31 downto 0);
    gs_pulse_width_cnt_high : in std_logic_vector(1 downto 0);
    gs_pulse_deassert_cnt   : in std_logic_vector(8 downto 0);
    gs_deassert_cnt         : in std_logic_vector(8 downto 0)

    );
end jadepix_ctrl_wrapper;

architecture behv of jadepix_ctrl_wrapper is

begin

  jadepix_ctrl : entity work.jadepix_ctrl
    port map(

      clk => clk,
      rst => rst,

      cfg_fifo_dout       => cfg_fifo_dout,
      cfg_fifo_dout_valid => cfg_fifo_dout_valid,
      cfg_fifo_empty      => cfg_fifo_empty,
      cfg_fifo_pfull      => cfg_fifo_pfull,
      cfg_fifo_count      => cfg_fifo_count,
      cfg_busy            => cfg_busy,
      cfg_fifo_rd_en      => cfg_fifo_rd_en,
      cfg_start           => cfg_start,
      cfg_add_factor_t0   => cfg_add_factor_t0,
      cfg_add_factor_t1   => cfg_add_factor_t1,
      cfg_add_factor_t2   => cfg_add_factor_t2,

      start_cache   => start_cache,
      clk_cache     => clk_cache,
      is_busy_cache => is_busy_cache,

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

  jadepix_load_spi : entity work.jadepix_spi_load
    port map(
      clk           => clk_ipb,
      rst           => rst_ipb,
      spi_trans_end => spi_trans_end,
      load_soft     => load_soft,
      LOAD          => LOAD
      );

  gen_clk_cache_delay : entity work.gen_clk_cache_delay
    port map(
      clk => clk,
      rst => rst,

      hitmap_en  => hitmap_en,
      hitmap_num => hitmap_num,

      clk_cache       => clk_cache,
      clk_cache_delay => clk_cache_delay
      );

end behv;
