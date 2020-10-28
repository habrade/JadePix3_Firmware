
connect_debug_port u_ila_0/clk [get_nets [list jadepix_clocks/clk_sys]]

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
connect_debug_port u_ila_0/probe0 [get_nets [list {jadepix_read_data/fifo_status_buffer/state_next[0]} {jadepix_read_data/fifo_status_buffer/state_next[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 9 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {jadepix_read_data/fifo_status_buffer/row[0]} {jadepix_read_data/fifo_status_buffer/row[1]} {jadepix_read_data/fifo_status_buffer/row[2]} {jadepix_read_data/fifo_status_buffer/row[3]} {jadepix_read_data/fifo_status_buffer/row[4]} {jadepix_read_data/fifo_status_buffer/row[5]} {jadepix_read_data/fifo_status_buffer/row[6]} {jadepix_read_data/fifo_status_buffer/row[7]} {jadepix_read_data/fifo_status_buffer/row[8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 5 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {jadepix_read_data/fifo_status_buffer/sector_counters_v[0][valid_counter][0]} {jadepix_read_data/fifo_status_buffer/sector_counters_v[0][valid_counter][1]} {jadepix_read_data/fifo_status_buffer/sector_counters_v[0][valid_counter][2]} {jadepix_read_data/fifo_status_buffer/sector_counters_v[0][valid_counter][3]} {jadepix_read_data/fifo_status_buffer/sector_counters_v[0][valid_counter][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 86 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {jadepix_read_data/fifo_status_buffer/buffer_data_flat[0]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[1]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[2]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[3]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[4]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[5]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[6]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[7]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[8]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[9]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[10]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[11]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[12]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[13]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[14]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[15]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[16]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[17]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[18]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[19]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[20]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[21]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[22]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[23]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[24]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[25]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[26]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[27]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[28]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[29]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[30]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[31]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[32]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[33]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[34]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[35]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[36]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[37]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[38]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[39]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[40]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[41]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[42]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[43]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[44]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[45]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[46]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[47]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[48]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[49]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[50]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[51]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[52]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[53]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[54]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[55]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[56]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[57]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[58]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[59]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[60]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[61]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[62]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[63]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[64]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[65]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[66]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[67]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[68]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[69]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[70]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[71]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[72]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[73]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[74]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[75]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[76]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[77]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[78]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[79]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[80]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[81]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[82]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[83]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[84]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[85]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 9 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {jadepix_read_data/row[0]} {jadepix_read_data/row[1]} {jadepix_read_data/row[2]} {jadepix_read_data/row[3]} {jadepix_read_data/row[4]} {jadepix_read_data/row[5]} {jadepix_read_data/row[6]} {jadepix_read_data/row[7]} {jadepix_read_data/row[8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 2 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[0].fifo_monitor_index/fifo_status[0]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[0].fifo_monitor_index/fifo_status[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 5 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {jadepix_read_data/fifo_status_buffer/sector_counters_v[0][overflow_counter][0]} {jadepix_read_data/fifo_status_buffer/sector_counters_v[0][overflow_counter][1]} {jadepix_read_data/fifo_status_buffer/sector_counters_v[0][overflow_counter][2]} {jadepix_read_data/fifo_status_buffer/sector_counters_v[0][overflow_counter][3]} {jadepix_read_data/fifo_status_buffer/sector_counters_v[0][overflow_counter][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 5 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[0].fifo_monitor_index/fifo_counters[overflow_counter][0]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[0].fifo_monitor_index/fifo_counters[overflow_counter][1]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[0].fifo_monitor_index/fifo_counters[overflow_counter][2]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[0].fifo_monitor_index/fifo_counters[overflow_counter][3]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[0].fifo_monitor_index/fifo_counters[overflow_counter][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 22 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {jadepix_read_data/frame_num[0]} {jadepix_read_data/frame_num[1]} {jadepix_read_data/frame_num[2]} {jadepix_read_data/frame_num[3]} {jadepix_read_data/frame_num[4]} {jadepix_read_data/frame_num[5]} {jadepix_read_data/frame_num[6]} {jadepix_read_data/frame_num[7]} {jadepix_read_data/frame_num[8]} {jadepix_read_data/frame_num[9]} {jadepix_read_data/frame_num[10]} {jadepix_read_data/frame_num[11]} {jadepix_read_data/frame_num[12]} {jadepix_read_data/frame_num[13]} {jadepix_read_data/frame_num[14]} {jadepix_read_data/frame_num[15]} {jadepix_read_data/frame_num[16]} {jadepix_read_data/frame_num[17]} {jadepix_read_data/frame_num[18]} {jadepix_read_data/frame_num[19]} {jadepix_read_data/frame_num[20]} {jadepix_read_data/frame_num[21]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 5 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[0].fifo_monitor_index/fifo_counters[valid_counter][0]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[0].fifo_monitor_index/fifo_counters[valid_counter][1]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[0].fifo_monitor_index/fifo_counters[valid_counter][2]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[0].fifo_monitor_index/fifo_counters[valid_counter][3]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[0].fifo_monitor_index/fifo_counters[valid_counter][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 22 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list {jadepix_read_data/fifo_status_buffer/frame_num[0]} {jadepix_read_data/fifo_status_buffer/frame_num[1]} {jadepix_read_data/fifo_status_buffer/frame_num[2]} {jadepix_read_data/fifo_status_buffer/frame_num[3]} {jadepix_read_data/fifo_status_buffer/frame_num[4]} {jadepix_read_data/fifo_status_buffer/frame_num[5]} {jadepix_read_data/fifo_status_buffer/frame_num[6]} {jadepix_read_data/fifo_status_buffer/frame_num[7]} {jadepix_read_data/fifo_status_buffer/frame_num[8]} {jadepix_read_data/fifo_status_buffer/frame_num[9]} {jadepix_read_data/fifo_status_buffer/frame_num[10]} {jadepix_read_data/fifo_status_buffer/frame_num[11]} {jadepix_read_data/fifo_status_buffer/frame_num[12]} {jadepix_read_data/fifo_status_buffer/frame_num[13]} {jadepix_read_data/fifo_status_buffer/frame_num[14]} {jadepix_read_data/fifo_status_buffer/frame_num[15]} {jadepix_read_data/fifo_status_buffer/frame_num[16]} {jadepix_read_data/fifo_status_buffer/frame_num[17]} {jadepix_read_data/fifo_status_buffer/frame_num[18]} {jadepix_read_data/fifo_status_buffer/frame_num[19]} {jadepix_read_data/fifo_status_buffer/frame_num[20]} {jadepix_read_data/fifo_status_buffer/frame_num[21]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 8 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list {jadepix_read_data/fifo_status_buffer/buffer_fill_count[0]} {jadepix_read_data/fifo_status_buffer/buffer_fill_count[1]} {jadepix_read_data/fifo_status_buffer/buffer_fill_count[2]} {jadepix_read_data/fifo_status_buffer/buffer_fill_count[3]} {jadepix_read_data/fifo_status_buffer/buffer_fill_count[4]} {jadepix_read_data/fifo_status_buffer/buffer_fill_count[5]} {jadepix_read_data/fifo_status_buffer/buffer_fill_count[6]} {jadepix_read_data/fifo_status_buffer/buffer_fill_count[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 2 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list {jadepix_read_data/fifo_status_buffer/state_reg[0]} {jadepix_read_data/fifo_status_buffer/state_reg[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 32 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list {jadepix_read_data/data_fifo_wr_din[0]} {jadepix_read_data/data_fifo_wr_din[1]} {jadepix_read_data/data_fifo_wr_din[2]} {jadepix_read_data/data_fifo_wr_din[3]} {jadepix_read_data/data_fifo_wr_din[4]} {jadepix_read_data/data_fifo_wr_din[5]} {jadepix_read_data/data_fifo_wr_din[6]} {jadepix_read_data/data_fifo_wr_din[7]} {jadepix_read_data/data_fifo_wr_din[8]} {jadepix_read_data/data_fifo_wr_din[9]} {jadepix_read_data/data_fifo_wr_din[10]} {jadepix_read_data/data_fifo_wr_din[11]} {jadepix_read_data/data_fifo_wr_din[12]} {jadepix_read_data/data_fifo_wr_din[13]} {jadepix_read_data/data_fifo_wr_din[14]} {jadepix_read_data/data_fifo_wr_din[15]} {jadepix_read_data/data_fifo_wr_din[16]} {jadepix_read_data/data_fifo_wr_din[17]} {jadepix_read_data/data_fifo_wr_din[18]} {jadepix_read_data/data_fifo_wr_din[19]} {jadepix_read_data/data_fifo_wr_din[20]} {jadepix_read_data/data_fifo_wr_din[21]} {jadepix_read_data/data_fifo_wr_din[22]} {jadepix_read_data/data_fifo_wr_din[23]} {jadepix_read_data/data_fifo_wr_din[24]} {jadepix_read_data/data_fifo_wr_din[25]} {jadepix_read_data/data_fifo_wr_din[26]} {jadepix_read_data/data_fifo_wr_din[27]} {jadepix_read_data/data_fifo_wr_din[28]} {jadepix_read_data/data_fifo_wr_din[29]} {jadepix_read_data/data_fifo_wr_din[30]} {jadepix_read_data/data_fifo_wr_din[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 2 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list {jadepix_read_data/BLK_SELECT[0]} {jadepix_read_data/BLK_SELECT[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 8 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list {jadepix_read_data/DATA_IN[0]} {jadepix_read_data/DATA_IN[1]} {jadepix_read_data/DATA_IN[2]} {jadepix_read_data/DATA_IN[3]} {jadepix_read_data/DATA_IN[4]} {jadepix_read_data/DATA_IN[5]} {jadepix_read_data/DATA_IN[6]} {jadepix_read_data/DATA_IN[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
set_property port_width 5 [get_debug_ports u_ila_0/probe16]
connect_debug_port u_ila_0/probe16 [get_nets [list {jadepix_read_data/fifo_data/buffer_data_record[sectors][0][overflow_counter][0]} {jadepix_read_data/fifo_data/buffer_data_record[sectors][0][overflow_counter][1]} {jadepix_read_data/fifo_data/buffer_data_record[sectors][0][overflow_counter][2]} {jadepix_read_data/fifo_data/buffer_data_record[sectors][0][overflow_counter][3]} {jadepix_read_data/fifo_data/buffer_data_record[sectors][0][overflow_counter][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe17]
set_property port_width 5 [get_debug_ports u_ila_0/probe17]
connect_debug_port u_ila_0/probe17 [get_nets [list {jadepix_read_data/fifo_data/buffer_data_record[sectors][0][valid_counter][0]} {jadepix_read_data/fifo_data/buffer_data_record[sectors][0][valid_counter][1]} {jadepix_read_data/fifo_data/buffer_data_record[sectors][0][valid_counter][2]} {jadepix_read_data/fifo_data/buffer_data_record[sectors][0][valid_counter][3]} {jadepix_read_data/fifo_data/buffer_data_record[sectors][0][valid_counter][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe18]
set_property port_width 22 [get_debug_ports u_ila_0/probe18]
connect_debug_port u_ila_0/probe18 [get_nets [list {jadepix_read_data/fifo_data/buffer_data_record[frame_num][0]} {jadepix_read_data/fifo_data/buffer_data_record[frame_num][1]} {jadepix_read_data/fifo_data/buffer_data_record[frame_num][2]} {jadepix_read_data/fifo_data/buffer_data_record[frame_num][3]} {jadepix_read_data/fifo_data/buffer_data_record[frame_num][4]} {jadepix_read_data/fifo_data/buffer_data_record[frame_num][5]} {jadepix_read_data/fifo_data/buffer_data_record[frame_num][6]} {jadepix_read_data/fifo_data/buffer_data_record[frame_num][7]} {jadepix_read_data/fifo_data/buffer_data_record[frame_num][8]} {jadepix_read_data/fifo_data/buffer_data_record[frame_num][9]} {jadepix_read_data/fifo_data/buffer_data_record[frame_num][10]} {jadepix_read_data/fifo_data/buffer_data_record[frame_num][11]} {jadepix_read_data/fifo_data/buffer_data_record[frame_num][12]} {jadepix_read_data/fifo_data/buffer_data_record[frame_num][13]} {jadepix_read_data/fifo_data/buffer_data_record[frame_num][14]} {jadepix_read_data/fifo_data/buffer_data_record[frame_num][15]} {jadepix_read_data/fifo_data/buffer_data_record[frame_num][16]} {jadepix_read_data/fifo_data/buffer_data_record[frame_num][17]} {jadepix_read_data/fifo_data/buffer_data_record[frame_num][18]} {jadepix_read_data/fifo_data/buffer_data_record[frame_num][19]} {jadepix_read_data/fifo_data/buffer_data_record[frame_num][20]} {jadepix_read_data/fifo_data/buffer_data_record[frame_num][21]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe19]
set_property port_width 2 [get_debug_ports u_ila_0/probe19]
connect_debug_port u_ila_0/probe19 [get_nets [list {jadepix_read_data/fifo_data/fifo_status_v[0][0]} {jadepix_read_data/fifo_data/fifo_status_v[0][1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe20]
set_property port_width 9 [get_debug_ports u_ila_0/probe20]
connect_debug_port u_ila_0/probe20 [get_nets [list {jadepix_read_data/fifo_data/buffer_data_record[row][0]} {jadepix_read_data/fifo_data/buffer_data_record[row][1]} {jadepix_read_data/fifo_data/buffer_data_record[row][2]} {jadepix_read_data/fifo_data/buffer_data_record[row][3]} {jadepix_read_data/fifo_data/buffer_data_record[row][4]} {jadepix_read_data/fifo_data/buffer_data_record[row][5]} {jadepix_read_data/fifo_data/buffer_data_record[row][6]} {jadepix_read_data/fifo_data/buffer_data_record[row][7]} {jadepix_read_data/fifo_data/buffer_data_record[row][8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe21]
set_property port_width 15 [get_debug_ports u_ila_0/probe21]
connect_debug_port u_ila_0/probe21 [get_nets [list {jadepix_read_data/fifo_data/buffer_data_record[rbof][0]} {jadepix_read_data/fifo_data/buffer_data_record[rbof][1]} {jadepix_read_data/fifo_data/buffer_data_record[rbof][2]} {jadepix_read_data/fifo_data/buffer_data_record[rbof][3]} {jadepix_read_data/fifo_data/buffer_data_record[rbof][4]} {jadepix_read_data/fifo_data/buffer_data_record[rbof][5]} {jadepix_read_data/fifo_data/buffer_data_record[rbof][6]} {jadepix_read_data/fifo_data/buffer_data_record[rbof][7]} {jadepix_read_data/fifo_data/buffer_data_record[rbof][8]} {jadepix_read_data/fifo_data/buffer_data_record[rbof][9]} {jadepix_read_data/fifo_data/buffer_data_record[rbof][10]} {jadepix_read_data/fifo_data/buffer_data_record[rbof][11]} {jadepix_read_data/fifo_data/buffer_data_record[rbof][12]} {jadepix_read_data/fifo_data/buffer_data_record[rbof][13]} {jadepix_read_data/fifo_data/buffer_data_record[rbof][14]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe22]
set_property port_width 2 [get_debug_ports u_ila_0/probe22]
connect_debug_port u_ila_0/probe22 [get_nets [list {jadepix_read_data/fifo_data/blk_select_delay[0]} {jadepix_read_data/fifo_data/blk_select_delay[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe23]
set_property port_width 32 [get_debug_ports u_ila_0/probe23]
connect_debug_port u_ila_0/probe23 [get_nets [list {jadepix_read_data/fifo_data/data_fifo_wr_din[0]} {jadepix_read_data/fifo_data/data_fifo_wr_din[1]} {jadepix_read_data/fifo_data/data_fifo_wr_din[2]} {jadepix_read_data/fifo_data/data_fifo_wr_din[3]} {jadepix_read_data/fifo_data/data_fifo_wr_din[4]} {jadepix_read_data/fifo_data/data_fifo_wr_din[5]} {jadepix_read_data/fifo_data/data_fifo_wr_din[6]} {jadepix_read_data/fifo_data/data_fifo_wr_din[7]} {jadepix_read_data/fifo_data/data_fifo_wr_din[8]} {jadepix_read_data/fifo_data/data_fifo_wr_din[9]} {jadepix_read_data/fifo_data/data_fifo_wr_din[10]} {jadepix_read_data/fifo_data/data_fifo_wr_din[11]} {jadepix_read_data/fifo_data/data_fifo_wr_din[12]} {jadepix_read_data/fifo_data/data_fifo_wr_din[13]} {jadepix_read_data/fifo_data/data_fifo_wr_din[14]} {jadepix_read_data/fifo_data/data_fifo_wr_din[15]} {jadepix_read_data/fifo_data/data_fifo_wr_din[16]} {jadepix_read_data/fifo_data/data_fifo_wr_din[17]} {jadepix_read_data/fifo_data/data_fifo_wr_din[18]} {jadepix_read_data/fifo_data/data_fifo_wr_din[19]} {jadepix_read_data/fifo_data/data_fifo_wr_din[20]} {jadepix_read_data/fifo_data/data_fifo_wr_din[21]} {jadepix_read_data/fifo_data/data_fifo_wr_din[22]} {jadepix_read_data/fifo_data/data_fifo_wr_din[23]} {jadepix_read_data/fifo_data/data_fifo_wr_din[24]} {jadepix_read_data/fifo_data/data_fifo_wr_din[25]} {jadepix_read_data/fifo_data/data_fifo_wr_din[26]} {jadepix_read_data/fifo_data/data_fifo_wr_din[27]} {jadepix_read_data/fifo_data/data_fifo_wr_din[28]} {jadepix_read_data/fifo_data/data_fifo_wr_din[29]} {jadepix_read_data/fifo_data/data_fifo_wr_din[30]} {jadepix_read_data/fifo_data/data_fifo_wr_din[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe24]
set_property port_width 5 [get_debug_ports u_ila_0/probe24]
connect_debug_port u_ila_0/probe24 [get_nets [list {jadepix_read_data/fifo_data/fifo_oc[0]} {jadepix_read_data/fifo_data/fifo_oc[1]} {jadepix_read_data/fifo_data/fifo_oc[2]} {jadepix_read_data/fifo_data/fifo_oc[3]} {jadepix_read_data/fifo_data/fifo_oc[4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe25]
set_property port_width 1 [get_debug_ports u_ila_0/probe25]
connect_debug_port u_ila_0/probe25 [get_nets [list jadepix_read_data/fifo_status_buffer/buffer_data_valid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe26]
set_property port_width 1 [get_debug_ports u_ila_0/probe26]
connect_debug_port u_ila_0/probe26 [get_nets [list jadepix_read_data/fifo_status_buffer/buffer_empty]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe27]
set_property port_width 1 [get_debug_ports u_ila_0/probe27]
connect_debug_port u_ila_0/probe27 [get_nets [list jadepix_read_data/fifo_status_buffer/buffer_full]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe28]
set_property port_width 1 [get_debug_ports u_ila_0/probe28]
connect_debug_port u_ila_0/probe28 [get_nets [list jadepix_read_data/fifo_status_buffer/buffer_read_en]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe29]
set_property port_width 1 [get_debug_ports u_ila_0/probe29]
connect_debug_port u_ila_0/probe29 [get_nets [list jadepix_read_data/fifo_status_buffer/buffer_w_en]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe30]
set_property port_width 1 [get_debug_ports u_ila_0/probe30]
connect_debug_port u_ila_0/probe30 [get_nets [list jadepix_read_data/clk_cache]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe31]
set_property port_width 1 [get_debug_ports u_ila_0/probe31]
connect_debug_port u_ila_0/probe31 [get_nets [list jadepix_read_data/clk_cache_delay]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe32]
set_property port_width 1 [get_debug_ports u_ila_0/probe32]
connect_debug_port u_ila_0/probe32 [get_nets [list jadepix_read_data/fifo_data/data_fifo_full]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe33]
set_property port_width 1 [get_debug_ports u_ila_0/probe33]
connect_debug_port u_ila_0/probe33 [get_nets [list jadepix_read_data/data_fifo_full]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe34]
set_property port_width 1 [get_debug_ports u_ila_0/probe34]
connect_debug_port u_ila_0/probe34 [get_nets [list jadepix_read_data/fifo_data/data_fifo_rst]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe35]
set_property port_width 1 [get_debug_ports u_ila_0/probe35]
connect_debug_port u_ila_0/probe35 [get_nets [list jadepix_read_data/data_fifo_rst]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe36]
set_property port_width 1 [get_debug_ports u_ila_0/probe36]
connect_debug_port u_ila_0/probe36 [get_nets [list jadepix_read_data/fifo_data/data_fifo_wr_en]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe37]
set_property port_width 1 [get_debug_ports u_ila_0/probe37]
connect_debug_port u_ila_0/probe37 [get_nets [list jadepix_read_data/data_fifo_wr_en]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe38]
set_property port_width 1 [get_debug_ports u_ila_0/probe38]
connect_debug_port u_ila_0/probe38 [get_nets [list jadepix_read_data/fifo_data/fifo_data_valid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe39]
set_property port_width 1 [get_debug_ports u_ila_0/probe39]
connect_debug_port u_ila_0/probe39 [get_nets [list jadepix_read_data/is_busy_cache]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe40]
set_property port_width 1 [get_debug_ports u_ila_0/probe40]
connect_debug_port u_ila_0/probe40 [get_nets [list jadepix_read_data/fifo_data/read_frame_start]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe41]
set_property port_width 1 [get_debug_ports u_ila_0/probe41]
connect_debug_port u_ila_0/probe41 [get_nets [list jadepix_read_data/fifo_data/read_frame_stop]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe42]
set_property port_width 1 [get_debug_ports u_ila_0/probe42]
connect_debug_port u_ila_0/probe42 [get_nets [list jadepix_read_data/start_cache]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk_sys]
