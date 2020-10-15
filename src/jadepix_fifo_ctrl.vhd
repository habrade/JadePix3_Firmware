----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/15/2020 08:14:38 PM
-- Design Name: 
-- Module Name: jadepix_fifo_read - behv
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

entity jadepix_fifo_ctrl is
  port(
    clk : in std_logic;
    rst : in std_logic;

    -- Buffer read
    buffer_read_en    : out std_logic;
    buffer_data_valid : in  std_logic;
    buffer_data       : in  std_logic_vector(DATA_FRAME_WIDTH-1 downto 0);

    -- Buffer statuss
    buffer_empty      : in std_logic;
    buffer_empty_next : in std_logic;
    buffer_full       : in std_logic;
    buffer_full_next  : in std_logic;
    -- The number of elements in the FIFO
    buffer_fill_count : in integer range DATA_BUF_DEPTH - 1 downto 0;

    -- Jadepix FIFO
    DATA_IN : in std_logic_vector(7 downto 0);

    fifo_read_en_v : out std_logic_vector(SECTOR_NUM-1 downto 0);
    blk_select     : out std_logic_vector(BLK_SELECT_WIDTH-1 downto 0);

    INQUIRY : out std_logic_vector(1 downto 0);

    sectors_row_read_end : out std_logic;

    -- IPBUS readout
    ipbus_data_payload_valid : out std_logic;
    ipbus_data_payload       : out std_logic_vector(71 downto 0)
    );

end jadepix_fifo_ctrl;


architecture behv of jadepix_fifo_ctrl is

  type READ_FIFO_STATE is (IDLE, READ_BUFFER, READ_ROW,
                           READ_FIFO0_HALF1, READ_FIFO0_HALF2,
                           READ_FIFO1_HALF1, READ_FIFO1_HALF2,
                           READ_FIFO2_HALF1, READ_FIFO2_HALF2,
                           READ_FIFO3_HALF1, READ_FIFO3_HALF2,
                           READ_ROW_END);

  signal state_reg, state_next, state_temp : READ_FIFO_STATE := IDLE;

  signal data_frame : buffer_data_frame := DATA_FRAME_NULL;

  signal cnt_sec0, cnt_sec1, cnt_sec2, cnt_sec3 : integer range 0 to 16 := 0;


begin

  process(all)
  begin
    if rst = '1' then
      state_reg <= IDLE;
    elsif rising_edge(clk) then
      state_reg <= state_next;
    end if;
  end process;

  process(all)
  begin
    case state_reg is
      when IDLE =>
        if buffer_empty = '0' and buffer_fill_count /= 0 then
          state_next <= READ_BUFFER;
        end if;

      when READ_BUFFER =>
        state_next <= READ_ROW;

      -- Read row by row
      when READ_ROW =>
        if buffer_data_valid = '1' then
          if (cnt_sec0 /= 0) then
            state_next <= READ_FIFO0_HALF1;
          elsif (cnt_sec1 /= 0) then
            state_next <= READ_FIFO1_HALF1;
          elsif (cnt_sec2 /= 0) then
            state_next <= READ_FIFO2_HALF1;
          elsif (cnt_sec3 /= 0) then
            state_next <= READ_FIFO3_HALF1;
          else
            state_next <= READ_ROW_END;
          end if;
        end if;

      -- Read FIFO 0
      when READ_FIFO0_HALF1 =>
        state_next <= READ_FIFO0_HALF2;
      when READ_FIFO0_HALF2 =>
        if (cnt_sec0 /= 0) then
          state_next <= READ_FIFO0_HALF1;
        elsif (cnt_sec1 /= 0) then
          state_next <= READ_FIFO1_HALF1;
        elsif (cnt_sec2 /= 0) then
          state_next <= READ_FIFO2_HALF1;
        elsif (cnt_sec3 /= 0) then
          state_next <= READ_FIFO3_HALF1;
        else
          state_next <= READ_ROW_END;
        end if;


      -- Read FIFO 1
      when READ_FIFO1_HALF1 =>
        state_next <= READ_FIFO1_HALF2;
      when READ_FIFO1_HALF2 =>
        if (cnt_sec1 /= 0) then
          state_next <= READ_FIFO1_HALF1;
        elsif (cnt_sec2 /= 0) then
          state_next <= READ_FIFO2_HALF1;
        elsif (cnt_sec3 /= 0) then
          state_next <= READ_FIFO3_HALF1;
        else
          state_next <= READ_ROW_END;
        end if;

      -- Read FIFO 2
      when READ_FIFO2_HALF1 =>
        state_next <= READ_FIFO2_HALF2;
      when READ_FIFO2_HALF2 =>
        if (cnt_sec2 /= 0) then
          state_next <= READ_FIFO2_HALF1;
        elsif (cnt_sec3 /= 0) then
          state_next <= READ_FIFO3_HALF1;
        else
          state_next <= READ_ROW_END;
        end if;

      -- Read FIFO 3
      when READ_FIFO3_HALF1 =>
        state_next <= READ_FIFO3_HALF2;
      when READ_FIFO3_HALF2 =>
        if (cnt_sec3 /= 0) then
          state_next <= READ_FIFO3_HALF1;
        else
          state_next <= READ_ROW_END;
        end if;

      when READ_ROW_END =>
        state_next <= IDLE;

      when others =>
        state_next <= IDLE;
    end case;
  end process;

  process(all)
  begin
    if rising_edge(clk) then
      case(state_next) is
        when IDLE =>
          sectors_row_read_end <= '0';
          buffer_read_en       <= '0';
          blk_select           <= "ZZ";
          fifo_read_en_v       <= (others => '0');

        when READ_BUFFER =>
          buffer_read_en <= '1';

        when READ_ROW =>
          buffer_read_en <= '0';

          data_frame.frame_num                   <= buffer_data(DATA_FRAME_WIDTH-1 downto DATA_FRAME_WIDTH-FRAME_CNT_WIDTH);
          data_frame.row                         <= buffer_data(DATA_FRAME_WIDTH-FRAME_CNT_WIDTH-1 downto DATA_FRAME_WIDTH-FRAME_CNT_WIDTH-ROW_WIDTH);
          data_frame.sectors(0).valid_counter    <= buffer_data(4*VC_WIDTH+4*OC_WIDTH+RBOF_WIDTH-1 downto 3*VC_WIDTH+4*OC_WIDTH+RBOF_WIDTH);
          cnt_sec0                               <= to_integer(unsigned(buffer_data(4*VC_WIDTH+4*OC_WIDTH+RBOF_WIDTH-1 downto 3*VC_WIDTH+4*OC_WIDTH+RBOF_WIDTH)));
          data_frame.sectors(0).overflow_counter <= buffer_data(3*VC_WIDTH+4*OC_WIDTH+RBOF_WIDTH-1 downto 3*VC_WIDTH+3*OC_WIDTH+RBOF_WIDTH);
          data_frame.sectors(1).valid_counter    <= buffer_data(3*VC_WIDTH+3*OC_WIDTH+RBOF_WIDTH-1 downto 2*VC_WIDTH+3*OC_WIDTH+RBOF_WIDTH);
          cnt_sec1                               <= to_integer(unsigned(buffer_data(3*VC_WIDTH+3*OC_WIDTH+RBOF_WIDTH-1 downto 2*VC_WIDTH+3*OC_WIDTH+RBOF_WIDTH)));
          data_frame.sectors(1).overflow_counter <= buffer_data(2*VC_WIDTH+3*OC_WIDTH+RBOF_WIDTH-1 downto 2*VC_WIDTH+2*OC_WIDTH+RBOF_WIDTH);
          data_frame.sectors(2).valid_counter    <= buffer_data(2*VC_WIDTH+2*OC_WIDTH+RBOF_WIDTH-1 downto VC_WIDTH+2*OC_WIDTH+RBOF_WIDTH);
          cnt_sec2                               <= to_integer(unsigned(buffer_data(2*VC_WIDTH+2*OC_WIDTH+RBOF_WIDTH-1 downto VC_WIDTH+2*OC_WIDTH+RBOF_WIDTH)));
          data_frame.sectors(2).overflow_counter <= buffer_data(VC_WIDTH+2*OC_WIDTH+RBOF_WIDTH-1 downto VC_WIDTH+OC_WIDTH+RBOF_WIDTH);
          data_frame.sectors(3).valid_counter    <= buffer_data(VC_WIDTH+OC_WIDTH+RBOF_WIDTH-1 downto OC_WIDTH+RBOF_WIDTH);
          cnt_sec3                               <= to_integer(unsigned(buffer_data(VC_WIDTH+OC_WIDTH+RBOF_WIDTH-1 downto OC_WIDTH+RBOF_WIDTH)));
          data_frame.sectors(3).overflow_counter <= buffer_data(OC_WIDTH+RBOF_WIDTH-1 downto RBOF_WIDTH);
          data_frame.rbof                        <= buffer_data(RBOF_WIDTH-1 downto 0);

        -- Read FIFO 0
        when READ_FIFO0_HALF1 =>
          blk_select     <= "00";
          fifo_read_en_v <= "0001";
          if cnt_sec0 > 0 then
            cnt_sec0 <= cnt_sec0 - 1;
          end if;
        when READ_FIFO0_HALF2 => null;
        
        -- Read FIFO 1
        when READ_FIFO1_HALF1 =>
          blk_select     <= "01";
          fifo_read_en_v <= "0010";
          if cnt_sec1 > 0 then
            cnt_sec1 <= cnt_sec1 - 1;
          end if;
        when READ_FIFO1_HALF2 => null;

        -- Read FIFO 2
        when READ_FIFO2_HALF1 =>
          blk_select     <= "10";
          fifo_read_en_v <= "0100";
          if cnt_sec2 > 0 then
            cnt_sec2 <= cnt_sec2 - 1;
          end if;
        when READ_FIFO2_HALF2 => null;

        -- Read FIFO 3
        when READ_FIFO3_HALF1 =>
          blk_select     <= "11";
          fifo_read_en_v <= "1000";
          if cnt_sec3 > 0 then
            cnt_sec3 <= cnt_sec3 - 1;
          end if;
        when READ_FIFO3_HALF2 => null;

        when READ_ROW_END =>
          blk_select           <= "ZZ";
          fifo_read_en_v       <= (others => '0');
          sectors_row_read_end <= '1';

        when others =>
          null;

      end case;
    end if;
  end process;

end behv;
