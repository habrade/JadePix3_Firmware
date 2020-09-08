

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
connect_debug_port u_ila_0/clk [get_nets [list jadepix_clocks/clk]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 9 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {jadepix_ctrl/CA[0]} {jadepix_ctrl/CA[1]} {jadepix_ctrl/CA[2]} {jadepix_ctrl/CA[3]} {jadepix_ctrl/CA[4]} {jadepix_ctrl/CA[5]} {jadepix_ctrl/CA[6]} {jadepix_ctrl/CA[7]} {jadepix_ctrl/CA[8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 9 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {jadepix_ctrl/RA[0]} {jadepix_ctrl/RA[1]} {jadepix_ctrl/RA[2]} {jadepix_ctrl/RA[3]} {jadepix_ctrl/RA[4]} {jadepix_ctrl/RA[5]} {jadepix_ctrl/RA[6]} {jadepix_ctrl/RA[7]} {jadepix_ctrl/RA[8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 5 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {jadepix_ctrl/cfg_cnt[0]} {jadepix_ctrl/cfg_cnt[1]} {jadepix_ctrl/cfg_cnt[2]} {jadepix_ctrl/cfg_cnt[3]} {jadepix_ctrl/cfg_cnt[4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 3 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {jadepix_ctrl/cfg_dout[0]} {jadepix_ctrl/cfg_dout[1]} {jadepix_ctrl/cfg_dout[2]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 17 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {jadepix_ctrl/cfg_fifo_count[0]} {jadepix_ctrl/cfg_fifo_count[1]} {jadepix_ctrl/cfg_fifo_count[2]} {jadepix_ctrl/cfg_fifo_count[3]} {jadepix_ctrl/cfg_fifo_count[4]} {jadepix_ctrl/cfg_fifo_count[5]} {jadepix_ctrl/cfg_fifo_count[6]} {jadepix_ctrl/cfg_fifo_count[7]} {jadepix_ctrl/cfg_fifo_count[8]} {jadepix_ctrl/cfg_fifo_count[9]} {jadepix_ctrl/cfg_fifo_count[10]} {jadepix_ctrl/cfg_fifo_count[11]} {jadepix_ctrl/cfg_fifo_count[12]} {jadepix_ctrl/cfg_fifo_count[13]} {jadepix_ctrl/cfg_fifo_count[14]} {jadepix_ctrl/cfg_fifo_count[15]} {jadepix_ctrl/cfg_fifo_count[16]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 9 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {jadepix_ctrl/gs_deassert_cnt[0]} {jadepix_ctrl/gs_deassert_cnt[1]} {jadepix_ctrl/gs_deassert_cnt[2]} {jadepix_ctrl/gs_deassert_cnt[3]} {jadepix_ctrl/gs_deassert_cnt[4]} {jadepix_ctrl/gs_deassert_cnt[5]} {jadepix_ctrl/gs_deassert_cnt[6]} {jadepix_ctrl/gs_deassert_cnt[7]} {jadepix_ctrl/gs_deassert_cnt[8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 9 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {jadepix_ctrl/gs_deassert_counter[0]} {jadepix_ctrl/gs_deassert_counter[1]} {jadepix_ctrl/gs_deassert_counter[2]} {jadepix_ctrl/gs_deassert_counter[3]} {jadepix_ctrl/gs_deassert_counter[4]} {jadepix_ctrl/gs_deassert_counter[5]} {jadepix_ctrl/gs_deassert_counter[6]} {jadepix_ctrl/gs_deassert_counter[7]} {jadepix_ctrl/gs_deassert_counter[8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 9 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {jadepix_ctrl/gs_pulse_deassert_counter[0]} {jadepix_ctrl/gs_pulse_deassert_counter[1]} {jadepix_ctrl/gs_pulse_deassert_counter[2]} {jadepix_ctrl/gs_pulse_deassert_counter[3]} {jadepix_ctrl/gs_pulse_deassert_counter[4]} {jadepix_ctrl/gs_pulse_deassert_counter[5]} {jadepix_ctrl/gs_pulse_deassert_counter[6]} {jadepix_ctrl/gs_pulse_deassert_counter[7]} {jadepix_ctrl/gs_pulse_deassert_counter[8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 9 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {jadepix_ctrl/gs_pulse_deassert_cnt[0]} {jadepix_ctrl/gs_pulse_deassert_cnt[1]} {jadepix_ctrl/gs_pulse_deassert_cnt[2]} {jadepix_ctrl/gs_pulse_deassert_cnt[3]} {jadepix_ctrl/gs_pulse_deassert_cnt[4]} {jadepix_ctrl/gs_pulse_deassert_cnt[5]} {jadepix_ctrl/gs_pulse_deassert_cnt[6]} {jadepix_ctrl/gs_pulse_deassert_cnt[7]} {jadepix_ctrl/gs_pulse_deassert_cnt[8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 3 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list {jadepix_ctrl/cfg_sync[din][0]} {jadepix_ctrl/cfg_sync[din][1]} {jadepix_ctrl/cfg_sync[din][2]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 9 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list {ipbus_payload/slave3/hitmap_col_low[0]} {ipbus_payload/slave3/hitmap_col_low[1]} {ipbus_payload/slave3/hitmap_col_low[2]} {ipbus_payload/slave3/hitmap_col_low[3]} {ipbus_payload/slave3/hitmap_col_low[4]} {ipbus_payload/slave3/hitmap_col_low[5]} {ipbus_payload/slave3/hitmap_col_low[6]} {ipbus_payload/slave3/hitmap_col_low[7]} {ipbus_payload/slave3/hitmap_col_low[8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 9 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list {ipbus_payload/slave3/hitmap_col_high[0]} {ipbus_payload/slave3/hitmap_col_high[1]} {ipbus_payload/slave3/hitmap_col_high[2]} {ipbus_payload/slave3/hitmap_col_high[3]} {ipbus_payload/slave3/hitmap_col_high[4]} {ipbus_payload/slave3/hitmap_col_high[5]} {ipbus_payload/slave3/hitmap_col_high[6]} {ipbus_payload/slave3/hitmap_col_high[7]} {ipbus_payload/slave3/hitmap_col_high[8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 4 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list {ipbus_payload/slave3/CACHE_BIT_SET[0]} {ipbus_payload/slave3/CACHE_BIT_SET[1]} {ipbus_payload/slave3/CACHE_BIT_SET[2]} {ipbus_payload/slave3/CACHE_BIT_SET[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 5 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list {jadepix_ctrl/rs_cnt[0]} {jadepix_ctrl/rs_cnt[1]} {jadepix_ctrl/rs_cnt[2]} {jadepix_ctrl/rs_cnt[3]} {jadepix_ctrl/rs_cnt[4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 9 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list {jadepix_ctrl/gs_pulse_delay_cnt[0]} {jadepix_ctrl/gs_pulse_delay_cnt[1]} {jadepix_ctrl/gs_pulse_delay_cnt[2]} {jadepix_ctrl/gs_pulse_delay_cnt[3]} {jadepix_ctrl/gs_pulse_delay_cnt[4]} {jadepix_ctrl/gs_pulse_delay_cnt[5]} {jadepix_ctrl/gs_pulse_delay_cnt[6]} {jadepix_ctrl/gs_pulse_delay_cnt[7]} {jadepix_ctrl/gs_pulse_delay_cnt[8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 9 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list {jadepix_ctrl/gs_pulse_delay_counter[0]} {jadepix_ctrl/gs_pulse_delay_counter[1]} {jadepix_ctrl/gs_pulse_delay_counter[2]} {jadepix_ctrl/gs_pulse_delay_counter[3]} {jadepix_ctrl/gs_pulse_delay_counter[4]} {jadepix_ctrl/gs_pulse_delay_counter[5]} {jadepix_ctrl/gs_pulse_delay_counter[6]} {jadepix_ctrl/gs_pulse_delay_counter[7]} {jadepix_ctrl/gs_pulse_delay_counter[8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
set_property port_width 2 [get_debug_ports u_ila_0/probe16]
connect_debug_port u_ila_0/probe16 [get_nets [list {jadepix_ctrl/gs_pulse_width_cnt_high[0]} {jadepix_ctrl/gs_pulse_width_cnt_high[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe17]
set_property port_width 34 [get_debug_ports u_ila_0/probe17]
connect_debug_port u_ila_0/probe17 [get_nets [list {jadepix_ctrl/gs_width_counter[0]} {jadepix_ctrl/gs_width_counter[1]} {jadepix_ctrl/gs_width_counter[2]} {jadepix_ctrl/gs_width_counter[3]} {jadepix_ctrl/gs_width_counter[4]} {jadepix_ctrl/gs_width_counter[5]} {jadepix_ctrl/gs_width_counter[6]} {jadepix_ctrl/gs_width_counter[7]} {jadepix_ctrl/gs_width_counter[8]} {jadepix_ctrl/gs_width_counter[9]} {jadepix_ctrl/gs_width_counter[10]} {jadepix_ctrl/gs_width_counter[11]} {jadepix_ctrl/gs_width_counter[12]} {jadepix_ctrl/gs_width_counter[13]} {jadepix_ctrl/gs_width_counter[14]} {jadepix_ctrl/gs_width_counter[15]} {jadepix_ctrl/gs_width_counter[16]} {jadepix_ctrl/gs_width_counter[17]} {jadepix_ctrl/gs_width_counter[18]} {jadepix_ctrl/gs_width_counter[19]} {jadepix_ctrl/gs_width_counter[20]} {jadepix_ctrl/gs_width_counter[21]} {jadepix_ctrl/gs_width_counter[22]} {jadepix_ctrl/gs_width_counter[23]} {jadepix_ctrl/gs_width_counter[24]} {jadepix_ctrl/gs_width_counter[25]} {jadepix_ctrl/gs_width_counter[26]} {jadepix_ctrl/gs_width_counter[27]} {jadepix_ctrl/gs_width_counter[28]} {jadepix_ctrl/gs_width_counter[29]} {jadepix_ctrl/gs_width_counter[30]} {jadepix_ctrl/gs_width_counter[31]} {jadepix_ctrl/gs_width_counter[32]} {jadepix_ctrl/gs_width_counter[33]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe18]
set_property port_width 32 [get_debug_ports u_ila_0/probe18]
connect_debug_port u_ila_0/probe18 [get_nets [list {jadepix_ctrl/gs_pulse_width_cnt_low[0]} {jadepix_ctrl/gs_pulse_width_cnt_low[1]} {jadepix_ctrl/gs_pulse_width_cnt_low[2]} {jadepix_ctrl/gs_pulse_width_cnt_low[3]} {jadepix_ctrl/gs_pulse_width_cnt_low[4]} {jadepix_ctrl/gs_pulse_width_cnt_low[5]} {jadepix_ctrl/gs_pulse_width_cnt_low[6]} {jadepix_ctrl/gs_pulse_width_cnt_low[7]} {jadepix_ctrl/gs_pulse_width_cnt_low[8]} {jadepix_ctrl/gs_pulse_width_cnt_low[9]} {jadepix_ctrl/gs_pulse_width_cnt_low[10]} {jadepix_ctrl/gs_pulse_width_cnt_low[11]} {jadepix_ctrl/gs_pulse_width_cnt_low[12]} {jadepix_ctrl/gs_pulse_width_cnt_low[13]} {jadepix_ctrl/gs_pulse_width_cnt_low[14]} {jadepix_ctrl/gs_pulse_width_cnt_low[15]} {jadepix_ctrl/gs_pulse_width_cnt_low[16]} {jadepix_ctrl/gs_pulse_width_cnt_low[17]} {jadepix_ctrl/gs_pulse_width_cnt_low[18]} {jadepix_ctrl/gs_pulse_width_cnt_low[19]} {jadepix_ctrl/gs_pulse_width_cnt_low[20]} {jadepix_ctrl/gs_pulse_width_cnt_low[21]} {jadepix_ctrl/gs_pulse_width_cnt_low[22]} {jadepix_ctrl/gs_pulse_width_cnt_low[23]} {jadepix_ctrl/gs_pulse_width_cnt_low[24]} {jadepix_ctrl/gs_pulse_width_cnt_low[25]} {jadepix_ctrl/gs_pulse_width_cnt_low[26]} {jadepix_ctrl/gs_pulse_width_cnt_low[27]} {jadepix_ctrl/gs_pulse_width_cnt_low[28]} {jadepix_ctrl/gs_pulse_width_cnt_low[29]} {jadepix_ctrl/gs_pulse_width_cnt_low[30]} {jadepix_ctrl/gs_pulse_width_cnt_low[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe19]
set_property port_width 4 [get_debug_ports u_ila_0/probe19]
connect_debug_port u_ila_0/probe19 [get_nets [list {jadepix_ctrl/hitmap_num[0]} {jadepix_ctrl/hitmap_num[1]} {jadepix_ctrl/hitmap_num[2]} {jadepix_ctrl/hitmap_num[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe20]
set_property port_width 17 [get_debug_ports u_ila_0/probe20]
connect_debug_port u_ila_0/probe20 [get_nets [list {jadepix_ctrl/pix_cnt[0]} {jadepix_ctrl/pix_cnt[1]} {jadepix_ctrl/pix_cnt[2]} {jadepix_ctrl/pix_cnt[3]} {jadepix_ctrl/pix_cnt[4]} {jadepix_ctrl/pix_cnt[5]} {jadepix_ctrl/pix_cnt[6]} {jadepix_ctrl/pix_cnt[7]} {jadepix_ctrl/pix_cnt[8]} {jadepix_ctrl/pix_cnt[9]} {jadepix_ctrl/pix_cnt[10]} {jadepix_ctrl/pix_cnt[11]} {jadepix_ctrl/pix_cnt[12]} {jadepix_ctrl/pix_cnt[13]} {jadepix_ctrl/pix_cnt[14]} {jadepix_ctrl/pix_cnt[15]} {jadepix_ctrl/pix_cnt[16]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe21]
set_property port_width 5 [get_debug_ports u_ila_0/probe21]
connect_debug_port u_ila_0/probe21 [get_nets [list {jadepix_ctrl/state_reg[0]} {jadepix_ctrl/state_reg[1]} {jadepix_ctrl/state_reg[2]} {jadepix_ctrl/state_reg[3]} {jadepix_ctrl/state_reg[4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe22]
set_property port_width 5 [get_debug_ports u_ila_0/probe22]
connect_debug_port u_ila_0/probe22 [get_nets [list {jadepix_ctrl/state_next[0]} {jadepix_ctrl/state_next[1]} {jadepix_ctrl/state_next[2]} {jadepix_ctrl/state_next[3]} {jadepix_ctrl/state_next[4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe23]
set_property port_width 1 [get_debug_ports u_ila_0/probe23]
connect_debug_port u_ila_0/probe23 [get_nets [list jadepix_ctrl/APLSE]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe24]
set_property port_width 1 [get_debug_ports u_ila_0/probe24]
connect_debug_port u_ila_0/probe24 [get_nets [list jadepix_ctrl/CA_EN]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe25]
set_property port_width 1 [get_debug_ports u_ila_0/probe25]
connect_debug_port u_ila_0/probe25 [get_nets [list jadepix_ctrl/cfg_busy]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe26]
set_property port_width 1 [get_debug_ports u_ila_0/probe26]
connect_debug_port u_ila_0/probe26 [get_nets [list jadepix_ctrl/cfg_dout_valid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe27]
set_property port_width 1 [get_debug_ports u_ila_0/probe27]
connect_debug_port u_ila_0/probe27 [get_nets [list jadepix_ctrl/cfg_fifo_empty]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe28]
set_property port_width 1 [get_debug_ports u_ila_0/probe28]
connect_debug_port u_ila_0/probe28 [get_nets [list jadepix_ctrl/cfg_fifo_pfull]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe29]
set_property port_width 1 [get_debug_ports u_ila_0/probe29]
connect_debug_port u_ila_0/probe29 [get_nets [list jadepix_ctrl/cfg_rd_en]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe30]
set_property port_width 1 [get_debug_ports u_ila_0/probe30]
connect_debug_port u_ila_0/probe30 [get_nets [list jadepix_ctrl/cfg_start]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe31]
set_property port_width 1 [get_debug_ports u_ila_0/probe31]
connect_debug_port u_ila_0/probe31 [get_nets [list {jadepix_ctrl/cfg_sync[wr_en]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe32]
set_property port_width 1 [get_debug_ports u_ila_0/probe32]
connect_debug_port u_ila_0/probe32 [get_nets [list jadepix_ctrl/CON_DATA]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe33]
set_property port_width 1 [get_debug_ports u_ila_0/probe33]
connect_debug_port u_ila_0/probe33 [get_nets [list jadepix_ctrl/CON_SELM]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe34]
set_property port_width 1 [get_debug_ports u_ila_0/probe34]
connect_debug_port u_ila_0/probe34 [get_nets [list jadepix_ctrl/CON_SELP]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe35]
set_property port_width 1 [get_debug_ports u_ila_0/probe35]
connect_debug_port u_ila_0/probe35 [get_nets [list jadepix_ctrl/DPLSE]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe36]
set_property port_width 1 [get_debug_ports u_ila_0/probe36]
connect_debug_port u_ila_0/probe36 [get_nets [list jadepix_ctrl/fifo_rst]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe37]
set_property port_width 1 [get_debug_ports u_ila_0/probe37]
connect_debug_port u_ila_0/probe37 [get_nets [list jadepix_ctrl/gs_sel_pulse]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe38]
set_property port_width 1 [get_debug_ports u_ila_0/probe38]
connect_debug_port u_ila_0/probe38 [get_nets [list jadepix_ctrl/gs_start]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe39]
set_property port_width 1 [get_debug_ports u_ila_0/probe39]
connect_debug_port u_ila_0/probe39 [get_nets [list jadepix_ctrl/GSHUTTER]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe40]
set_property port_width 1 [get_debug_ports u_ila_0/probe40]
connect_debug_port u_ila_0/probe40 [get_nets [list jadepix_ctrl/HIT_RST]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe41]
set_property port_width 1 [get_debug_ports u_ila_0/probe41]
connect_debug_port u_ila_0/probe41 [get_nets [list ipbus_payload/slave3/hitmap_en]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe42]
set_property port_width 1 [get_debug_ports u_ila_0/probe42]
connect_debug_port u_ila_0/probe42 [get_nets [list ipbus_payload/LOAD]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe43]
set_property port_width 1 [get_debug_ports u_ila_0/probe43]
connect_debug_port u_ila_0/probe43 [get_nets [list ipbus_payload/slave3/LOAD]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe44]
set_property port_width 1 [get_debug_ports u_ila_0/probe44]
connect_debug_port u_ila_0/probe44 [get_nets [list ipbus_payload/slave3/MATRIX_GRST]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe45]
set_property port_width 1 [get_debug_ports u_ila_0/probe45]
connect_debug_port u_ila_0/probe45 [get_nets [list ipbus_payload/slave3/PDB]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe46]
set_property port_width 1 [get_debug_ports u_ila_0/probe46]
connect_debug_port u_ila_0/probe46 [get_nets [list jadepix_ctrl/pulse_out]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe47]
set_property port_width 1 [get_debug_ports u_ila_0/probe47]
connect_debug_port u_ila_0/probe47 [get_nets [list jadepix_ctrl/RA_EN]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe48]
set_property port_width 1 [get_debug_ports u_ila_0/probe48]
connect_debug_port u_ila_0/probe48 [get_nets [list jadepix_ctrl/RD_EN]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe49]
set_property port_width 1 [get_debug_ports u_ila_0/probe49]
connect_debug_port u_ila_0/probe49 [get_nets [list jadepix_ctrl/rs_busy]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe50]
set_property port_width 1 [get_debug_ports u_ila_0/probe50]
connect_debug_port u_ila_0/probe50 [get_nets [list jadepix_ctrl/rs_start]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe51]
set_property port_width 1 [get_debug_ports u_ila_0/probe51]
connect_debug_port u_ila_0/probe51 [get_nets [list jadepix_ctrl/rs_stop]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk_sys]
