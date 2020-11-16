
connect_debug_port u_ila_0/probe9 [get_nets [list {jadepix_read_data/fifo_ctrl/read_row_cnt[0]} {jadepix_read_data/fifo_ctrl/read_row_cnt[1]} {jadepix_read_data/fifo_ctrl/read_row_cnt[2]} {jadepix_read_data/fifo_ctrl/read_row_cnt[3]} {jadepix_read_data/fifo_ctrl/read_row_cnt[4]} {jadepix_read_data/fifo_ctrl/read_row_cnt[5]} {jadepix_read_data/fifo_ctrl/read_row_cnt[6]} {jadepix_read_data/fifo_ctrl/read_row_cnt[7]} {jadepix_read_data/fifo_ctrl/read_row_cnt[8]} {jadepix_read_data/fifo_ctrl/read_row_cnt[9]}]]
connect_debug_port u_ila_0/probe95 [get_nets [list jadepix_read_data/fifo_ctrl/read_frame_start]]
connect_debug_port u_ila_0/probe97 [get_nets [list jadepix_read_data/fifo_ctrl/read_frame_stop]]

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
set_property port_width 2 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {jadepix_read_data/fifo_status_buffer/state_reg[0]} {jadepix_read_data/fifo_status_buffer/state_reg[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 2 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {jadepix_read_data/fifo_status_buffer/state_next[0]} {jadepix_read_data/fifo_status_buffer/state_next[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 5 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {jadepix_read_data/fifo_status_buffer/sector_counters_v[0][valid_counter][0]} {jadepix_read_data/fifo_status_buffer/sector_counters_v[0][valid_counter][1]} {jadepix_read_data/fifo_status_buffer/sector_counters_v[0][valid_counter][2]} {jadepix_read_data/fifo_status_buffer/sector_counters_v[0][valid_counter][3]} {jadepix_read_data/fifo_status_buffer/sector_counters_v[0][valid_counter][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 5 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {jadepix_read_data/fifo_status_buffer/sector_counters_v[0][overflow_counter][0]} {jadepix_read_data/fifo_status_buffer/sector_counters_v[0][overflow_counter][1]} {jadepix_read_data/fifo_status_buffer/sector_counters_v[0][overflow_counter][2]} {jadepix_read_data/fifo_status_buffer/sector_counters_v[0][overflow_counter][3]} {jadepix_read_data/fifo_status_buffer/sector_counters_v[0][overflow_counter][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 9 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {jadepix_read_data/fifo_status_buffer/row[0]} {jadepix_read_data/fifo_status_buffer/row[1]} {jadepix_read_data/fifo_status_buffer/row[2]} {jadepix_read_data/fifo_status_buffer/row[3]} {jadepix_read_data/fifo_status_buffer/row[4]} {jadepix_read_data/fifo_status_buffer/row[5]} {jadepix_read_data/fifo_status_buffer/row[6]} {jadepix_read_data/fifo_status_buffer/row[7]} {jadepix_read_data/fifo_status_buffer/row[8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 8 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {jadepix_read_data/fifo_status_buffer/buffer_fill_count[0]} {jadepix_read_data/fifo_status_buffer/buffer_fill_count[1]} {jadepix_read_data/fifo_status_buffer/buffer_fill_count[2]} {jadepix_read_data/fifo_status_buffer/buffer_fill_count[3]} {jadepix_read_data/fifo_status_buffer/buffer_fill_count[4]} {jadepix_read_data/fifo_status_buffer/buffer_fill_count[5]} {jadepix_read_data/fifo_status_buffer/buffer_fill_count[6]} {jadepix_read_data/fifo_status_buffer/buffer_fill_count[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 86 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {jadepix_read_data/fifo_status_buffer/buffer_data_flat[0]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[1]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[2]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[3]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[4]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[5]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[6]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[7]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[8]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[9]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[10]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[11]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[12]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[13]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[14]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[15]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[16]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[17]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[18]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[19]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[20]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[21]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[22]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[23]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[24]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[25]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[26]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[27]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[28]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[29]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[30]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[31]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[32]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[33]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[34]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[35]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[36]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[37]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[38]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[39]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[40]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[41]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[42]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[43]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[44]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[45]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[46]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[47]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[48]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[49]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[50]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[51]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[52]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[53]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[54]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[55]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[56]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[57]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[58]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[59]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[60]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[61]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[62]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[63]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[64]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[65]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[66]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[67]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[68]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[69]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[70]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[71]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[72]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[73]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[74]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[75]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[76]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[77]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[78]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[79]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[80]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[81]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[82]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[83]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[84]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[85]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 22 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {jadepix_read_data/fifo_status_buffer/frame_num[0]} {jadepix_read_data/fifo_status_buffer/frame_num[1]} {jadepix_read_data/fifo_status_buffer/frame_num[2]} {jadepix_read_data/fifo_status_buffer/frame_num[3]} {jadepix_read_data/fifo_status_buffer/frame_num[4]} {jadepix_read_data/fifo_status_buffer/frame_num[5]} {jadepix_read_data/fifo_status_buffer/frame_num[6]} {jadepix_read_data/fifo_status_buffer/frame_num[7]} {jadepix_read_data/fifo_status_buffer/frame_num[8]} {jadepix_read_data/fifo_status_buffer/frame_num[9]} {jadepix_read_data/fifo_status_buffer/frame_num[10]} {jadepix_read_data/fifo_status_buffer/frame_num[11]} {jadepix_read_data/fifo_status_buffer/frame_num[12]} {jadepix_read_data/fifo_status_buffer/frame_num[13]} {jadepix_read_data/fifo_status_buffer/frame_num[14]} {jadepix_read_data/fifo_status_buffer/frame_num[15]} {jadepix_read_data/fifo_status_buffer/frame_num[16]} {jadepix_read_data/fifo_status_buffer/frame_num[17]} {jadepix_read_data/fifo_status_buffer/frame_num[18]} {jadepix_read_data/fifo_status_buffer/frame_num[19]} {jadepix_read_data/fifo_status_buffer/frame_num[20]} {jadepix_read_data/fifo_status_buffer/frame_num[21]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 2 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {jadepix_read_data/fifo_data/fifo_status_v[3][0]} {jadepix_read_data/fifo_data/fifo_status_v[3][1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 2 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list {jadepix_read_data/fifo_data/fifo_status_v[2][0]} {jadepix_read_data/fifo_data/fifo_status_v[2][1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 2 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list {jadepix_read_data/fifo_data/fifo_status_v[1][0]} {jadepix_read_data/fifo_data/fifo_status_v[1][1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 2 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list {jadepix_read_data/fifo_data/fifo_status_v[0][0]} {jadepix_read_data/fifo_data/fifo_status_v[0][1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 5 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list {jadepix_read_data/fifo_data/fifo_oc[0]} {jadepix_read_data/fifo_data/fifo_oc[1]} {jadepix_read_data/fifo_data/fifo_oc[2]} {jadepix_read_data/fifo_data/fifo_oc[3]} {jadepix_read_data/fifo_data/fifo_oc[4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 32 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list {jadepix_read_data/fifo_data/data_fifo_wr_din[0]} {jadepix_read_data/fifo_data/data_fifo_wr_din[1]} {jadepix_read_data/fifo_data/data_fifo_wr_din[2]} {jadepix_read_data/fifo_data/data_fifo_wr_din[3]} {jadepix_read_data/fifo_data/data_fifo_wr_din[4]} {jadepix_read_data/fifo_data/data_fifo_wr_din[5]} {jadepix_read_data/fifo_data/data_fifo_wr_din[6]} {jadepix_read_data/fifo_data/data_fifo_wr_din[7]} {jadepix_read_data/fifo_data/data_fifo_wr_din[8]} {jadepix_read_data/fifo_data/data_fifo_wr_din[9]} {jadepix_read_data/fifo_data/data_fifo_wr_din[10]} {jadepix_read_data/fifo_data/data_fifo_wr_din[11]} {jadepix_read_data/fifo_data/data_fifo_wr_din[12]} {jadepix_read_data/fifo_data/data_fifo_wr_din[13]} {jadepix_read_data/fifo_data/data_fifo_wr_din[14]} {jadepix_read_data/fifo_data/data_fifo_wr_din[15]} {jadepix_read_data/fifo_data/data_fifo_wr_din[16]} {jadepix_read_data/fifo_data/data_fifo_wr_din[17]} {jadepix_read_data/fifo_data/data_fifo_wr_din[18]} {jadepix_read_data/fifo_data/data_fifo_wr_din[19]} {jadepix_read_data/fifo_data/data_fifo_wr_din[20]} {jadepix_read_data/fifo_data/data_fifo_wr_din[21]} {jadepix_read_data/fifo_data/data_fifo_wr_din[22]} {jadepix_read_data/fifo_data/data_fifo_wr_din[23]} {jadepix_read_data/fifo_data/data_fifo_wr_din[24]} {jadepix_read_data/fifo_data/data_fifo_wr_din[25]} {jadepix_read_data/fifo_data/data_fifo_wr_din[26]} {jadepix_read_data/fifo_data/data_fifo_wr_din[27]} {jadepix_read_data/fifo_data/data_fifo_wr_din[28]} {jadepix_read_data/fifo_data/data_fifo_wr_din[29]} {jadepix_read_data/fifo_data/data_fifo_wr_din[30]} {jadepix_read_data/fifo_data/data_fifo_wr_din[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 5 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list {jadepix_read_data/fifo_data/buffer_data_record[sectors][0][valid_counter][0]} {jadepix_read_data/fifo_data/buffer_data_record[sectors][0][valid_counter][1]} {jadepix_read_data/fifo_data/buffer_data_record[sectors][0][valid_counter][2]} {jadepix_read_data/fifo_data/buffer_data_record[sectors][0][valid_counter][3]} {jadepix_read_data/fifo_data/buffer_data_record[sectors][0][valid_counter][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 5 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list {jadepix_read_data/fifo_data/buffer_data_record[sectors][0][overflow_counter][0]} {jadepix_read_data/fifo_data/buffer_data_record[sectors][0][overflow_counter][1]} {jadepix_read_data/fifo_data/buffer_data_record[sectors][0][overflow_counter][2]} {jadepix_read_data/fifo_data/buffer_data_record[sectors][0][overflow_counter][3]} {jadepix_read_data/fifo_data/buffer_data_record[sectors][0][overflow_counter][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
set_property port_width 9 [get_debug_ports u_ila_0/probe16]
connect_debug_port u_ila_0/probe16 [get_nets [list {jadepix_read_data/fifo_data/buffer_data_record[row][0]} {jadepix_read_data/fifo_data/buffer_data_record[row][1]} {jadepix_read_data/fifo_data/buffer_data_record[row][2]} {jadepix_read_data/fifo_data/buffer_data_record[row][3]} {jadepix_read_data/fifo_data/buffer_data_record[row][4]} {jadepix_read_data/fifo_data/buffer_data_record[row][5]} {jadepix_read_data/fifo_data/buffer_data_record[row][6]} {jadepix_read_data/fifo_data/buffer_data_record[row][7]} {jadepix_read_data/fifo_data/buffer_data_record[row][8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe17]
set_property port_width 15 [get_debug_ports u_ila_0/probe17]
connect_debug_port u_ila_0/probe17 [get_nets [list {jadepix_read_data/fifo_data/buffer_data_record[rbof][0]} {jadepix_read_data/fifo_data/buffer_data_record[rbof][1]} {jadepix_read_data/fifo_data/buffer_data_record[rbof][2]} {jadepix_read_data/fifo_data/buffer_data_record[rbof][3]} {jadepix_read_data/fifo_data/buffer_data_record[rbof][4]} {jadepix_read_data/fifo_data/buffer_data_record[rbof][5]} {jadepix_read_data/fifo_data/buffer_data_record[rbof][6]} {jadepix_read_data/fifo_data/buffer_data_record[rbof][7]} {jadepix_read_data/fifo_data/buffer_data_record[rbof][8]} {jadepix_read_data/fifo_data/buffer_data_record[rbof][9]} {jadepix_read_data/fifo_data/buffer_data_record[rbof][10]} {jadepix_read_data/fifo_data/buffer_data_record[rbof][11]} {jadepix_read_data/fifo_data/buffer_data_record[rbof][12]} {jadepix_read_data/fifo_data/buffer_data_record[rbof][13]} {jadepix_read_data/fifo_data/buffer_data_record[rbof][14]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe18]
set_property port_width 2 [get_debug_ports u_ila_0/probe18]
connect_debug_port u_ila_0/probe18 [get_nets [list {jadepix_read_data/fifo_data/blk_select_delay[0]} {jadepix_read_data/fifo_data/blk_select_delay[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe19]
set_property port_width 22 [get_debug_ports u_ila_0/probe19]
connect_debug_port u_ila_0/probe19 [get_nets [list {jadepix_read_data/fifo_data/buffer_data_record[frame_num][0]} {jadepix_read_data/fifo_data/buffer_data_record[frame_num][1]} {jadepix_read_data/fifo_data/buffer_data_record[frame_num][2]} {jadepix_read_data/fifo_data/buffer_data_record[frame_num][3]} {jadepix_read_data/fifo_data/buffer_data_record[frame_num][4]} {jadepix_read_data/fifo_data/buffer_data_record[frame_num][5]} {jadepix_read_data/fifo_data/buffer_data_record[frame_num][6]} {jadepix_read_data/fifo_data/buffer_data_record[frame_num][7]} {jadepix_read_data/fifo_data/buffer_data_record[frame_num][8]} {jadepix_read_data/fifo_data/buffer_data_record[frame_num][9]} {jadepix_read_data/fifo_data/buffer_data_record[frame_num][10]} {jadepix_read_data/fifo_data/buffer_data_record[frame_num][11]} {jadepix_read_data/fifo_data/buffer_data_record[frame_num][12]} {jadepix_read_data/fifo_data/buffer_data_record[frame_num][13]} {jadepix_read_data/fifo_data/buffer_data_record[frame_num][14]} {jadepix_read_data/fifo_data/buffer_data_record[frame_num][15]} {jadepix_read_data/fifo_data/buffer_data_record[frame_num][16]} {jadepix_read_data/fifo_data/buffer_data_record[frame_num][17]} {jadepix_read_data/fifo_data/buffer_data_record[frame_num][18]} {jadepix_read_data/fifo_data/buffer_data_record[frame_num][19]} {jadepix_read_data/fifo_data/buffer_data_record[frame_num][20]} {jadepix_read_data/fifo_data/buffer_data_record[frame_num][21]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe20]
set_property port_width 4 [get_debug_ports u_ila_0/probe20]
connect_debug_port u_ila_0/probe20 [get_nets [list {jadepix_read_data/fifo_ctrl/fifo_read_en_v[0]} {jadepix_read_data/fifo_ctrl/fifo_read_en_v[1]} {jadepix_read_data/fifo_ctrl/fifo_read_en_v[2]} {jadepix_read_data/fifo_ctrl/fifo_read_en_v[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe21]
set_property port_width 5 [get_debug_ports u_ila_0/probe21]
connect_debug_port u_ila_0/probe21 [get_nets [list {jadepix_read_data/fifo_ctrl/cnt_sec3[0]} {jadepix_read_data/fifo_ctrl/cnt_sec3[1]} {jadepix_read_data/fifo_ctrl/cnt_sec3[2]} {jadepix_read_data/fifo_ctrl/cnt_sec3[3]} {jadepix_read_data/fifo_ctrl/cnt_sec3[4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe22]
set_property port_width 5 [get_debug_ports u_ila_0/probe22]
connect_debug_port u_ila_0/probe22 [get_nets [list {jadepix_read_data/fifo_ctrl/cnt_sec2[0]} {jadepix_read_data/fifo_ctrl/cnt_sec2[1]} {jadepix_read_data/fifo_ctrl/cnt_sec2[2]} {jadepix_read_data/fifo_ctrl/cnt_sec2[3]} {jadepix_read_data/fifo_ctrl/cnt_sec2[4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe23]
set_property port_width 5 [get_debug_ports u_ila_0/probe23]
connect_debug_port u_ila_0/probe23 [get_nets [list {jadepix_read_data/fifo_ctrl/cnt_sec1[0]} {jadepix_read_data/fifo_ctrl/cnt_sec1[1]} {jadepix_read_data/fifo_ctrl/cnt_sec1[2]} {jadepix_read_data/fifo_ctrl/cnt_sec1[3]} {jadepix_read_data/fifo_ctrl/cnt_sec1[4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe24]
set_property port_width 5 [get_debug_ports u_ila_0/probe24]
connect_debug_port u_ila_0/probe24 [get_nets [list {jadepix_read_data/fifo_ctrl/cnt_sec0[0]} {jadepix_read_data/fifo_ctrl/cnt_sec0[1]} {jadepix_read_data/fifo_ctrl/cnt_sec0[2]} {jadepix_read_data/fifo_ctrl/cnt_sec0[3]} {jadepix_read_data/fifo_ctrl/cnt_sec0[4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe25]
set_property port_width 8 [get_debug_ports u_ila_0/probe25]
connect_debug_port u_ila_0/probe25 [get_nets [list {jadepix_read_data/fifo_ctrl/buffer_fill_count[0]} {jadepix_read_data/fifo_ctrl/buffer_fill_count[1]} {jadepix_read_data/fifo_ctrl/buffer_fill_count[2]} {jadepix_read_data/fifo_ctrl/buffer_fill_count[3]} {jadepix_read_data/fifo_ctrl/buffer_fill_count[4]} {jadepix_read_data/fifo_ctrl/buffer_fill_count[5]} {jadepix_read_data/fifo_ctrl/buffer_fill_count[6]} {jadepix_read_data/fifo_ctrl/buffer_fill_count[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe26]
set_property port_width 5 [get_debug_ports u_ila_0/probe26]
connect_debug_port u_ila_0/probe26 [get_nets [list {jadepix_read_data/fifo_ctrl/buffer_data_record[sectors][0][valid_counter][0]} {jadepix_read_data/fifo_ctrl/buffer_data_record[sectors][0][valid_counter][1]} {jadepix_read_data/fifo_ctrl/buffer_data_record[sectors][0][valid_counter][2]} {jadepix_read_data/fifo_ctrl/buffer_data_record[sectors][0][valid_counter][3]} {jadepix_read_data/fifo_ctrl/buffer_data_record[sectors][0][valid_counter][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe27]
set_property port_width 5 [get_debug_ports u_ila_0/probe27]
connect_debug_port u_ila_0/probe27 [get_nets [list {jadepix_read_data/fifo_ctrl/buffer_data_record[sectors][0][overflow_counter][0]} {jadepix_read_data/fifo_ctrl/buffer_data_record[sectors][0][overflow_counter][1]} {jadepix_read_data/fifo_ctrl/buffer_data_record[sectors][0][overflow_counter][2]} {jadepix_read_data/fifo_ctrl/buffer_data_record[sectors][0][overflow_counter][3]} {jadepix_read_data/fifo_ctrl/buffer_data_record[sectors][0][overflow_counter][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe28]
set_property port_width 15 [get_debug_ports u_ila_0/probe28]
connect_debug_port u_ila_0/probe28 [get_nets [list {jadepix_read_data/fifo_ctrl/buffer_data_record[rbof][0]} {jadepix_read_data/fifo_ctrl/buffer_data_record[rbof][1]} {jadepix_read_data/fifo_ctrl/buffer_data_record[rbof][2]} {jadepix_read_data/fifo_ctrl/buffer_data_record[rbof][3]} {jadepix_read_data/fifo_ctrl/buffer_data_record[rbof][4]} {jadepix_read_data/fifo_ctrl/buffer_data_record[rbof][5]} {jadepix_read_data/fifo_ctrl/buffer_data_record[rbof][6]} {jadepix_read_data/fifo_ctrl/buffer_data_record[rbof][7]} {jadepix_read_data/fifo_ctrl/buffer_data_record[rbof][8]} {jadepix_read_data/fifo_ctrl/buffer_data_record[rbof][9]} {jadepix_read_data/fifo_ctrl/buffer_data_record[rbof][10]} {jadepix_read_data/fifo_ctrl/buffer_data_record[rbof][11]} {jadepix_read_data/fifo_ctrl/buffer_data_record[rbof][12]} {jadepix_read_data/fifo_ctrl/buffer_data_record[rbof][13]} {jadepix_read_data/fifo_ctrl/buffer_data_record[rbof][14]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe29]
set_property port_width 9 [get_debug_ports u_ila_0/probe29]
connect_debug_port u_ila_0/probe29 [get_nets [list {jadepix_read_data/fifo_ctrl/buffer_data_record[row][0]} {jadepix_read_data/fifo_ctrl/buffer_data_record[row][1]} {jadepix_read_data/fifo_ctrl/buffer_data_record[row][2]} {jadepix_read_data/fifo_ctrl/buffer_data_record[row][3]} {jadepix_read_data/fifo_ctrl/buffer_data_record[row][4]} {jadepix_read_data/fifo_ctrl/buffer_data_record[row][5]} {jadepix_read_data/fifo_ctrl/buffer_data_record[row][6]} {jadepix_read_data/fifo_ctrl/buffer_data_record[row][7]} {jadepix_read_data/fifo_ctrl/buffer_data_record[row][8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe30]
set_property port_width 2 [get_debug_ports u_ila_0/probe30]
connect_debug_port u_ila_0/probe30 [get_nets [list {jadepix_read_data/fifo_ctrl/blk_select[0]} {jadepix_read_data/fifo_ctrl/blk_select[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe31]
set_property port_width 86 [get_debug_ports u_ila_0/probe31]
connect_debug_port u_ila_0/probe31 [get_nets [list {jadepix_read_data/fifo_ctrl/buffer_data_flat[0]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[1]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[2]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[3]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[4]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[5]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[6]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[7]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[8]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[9]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[10]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[11]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[12]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[13]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[14]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[15]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[16]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[17]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[18]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[19]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[20]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[21]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[22]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[23]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[24]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[25]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[26]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[27]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[28]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[29]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[30]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[31]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[32]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[33]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[34]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[35]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[36]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[37]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[38]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[39]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[40]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[41]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[42]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[43]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[44]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[45]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[46]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[47]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[48]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[49]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[50]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[51]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[52]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[53]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[54]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[55]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[56]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[57]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[58]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[59]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[60]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[61]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[62]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[63]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[64]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[65]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[66]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[67]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[68]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[69]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[70]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[71]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[72]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[73]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[74]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[75]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[76]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[77]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[78]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[79]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[80]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[81]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[82]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[83]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[84]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[85]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe32]
set_property port_width 22 [get_debug_ports u_ila_0/probe32]
connect_debug_port u_ila_0/probe32 [get_nets [list {jadepix_read_data/fifo_ctrl/buffer_data_record[frame_num][0]} {jadepix_read_data/fifo_ctrl/buffer_data_record[frame_num][1]} {jadepix_read_data/fifo_ctrl/buffer_data_record[frame_num][2]} {jadepix_read_data/fifo_ctrl/buffer_data_record[frame_num][3]} {jadepix_read_data/fifo_ctrl/buffer_data_record[frame_num][4]} {jadepix_read_data/fifo_ctrl/buffer_data_record[frame_num][5]} {jadepix_read_data/fifo_ctrl/buffer_data_record[frame_num][6]} {jadepix_read_data/fifo_ctrl/buffer_data_record[frame_num][7]} {jadepix_read_data/fifo_ctrl/buffer_data_record[frame_num][8]} {jadepix_read_data/fifo_ctrl/buffer_data_record[frame_num][9]} {jadepix_read_data/fifo_ctrl/buffer_data_record[frame_num][10]} {jadepix_read_data/fifo_ctrl/buffer_data_record[frame_num][11]} {jadepix_read_data/fifo_ctrl/buffer_data_record[frame_num][12]} {jadepix_read_data/fifo_ctrl/buffer_data_record[frame_num][13]} {jadepix_read_data/fifo_ctrl/buffer_data_record[frame_num][14]} {jadepix_read_data/fifo_ctrl/buffer_data_record[frame_num][15]} {jadepix_read_data/fifo_ctrl/buffer_data_record[frame_num][16]} {jadepix_read_data/fifo_ctrl/buffer_data_record[frame_num][17]} {jadepix_read_data/fifo_ctrl/buffer_data_record[frame_num][18]} {jadepix_read_data/fifo_ctrl/buffer_data_record[frame_num][19]} {jadepix_read_data/fifo_ctrl/buffer_data_record[frame_num][20]} {jadepix_read_data/fifo_ctrl/buffer_data_record[frame_num][21]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe33]
set_property port_width 5 [get_debug_ports u_ila_0/probe33]
connect_debug_port u_ila_0/probe33 [get_nets [list {jadepix_read_data/fabric_sector/fifo_oc[0]} {jadepix_read_data/fabric_sector/fifo_oc[1]} {jadepix_read_data/fabric_sector/fifo_oc[2]} {jadepix_read_data/fabric_sector/fifo_oc[3]} {jadepix_read_data/fabric_sector/fifo_oc[4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe34]
set_property port_width 2 [get_debug_ports u_ila_0/probe34]
connect_debug_port u_ila_0/probe34 [get_nets [list {jadepix_read_data/fabric_sector/blk_select[0]} {jadepix_read_data/fabric_sector/blk_select[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe35]
set_property port_width 2 [get_debug_ports u_ila_0/probe35]
connect_debug_port u_ila_0/probe35 [get_nets [list {jadepix_read_data/fabric_sector/blk_select_delay[0]} {jadepix_read_data/fabric_sector/blk_select_delay[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe36]
set_property port_width 5 [get_debug_ports u_ila_0/probe36]
connect_debug_port u_ila_0/probe36 [get_nets [list {jadepix_ctrl_wrapper/jadepix_ctrl/state_reg[0]} {jadepix_ctrl_wrapper/jadepix_ctrl/state_reg[1]} {jadepix_ctrl_wrapper/jadepix_ctrl/state_reg[2]} {jadepix_ctrl_wrapper/jadepix_ctrl/state_reg[3]} {jadepix_ctrl_wrapper/jadepix_ctrl/state_reg[4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe37]
set_property port_width 5 [get_debug_ports u_ila_0/probe37]
connect_debug_port u_ila_0/probe37 [get_nets [list {jadepix_ctrl_wrapper/jadepix_ctrl/state_next[0]} {jadepix_ctrl_wrapper/jadepix_ctrl/state_next[1]} {jadepix_ctrl_wrapper/jadepix_ctrl/state_next[2]} {jadepix_ctrl_wrapper/jadepix_ctrl/state_next[3]} {jadepix_ctrl_wrapper/jadepix_ctrl/state_next[4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe38]
set_property port_width 3 [get_debug_ports u_ila_0/probe38]
connect_debug_port u_ila_0/probe38 [get_nets [list {jadepix_ctrl_wrapper/jadepix_ctrl/rs_hitmap_cnt[0]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_hitmap_cnt[1]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_hitmap_cnt[2]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe39]
set_property port_width 22 [get_debug_ports u_ila_0/probe39]
connect_debug_port u_ila_0/probe39 [get_nets [list {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_num_set[0]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_num_set[1]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_num_set[2]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_num_set[3]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_num_set[4]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_num_set[5]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_num_set[6]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_num_set[7]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_num_set[8]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_num_set[9]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_num_set[10]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_num_set[11]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_num_set[12]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_num_set[13]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_num_set[14]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_num_set[15]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_num_set[16]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_num_set[17]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_num_set[18]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_num_set[19]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_num_set[20]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_num_set[21]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe40]
set_property port_width 22 [get_debug_ports u_ila_0/probe40]
connect_debug_port u_ila_0/probe40 [get_nets [list {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_cnt[0]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_cnt[1]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_cnt[2]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_cnt[3]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_cnt[4]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_cnt[5]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_cnt[6]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_cnt[7]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_cnt[8]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_cnt[9]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_cnt[10]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_cnt[11]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_cnt[12]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_cnt[13]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_cnt[14]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_cnt[15]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_cnt[16]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_cnt[17]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_cnt[18]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_cnt[19]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_cnt[20]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_cnt[21]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe41]
set_property port_width 5 [get_debug_ports u_ila_0/probe41]
connect_debug_port u_ila_0/probe41 [get_nets [list {jadepix_ctrl_wrapper/jadepix_ctrl/rs_cnt[0]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_cnt[1]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_cnt[2]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_cnt[3]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_cnt[4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe42]
set_property port_width 17 [get_debug_ports u_ila_0/probe42]
connect_debug_port u_ila_0/probe42 [get_nets [list {jadepix_ctrl_wrapper/jadepix_ctrl/pix_cnt[0]} {jadepix_ctrl_wrapper/jadepix_ctrl/pix_cnt[1]} {jadepix_ctrl_wrapper/jadepix_ctrl/pix_cnt[2]} {jadepix_ctrl_wrapper/jadepix_ctrl/pix_cnt[3]} {jadepix_ctrl_wrapper/jadepix_ctrl/pix_cnt[4]} {jadepix_ctrl_wrapper/jadepix_ctrl/pix_cnt[5]} {jadepix_ctrl_wrapper/jadepix_ctrl/pix_cnt[6]} {jadepix_ctrl_wrapper/jadepix_ctrl/pix_cnt[7]} {jadepix_ctrl_wrapper/jadepix_ctrl/pix_cnt[8]} {jadepix_ctrl_wrapper/jadepix_ctrl/pix_cnt[9]} {jadepix_ctrl_wrapper/jadepix_ctrl/pix_cnt[10]} {jadepix_ctrl_wrapper/jadepix_ctrl/pix_cnt[11]} {jadepix_ctrl_wrapper/jadepix_ctrl/pix_cnt[12]} {jadepix_ctrl_wrapper/jadepix_ctrl/pix_cnt[13]} {jadepix_ctrl_wrapper/jadepix_ctrl/pix_cnt[14]} {jadepix_ctrl_wrapper/jadepix_ctrl/pix_cnt[15]} {jadepix_ctrl_wrapper/jadepix_ctrl/pix_cnt[16]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe43]
set_property port_width 4 [get_debug_ports u_ila_0/probe43]
connect_debug_port u_ila_0/probe43 [get_nets [list {jadepix_ctrl_wrapper/jadepix_ctrl/hitmap_num[0]} {jadepix_ctrl_wrapper/jadepix_ctrl/hitmap_num[1]} {jadepix_ctrl_wrapper/jadepix_ctrl/hitmap_num[2]} {jadepix_ctrl_wrapper/jadepix_ctrl/hitmap_num[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe44]
set_property port_width 4 [get_debug_ports u_ila_0/probe44]
connect_debug_port u_ila_0/probe44 [get_nets [list {jadepix_ctrl_wrapper/jadepix_ctrl/hitmap_cnt[0]} {jadepix_ctrl_wrapper/jadepix_ctrl/hitmap_cnt[1]} {jadepix_ctrl_wrapper/jadepix_ctrl/hitmap_cnt[2]} {jadepix_ctrl_wrapper/jadepix_ctrl/hitmap_cnt[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe45]
set_property port_width 3 [get_debug_ports u_ila_0/probe45]
connect_debug_port u_ila_0/probe45 [get_nets [list {jadepix_ctrl_wrapper/jadepix_ctrl/cfg_sync[din][0]} {jadepix_ctrl_wrapper/jadepix_ctrl/cfg_sync[din][1]} {jadepix_ctrl_wrapper/jadepix_ctrl/cfg_sync[din][2]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe46]
set_property port_width 17 [get_debug_ports u_ila_0/probe46]
connect_debug_port u_ila_0/probe46 [get_nets [list {jadepix_ctrl_wrapper/jadepix_ctrl/cfg_fifo_count[0]} {jadepix_ctrl_wrapper/jadepix_ctrl/cfg_fifo_count[1]} {jadepix_ctrl_wrapper/jadepix_ctrl/cfg_fifo_count[2]} {jadepix_ctrl_wrapper/jadepix_ctrl/cfg_fifo_count[3]} {jadepix_ctrl_wrapper/jadepix_ctrl/cfg_fifo_count[4]} {jadepix_ctrl_wrapper/jadepix_ctrl/cfg_fifo_count[5]} {jadepix_ctrl_wrapper/jadepix_ctrl/cfg_fifo_count[6]} {jadepix_ctrl_wrapper/jadepix_ctrl/cfg_fifo_count[7]} {jadepix_ctrl_wrapper/jadepix_ctrl/cfg_fifo_count[8]} {jadepix_ctrl_wrapper/jadepix_ctrl/cfg_fifo_count[9]} {jadepix_ctrl_wrapper/jadepix_ctrl/cfg_fifo_count[10]} {jadepix_ctrl_wrapper/jadepix_ctrl/cfg_fifo_count[11]} {jadepix_ctrl_wrapper/jadepix_ctrl/cfg_fifo_count[12]} {jadepix_ctrl_wrapper/jadepix_ctrl/cfg_fifo_count[13]} {jadepix_ctrl_wrapper/jadepix_ctrl/cfg_fifo_count[14]} {jadepix_ctrl_wrapper/jadepix_ctrl/cfg_fifo_count[15]} {jadepix_ctrl_wrapper/jadepix_ctrl/cfg_fifo_count[16]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe47]
set_property port_width 3 [get_debug_ports u_ila_0/probe47]
connect_debug_port u_ila_0/probe47 [get_nets [list {jadepix_ctrl_wrapper/jadepix_ctrl/cfg_dout[0]} {jadepix_ctrl_wrapper/jadepix_ctrl/cfg_dout[1]} {jadepix_ctrl_wrapper/jadepix_ctrl/cfg_dout[2]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe48]
set_property port_width 5 [get_debug_ports u_ila_0/probe48]
connect_debug_port u_ila_0/probe48 [get_nets [list {jadepix_ctrl_wrapper/jadepix_ctrl/cfg_cnt[0]} {jadepix_ctrl_wrapper/jadepix_ctrl/cfg_cnt[1]} {jadepix_ctrl_wrapper/jadepix_ctrl/cfg_cnt[2]} {jadepix_ctrl_wrapper/jadepix_ctrl/cfg_cnt[3]} {jadepix_ctrl_wrapper/jadepix_ctrl/cfg_cnt[4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe49]
set_property port_width 9 [get_debug_ports u_ila_0/probe49]
connect_debug_port u_ila_0/probe49 [get_nets [list {jadepix_ctrl_wrapper/jadepix_ctrl/RA[0]} {jadepix_ctrl_wrapper/jadepix_ctrl/RA[1]} {jadepix_ctrl_wrapper/jadepix_ctrl/RA[2]} {jadepix_ctrl_wrapper/jadepix_ctrl/RA[3]} {jadepix_ctrl_wrapper/jadepix_ctrl/RA[4]} {jadepix_ctrl_wrapper/jadepix_ctrl/RA[5]} {jadepix_ctrl_wrapper/jadepix_ctrl/RA[6]} {jadepix_ctrl_wrapper/jadepix_ctrl/RA[7]} {jadepix_ctrl_wrapper/jadepix_ctrl/RA[8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe50]
set_property port_width 9 [get_debug_ports u_ila_0/probe50]
connect_debug_port u_ila_0/probe50 [get_nets [list {jadepix_ctrl_wrapper/jadepix_ctrl/CA[0]} {jadepix_ctrl_wrapper/jadepix_ctrl/CA[1]} {jadepix_ctrl_wrapper/jadepix_ctrl/CA[2]} {jadepix_ctrl_wrapper/jadepix_ctrl/CA[3]} {jadepix_ctrl_wrapper/jadepix_ctrl/CA[4]} {jadepix_ctrl_wrapper/jadepix_ctrl/CA[5]} {jadepix_ctrl_wrapper/jadepix_ctrl/CA[6]} {jadepix_ctrl_wrapper/jadepix_ctrl/CA[7]} {jadepix_ctrl_wrapper/jadepix_ctrl/CA[8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe51]
set_property port_width 9 [get_debug_ports u_ila_0/probe51]
connect_debug_port u_ila_0/probe51 [get_nets [list {jadepix_read_data/row[0]} {jadepix_read_data/row[1]} {jadepix_read_data/row[2]} {jadepix_read_data/row[3]} {jadepix_read_data/row[4]} {jadepix_read_data/row[5]} {jadepix_read_data/row[6]} {jadepix_read_data/row[7]} {jadepix_read_data/row[8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe52]
set_property port_width 22 [get_debug_ports u_ila_0/probe52]
connect_debug_port u_ila_0/probe52 [get_nets [list {jadepix_read_data/frame_num[0]} {jadepix_read_data/frame_num[1]} {jadepix_read_data/frame_num[2]} {jadepix_read_data/frame_num[3]} {jadepix_read_data/frame_num[4]} {jadepix_read_data/frame_num[5]} {jadepix_read_data/frame_num[6]} {jadepix_read_data/frame_num[7]} {jadepix_read_data/frame_num[8]} {jadepix_read_data/frame_num[9]} {jadepix_read_data/frame_num[10]} {jadepix_read_data/frame_num[11]} {jadepix_read_data/frame_num[12]} {jadepix_read_data/frame_num[13]} {jadepix_read_data/frame_num[14]} {jadepix_read_data/frame_num[15]} {jadepix_read_data/frame_num[16]} {jadepix_read_data/frame_num[17]} {jadepix_read_data/frame_num[18]} {jadepix_read_data/frame_num[19]} {jadepix_read_data/frame_num[20]} {jadepix_read_data/frame_num[21]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe53]
set_property port_width 32 [get_debug_ports u_ila_0/probe53]
connect_debug_port u_ila_0/probe53 [get_nets [list {jadepix_read_data/data_fifo_wr_din[0]} {jadepix_read_data/data_fifo_wr_din[1]} {jadepix_read_data/data_fifo_wr_din[2]} {jadepix_read_data/data_fifo_wr_din[3]} {jadepix_read_data/data_fifo_wr_din[4]} {jadepix_read_data/data_fifo_wr_din[5]} {jadepix_read_data/data_fifo_wr_din[6]} {jadepix_read_data/data_fifo_wr_din[7]} {jadepix_read_data/data_fifo_wr_din[8]} {jadepix_read_data/data_fifo_wr_din[9]} {jadepix_read_data/data_fifo_wr_din[10]} {jadepix_read_data/data_fifo_wr_din[11]} {jadepix_read_data/data_fifo_wr_din[12]} {jadepix_read_data/data_fifo_wr_din[13]} {jadepix_read_data/data_fifo_wr_din[14]} {jadepix_read_data/data_fifo_wr_din[15]} {jadepix_read_data/data_fifo_wr_din[16]} {jadepix_read_data/data_fifo_wr_din[17]} {jadepix_read_data/data_fifo_wr_din[18]} {jadepix_read_data/data_fifo_wr_din[19]} {jadepix_read_data/data_fifo_wr_din[20]} {jadepix_read_data/data_fifo_wr_din[21]} {jadepix_read_data/data_fifo_wr_din[22]} {jadepix_read_data/data_fifo_wr_din[23]} {jadepix_read_data/data_fifo_wr_din[24]} {jadepix_read_data/data_fifo_wr_din[25]} {jadepix_read_data/data_fifo_wr_din[26]} {jadepix_read_data/data_fifo_wr_din[27]} {jadepix_read_data/data_fifo_wr_din[28]} {jadepix_read_data/data_fifo_wr_din[29]} {jadepix_read_data/data_fifo_wr_din[30]} {jadepix_read_data/data_fifo_wr_din[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe54]
set_property port_width 32 [get_debug_ports u_ila_0/probe54]
connect_debug_port u_ila_0/probe54 [get_nets [list {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/rfifo_wr_din[0]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/rfifo_wr_din[1]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/rfifo_wr_din[2]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/rfifo_wr_din[3]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/rfifo_wr_din[4]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/rfifo_wr_din[5]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/rfifo_wr_din[6]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/rfifo_wr_din[7]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/rfifo_wr_din[8]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/rfifo_wr_din[9]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/rfifo_wr_din[10]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/rfifo_wr_din[11]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/rfifo_wr_din[12]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/rfifo_wr_din[13]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/rfifo_wr_din[14]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/rfifo_wr_din[15]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/rfifo_wr_din[16]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/rfifo_wr_din[17]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/rfifo_wr_din[18]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/rfifo_wr_din[19]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/rfifo_wr_din[20]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/rfifo_wr_din[21]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/rfifo_wr_din[22]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/rfifo_wr_din[23]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/rfifo_wr_din[24]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/rfifo_wr_din[25]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/rfifo_wr_din[26]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/rfifo_wr_din[27]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/rfifo_wr_din[28]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/rfifo_wr_din[29]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/rfifo_wr_din[30]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/rfifo_wr_din[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe55]
set_property port_width 1 [get_debug_ports u_ila_0/probe55]
connect_debug_port u_ila_0/probe55 [get_nets [list jadepix_ctrl_wrapper/jadepix_ctrl/aplse_gs]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe56]
set_property port_width 1 [get_debug_ports u_ila_0/probe56]
connect_debug_port u_ila_0/probe56 [get_nets [list jadepix_read_data/fifo_ctrl/buffer_data_valid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe57]
set_property port_width 1 [get_debug_ports u_ila_0/probe57]
connect_debug_port u_ila_0/probe57 [get_nets [list jadepix_read_data/fifo_status_buffer/buffer_data_valid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe58]
set_property port_width 1 [get_debug_ports u_ila_0/probe58]
connect_debug_port u_ila_0/probe58 [get_nets [list jadepix_read_data/fifo_ctrl/buffer_empty]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe59]
set_property port_width 1 [get_debug_ports u_ila_0/probe59]
connect_debug_port u_ila_0/probe59 [get_nets [list jadepix_read_data/fifo_status_buffer/buffer_empty]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe60]
set_property port_width 1 [get_debug_ports u_ila_0/probe60]
connect_debug_port u_ila_0/probe60 [get_nets [list jadepix_read_data/fifo_ctrl/buffer_full]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe61]
set_property port_width 1 [get_debug_ports u_ila_0/probe61]
connect_debug_port u_ila_0/probe61 [get_nets [list jadepix_read_data/fifo_status_buffer/buffer_full]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe62]
set_property port_width 1 [get_debug_ports u_ila_0/probe62]
connect_debug_port u_ila_0/probe62 [get_nets [list jadepix_read_data/fifo_status_buffer/buffer_read_en]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe63]
set_property port_width 1 [get_debug_ports u_ila_0/probe63]
connect_debug_port u_ila_0/probe63 [get_nets [list jadepix_read_data/fifo_ctrl/buffer_read_en]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe64]
set_property port_width 1 [get_debug_ports u_ila_0/probe64]
connect_debug_port u_ila_0/probe64 [get_nets [list jadepix_read_data/fifo_status_buffer/buffer_w_en]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe65]
set_property port_width 1 [get_debug_ports u_ila_0/probe65]
connect_debug_port u_ila_0/probe65 [get_nets [list jadepix_ctrl_wrapper/jadepix_ctrl/CA_EN]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe66]
set_property port_width 1 [get_debug_ports u_ila_0/probe66]
connect_debug_port u_ila_0/probe66 [get_nets [list jadepix_ctrl_wrapper/jadepix_ctrl/cfg_busy]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe67]
set_property port_width 1 [get_debug_ports u_ila_0/probe67]
connect_debug_port u_ila_0/probe67 [get_nets [list jadepix_ctrl_wrapper/jadepix_ctrl/cfg_dout_valid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe68]
set_property port_width 1 [get_debug_ports u_ila_0/probe68]
connect_debug_port u_ila_0/probe68 [get_nets [list jadepix_ctrl_wrapper/jadepix_ctrl/cfg_fifo_empty]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe69]
set_property port_width 1 [get_debug_ports u_ila_0/probe69]
connect_debug_port u_ila_0/probe69 [get_nets [list jadepix_ctrl_wrapper/jadepix_ctrl/cfg_fifo_pfull]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe70]
set_property port_width 1 [get_debug_ports u_ila_0/probe70]
connect_debug_port u_ila_0/probe70 [get_nets [list jadepix_ctrl_wrapper/jadepix_ctrl/cfg_rd_en]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe71]
set_property port_width 1 [get_debug_ports u_ila_0/probe71]
connect_debug_port u_ila_0/probe71 [get_nets [list jadepix_ctrl_wrapper/jadepix_ctrl/cfg_start]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe72]
set_property port_width 1 [get_debug_ports u_ila_0/probe72]
connect_debug_port u_ila_0/probe72 [get_nets [list {jadepix_ctrl_wrapper/jadepix_ctrl/cfg_sync[wr_en]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe73]
set_property port_width 1 [get_debug_ports u_ila_0/probe73]
connect_debug_port u_ila_0/probe73 [get_nets [list jadepix_read_data/clk_cache]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe74]
set_property port_width 1 [get_debug_ports u_ila_0/probe74]
connect_debug_port u_ila_0/probe74 [get_nets [list jadepix_read_data/clk_cache_delay]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe75]
set_property port_width 1 [get_debug_ports u_ila_0/probe75]
connect_debug_port u_ila_0/probe75 [get_nets [list jadepix_ctrl_wrapper/jadepix_ctrl/CON_DATA]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe76]
set_property port_width 1 [get_debug_ports u_ila_0/probe76]
connect_debug_port u_ila_0/probe76 [get_nets [list jadepix_ctrl_wrapper/jadepix_ctrl/CON_SELM]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe77]
set_property port_width 1 [get_debug_ports u_ila_0/probe77]
connect_debug_port u_ila_0/probe77 [get_nets [list jadepix_ctrl_wrapper/jadepix_ctrl/CON_SELP]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe78]
set_property port_width 1 [get_debug_ports u_ila_0/probe78]
connect_debug_port u_ila_0/probe78 [get_nets [list jadepix_read_data/data_fifo_full]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe79]
set_property port_width 1 [get_debug_ports u_ila_0/probe79]
connect_debug_port u_ila_0/probe79 [get_nets [list jadepix_read_data/fifo_data/data_fifo_full]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe80]
set_property port_width 1 [get_debug_ports u_ila_0/probe80]
connect_debug_port u_ila_0/probe80 [get_nets [list jadepix_read_data/data_fifo_rst]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe81]
set_property port_width 1 [get_debug_ports u_ila_0/probe81]
connect_debug_port u_ila_0/probe81 [get_nets [list jadepix_read_data/fifo_data/data_fifo_rst]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe82]
set_property port_width 1 [get_debug_ports u_ila_0/probe82]
connect_debug_port u_ila_0/probe82 [get_nets [list jadepix_read_data/fifo_data/data_fifo_wr_en]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe83]
set_property port_width 1 [get_debug_ports u_ila_0/probe83]
connect_debug_port u_ila_0/probe83 [get_nets [list jadepix_read_data/data_fifo_wr_en]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe84]
set_property port_width 1 [get_debug_ports u_ila_0/probe84]
connect_debug_port u_ila_0/probe84 [get_nets [list jadepix_ctrl_wrapper/jadepix_ctrl/dplse_gs]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe85]
set_property port_width 1 [get_debug_ports u_ila_0/probe85]
connect_debug_port u_ila_0/probe85 [get_nets [list jadepix_read_data/fifo_data/fifo_data_valid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe86]
set_property port_width 1 [get_debug_ports u_ila_0/probe86]
connect_debug_port u_ila_0/probe86 [get_nets [list jadepix_read_data/fabric_sector/fifo_data_valid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe87]
set_property port_width 1 [get_debug_ports u_ila_0/probe87]
connect_debug_port u_ila_0/probe87 [get_nets [list jadepix_read_data/fabric_sector/fifo_read_en]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe88]
set_property port_width 1 [get_debug_ports u_ila_0/probe88]
connect_debug_port u_ila_0/probe88 [get_nets [list jadepix_ctrl_wrapper/jadepix_ctrl/fifo_rst]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe89]
set_property port_width 1 [get_debug_ports u_ila_0/probe89]
connect_debug_port u_ila_0/probe89 [get_nets [list jadepix_ctrl_wrapper/jadepix_ctrl/HIT_RST]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe90]
set_property port_width 1 [get_debug_ports u_ila_0/probe90]
connect_debug_port u_ila_0/probe90 [get_nets [list jadepix_read_data/is_busy_cache]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe91]
set_property port_width 1 [get_debug_ports u_ila_0/probe91]
connect_debug_port u_ila_0/probe91 [get_nets [list jadepix_ctrl_wrapper/jadepix_ctrl/pulse_out]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe92]
set_property port_width 1 [get_debug_ports u_ila_0/probe92]
connect_debug_port u_ila_0/probe92 [get_nets [list jadepix_ctrl_wrapper/jadepix_ctrl/RA_EN]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe93]
set_property port_width 1 [get_debug_ports u_ila_0/probe93]
connect_debug_port u_ila_0/probe93 [get_nets [list jadepix_ctrl_wrapper/jadepix_ctrl/RD_EN]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe94]
set_property port_width 1 [get_debug_ports u_ila_0/probe94]
connect_debug_port u_ila_0/probe94 [get_nets [list jadepix_read_data/fifo_data/read_frame_start]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe95]
set_property port_width 1 [get_debug_ports u_ila_0/probe95]
connect_debug_port u_ila_0/probe95 [get_nets [list jadepix_read_data/fifo_data/read_frame_stop]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe96]
set_property port_width 1 [get_debug_ports u_ila_0/probe96]
connect_debug_port u_ila_0/probe96 [get_nets [list {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/rfifo_wr_en}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe97]
set_property port_width 1 [get_debug_ports u_ila_0/probe97]
connect_debug_port u_ila_0/probe97 [get_nets [list jadepix_ctrl_wrapper/jadepix_ctrl/rs_busy]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe98]
set_property port_width 1 [get_debug_ports u_ila_0/probe98]
connect_debug_port u_ila_0/probe98 [get_nets [list jadepix_ctrl_wrapper/jadepix_ctrl/rs_start]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe99]
set_property port_width 1 [get_debug_ports u_ila_0/probe99]
connect_debug_port u_ila_0/probe99 [get_nets [list jadepix_read_data/start_cache]]
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
connect_debug_port u_ila_1/clk [get_nets [list ipbus_infra/clocks/mmcm_1]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe0]
set_property port_width 32 [get_debug_ports u_ila_1/probe0]
connect_debug_port u_ila_1/probe0 [get_nets [list {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_port[0]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_port[1]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_port[2]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_port[3]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_port[4]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_port[5]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_port[6]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_port[7]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_port[8]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_port[9]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_port[10]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_port[11]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_port[12]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_port[13]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_port[14]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_port[15]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_port[16]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_port[17]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_port[18]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_port[19]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_port[20]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_port[21]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_port[22]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_port[23]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_port[24]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_port[25]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_port[26]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_port[27]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_port[28]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_port[29]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_port[30]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_port[31]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe1]
set_property port_width 17 [get_debug_ports u_ila_1/probe1]
connect_debug_port u_ila_1/probe1 [get_nets [list {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_count[0]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_count[1]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_count[2]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_count[3]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_count[4]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_count[5]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_count[6]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_count[7]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_count[8]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_count[9]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_count[10]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_count[11]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_count[12]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_count[13]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_count[14]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_count[15]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_count[16]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe2]
set_property port_width 18 [get_debug_ports u_ila_1/probe2]
connect_debug_port u_ila_1/probe2 [get_nets [list {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/rd_data_count[0]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/rd_data_count[1]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/rd_data_count[2]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/rd_data_count[3]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/rd_data_count[4]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/rd_data_count[5]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/rd_data_count[6]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/rd_data_count[7]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/rd_data_count[8]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/rd_data_count[9]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/rd_data_count[10]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/rd_data_count[11]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/rd_data_count[12]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/rd_data_count[13]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/rd_data_count[14]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/rd_data_count[15]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/rd_data_count[16]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/rd_data_count[17]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe3]
set_property port_width 1 [get_debug_ports u_ila_1/probe3]
connect_debug_port u_ila_1/probe3 [get_nets [list {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/empty}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe4]
set_property port_width 1 [get_debug_ports u_ila_1/probe4]
connect_debug_port u_ila_1/probe4 [get_nets [list {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/ipb_rd_ack}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe5]
set_property port_width 1 [get_debug_ports u_ila_1/probe5]
connect_debug_port u_ila_1/probe5 [get_nets [list {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/rd_addr_match}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe6]
set_property port_width 1 [get_debug_ports u_ila_1/probe6]
connect_debug_port u_ila_1/probe6 [get_nets [list {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/rd_en}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe7]
set_property port_width 1 [get_debug_ports u_ila_1/probe7]
connect_debug_port u_ila_1/probe7 [get_nets [list {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe8]
set_property port_width 1 [get_debug_ports u_ila_1/probe8]
connect_debug_port u_ila_1/probe8 [get_nets [list {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_en}]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk_ipb]
