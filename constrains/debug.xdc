



connect_debug_port u_ila_1/probe24 [get_nets [list jadepix_ctrl/APLSE]]
connect_debug_port u_ila_1/probe36 [get_nets [list jadepix_ctrl/DPLSE]]
connect_debug_port u_ila_1/probe40 [get_nets [list jadepix_ctrl/GSHUTTER]]
connect_debug_port u_ila_1/probe45 [get_nets [list ipbus_payload/slave3/MATRIX_GRST]]
connect_debug_port u_ila_1/probe52 [get_nets [list jadepix_ctrl/rs_stop]]

create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list jadepix_clocks/DACCLK]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 32 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {DAC_DATA[0]} {DAC_DATA[1]} {DAC_DATA[2]} {DAC_DATA[3]} {DAC_DATA[4]} {DAC_DATA[5]} {DAC_DATA[6]} {DAC_DATA[7]} {DAC_DATA[8]} {DAC_DATA[9]} {DAC_DATA[10]} {DAC_DATA[11]} {DAC_DATA[12]} {DAC_DATA[13]} {DAC_DATA[14]} {DAC_DATA[15]} {DAC_DATA[16]} {DAC_DATA[17]} {DAC_DATA[18]} {DAC_DATA[19]} {DAC_DATA[20]} {DAC_DATA[21]} {DAC_DATA[22]} {DAC_DATA[23]} {DAC_DATA[24]} {DAC_DATA[25]} {DAC_DATA[26]} {DAC_DATA[27]} {DAC_DATA[28]} {DAC_DATA[29]} {DAC_DATA[30]} {DAC_DATA[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 2 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {dac70004/state[0]} {dac70004/state[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 5 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {dac70004/BS_cnt[0]} {dac70004/BS_cnt[1]} {dac70004/BS_cnt[2]} {dac70004/BS_cnt[3]} {dac70004/BS_cnt[4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 32 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {dac70004/DATA_shift_register[0]} {dac70004/DATA_shift_register[1]} {dac70004/DATA_shift_register[2]} {dac70004/DATA_shift_register[3]} {dac70004/DATA_shift_register[4]} {dac70004/DATA_shift_register[5]} {dac70004/DATA_shift_register[6]} {dac70004/DATA_shift_register[7]} {dac70004/DATA_shift_register[8]} {dac70004/DATA_shift_register[9]} {dac70004/DATA_shift_register[10]} {dac70004/DATA_shift_register[11]} {dac70004/DATA_shift_register[12]} {dac70004/DATA_shift_register[13]} {dac70004/DATA_shift_register[14]} {dac70004/DATA_shift_register[15]} {dac70004/DATA_shift_register[16]} {dac70004/DATA_shift_register[17]} {dac70004/DATA_shift_register[18]} {dac70004/DATA_shift_register[19]} {dac70004/DATA_shift_register[20]} {dac70004/DATA_shift_register[21]} {dac70004/DATA_shift_register[22]} {dac70004/DATA_shift_register[23]} {dac70004/DATA_shift_register[24]} {dac70004/DATA_shift_register[25]} {dac70004/DATA_shift_register[26]} {dac70004/DATA_shift_register[27]} {dac70004/DATA_shift_register[28]} {dac70004/DATA_shift_register[29]} {dac70004/DATA_shift_register[30]} {dac70004/DATA_shift_register[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 1 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list DAC_BUSY]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 1 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list dac70004/DAC_BUSY_reg]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 1 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list dac70004/DAC_CLR_reg]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 1 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list dac70004/DAC_LOAD_reg]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 1 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list dac70004/DAC_SYNC_reg]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 1 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list DAC_WE]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 1 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list dac70004/SCLK_reg]]
create_debug_core u_ila_1 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_1]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_1]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_1]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_1]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_1]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_1]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_1]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_1]
set_property port_width 1 [get_debug_ports u_ila_1/clk]
connect_debug_port u_ila_1/clk [get_nets [list jadepix_clocks/clk]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe0]
set_property port_width 5 [get_debug_ports u_ila_1/probe0]
connect_debug_port u_ila_1/probe0 [get_nets [list {jadepix_ctrl/state_reg[0]} {jadepix_ctrl/state_reg[1]} {jadepix_ctrl/state_reg[2]} {jadepix_ctrl/state_reg[3]} {jadepix_ctrl/state_reg[4]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe1]
set_property port_width 5 [get_debug_ports u_ila_1/probe1]
connect_debug_port u_ila_1/probe1 [get_nets [list {jadepix_ctrl/state_next[0]} {jadepix_ctrl/state_next[1]} {jadepix_ctrl/state_next[2]} {jadepix_ctrl/state_next[3]} {jadepix_ctrl/state_next[4]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe2]
set_property port_width 5 [get_debug_ports u_ila_1/probe2]
connect_debug_port u_ila_1/probe2 [get_nets [list {jadepix_ctrl/rs_cnt[0]} {jadepix_ctrl/rs_cnt[1]} {jadepix_ctrl/rs_cnt[2]} {jadepix_ctrl/rs_cnt[3]} {jadepix_ctrl/rs_cnt[4]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe3]
set_property port_width 17 [get_debug_ports u_ila_1/probe3]
connect_debug_port u_ila_1/probe3 [get_nets [list {jadepix_ctrl/pix_cnt[0]} {jadepix_ctrl/pix_cnt[1]} {jadepix_ctrl/pix_cnt[2]} {jadepix_ctrl/pix_cnt[3]} {jadepix_ctrl/pix_cnt[4]} {jadepix_ctrl/pix_cnt[5]} {jadepix_ctrl/pix_cnt[6]} {jadepix_ctrl/pix_cnt[7]} {jadepix_ctrl/pix_cnt[8]} {jadepix_ctrl/pix_cnt[9]} {jadepix_ctrl/pix_cnt[10]} {jadepix_ctrl/pix_cnt[11]} {jadepix_ctrl/pix_cnt[12]} {jadepix_ctrl/pix_cnt[13]} {jadepix_ctrl/pix_cnt[14]} {jadepix_ctrl/pix_cnt[15]} {jadepix_ctrl/pix_cnt[16]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe4]
set_property port_width 4 [get_debug_ports u_ila_1/probe4]
connect_debug_port u_ila_1/probe4 [get_nets [list {jadepix_ctrl/hitmap_num[0]} {jadepix_ctrl/hitmap_num[1]} {jadepix_ctrl/hitmap_num[2]} {jadepix_ctrl/hitmap_num[3]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe5]
set_property port_width 34 [get_debug_ports u_ila_1/probe5]
connect_debug_port u_ila_1/probe5 [get_nets [list {jadepix_ctrl/gs_width_counter[0]} {jadepix_ctrl/gs_width_counter[1]} {jadepix_ctrl/gs_width_counter[2]} {jadepix_ctrl/gs_width_counter[3]} {jadepix_ctrl/gs_width_counter[4]} {jadepix_ctrl/gs_width_counter[5]} {jadepix_ctrl/gs_width_counter[6]} {jadepix_ctrl/gs_width_counter[7]} {jadepix_ctrl/gs_width_counter[8]} {jadepix_ctrl/gs_width_counter[9]} {jadepix_ctrl/gs_width_counter[10]} {jadepix_ctrl/gs_width_counter[11]} {jadepix_ctrl/gs_width_counter[12]} {jadepix_ctrl/gs_width_counter[13]} {jadepix_ctrl/gs_width_counter[14]} {jadepix_ctrl/gs_width_counter[15]} {jadepix_ctrl/gs_width_counter[16]} {jadepix_ctrl/gs_width_counter[17]} {jadepix_ctrl/gs_width_counter[18]} {jadepix_ctrl/gs_width_counter[19]} {jadepix_ctrl/gs_width_counter[20]} {jadepix_ctrl/gs_width_counter[21]} {jadepix_ctrl/gs_width_counter[22]} {jadepix_ctrl/gs_width_counter[23]} {jadepix_ctrl/gs_width_counter[24]} {jadepix_ctrl/gs_width_counter[25]} {jadepix_ctrl/gs_width_counter[26]} {jadepix_ctrl/gs_width_counter[27]} {jadepix_ctrl/gs_width_counter[28]} {jadepix_ctrl/gs_width_counter[29]} {jadepix_ctrl/gs_width_counter[30]} {jadepix_ctrl/gs_width_counter[31]} {jadepix_ctrl/gs_width_counter[32]} {jadepix_ctrl/gs_width_counter[33]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe6]
set_property port_width 32 [get_debug_ports u_ila_1/probe6]
connect_debug_port u_ila_1/probe6 [get_nets [list {jadepix_ctrl/gs_pulse_width_cnt_low[0]} {jadepix_ctrl/gs_pulse_width_cnt_low[1]} {jadepix_ctrl/gs_pulse_width_cnt_low[2]} {jadepix_ctrl/gs_pulse_width_cnt_low[3]} {jadepix_ctrl/gs_pulse_width_cnt_low[4]} {jadepix_ctrl/gs_pulse_width_cnt_low[5]} {jadepix_ctrl/gs_pulse_width_cnt_low[6]} {jadepix_ctrl/gs_pulse_width_cnt_low[7]} {jadepix_ctrl/gs_pulse_width_cnt_low[8]} {jadepix_ctrl/gs_pulse_width_cnt_low[9]} {jadepix_ctrl/gs_pulse_width_cnt_low[10]} {jadepix_ctrl/gs_pulse_width_cnt_low[11]} {jadepix_ctrl/gs_pulse_width_cnt_low[12]} {jadepix_ctrl/gs_pulse_width_cnt_low[13]} {jadepix_ctrl/gs_pulse_width_cnt_low[14]} {jadepix_ctrl/gs_pulse_width_cnt_low[15]} {jadepix_ctrl/gs_pulse_width_cnt_low[16]} {jadepix_ctrl/gs_pulse_width_cnt_low[17]} {jadepix_ctrl/gs_pulse_width_cnt_low[18]} {jadepix_ctrl/gs_pulse_width_cnt_low[19]} {jadepix_ctrl/gs_pulse_width_cnt_low[20]} {jadepix_ctrl/gs_pulse_width_cnt_low[21]} {jadepix_ctrl/gs_pulse_width_cnt_low[22]} {jadepix_ctrl/gs_pulse_width_cnt_low[23]} {jadepix_ctrl/gs_pulse_width_cnt_low[24]} {jadepix_ctrl/gs_pulse_width_cnt_low[25]} {jadepix_ctrl/gs_pulse_width_cnt_low[26]} {jadepix_ctrl/gs_pulse_width_cnt_low[27]} {jadepix_ctrl/gs_pulse_width_cnt_low[28]} {jadepix_ctrl/gs_pulse_width_cnt_low[29]} {jadepix_ctrl/gs_pulse_width_cnt_low[30]} {jadepix_ctrl/gs_pulse_width_cnt_low[31]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe7]
set_property port_width 2 [get_debug_ports u_ila_1/probe7]
connect_debug_port u_ila_1/probe7 [get_nets [list {jadepix_ctrl/gs_pulse_width_cnt_high[0]} {jadepix_ctrl/gs_pulse_width_cnt_high[1]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe8]
set_property port_width 9 [get_debug_ports u_ila_1/probe8]
connect_debug_port u_ila_1/probe8 [get_nets [list {jadepix_ctrl/gs_pulse_delay_counter[0]} {jadepix_ctrl/gs_pulse_delay_counter[1]} {jadepix_ctrl/gs_pulse_delay_counter[2]} {jadepix_ctrl/gs_pulse_delay_counter[3]} {jadepix_ctrl/gs_pulse_delay_counter[4]} {jadepix_ctrl/gs_pulse_delay_counter[5]} {jadepix_ctrl/gs_pulse_delay_counter[6]} {jadepix_ctrl/gs_pulse_delay_counter[7]} {jadepix_ctrl/gs_pulse_delay_counter[8]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe9]
set_property port_width 9 [get_debug_ports u_ila_1/probe9]
connect_debug_port u_ila_1/probe9 [get_nets [list {jadepix_ctrl/gs_pulse_delay_cnt[0]} {jadepix_ctrl/gs_pulse_delay_cnt[1]} {jadepix_ctrl/gs_pulse_delay_cnt[2]} {jadepix_ctrl/gs_pulse_delay_cnt[3]} {jadepix_ctrl/gs_pulse_delay_cnt[4]} {jadepix_ctrl/gs_pulse_delay_cnt[5]} {jadepix_ctrl/gs_pulse_delay_cnt[6]} {jadepix_ctrl/gs_pulse_delay_cnt[7]} {jadepix_ctrl/gs_pulse_delay_cnt[8]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe10]
set_property port_width 9 [get_debug_ports u_ila_1/probe10]
connect_debug_port u_ila_1/probe10 [get_nets [list {jadepix_ctrl/gs_pulse_deassert_counter[0]} {jadepix_ctrl/gs_pulse_deassert_counter[1]} {jadepix_ctrl/gs_pulse_deassert_counter[2]} {jadepix_ctrl/gs_pulse_deassert_counter[3]} {jadepix_ctrl/gs_pulse_deassert_counter[4]} {jadepix_ctrl/gs_pulse_deassert_counter[5]} {jadepix_ctrl/gs_pulse_deassert_counter[6]} {jadepix_ctrl/gs_pulse_deassert_counter[7]} {jadepix_ctrl/gs_pulse_deassert_counter[8]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe11]
set_property port_width 9 [get_debug_ports u_ila_1/probe11]
connect_debug_port u_ila_1/probe11 [get_nets [list {jadepix_ctrl/gs_pulse_deassert_cnt[0]} {jadepix_ctrl/gs_pulse_deassert_cnt[1]} {jadepix_ctrl/gs_pulse_deassert_cnt[2]} {jadepix_ctrl/gs_pulse_deassert_cnt[3]} {jadepix_ctrl/gs_pulse_deassert_cnt[4]} {jadepix_ctrl/gs_pulse_deassert_cnt[5]} {jadepix_ctrl/gs_pulse_deassert_cnt[6]} {jadepix_ctrl/gs_pulse_deassert_cnt[7]} {jadepix_ctrl/gs_pulse_deassert_cnt[8]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe12]
set_property port_width 9 [get_debug_ports u_ila_1/probe12]
connect_debug_port u_ila_1/probe12 [get_nets [list {jadepix_ctrl/gs_deassert_counter[0]} {jadepix_ctrl/gs_deassert_counter[1]} {jadepix_ctrl/gs_deassert_counter[2]} {jadepix_ctrl/gs_deassert_counter[3]} {jadepix_ctrl/gs_deassert_counter[4]} {jadepix_ctrl/gs_deassert_counter[5]} {jadepix_ctrl/gs_deassert_counter[6]} {jadepix_ctrl/gs_deassert_counter[7]} {jadepix_ctrl/gs_deassert_counter[8]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe13]
set_property port_width 9 [get_debug_ports u_ila_1/probe13]
connect_debug_port u_ila_1/probe13 [get_nets [list {jadepix_ctrl/gs_col[0]} {jadepix_ctrl/gs_col[1]} {jadepix_ctrl/gs_col[2]} {jadepix_ctrl/gs_col[3]} {jadepix_ctrl/gs_col[4]} {jadepix_ctrl/gs_col[5]} {jadepix_ctrl/gs_col[6]} {jadepix_ctrl/gs_col[7]} {jadepix_ctrl/gs_col[8]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe14]
set_property port_width 3 [get_debug_ports u_ila_1/probe14]
connect_debug_port u_ila_1/probe14 [get_nets [list {jadepix_ctrl/cfg_sync[din][0]} {jadepix_ctrl/cfg_sync[din][1]} {jadepix_ctrl/cfg_sync[din][2]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe15]
set_property port_width 9 [get_debug_ports u_ila_1/probe15]
connect_debug_port u_ila_1/probe15 [get_nets [list {jadepix_ctrl/gs_deassert_cnt[0]} {jadepix_ctrl/gs_deassert_cnt[1]} {jadepix_ctrl/gs_deassert_cnt[2]} {jadepix_ctrl/gs_deassert_cnt[3]} {jadepix_ctrl/gs_deassert_cnt[4]} {jadepix_ctrl/gs_deassert_cnt[5]} {jadepix_ctrl/gs_deassert_cnt[6]} {jadepix_ctrl/gs_deassert_cnt[7]} {jadepix_ctrl/gs_deassert_cnt[8]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe16]
set_property port_width 17 [get_debug_ports u_ila_1/probe16]
connect_debug_port u_ila_1/probe16 [get_nets [list {jadepix_ctrl/cfg_fifo_count[0]} {jadepix_ctrl/cfg_fifo_count[1]} {jadepix_ctrl/cfg_fifo_count[2]} {jadepix_ctrl/cfg_fifo_count[3]} {jadepix_ctrl/cfg_fifo_count[4]} {jadepix_ctrl/cfg_fifo_count[5]} {jadepix_ctrl/cfg_fifo_count[6]} {jadepix_ctrl/cfg_fifo_count[7]} {jadepix_ctrl/cfg_fifo_count[8]} {jadepix_ctrl/cfg_fifo_count[9]} {jadepix_ctrl/cfg_fifo_count[10]} {jadepix_ctrl/cfg_fifo_count[11]} {jadepix_ctrl/cfg_fifo_count[12]} {jadepix_ctrl/cfg_fifo_count[13]} {jadepix_ctrl/cfg_fifo_count[14]} {jadepix_ctrl/cfg_fifo_count[15]} {jadepix_ctrl/cfg_fifo_count[16]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe17]
set_property port_width 3 [get_debug_ports u_ila_1/probe17]
connect_debug_port u_ila_1/probe17 [get_nets [list {jadepix_ctrl/cfg_dout[0]} {jadepix_ctrl/cfg_dout[1]} {jadepix_ctrl/cfg_dout[2]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe18]
set_property port_width 5 [get_debug_ports u_ila_1/probe18]
connect_debug_port u_ila_1/probe18 [get_nets [list {jadepix_ctrl/cfg_cnt[0]} {jadepix_ctrl/cfg_cnt[1]} {jadepix_ctrl/cfg_cnt[2]} {jadepix_ctrl/cfg_cnt[3]} {jadepix_ctrl/cfg_cnt[4]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe19]
set_property port_width 9 [get_debug_ports u_ila_1/probe19]
connect_debug_port u_ila_1/probe19 [get_nets [list {jadepix_ctrl/RA[0]} {jadepix_ctrl/RA[1]} {jadepix_ctrl/RA[2]} {jadepix_ctrl/RA[3]} {jadepix_ctrl/RA[4]} {jadepix_ctrl/RA[5]} {jadepix_ctrl/RA[6]} {jadepix_ctrl/RA[7]} {jadepix_ctrl/RA[8]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe20]
set_property port_width 9 [get_debug_ports u_ila_1/probe20]
connect_debug_port u_ila_1/probe20 [get_nets [list {jadepix_ctrl/CA[0]} {jadepix_ctrl/CA[1]} {jadepix_ctrl/CA[2]} {jadepix_ctrl/CA[3]} {jadepix_ctrl/CA[4]} {jadepix_ctrl/CA[5]} {jadepix_ctrl/CA[6]} {jadepix_ctrl/CA[7]} {jadepix_ctrl/CA[8]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe21]
set_property port_width 9 [get_debug_ports u_ila_1/probe21]
connect_debug_port u_ila_1/probe21 [get_nets [list {ipbus_payload/slave3/hitmap_col_low[0]} {ipbus_payload/slave3/hitmap_col_low[1]} {ipbus_payload/slave3/hitmap_col_low[2]} {ipbus_payload/slave3/hitmap_col_low[3]} {ipbus_payload/slave3/hitmap_col_low[4]} {ipbus_payload/slave3/hitmap_col_low[5]} {ipbus_payload/slave3/hitmap_col_low[6]} {ipbus_payload/slave3/hitmap_col_low[7]} {ipbus_payload/slave3/hitmap_col_low[8]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe22]
set_property port_width 9 [get_debug_ports u_ila_1/probe22]
connect_debug_port u_ila_1/probe22 [get_nets [list {ipbus_payload/slave3/hitmap_col_high[0]} {ipbus_payload/slave3/hitmap_col_high[1]} {ipbus_payload/slave3/hitmap_col_high[2]} {ipbus_payload/slave3/hitmap_col_high[3]} {ipbus_payload/slave3/hitmap_col_high[4]} {ipbus_payload/slave3/hitmap_col_high[5]} {ipbus_payload/slave3/hitmap_col_high[6]} {ipbus_payload/slave3/hitmap_col_high[7]} {ipbus_payload/slave3/hitmap_col_high[8]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe23]
set_property port_width 4 [get_debug_ports u_ila_1/probe23]
connect_debug_port u_ila_1/probe23 [get_nets [list {ipbus_payload/slave3/CACHE_BIT_SET[0]} {ipbus_payload/slave3/CACHE_BIT_SET[1]} {ipbus_payload/slave3/CACHE_BIT_SET[2]} {ipbus_payload/slave3/CACHE_BIT_SET[3]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe24]
set_property port_width 1 [get_debug_ports u_ila_1/probe24]
connect_debug_port u_ila_1/probe24 [get_nets [list jadepix_ctrl/aplse_gs]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe25]
set_property port_width 1 [get_debug_ports u_ila_1/probe25]
connect_debug_port u_ila_1/probe25 [get_nets [list jadepix_ctrl/CA_EN]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe26]
set_property port_width 1 [get_debug_ports u_ila_1/probe26]
connect_debug_port u_ila_1/probe26 [get_nets [list jadepix_ctrl/cfg_busy]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe27]
set_property port_width 1 [get_debug_ports u_ila_1/probe27]
connect_debug_port u_ila_1/probe27 [get_nets [list jadepix_ctrl/cfg_dout_valid]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe28]
set_property port_width 1 [get_debug_ports u_ila_1/probe28]
connect_debug_port u_ila_1/probe28 [get_nets [list jadepix_ctrl/cfg_fifo_empty]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe29]
set_property port_width 1 [get_debug_ports u_ila_1/probe29]
connect_debug_port u_ila_1/probe29 [get_nets [list jadepix_ctrl/cfg_fifo_pfull]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe30]
set_property port_width 1 [get_debug_ports u_ila_1/probe30]
connect_debug_port u_ila_1/probe30 [get_nets [list jadepix_ctrl/cfg_rd_en]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe31]
set_property port_width 1 [get_debug_ports u_ila_1/probe31]
connect_debug_port u_ila_1/probe31 [get_nets [list jadepix_ctrl/cfg_start]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe32]
set_property port_width 1 [get_debug_ports u_ila_1/probe32]
connect_debug_port u_ila_1/probe32 [get_nets [list {jadepix_ctrl/cfg_sync[wr_en]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe33]
set_property port_width 1 [get_debug_ports u_ila_1/probe33]
connect_debug_port u_ila_1/probe33 [get_nets [list jadepix_ctrl/CON_DATA]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe34]
set_property port_width 1 [get_debug_ports u_ila_1/probe34]
connect_debug_port u_ila_1/probe34 [get_nets [list jadepix_ctrl/CON_SELM]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe35]
set_property port_width 1 [get_debug_ports u_ila_1/probe35]
connect_debug_port u_ila_1/probe35 [get_nets [list jadepix_ctrl/CON_SELP]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe36]
set_property port_width 1 [get_debug_ports u_ila_1/probe36]
connect_debug_port u_ila_1/probe36 [get_nets [list jadepix_ctrl/dplse_gs]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe37]
set_property port_width 1 [get_debug_ports u_ila_1/probe37]
connect_debug_port u_ila_1/probe37 [get_nets [list jadepix_ctrl/fifo_rst]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe38]
set_property port_width 1 [get_debug_ports u_ila_1/probe38]
connect_debug_port u_ila_1/probe38 [get_nets [list jadepix_ctrl/gs_sel_pulse]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe39]
set_property port_width 1 [get_debug_ports u_ila_1/probe39]
connect_debug_port u_ila_1/probe39 [get_nets [list jadepix_ctrl/gs_start]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe40]
set_property port_width 1 [get_debug_ports u_ila_1/probe40]
connect_debug_port u_ila_1/probe40 [get_nets [list jadepix_ctrl/gshutter_gs]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe41]
set_property port_width 1 [get_debug_ports u_ila_1/probe41]
connect_debug_port u_ila_1/probe41 [get_nets [list jadepix_ctrl/HIT_RST]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe42]
set_property port_width 1 [get_debug_ports u_ila_1/probe42]
connect_debug_port u_ila_1/probe42 [get_nets [list ipbus_payload/slave3/hitmap_en]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe43]
set_property port_width 1 [get_debug_ports u_ila_1/probe43]
connect_debug_port u_ila_1/probe43 [get_nets [list ipbus_payload/slave3/LOAD]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe44]
set_property port_width 1 [get_debug_ports u_ila_1/probe44]
connect_debug_port u_ila_1/probe44 [get_nets [list ipbus_payload/LOAD]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe45]
set_property port_width 1 [get_debug_ports u_ila_1/probe45]
connect_debug_port u_ila_1/probe45 [get_nets [list ipbus_payload/slave3/PDB]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe46]
set_property port_width 1 [get_debug_ports u_ila_1/probe46]
connect_debug_port u_ila_1/probe46 [get_nets [list jadepix_ctrl/pulse_out]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe47]
set_property port_width 1 [get_debug_ports u_ila_1/probe47]
connect_debug_port u_ila_1/probe47 [get_nets [list jadepix_ctrl/RA_EN]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe48]
set_property port_width 1 [get_debug_ports u_ila_1/probe48]
connect_debug_port u_ila_1/probe48 [get_nets [list jadepix_ctrl/RD_EN]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe49]
set_property port_width 1 [get_debug_ports u_ila_1/probe49]
connect_debug_port u_ila_1/probe49 [get_nets [list jadepix_ctrl/rs_busy]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe50]
set_property port_width 1 [get_debug_ports u_ila_1/probe50]
connect_debug_port u_ila_1/probe50 [get_nets [list jadepix_ctrl/rs_start]]
create_debug_core u_ila_2 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_2]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_2]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_2]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_2]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_2]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_2]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_2]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_2]
set_property port_width 1 [get_debug_ports u_ila_2/clk]
connect_debug_port u_ila_2/clk [get_nets [list ipbus_infra/clocks/mmcm_1]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe0]
set_property port_width 32 [get_debug_ports u_ila_2/probe0]
connect_debug_port u_ila_2/probe0 [get_nets [list {ipb_out[ipb_wdata][0]} {ipb_out[ipb_wdata][1]} {ipb_out[ipb_wdata][2]} {ipb_out[ipb_wdata][3]} {ipb_out[ipb_wdata][4]} {ipb_out[ipb_wdata][5]} {ipb_out[ipb_wdata][6]} {ipb_out[ipb_wdata][7]} {ipb_out[ipb_wdata][8]} {ipb_out[ipb_wdata][9]} {ipb_out[ipb_wdata][10]} {ipb_out[ipb_wdata][11]} {ipb_out[ipb_wdata][12]} {ipb_out[ipb_wdata][13]} {ipb_out[ipb_wdata][14]} {ipb_out[ipb_wdata][15]} {ipb_out[ipb_wdata][16]} {ipb_out[ipb_wdata][17]} {ipb_out[ipb_wdata][18]} {ipb_out[ipb_wdata][19]} {ipb_out[ipb_wdata][20]} {ipb_out[ipb_wdata][21]} {ipb_out[ipb_wdata][22]} {ipb_out[ipb_wdata][23]} {ipb_out[ipb_wdata][24]} {ipb_out[ipb_wdata][25]} {ipb_out[ipb_wdata][26]} {ipb_out[ipb_wdata][27]} {ipb_out[ipb_wdata][28]} {ipb_out[ipb_wdata][29]} {ipb_out[ipb_wdata][30]} {ipb_out[ipb_wdata][31]}]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe1]
set_property port_width 32 [get_debug_ports u_ila_2/probe1]
connect_debug_port u_ila_2/probe1 [get_nets [list {ipb_out[ipb_addr][0]} {ipb_out[ipb_addr][1]} {ipb_out[ipb_addr][2]} {ipb_out[ipb_addr][3]} {ipb_out[ipb_addr][4]} {ipb_out[ipb_addr][5]} {ipb_out[ipb_addr][6]} {ipb_out[ipb_addr][7]} {ipb_out[ipb_addr][8]} {ipb_out[ipb_addr][9]} {ipb_out[ipb_addr][10]} {ipb_out[ipb_addr][11]} {ipb_out[ipb_addr][12]} {ipb_out[ipb_addr][13]} {ipb_out[ipb_addr][14]} {ipb_out[ipb_addr][15]} {ipb_out[ipb_addr][16]} {ipb_out[ipb_addr][17]} {ipb_out[ipb_addr][18]} {ipb_out[ipb_addr][19]} {ipb_out[ipb_addr][20]} {ipb_out[ipb_addr][21]} {ipb_out[ipb_addr][22]} {ipb_out[ipb_addr][23]} {ipb_out[ipb_addr][24]} {ipb_out[ipb_addr][25]} {ipb_out[ipb_addr][26]} {ipb_out[ipb_addr][27]} {ipb_out[ipb_addr][28]} {ipb_out[ipb_addr][29]} {ipb_out[ipb_addr][30]} {ipb_out[ipb_addr][31]}]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe2]
set_property port_width 32 [get_debug_ports u_ila_2/probe2]
connect_debug_port u_ila_2/probe2 [get_nets [list {ipb_in[ipb_rdata][0]} {ipb_in[ipb_rdata][1]} {ipb_in[ipb_rdata][2]} {ipb_in[ipb_rdata][3]} {ipb_in[ipb_rdata][4]} {ipb_in[ipb_rdata][5]} {ipb_in[ipb_rdata][6]} {ipb_in[ipb_rdata][7]} {ipb_in[ipb_rdata][8]} {ipb_in[ipb_rdata][9]} {ipb_in[ipb_rdata][10]} {ipb_in[ipb_rdata][11]} {ipb_in[ipb_rdata][12]} {ipb_in[ipb_rdata][13]} {ipb_in[ipb_rdata][14]} {ipb_in[ipb_rdata][15]} {ipb_in[ipb_rdata][16]} {ipb_in[ipb_rdata][17]} {ipb_in[ipb_rdata][18]} {ipb_in[ipb_rdata][19]} {ipb_in[ipb_rdata][20]} {ipb_in[ipb_rdata][21]} {ipb_in[ipb_rdata][22]} {ipb_in[ipb_rdata][23]} {ipb_in[ipb_rdata][24]} {ipb_in[ipb_rdata][25]} {ipb_in[ipb_rdata][26]} {ipb_in[ipb_rdata][27]} {ipb_in[ipb_rdata][28]} {ipb_in[ipb_rdata][29]} {ipb_in[ipb_rdata][30]} {ipb_in[ipb_rdata][31]}]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe3]
set_property port_width 1 [get_debug_ports u_ila_2/probe3]
connect_debug_port u_ila_2/probe3 [get_nets [list {ipbus_payload/ss[0]}]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe4]
set_property port_width 31 [get_debug_ports u_ila_2/probe4]
connect_debug_port u_ila_2/probe4 [get_nets [list {ipbus_payload/slave3/inst_ipbus_slave_reg_ram/inst_device_fabric/sel[1]} {ipbus_payload/slave3/inst_ipbus_slave_reg_ram/inst_device_fabric/sel[2]} {ipbus_payload/slave3/inst_ipbus_slave_reg_ram/inst_device_fabric/sel[3]} {ipbus_payload/slave3/inst_ipbus_slave_reg_ram/inst_device_fabric/sel[4]} {ipbus_payload/slave3/inst_ipbus_slave_reg_ram/inst_device_fabric/sel[5]} {ipbus_payload/slave3/inst_ipbus_slave_reg_ram/inst_device_fabric/sel[6]} {ipbus_payload/slave3/inst_ipbus_slave_reg_ram/inst_device_fabric/sel[7]} {ipbus_payload/slave3/inst_ipbus_slave_reg_ram/inst_device_fabric/sel[8]} {ipbus_payload/slave3/inst_ipbus_slave_reg_ram/inst_device_fabric/sel[9]} {ipbus_payload/slave3/inst_ipbus_slave_reg_ram/inst_device_fabric/sel[10]} {ipbus_payload/slave3/inst_ipbus_slave_reg_ram/inst_device_fabric/sel[11]} {ipbus_payload/slave3/inst_ipbus_slave_reg_ram/inst_device_fabric/sel[12]} {ipbus_payload/slave3/inst_ipbus_slave_reg_ram/inst_device_fabric/sel[13]} {ipbus_payload/slave3/inst_ipbus_slave_reg_ram/inst_device_fabric/sel[14]} {ipbus_payload/slave3/inst_ipbus_slave_reg_ram/inst_device_fabric/sel[15]} {ipbus_payload/slave3/inst_ipbus_slave_reg_ram/inst_device_fabric/sel[16]} {ipbus_payload/slave3/inst_ipbus_slave_reg_ram/inst_device_fabric/sel[17]} {ipbus_payload/slave3/inst_ipbus_slave_reg_ram/inst_device_fabric/sel[18]} {ipbus_payload/slave3/inst_ipbus_slave_reg_ram/inst_device_fabric/sel[19]} {ipbus_payload/slave3/inst_ipbus_slave_reg_ram/inst_device_fabric/sel[20]} {ipbus_payload/slave3/inst_ipbus_slave_reg_ram/inst_device_fabric/sel[21]} {ipbus_payload/slave3/inst_ipbus_slave_reg_ram/inst_device_fabric/sel[22]} {ipbus_payload/slave3/inst_ipbus_slave_reg_ram/inst_device_fabric/sel[23]} {ipbus_payload/slave3/inst_ipbus_slave_reg_ram/inst_device_fabric/sel[24]} {ipbus_payload/slave3/inst_ipbus_slave_reg_ram/inst_device_fabric/sel[25]} {ipbus_payload/slave3/inst_ipbus_slave_reg_ram/inst_device_fabric/sel[26]} {ipbus_payload/slave3/inst_ipbus_slave_reg_ram/inst_device_fabric/sel[27]} {ipbus_payload/slave3/inst_ipbus_slave_reg_ram/inst_device_fabric/sel[28]} {ipbus_payload/slave3/inst_ipbus_slave_reg_ram/inst_device_fabric/sel[29]} {ipbus_payload/slave3/inst_ipbus_slave_reg_ram/inst_device_fabric/sel[30]} {ipbus_payload/slave3/inst_ipbus_slave_reg_ram/inst_device_fabric/sel[31]}]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe5]
set_property port_width 1 [get_debug_ports u_ila_2/probe5]
connect_debug_port u_ila_2/probe5 [get_nets [list {ipb_in[ipb_ack]}]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe6]
set_property port_width 1 [get_debug_ports u_ila_2/probe6]
connect_debug_port u_ila_2/probe6 [get_nets [list {ipb_in[ipb_err]}]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe7]
set_property port_width 1 [get_debug_ports u_ila_2/probe7]
connect_debug_port u_ila_2/probe7 [get_nets [list {ipb_out[ipb_strobe]}]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe8]
set_property port_width 1 [get_debug_ports u_ila_2/probe8]
connect_debug_port u_ila_2/probe8 [get_nets [list {ipb_out[ipb_write]}]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe9]
set_property port_width 1 [get_debug_ports u_ila_2/probe9]
connect_debug_port u_ila_2/probe9 [get_nets [list ipbus_payload/miso]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe10]
set_property port_width 1 [get_debug_ports u_ila_2/probe10]
connect_debug_port u_ila_2/probe10 [get_nets [list ipbus_payload/mosi]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe11]
set_property port_width 1 [get_debug_ports u_ila_2/probe11]
connect_debug_port u_ila_2/probe11 [get_nets [list ipbus_payload/sclk]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk_ipb]
