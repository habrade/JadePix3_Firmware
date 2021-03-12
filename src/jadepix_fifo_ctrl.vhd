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
use IEEE.NUMERIC_STD_UNSIGNED.all;

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
    buffer_data_flat  : in  std_logic_vector(BUFFER_DATA_FRAME_WIDTH-1 downto 0);

    -- Buffer statuss
    buffer_empty      : in std_logic;
    buffer_empty_next : in std_logic;
    buffer_full       : in std_logic;
    buffer_full_next  : in std_logic;
    -- The number of elements in the FIFO
    buffer_fill_count : in integer range BUFFER_DATA_DEPTH - 1 downto 0;

    -- To Jadepix FIFO
    fifo_read_en_v : out std_logic_vector(SECTOR_NUM-1 downto 0);
    blk_select     : out std_logic_vector(BLK_SELECT_WIDTH-1 downto 0);

    buffer_data_record : out buffer_data_frame

    );

end jadepix_fifo_ctrl;


architecture behv of jadepix_fifo_ctrl is

  type READ_FIFO_STATE is (INITIAL, IDLE, READ_BUFFER, READ_ROW,
                           READ_FIFO0_HALF1, READ_FIFO0_HALF2,
                           SET_BLK_SEL1,
                           READ_FIFO1_HALF1, READ_FIFO1_HALF2,
													 SET_BLK_SEL2,
												   READ_FIFO2_HALF1, READ_FIFO2_HALF2,
													 SET_BLK_SEL3,
												   READ_FIFO3_HALF1, READ_FIFO3_HALF2,
												   READ_ROW_END);

  signal state_reg, state_next : READ_FIFO_STATE := IDLE;

  signal cnt_sec0, cnt_sec1, cnt_sec2, cnt_sec3 : integer range 0 to VALID_MAX := 0;

  constant DATA_FRAME_NULL : buffer_data_frame := ((others => '0'),
                                                   (others => '0'),
                                                   (others => ((others => '0'), (others => '0'))),
                                                   (others => '0'));

  -- DEBUG
  attribute mark_debug                       : string;
  attribute mark_debug of buffer_read_en     : signal is "true";
  attribute mark_debug of buffer_data_valid  : signal is "true";
  attribute mark_debug of buffer_data_flat   : signal is "true";
  attribute mark_debug of buffer_empty       : signal is "true";
  attribute mark_debug of buffer_full        : signal is "true";
  attribute mark_debug of buffer_fill_count  : signal is "true";
  attribute mark_debug of fifo_read_en_v     : signal is "true";
  attribute mark_debug of blk_select         : signal is "true";
  attribute mark_debug of buffer_data_record : signal is "true";
  attribute mark_debug of cnt_sec0           : signal is "true";
  attribute mark_debug of cnt_sec1           : signal is "true";
  attribute mark_debug of cnt_sec2           : signal is "true";
  attribute mark_debug of cnt_sec3           : signal is "true";

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
    state_next <= state_reg;
    case state_reg is
      when INITIAL =>
        state_next <= IDLE;

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
            state_next <= SET_BLK_SEL1;
          elsif (cnt_sec2 /= 0) then
            state_next <= SET_BLK_SEL2;
          elsif (cnt_sec3 /= 0) then
            state_next <= SET_BLK_SEL3;
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
          state_next <= SET_BLK_SEL1;
        elsif (cnt_sec2 /= 0) then
          state_next <= SET_BLK_SEL2;
        elsif (cnt_sec3 /= 0) then
          state_next <= SET_BLK_SEL3;
        else
          state_next <= READ_ROW_END;
        end if;
       
      when SET_BLK_SEL1 =>
      	state_next <= READ_FIFO1_HALF1;
      	
      -- Read FIFO 1
      when READ_FIFO1_HALF1 =>
        state_next <= READ_FIFO1_HALF2;
      when READ_FIFO1_HALF2 =>
        if (cnt_sec1 /= 0) then
          state_next <= READ_FIFO1_HALF1;
        elsif (cnt_sec2 /= 0) then
          state_next <= SET_BLK_SEL2;
        elsif (cnt_sec3 /= 0) then
          state_next <= SET_BLK_SEL3;
        else
          state_next <= READ_ROW_END;
        end if;

      when SET_BLK_SEL2 =>
      	state_next <= READ_FIFO2_HALF1;
      	
      -- Read FIFO 2
      when READ_FIFO2_HALF1 =>
        state_next <= READ_FIFO2_HALF2;
      when READ_FIFO2_HALF2 =>
        if (cnt_sec2 /= 0) then
          state_next <= READ_FIFO2_HALF1;
        elsif (cnt_sec3 /= 0) then
          state_next <= SET_BLK_SEL3;
        else
          state_next <= READ_ROW_END;
        end if;

      when SET_BLK_SEL3 =>
      	state_next <= READ_FIFO3_HALF1;

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
        when INITIAL =>
          buffer_data_record <= DATA_FRAME_NULL;

        when IDLE =>
          buffer_read_en <= '0';
          blk_select     <= "00";
          fifo_read_en_v <= (others => '0');

        when READ_BUFFER =>
          buffer_read_en <= '1';
          
        when READ_ROW =>
          buffer_read_en <= '0';

          /* Yeah, ugly code here... */
          buffer_data_record.frame_num <= buffer_data_flat(BUFFER_DATA_FRAME_WIDTH-1 downto BUFFER_DATA_FRAME_WIDTH-FRAME_CNT_WIDTH);
          buffer_data_record.row       <= buffer_data_flat(BUFFER_DATA_FRAME_WIDTH-FRAME_CNT_WIDTH-1 downto BUFFER_DATA_FRAME_WIDTH-FRAME_CNT_WIDTH-ROW_WIDTH);

          cnt_sec0                                       <= to_integer(unsigned(buffer_data_flat(4*VC_WIDTH+4*OC_WIDTH+RBOF_WIDTH-1 downto 3*VC_WIDTH+4*OC_WIDTH+RBOF_WIDTH)));
          buffer_data_record.sectors(0).valid_counter    <= buffer_data_flat(4*VC_WIDTH+4*OC_WIDTH+RBOF_WIDTH-1 downto 3*VC_WIDTH+4*OC_WIDTH+RBOF_WIDTH);
          buffer_data_record.sectors(0).overflow_counter <= buffer_data_flat(3*VC_WIDTH+4*OC_WIDTH+RBOF_WIDTH-1 downto 3*VC_WIDTH+3*OC_WIDTH+RBOF_WIDTH);

          cnt_sec1                                       <= to_integer(unsigned(buffer_data_flat(3*VC_WIDTH+3*OC_WIDTH+RBOF_WIDTH-1 downto 2*VC_WIDTH+3*OC_WIDTH+RBOF_WIDTH)));
          buffer_data_record.sectors(1).valid_counter    <= buffer_data_flat(3*VC_WIDTH+3*OC_WIDTH+RBOF_WIDTH-1 downto 2*VC_WIDTH+3*OC_WIDTH+RBOF_WIDTH);
          buffer_data_record.sectors(1).overflow_counter <= buffer_data_flat(2*VC_WIDTH+3*OC_WIDTH+RBOF_WIDTH-1 downto 2*VC_WIDTH+2*OC_WIDTH+RBOF_WIDTH);

          cnt_sec2                                       <= to_integer(unsigned(buffer_data_flat(2*VC_WIDTH+2*OC_WIDTH+RBOF_WIDTH-1 downto VC_WIDTH+2*OC_WIDTH+RBOF_WIDTH)));
          buffer_data_record.sectors(2).valid_counter    <= buffer_data_flat(2*VC_WIDTH+2*OC_WIDTH+RBOF_WIDTH-1 downto VC_WIDTH+2*OC_WIDTH+RBOF_WIDTH);
          buffer_data_record.sectors(2).overflow_counter <= buffer_data_flat(VC_WIDTH+2*OC_WIDTH+RBOF_WIDTH-1 downto VC_WIDTH+OC_WIDTH+RBOF_WIDTH);

          cnt_sec3                                       <= to_integer(unsigned(buffer_data_flat(VC_WIDTH+OC_WIDTH+RBOF_WIDTH-1 downto OC_WIDTH+RBOF_WIDTH)));
          buffer_data_record.sectors(3).valid_counter    <= buffer_data_flat(VC_WIDTH+OC_WIDTH+RBOF_WIDTH-1 downto OC_WIDTH+RBOF_WIDTH);
          buffer_data_record.sectors(3).overflow_counter <= buffer_data_flat(OC_WIDTH+RBOF_WIDTH-1 downto RBOF_WIDTH);

          buffer_data_record.rbof <= buffer_data_flat(RBOF_WIDTH-1 downto 0);

        -- Read FIFO 0
        when READ_FIFO0_HALF1 =>
          fifo_read_en_v <= "0001";
          if cnt_sec0 > 0 then
            cnt_sec0 <= cnt_sec0 - 1;
          end if;
        when READ_FIFO0_HALF2 => null;
        
        when SET_BLK_SEL1 =>
        	blk_select <= "01";

        -- Read FIFO 1
        when READ_FIFO1_HALF1 =>
          fifo_read_en_v <= "0010";

          if cnt_sec1 > 0 then
            cnt_sec1 <= cnt_sec1 - 1;
          end if;
        when READ_FIFO1_HALF2 => null;
        
				when SET_BLK_SEL2 =>
				  blk_select <= "10";

        -- Read FIFO 2
        when READ_FIFO2_HALF1 =>
          fifo_read_en_v <= "0100";

          if cnt_sec2 > 0 then
            cnt_sec2 <= cnt_sec2 - 1;
          end if;
        when READ_FIFO2_HALF2 => null;
        
        when SET_BLK_SEL3 =>
				  blk_select <= "11";

        -- Read FIFO 3
        when READ_FIFO3_HALF1 =>
          fifo_read_en_v <= "1000";

          if cnt_sec3 > 0 then
            cnt_sec3 <= cnt_sec3 - 1;
          end if;
        when READ_FIFO3_HALF2 => null;

        when READ_ROW_END =>
          blk_select     <= "00";
          fifo_read_en_v <= (others => '0');

        when others =>
          null;
      end case;

    end if;
  end process;

end behv;
