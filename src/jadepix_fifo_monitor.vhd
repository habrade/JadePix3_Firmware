----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/15/2020 08:15:03 PM
-- Design Name: 
-- Module Name: jadepix_fifo_monitor - behv
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

entity jadepix_fifo_monitor is
  port (
    clk : in std_logic;
    rst : in std_logic;

    clk_cache : in std_logic;

    fifo_valid_in : in std_logic;
    fifo_read_en  :    std_logic;

    fifo_counters : out sector_counters;
    fifo_status   : out sector_status
    );

end jadepix_fifo_monitor;

architecture behv of jadepix_fifo_monitor is

  signal valid_cnt     : integer range 0 to VALID_MAX         := 0;
  signal valid_num     : integer range 0 to VALID_MAX         := 0;
  signal fifo_read_cnt : integer range 0 to 1                 := 0;
  signal fifo_cnt      : integer range 0 to FIFO_DEPTH        := 0;
  signal overflow_cnt  : integer range 0 to FIFO_DEPTH        := 0;
  signal overflow_num  : integer range 0 to FIFO_OVERFLOW_MAX := 0;


  type COUNTER_STATE is (INITIAL, IDLE, W_FIFO, WR_FIFO, FIFO_OVERFLOW, R_FIFO);

  signal state_reg, state_next : COUNTER_STATE := IDLE;

  procedure GET_NEXT_STATE (signal fifo_valid_in : in  std_logic;
                            signal fifo_read_en  : in  std_logic;
                            signal state_next    : out COUNTER_STATE) is
  begin
    if fifo_valid_in = '1' and fifo_read_en = '0' then
      if fifo_cnt = FIFO_DEPTH then
        state_next <= FIFO_OVERFLOW;
      else
        state_next <= W_FIFO;
      end if;
    elsif fifo_valid_in = '1' and fifo_read_en = '1' then
      state_next <= WR_FIFO;
    elsif fifo_valid_in = '0' and fifo_read_en = '1' then
      state_next <= R_FIFO;
    else
      state_next <= IDLE;
    end if;
  end procedure;

begin

  process(all)
  begin
    if rst = '1' then
      state_reg <= INITIAL;
    elsif rising_edge(clk) then
      state_reg <= state_next;
    end if;
  end process;


  process(all)
  begin
    case state_reg is

      when INITIAL =>
        state_next <= IDLE;

      when IDLE =>
        GET_NEXT_STATE(fifo_valid_in, fifo_read_en, state_next);

      when W_FIFO =>
        GET_NEXT_STATE(fifo_valid_in, fifo_read_en, state_next);

      when WR_FIFO =>
        GET_NEXT_STATE(fifo_valid_in, fifo_read_en, state_next);

      when R_FIFO =>
        GET_NEXT_STATE(fifo_valid_in, fifo_read_en, state_next);

      when FIFO_OVERFLOW =>
        GET_NEXT_STATE(fifo_valid_in, fifo_read_en, state_next);

      when others => null;

    end case;
  end process;


  process(all)
  begin
    if rising_edge(clk) then
      case(state_next) is
        when INITIAL =>
          valid_cnt    <= 0;
          fifo_cnt     <= 0;
          overflow_cnt <= 0;

        when IDLE =>
          valid_cnt <= 0;

        when W_FIFO =>

          valid_cnt <= (valid_cnt rem VALID_MAX) + 1;

          if fifo_cnt < FIFO_DEPTH then
            fifo_cnt <= fifo_cnt + 1;
          end if;

        when WR_FIFO =>
          valid_cnt <= (valid_cnt rem VALID_MAX) + 1;

        when R_FIFO =>
          valid_cnt    <= 0;
          overflow_cnt <= 0;

          fifo_read_cnt <= (fifo_read_cnt + 1) rem 2;

          if fifo_cnt > 0 and fifo_read_cnt = 1 then
            fifo_cnt <= fifo_cnt - 1;
          end if;

        when FIFO_OVERFLOW =>
          valid_cnt <= 0;
          if overflow_cnt < FIFO_OVERFLOW_MAX then
            overflow_cnt <= overflow_cnt + 1;
          end if;

        when others => null;
      end case;
    end if;
  end process;

  get_fifo_status : process(all)
  begin
    if rst = '1' then
      fifo_status.fifo_status <= "00";
    else
      fifo_status.fifo_status <=
        "00" when fifo_cnt                                <= FIFO_STATUS_TH1 else
        "01" when fifo_cnt > FIFO_STATUS_TH1 and fifo_cnt <= FIFO_STATUS_TH2 else
        "10" when fifo_cnt > FIFO_STATUS_TH2 and fifo_cnt <= FIFO_STATUS_TH3 else
        "11" when fifo_cnt > FIFO_STATUS_TH3 and fifo_cnt <= FIFO_DEPTH else
        "ZZ";
    end if;
  end process;


  get_valid_cnt_max : process(all)
  begin
    if rst = '1' then
      valid_num <= 0;
    else
      if falling_edge(clk_cache) then
        valid_num <= maximum(0, valid_cnt);
      else
        valid_num <= maximum(valid_num, valid_cnt);
      end if;
    end if;
  end process;

  fifo_counters.valid_counter    <= std_logic_vector(to_unsigned(valid_num, fifo_counters.valid_counter'length));
  fifo_counters.overflow_counter <= std_logic_vector(to_unsigned(overflow_cnt, fifo_counters.overflow_counter'length));

end behv;
