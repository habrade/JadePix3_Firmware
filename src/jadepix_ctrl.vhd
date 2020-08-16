----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/16/2020 08:41:41 PM
-- Design Name: 
-- Module Name: jadepix_ctrl - behv
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

use work.jadepix_defines.all;


entity jadepix_ctrl is
  port(
    clk : in std_logic;
    rst : in std_logic;

    cfg_out   : in jadepix_cfg;
    cfg_start : in std_logic;

    rs_start  : in std_logic;
    gs_start  : in std_logic;
    apulse_in : in std_logic;
    dpulse_in : in std_logic;

    RA    : out std_logic_vector(ROW_WIDTH-1 downto 0);
    RA_EN : out std_logic;
    CA    : out std_logic_vector(COL_WIDTH-1 downto 0);
    CA_EN : out std_logic;

    CON_SELM : out std_logic;
    CON_SELP : out std_logic;
    CON_DATA : out std_logic;

    MATRIX_DIN : in std_logic_vector(15 downto 0);

--    CACHE_CLK     : out std_logic;
    CACHE_BIT_SEL : out std_logic_vector(3 downto 0);
    HIT_RST       : out std_logic;
    RD_EN         : out std_logic;

    MATRIX_GRST : out std_logic;
    DIGSEL_EN   : out std_logic;
    ANASEL_EN   : out std_logic;
    GSHUTTER    : out std_logic;
    DPLSE       : out std_logic;
    APLSE       : out std_logic

    );
end jadepix_ctrl;

architecture behv of jadepix_ctrl is

  type JADEPIX_STATE is (IDLE, CFG, RS, GS);
  signal state_reg, state_next : JADEPIX_STATE;

  signal RA_tmp                                   : natural range 0 to N_ROW-1;
  signal CA_tmp                                   : natural range 0 to N_COL-1;
  signal RA_EN_tmp, CA_EN_tmp                     : std_logic;
  signal CON_SELM_tmp, CON_SELP_tmp, CON_DATA_tmp : std_logic;

  signal rs_finished : std_logic;

begin

  process(clk, rst)
  begin
    if rst = '1' then
      state_reg <= IDLE;
    elsif rising_edge(clk) then
      state_reg <= state_next;
    end if;
  end process;

  process(cfg_out, cfg_start, rs_start, gs_start, RA_tmp, CA_tmp, apulse_in, dpulse_in, state_reg)
  begin
    state_next <= state_reg;
    case state_reg is
      when IDLE =>
        RD_EN        <= '0';
        HIT_RST      <= '0';
        MATRIX_GRST  <= '0';
        DIGSEL_EN    <= '0';
        ANASEL_EN    <= '0';
        GSHUTTER     <= '0';
        DPLSE        <= '0';
        APLSE        <= '0';
        RA_tmp       <= 0;
        CA_tmp       <= 0;
        CON_SELM_tmp <= '0';
        CON_SELP_tmp <= '0';
        CON_DATA_tmp <= '0';

        if cfg_start = '1' then
          state_next <= CFG;
        elsif rs_start = '1' then
          state_next <= RS;
        elsif gs_start = '1' then
          state_next <= GS;
        else
          state_next <= IDLE;
        end if;

      when CFG =>
        RA_EN_tmp    <= '1';
        CA_EN_tmp    <= '1';
        RA_tmp       <= to_integer(unsigned(cfg_out.row));
        CA_tmp       <= to_integer(unsigned(cfg_out.col));
        CON_SELM_tmp <= cfg_out.data(2);
        CON_SELP_tmp <= cfg_out.data(1);
        CON_DATA_tmp <= cfg_out.data(0);
        state_next   <= IDLE;

      when RS =>
        RA_EN_tmp <= '1';
        CA_EN_tmp <= '1';

        if RA_tmp = (N_ROW-1) then
          if CA_tmp = (N_COL-1) then
            rs_finished <= '1';
            state_next  <= IDLE;
            CA_tmp      <= 0;
          else
            state_next  <= RS;
            rs_finished <= '0';
            CA_tmp      <= CA_tmp + 1;
          end if;
          RA_tmp <= 0;
        else
          if CA_tmp = (N_COL-1) then
            CA_tmp <= 0;
          else
            CA_tmp <= CA_tmp + 1;
          end if;
          state_next  <= RS;
          rs_finished <= '0';
          RA_tmp      <= RA_tmp + 1;
        end if;

      when GS =>
        GSHUTTER   <= '1';
        APLSE      <= apulse_in;
        DPLSE      <= dpulse_in;
        state_next <= IDLE;

      when others =>
        state_next <= IDLE;
    end case;
  end process;

  process(clk, rst)
  begin
    if rst = '1' then
      RA_EN    <= '0';
      CA_EN    <= '0';
      RA       <= (others => '0');
      CA       <= (others => '0');
      CON_SELM <= '0';
      CON_SELM <= '0';
      CON_DATA <= '0';
    elsif rising_edge(clk) then
      RA_EN    <= RA_EN_tmp;
      CA_EN    <= CA_EN_tmp;
      RA       <= std_logic_vector(to_unsigned(RA_tmp, ROW_WIDTH));
      CA       <= std_logic_vector(to_unsigned(CA_tmp, COL_WIDTH));
      CON_SELM <= CON_SELM_tmp;
      CON_SELP <= CON_SELP_tmp;
      CON_DATA <= CON_DATA_tmp;
    end if;
  end process;
end behv;
