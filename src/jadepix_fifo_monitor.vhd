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

    -- VALID IN
    fifo_valid_in     : in std_logic;
    -- How many data have been readed out
    fifo_readout_num  : in integer range 0 to 16;
    fifo_row_read_end : in std_logic;

		is_fifo_writing : out boolean;
    fifo_counters : out sector_counters;
    fifo_status   : out sector_status
    );

end jadepix_fifo_monitor;

architecture behv of jadepix_fifo_monitor is

  signal valid_cnt     : integer range 0 to 16 := 0;
  signal valid_num     : integer range 0 to 16 := 0;
  signal valid_cnt_out : integer range 0 to 16 := 0;
  signal fifo_read_cnt : integer range 0 to 16 := 0;
  signal fifo_cnt      : integer               := 0;
  signal fifo_cnt_reg1 : integer               := 0;
  signal fifo_cnt_reg2 : integer               := 0;
  signal overflow_cnt  : integer               := 0;
  signal overflow_num  : integer               := 0;

--  signal is_fifo_writing : std_logic := '0';


  type COUNTER_STATE is (INITIAL, IDLE, START_CACHE, WRITE_FIFO, FIFO_OVERFLOW, READ_FIFO);

  signal state_reg, state_next : COUNTER_STATE := INITIAL;

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
        if rising_edge(clk_cache) then
          state_next <= START_CACHE;
--        elsif fifo_read_en = '1' then
--          state_next <= READ_FIFO;
        end if;

      when START_CACHE =>
        if fifo_valid_in = '1' then
          state_next <= WRITE_FIFO;
--        elsif fifo_read_en = '1' then
--          state_next <= READ_FIFO;
        end if;

      when WRITE_FIFO =>
        if fifo_valid_in = '1' then
          if fifo_cnt = FIFO_DEPTH then
            state_next <= FIFO_OVERFLOW;
          else
            state_next <= WRITE_FIFO;
          end if;
        elsif rising_edge(clk_cache) then
          state_next <= START_CACHE;
        else
          state_next <= IDLE;
        end if;

      when FIFO_OVERFLOW =>
        if fifo_valid_in = '1' then
          state_next <= FIFO_OVERFLOW;
        else
          state_next <= IDLE;
        end if;

      when others =>
        state_next <= INITIAL;
    end case;
  end process;


  process(all)
  begin
    if rising_edge(clk) then
      case(state_next) is
        when INITIAL =>
          valid_cnt       <= 0;
          valid_num       <= 0;
          fifo_cnt        <= 0;
          overflow_cnt    <= 0;
          is_fifo_writing <= false;

        when IDLE =>
          valid_cnt       <= 0;
          valid_num       <= 0;
          is_fifo_writing <= false;

        when START_CACHE =>
          if fifo_valid_in = '1' then  -- In case the valid happend at first clock
            if valid_cnt < VALID_MAX then
              valid_cnt <= valid_cnt + 1;
            else
              valid_cnt <= VALID_MAX;
            end if;

            if fifo_cnt = FIFO_DEPTH then
              fifo_cnt <= FIFO_DEPTH;
              if overflow_cnt = FIFO_OVERFLOW_MAX then
                overflow_cnt <= FIFO_OVERFLOW_MAX;
              else
                overflow_cnt <= overflow_cnt + 1;
              end if;
            else
              fifo_cnt <= fifo_cnt + 1;
            end if;
            is_fifo_writing <= true;
          else
						is_fifo_writing <= false;
          end if;

          valid_num <= maximum(0, valid_cnt);

        when WRITE_FIFO =>
          if valid_cnt < VALID_MAX then
            valid_cnt <= valid_cnt + 1;
          else
            valid_cnt <= VALID_MAX;
          end if;

          if fifo_cnt = FIFO_DEPTH then
            fifo_cnt <= FIFO_DEPTH;
            if overflow_cnt = FIFO_OVERFLOW_MAX then
              overflow_cnt <= FIFO_OVERFLOW_MAX;
            else
              overflow_cnt <= overflow_cnt + 1;
            end if;
          else
            fifo_cnt <= fifo_cnt + 1;
          end if;

          is_fifo_writing <= true;
          valid_num       <= maximum(valid_num, valid_cnt);

        when FIFO_OVERFLOW =>
          if valid_cnt < VALID_MAX then
            valid_cnt <= valid_cnt + 1;
          else
            valid_cnt <= VALID_MAX;
          end if;

          if overflow_cnt < FIFO_OVERFLOW_MAX then
            overflow_cnt <= overflow_cnt + 1;
          else
            overflow_cnt <= FIFO_OVERFLOW_MAX;
          end if;

          is_fifo_writing <= true;
          fifo_cnt        <= FIFO_DEPTH;

        when READ_FIFO =>
          if fifo_cnt > 0 then
            fifo_cnt <= fifo_cnt - 1;
          else
            fifo_cnt <= 0;
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
      fifo_status.fifo_status <= "00" when fifo_cnt <= FIFO_STATUS_TH1 else
"01" when fifo_cnt > FIFO_STATUS_TH1 and fifo_cnt <= FIFO_STATUS_TH2 else
"10" when fifo_cnt > FIFO_STATUS_TH2 and fifo_cnt <= FIFO_STATUS_TH3 else
"11" when fifo_cnt > FIFO_STATUS_TH3 and fifo_cnt <= FIFO_DEPTH else
                                 "ZZ";
    end if;
  end process;

  reg_fifo_cnt : process(all)
  begin
    if rising_edge(clk_cache) then
      fifo_cnt_reg1 <= fifo_cnt;
      fifo_cnt_reg2 <= fifo_cnt_reg1;
    end if;
  end process;


  fifo_counters.valid_counter    <= std_logic_vector(to_unsigned(fifo_cnt_reg1-fifo_cnt_reg2+overflow_cnt, fifo_counters.valid_counter'length));
  fifo_counters.overflow_counter <= std_logic_vector(to_unsigned(overflow_cnt, fifo_counters.overflow_counter'length));

end behv;
