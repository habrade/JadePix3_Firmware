



connect_debug_port u_ila_0/probe18 [get_nets [list {jadepix_read_data/fifo_data/p_2_in[16]} {jadepix_read_data/fifo_data/p_2_in[17]}]]

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
connect_debug_port u_ila_0/clk [get_nets [list jadepix_clocks/CLK]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 8 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {DATA_IN_IBUF[0]} {DATA_IN_IBUF[1]} {DATA_IN_IBUF[2]} {DATA_IN_IBUF[3]} {DATA_IN_IBUF[4]} {DATA_IN_IBUF[5]} {DATA_IN_IBUF[6]} {DATA_IN_IBUF[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 9 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {CA_OBUF[0]} {CA_OBUF[1]} {CA_OBUF[2]} {CA_OBUF[3]} {CA_OBUF[4]} {CA_OBUF[5]} {CA_OBUF[6]} {CA_OBUF[7]} {CA_OBUF[8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 2 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {BLK_SELECT_OBUF[0]} {BLK_SELECT_OBUF[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 9 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {jadepix_read_data/row[0]} {jadepix_read_data/row[1]} {jadepix_read_data/row[2]} {jadepix_read_data/row[3]} {jadepix_read_data/row[4]} {jadepix_read_data/row[5]} {jadepix_read_data/row[6]} {jadepix_read_data/row[7]} {jadepix_read_data/row[8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 22 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {jadepix_read_data/frame_num[0]} {jadepix_read_data/frame_num[1]} {jadepix_read_data/frame_num[2]} {jadepix_read_data/frame_num[3]} {jadepix_read_data/frame_num[4]} {jadepix_read_data/frame_num[5]} {jadepix_read_data/frame_num[6]} {jadepix_read_data/frame_num[7]} {jadepix_read_data/frame_num[8]} {jadepix_read_data/frame_num[9]} {jadepix_read_data/frame_num[10]} {jadepix_read_data/frame_num[11]} {jadepix_read_data/frame_num[12]} {jadepix_read_data/frame_num[13]} {jadepix_read_data/frame_num[14]} {jadepix_read_data/frame_num[15]} {jadepix_read_data/frame_num[16]} {jadepix_read_data/frame_num[17]} {jadepix_read_data/frame_num[18]} {jadepix_read_data/frame_num[19]} {jadepix_read_data/frame_num[20]} {jadepix_read_data/frame_num[21]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 32 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {jadepix_read_data/data_fifo_wr_din[0]} {jadepix_read_data/data_fifo_wr_din[1]} {jadepix_read_data/data_fifo_wr_din[2]} {jadepix_read_data/data_fifo_wr_din[3]} {jadepix_read_data/data_fifo_wr_din[4]} {jadepix_read_data/data_fifo_wr_din[5]} {jadepix_read_data/data_fifo_wr_din[6]} {jadepix_read_data/data_fifo_wr_din[7]} {jadepix_read_data/data_fifo_wr_din[8]} {jadepix_read_data/data_fifo_wr_din[9]} {jadepix_read_data/data_fifo_wr_din[10]} {jadepix_read_data/data_fifo_wr_din[11]} {jadepix_read_data/data_fifo_wr_din[12]} {jadepix_read_data/data_fifo_wr_din[13]} {jadepix_read_data/data_fifo_wr_din[14]} {jadepix_read_data/data_fifo_wr_din[15]} {jadepix_read_data/data_fifo_wr_din[16]} {jadepix_read_data/data_fifo_wr_din[17]} {jadepix_read_data/data_fifo_wr_din[18]} {jadepix_read_data/data_fifo_wr_din[19]} {jadepix_read_data/data_fifo_wr_din[20]} {jadepix_read_data/data_fifo_wr_din[21]} {jadepix_read_data/data_fifo_wr_din[22]} {jadepix_read_data/data_fifo_wr_din[23]} {jadepix_read_data/data_fifo_wr_din[24]} {jadepix_read_data/data_fifo_wr_din[25]} {jadepix_read_data/data_fifo_wr_din[26]} {jadepix_read_data/data_fifo_wr_din[27]} {jadepix_read_data/data_fifo_wr_din[28]} {jadepix_read_data/data_fifo_wr_din[29]} {jadepix_read_data/data_fifo_wr_din[30]} {jadepix_read_data/data_fifo_wr_din[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 8 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {jadepix_read_data/DATA_IN[0]} {jadepix_read_data/DATA_IN[1]} {jadepix_read_data/DATA_IN[2]} {jadepix_read_data/DATA_IN[3]} {jadepix_read_data/DATA_IN[4]} {jadepix_read_data/DATA_IN[5]} {jadepix_read_data/DATA_IN[6]} {jadepix_read_data/DATA_IN[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 5 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {jadepix_read_data/fifo_status_buffer/sector_counters_v[3][valid_counter][0]} {jadepix_read_data/fifo_status_buffer/sector_counters_v[3][valid_counter][1]} {jadepix_read_data/fifo_status_buffer/sector_counters_v[3][valid_counter][2]} {jadepix_read_data/fifo_status_buffer/sector_counters_v[3][valid_counter][3]} {jadepix_read_data/fifo_status_buffer/sector_counters_v[3][valid_counter][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 5 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {jadepix_read_data/fifo_status_buffer/sector_counters_v[3][overflow_counter][0]} {jadepix_read_data/fifo_status_buffer/sector_counters_v[3][overflow_counter][1]} {jadepix_read_data/fifo_status_buffer/sector_counters_v[3][overflow_counter][2]} {jadepix_read_data/fifo_status_buffer/sector_counters_v[3][overflow_counter][3]} {jadepix_read_data/fifo_status_buffer/sector_counters_v[3][overflow_counter][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 5 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list {jadepix_read_data/fifo_status_buffer/sector_counters_v[2][valid_counter][0]} {jadepix_read_data/fifo_status_buffer/sector_counters_v[2][valid_counter][1]} {jadepix_read_data/fifo_status_buffer/sector_counters_v[2][valid_counter][2]} {jadepix_read_data/fifo_status_buffer/sector_counters_v[2][valid_counter][3]} {jadepix_read_data/fifo_status_buffer/sector_counters_v[2][valid_counter][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 5 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list {jadepix_read_data/fifo_status_buffer/sector_counters_v[2][overflow_counter][0]} {jadepix_read_data/fifo_status_buffer/sector_counters_v[2][overflow_counter][1]} {jadepix_read_data/fifo_status_buffer/sector_counters_v[2][overflow_counter][2]} {jadepix_read_data/fifo_status_buffer/sector_counters_v[2][overflow_counter][3]} {jadepix_read_data/fifo_status_buffer/sector_counters_v[2][overflow_counter][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 5 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list {jadepix_read_data/fifo_status_buffer/sector_counters_v[1][valid_counter][0]} {jadepix_read_data/fifo_status_buffer/sector_counters_v[1][valid_counter][1]} {jadepix_read_data/fifo_status_buffer/sector_counters_v[1][valid_counter][2]} {jadepix_read_data/fifo_status_buffer/sector_counters_v[1][valid_counter][3]} {jadepix_read_data/fifo_status_buffer/sector_counters_v[1][valid_counter][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 5 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list {jadepix_read_data/fifo_status_buffer/sector_counters_v[1][overflow_counter][0]} {jadepix_read_data/fifo_status_buffer/sector_counters_v[1][overflow_counter][1]} {jadepix_read_data/fifo_status_buffer/sector_counters_v[1][overflow_counter][2]} {jadepix_read_data/fifo_status_buffer/sector_counters_v[1][overflow_counter][3]} {jadepix_read_data/fifo_status_buffer/sector_counters_v[1][overflow_counter][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 5 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list {jadepix_read_data/fifo_status_buffer/sector_counters_v[0][valid_counter][0]} {jadepix_read_data/fifo_status_buffer/sector_counters_v[0][valid_counter][1]} {jadepix_read_data/fifo_status_buffer/sector_counters_v[0][valid_counter][2]} {jadepix_read_data/fifo_status_buffer/sector_counters_v[0][valid_counter][3]} {jadepix_read_data/fifo_status_buffer/sector_counters_v[0][valid_counter][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 5 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list {jadepix_read_data/fifo_status_buffer/sector_counters_v[0][overflow_counter][0]} {jadepix_read_data/fifo_status_buffer/sector_counters_v[0][overflow_counter][1]} {jadepix_read_data/fifo_status_buffer/sector_counters_v[0][overflow_counter][2]} {jadepix_read_data/fifo_status_buffer/sector_counters_v[0][overflow_counter][3]} {jadepix_read_data/fifo_status_buffer/sector_counters_v[0][overflow_counter][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 86 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list {jadepix_read_data/fifo_status_buffer/buffer_data_flat[0]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[1]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[2]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[3]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[4]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[5]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[6]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[7]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[8]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[9]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[10]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[11]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[12]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[13]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[14]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[15]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[16]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[17]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[18]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[19]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[20]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[21]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[22]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[23]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[24]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[25]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[26]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[27]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[28]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[29]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[30]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[31]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[32]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[33]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[34]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[35]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[36]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[37]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[38]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[39]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[40]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[41]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[42]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[43]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[44]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[45]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[46]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[47]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[48]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[49]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[50]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[51]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[52]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[53]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[54]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[55]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[56]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[57]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[58]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[59]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[60]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[61]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[62]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[63]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[64]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[65]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[66]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[67]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[68]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[69]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[70]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[71]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[72]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[73]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[74]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[75]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[76]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[77]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[78]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[79]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[80]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[81]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[82]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[83]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[84]} {jadepix_read_data/fifo_status_buffer/buffer_data_flat[85]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
set_property port_width 22 [get_debug_ports u_ila_0/probe16]
connect_debug_port u_ila_0/probe16 [get_nets [list {jadepix_read_data/fifo_status_buffer/frame_num[0]} {jadepix_read_data/fifo_status_buffer/frame_num[1]} {jadepix_read_data/fifo_status_buffer/frame_num[2]} {jadepix_read_data/fifo_status_buffer/frame_num[3]} {jadepix_read_data/fifo_status_buffer/frame_num[4]} {jadepix_read_data/fifo_status_buffer/frame_num[5]} {jadepix_read_data/fifo_status_buffer/frame_num[6]} {jadepix_read_data/fifo_status_buffer/frame_num[7]} {jadepix_read_data/fifo_status_buffer/frame_num[8]} {jadepix_read_data/fifo_status_buffer/frame_num[9]} {jadepix_read_data/fifo_status_buffer/frame_num[10]} {jadepix_read_data/fifo_status_buffer/frame_num[11]} {jadepix_read_data/fifo_status_buffer/frame_num[12]} {jadepix_read_data/fifo_status_buffer/frame_num[13]} {jadepix_read_data/fifo_status_buffer/frame_num[14]} {jadepix_read_data/fifo_status_buffer/frame_num[15]} {jadepix_read_data/fifo_status_buffer/frame_num[16]} {jadepix_read_data/fifo_status_buffer/frame_num[17]} {jadepix_read_data/fifo_status_buffer/frame_num[18]} {jadepix_read_data/fifo_status_buffer/frame_num[19]} {jadepix_read_data/fifo_status_buffer/frame_num[20]} {jadepix_read_data/fifo_status_buffer/frame_num[21]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe17]
set_property port_width 22 [get_debug_ports u_ila_0/probe17]
connect_debug_port u_ila_0/probe17 [get_nets [list {jadepix_read_data/fifo_data/frame_in_data_reg2[0]} {jadepix_read_data/fifo_data/frame_in_data_reg2[1]} {jadepix_read_data/fifo_data/frame_in_data_reg2[2]} {jadepix_read_data/fifo_data/frame_in_data_reg2[3]} {jadepix_read_data/fifo_data/frame_in_data_reg2[4]} {jadepix_read_data/fifo_data/frame_in_data_reg2[5]} {jadepix_read_data/fifo_data/frame_in_data_reg2[6]} {jadepix_read_data/fifo_data/frame_in_data_reg2[7]} {jadepix_read_data/fifo_data/frame_in_data_reg2[8]} {jadepix_read_data/fifo_data/frame_in_data_reg2[9]} {jadepix_read_data/fifo_data/frame_in_data_reg2[10]} {jadepix_read_data/fifo_data/frame_in_data_reg2[11]} {jadepix_read_data/fifo_data/frame_in_data_reg2[12]} {jadepix_read_data/fifo_data/frame_in_data_reg2[13]} {jadepix_read_data/fifo_data/frame_in_data_reg2[14]} {jadepix_read_data/fifo_data/frame_in_data_reg2[15]} {jadepix_read_data/fifo_data/frame_in_data_reg2[16]} {jadepix_read_data/fifo_data/frame_in_data_reg2[17]} {jadepix_read_data/fifo_data/frame_in_data_reg2[18]} {jadepix_read_data/fifo_data/frame_in_data_reg2[19]} {jadepix_read_data/fifo_data/frame_in_data_reg2[20]} {jadepix_read_data/fifo_data/frame_in_data_reg2[21]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe18]
set_property port_width 22 [get_debug_ports u_ila_0/probe18]
connect_debug_port u_ila_0/probe18 [get_nets [list {jadepix_read_data/fifo_data/frame_in_data_reg1[0]} {jadepix_read_data/fifo_data/frame_in_data_reg1[1]} {jadepix_read_data/fifo_data/frame_in_data_reg1[2]} {jadepix_read_data/fifo_data/frame_in_data_reg1[3]} {jadepix_read_data/fifo_data/frame_in_data_reg1[4]} {jadepix_read_data/fifo_data/frame_in_data_reg1[5]} {jadepix_read_data/fifo_data/frame_in_data_reg1[6]} {jadepix_read_data/fifo_data/frame_in_data_reg1[7]} {jadepix_read_data/fifo_data/frame_in_data_reg1[8]} {jadepix_read_data/fifo_data/frame_in_data_reg1[9]} {jadepix_read_data/fifo_data/frame_in_data_reg1[10]} {jadepix_read_data/fifo_data/frame_in_data_reg1[11]} {jadepix_read_data/fifo_data/frame_in_data_reg1[12]} {jadepix_read_data/fifo_data/frame_in_data_reg1[13]} {jadepix_read_data/fifo_data/frame_in_data_reg1[14]} {jadepix_read_data/fifo_data/frame_in_data_reg1[15]} {jadepix_read_data/fifo_data/frame_in_data_reg1[16]} {jadepix_read_data/fifo_data/frame_in_data_reg1[17]} {jadepix_read_data/fifo_data/frame_in_data_reg1[18]} {jadepix_read_data/fifo_data/frame_in_data_reg1[19]} {jadepix_read_data/fifo_data/frame_in_data_reg1[20]} {jadepix_read_data/fifo_data/frame_in_data_reg1[21]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe19]
set_property port_width 2 [get_debug_ports u_ila_0/probe19]
connect_debug_port u_ila_0/probe19 [get_nets [list {jadepix_read_data/fifo_data/fifo_status_v[3][0]} {jadepix_read_data/fifo_data/fifo_status_v[3][1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe20]
set_property port_width 2 [get_debug_ports u_ila_0/probe20]
connect_debug_port u_ila_0/probe20 [get_nets [list {jadepix_read_data/fifo_data/fifo_status_v[2][0]} {jadepix_read_data/fifo_data/fifo_status_v[2][1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe21]
set_property port_width 2 [get_debug_ports u_ila_0/probe21]
connect_debug_port u_ila_0/probe21 [get_nets [list {jadepix_read_data/fifo_data/fifo_status_v[1][0]} {jadepix_read_data/fifo_data/fifo_status_v[1][1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe22]
set_property port_width 2 [get_debug_ports u_ila_0/probe22]
connect_debug_port u_ila_0/probe22 [get_nets [list {jadepix_read_data/fifo_data/fifo_status_v[0][0]} {jadepix_read_data/fifo_data/fifo_status_v[0][1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe23]
set_property port_width 5 [get_debug_ports u_ila_0/probe23]
connect_debug_port u_ila_0/probe23 [get_nets [list {jadepix_read_data/fifo_data/fifo_oc[0]} {jadepix_read_data/fifo_data/fifo_oc[1]} {jadepix_read_data/fifo_data/fifo_oc[2]} {jadepix_read_data/fifo_data/fifo_oc[3]} {jadepix_read_data/fifo_data/fifo_oc[4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe24]
set_property port_width 32 [get_debug_ports u_ila_0/probe24]
connect_debug_port u_ila_0/probe24 [get_nets [list {jadepix_read_data/fifo_data/data_fifo_wr_din[0]} {jadepix_read_data/fifo_data/data_fifo_wr_din[1]} {jadepix_read_data/fifo_data/data_fifo_wr_din[2]} {jadepix_read_data/fifo_data/data_fifo_wr_din[3]} {jadepix_read_data/fifo_data/data_fifo_wr_din[4]} {jadepix_read_data/fifo_data/data_fifo_wr_din[5]} {jadepix_read_data/fifo_data/data_fifo_wr_din[6]} {jadepix_read_data/fifo_data/data_fifo_wr_din[7]} {jadepix_read_data/fifo_data/data_fifo_wr_din[8]} {jadepix_read_data/fifo_data/data_fifo_wr_din[9]} {jadepix_read_data/fifo_data/data_fifo_wr_din[10]} {jadepix_read_data/fifo_data/data_fifo_wr_din[11]} {jadepix_read_data/fifo_data/data_fifo_wr_din[12]} {jadepix_read_data/fifo_data/data_fifo_wr_din[13]} {jadepix_read_data/fifo_data/data_fifo_wr_din[14]} {jadepix_read_data/fifo_data/data_fifo_wr_din[15]} {jadepix_read_data/fifo_data/data_fifo_wr_din[16]} {jadepix_read_data/fifo_data/data_fifo_wr_din[17]} {jadepix_read_data/fifo_data/data_fifo_wr_din[18]} {jadepix_read_data/fifo_data/data_fifo_wr_din[19]} {jadepix_read_data/fifo_data/data_fifo_wr_din[20]} {jadepix_read_data/fifo_data/data_fifo_wr_din[21]} {jadepix_read_data/fifo_data/data_fifo_wr_din[22]} {jadepix_read_data/fifo_data/data_fifo_wr_din[23]} {jadepix_read_data/fifo_data/data_fifo_wr_din[24]} {jadepix_read_data/fifo_data/data_fifo_wr_din[25]} {jadepix_read_data/fifo_data/data_fifo_wr_din[26]} {jadepix_read_data/fifo_data/data_fifo_wr_din[27]} {jadepix_read_data/fifo_data/data_fifo_wr_din[28]} {jadepix_read_data/fifo_data/data_fifo_wr_din[29]} {jadepix_read_data/fifo_data/data_fifo_wr_din[30]} {jadepix_read_data/fifo_data/data_fifo_wr_din[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe25]
set_property port_width 5 [get_debug_ports u_ila_0/probe25]
connect_debug_port u_ila_0/probe25 [get_nets [list {jadepix_read_data/fifo_data/buffer_data_record[sectors][3][valid_counter][0]} {jadepix_read_data/fifo_data/buffer_data_record[sectors][3][valid_counter][1]} {jadepix_read_data/fifo_data/buffer_data_record[sectors][3][valid_counter][2]} {jadepix_read_data/fifo_data/buffer_data_record[sectors][3][valid_counter][3]} {jadepix_read_data/fifo_data/buffer_data_record[sectors][3][valid_counter][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe26]
set_property port_width 5 [get_debug_ports u_ila_0/probe26]
connect_debug_port u_ila_0/probe26 [get_nets [list {jadepix_read_data/fifo_data/buffer_data_record[sectors][2][valid_counter][0]} {jadepix_read_data/fifo_data/buffer_data_record[sectors][2][valid_counter][1]} {jadepix_read_data/fifo_data/buffer_data_record[sectors][2][valid_counter][2]} {jadepix_read_data/fifo_data/buffer_data_record[sectors][2][valid_counter][3]} {jadepix_read_data/fifo_data/buffer_data_record[sectors][2][valid_counter][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe27]
set_property port_width 5 [get_debug_ports u_ila_0/probe27]
connect_debug_port u_ila_0/probe27 [get_nets [list {jadepix_read_data/fifo_data/buffer_data_record[sectors][3][overflow_counter][0]} {jadepix_read_data/fifo_data/buffer_data_record[sectors][3][overflow_counter][1]} {jadepix_read_data/fifo_data/buffer_data_record[sectors][3][overflow_counter][2]} {jadepix_read_data/fifo_data/buffer_data_record[sectors][3][overflow_counter][3]} {jadepix_read_data/fifo_data/buffer_data_record[sectors][3][overflow_counter][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe28]
set_property port_width 5 [get_debug_ports u_ila_0/probe28]
connect_debug_port u_ila_0/probe28 [get_nets [list {jadepix_read_data/fifo_data/buffer_data_record[sectors][1][valid_counter][0]} {jadepix_read_data/fifo_data/buffer_data_record[sectors][1][valid_counter][1]} {jadepix_read_data/fifo_data/buffer_data_record[sectors][1][valid_counter][2]} {jadepix_read_data/fifo_data/buffer_data_record[sectors][1][valid_counter][3]} {jadepix_read_data/fifo_data/buffer_data_record[sectors][1][valid_counter][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe29]
set_property port_width 5 [get_debug_ports u_ila_0/probe29]
connect_debug_port u_ila_0/probe29 [get_nets [list {jadepix_read_data/fifo_data/buffer_data_record[sectors][2][overflow_counter][0]} {jadepix_read_data/fifo_data/buffer_data_record[sectors][2][overflow_counter][1]} {jadepix_read_data/fifo_data/buffer_data_record[sectors][2][overflow_counter][2]} {jadepix_read_data/fifo_data/buffer_data_record[sectors][2][overflow_counter][3]} {jadepix_read_data/fifo_data/buffer_data_record[sectors][2][overflow_counter][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe30]
set_property port_width 5 [get_debug_ports u_ila_0/probe30]
connect_debug_port u_ila_0/probe30 [get_nets [list {jadepix_read_data/fifo_data/buffer_data_record[sectors][0][valid_counter][0]} {jadepix_read_data/fifo_data/buffer_data_record[sectors][0][valid_counter][1]} {jadepix_read_data/fifo_data/buffer_data_record[sectors][0][valid_counter][2]} {jadepix_read_data/fifo_data/buffer_data_record[sectors][0][valid_counter][3]} {jadepix_read_data/fifo_data/buffer_data_record[sectors][0][valid_counter][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe31]
set_property port_width 5 [get_debug_ports u_ila_0/probe31]
connect_debug_port u_ila_0/probe31 [get_nets [list {jadepix_read_data/fifo_data/buffer_data_record[sectors][1][overflow_counter][0]} {jadepix_read_data/fifo_data/buffer_data_record[sectors][1][overflow_counter][1]} {jadepix_read_data/fifo_data/buffer_data_record[sectors][1][overflow_counter][2]} {jadepix_read_data/fifo_data/buffer_data_record[sectors][1][overflow_counter][3]} {jadepix_read_data/fifo_data/buffer_data_record[sectors][1][overflow_counter][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe32]
set_property port_width 5 [get_debug_ports u_ila_0/probe32]
connect_debug_port u_ila_0/probe32 [get_nets [list {jadepix_read_data/fifo_data/buffer_data_record[sectors][0][overflow_counter][0]} {jadepix_read_data/fifo_data/buffer_data_record[sectors][0][overflow_counter][1]} {jadepix_read_data/fifo_data/buffer_data_record[sectors][0][overflow_counter][2]} {jadepix_read_data/fifo_data/buffer_data_record[sectors][0][overflow_counter][3]} {jadepix_read_data/fifo_data/buffer_data_record[sectors][0][overflow_counter][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe33]
set_property port_width 4 [get_debug_ports u_ila_0/probe33]
connect_debug_port u_ila_0/probe33 [get_nets [list {jadepix_read_data/fifo_ctrl/fifo_read_en_v[0]} {jadepix_read_data/fifo_ctrl/fifo_read_en_v[1]} {jadepix_read_data/fifo_ctrl/fifo_read_en_v[2]} {jadepix_read_data/fifo_ctrl/fifo_read_en_v[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe34]
set_property port_width 5 [get_debug_ports u_ila_0/probe34]
connect_debug_port u_ila_0/probe34 [get_nets [list {jadepix_read_data/fifo_ctrl/cnt_sec3[0]} {jadepix_read_data/fifo_ctrl/cnt_sec3[1]} {jadepix_read_data/fifo_ctrl/cnt_sec3[2]} {jadepix_read_data/fifo_ctrl/cnt_sec3[3]} {jadepix_read_data/fifo_ctrl/cnt_sec3[4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe35]
set_property port_width 5 [get_debug_ports u_ila_0/probe35]
connect_debug_port u_ila_0/probe35 [get_nets [list {jadepix_read_data/fifo_ctrl/cnt_sec2[0]} {jadepix_read_data/fifo_ctrl/cnt_sec2[1]} {jadepix_read_data/fifo_ctrl/cnt_sec2[2]} {jadepix_read_data/fifo_ctrl/cnt_sec2[3]} {jadepix_read_data/fifo_ctrl/cnt_sec2[4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe36]
set_property port_width 5 [get_debug_ports u_ila_0/probe36]
connect_debug_port u_ila_0/probe36 [get_nets [list {jadepix_read_data/fifo_ctrl/cnt_sec1[0]} {jadepix_read_data/fifo_ctrl/cnt_sec1[1]} {jadepix_read_data/fifo_ctrl/cnt_sec1[2]} {jadepix_read_data/fifo_ctrl/cnt_sec1[3]} {jadepix_read_data/fifo_ctrl/cnt_sec1[4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe37]
set_property port_width 5 [get_debug_ports u_ila_0/probe37]
connect_debug_port u_ila_0/probe37 [get_nets [list {jadepix_read_data/fifo_ctrl/cnt_sec0[0]} {jadepix_read_data/fifo_ctrl/cnt_sec0[1]} {jadepix_read_data/fifo_ctrl/cnt_sec0[2]} {jadepix_read_data/fifo_ctrl/cnt_sec0[3]} {jadepix_read_data/fifo_ctrl/cnt_sec0[4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe38]
set_property port_width 5 [get_debug_ports u_ila_0/probe38]
connect_debug_port u_ila_0/probe38 [get_nets [list {jadepix_read_data/fifo_ctrl/buffer_data_record[sectors][3][valid_counter][0]} {jadepix_read_data/fifo_ctrl/buffer_data_record[sectors][3][valid_counter][1]} {jadepix_read_data/fifo_ctrl/buffer_data_record[sectors][3][valid_counter][2]} {jadepix_read_data/fifo_ctrl/buffer_data_record[sectors][3][valid_counter][3]} {jadepix_read_data/fifo_ctrl/buffer_data_record[sectors][3][valid_counter][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe39]
set_property port_width 8 [get_debug_ports u_ila_0/probe39]
connect_debug_port u_ila_0/probe39 [get_nets [list {jadepix_read_data/fifo_ctrl/buffer_fill_count[0]} {jadepix_read_data/fifo_ctrl/buffer_fill_count[1]} {jadepix_read_data/fifo_ctrl/buffer_fill_count[2]} {jadepix_read_data/fifo_ctrl/buffer_fill_count[3]} {jadepix_read_data/fifo_ctrl/buffer_fill_count[4]} {jadepix_read_data/fifo_ctrl/buffer_fill_count[5]} {jadepix_read_data/fifo_ctrl/buffer_fill_count[6]} {jadepix_read_data/fifo_ctrl/buffer_fill_count[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe40]
set_property port_width 5 [get_debug_ports u_ila_0/probe40]
connect_debug_port u_ila_0/probe40 [get_nets [list {jadepix_read_data/fifo_ctrl/buffer_data_record[sectors][2][valid_counter][0]} {jadepix_read_data/fifo_ctrl/buffer_data_record[sectors][2][valid_counter][1]} {jadepix_read_data/fifo_ctrl/buffer_data_record[sectors][2][valid_counter][2]} {jadepix_read_data/fifo_ctrl/buffer_data_record[sectors][2][valid_counter][3]} {jadepix_read_data/fifo_ctrl/buffer_data_record[sectors][2][valid_counter][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe41]
set_property port_width 5 [get_debug_ports u_ila_0/probe41]
connect_debug_port u_ila_0/probe41 [get_nets [list {jadepix_read_data/fifo_ctrl/buffer_data_record[sectors][3][overflow_counter][0]} {jadepix_read_data/fifo_ctrl/buffer_data_record[sectors][3][overflow_counter][1]} {jadepix_read_data/fifo_ctrl/buffer_data_record[sectors][3][overflow_counter][2]} {jadepix_read_data/fifo_ctrl/buffer_data_record[sectors][3][overflow_counter][3]} {jadepix_read_data/fifo_ctrl/buffer_data_record[sectors][3][overflow_counter][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe42]
set_property port_width 5 [get_debug_ports u_ila_0/probe42]
connect_debug_port u_ila_0/probe42 [get_nets [list {jadepix_read_data/fifo_ctrl/buffer_data_record[sectors][1][valid_counter][0]} {jadepix_read_data/fifo_ctrl/buffer_data_record[sectors][1][valid_counter][1]} {jadepix_read_data/fifo_ctrl/buffer_data_record[sectors][1][valid_counter][2]} {jadepix_read_data/fifo_ctrl/buffer_data_record[sectors][1][valid_counter][3]} {jadepix_read_data/fifo_ctrl/buffer_data_record[sectors][1][valid_counter][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe43]
set_property port_width 5 [get_debug_ports u_ila_0/probe43]
connect_debug_port u_ila_0/probe43 [get_nets [list {jadepix_read_data/fifo_ctrl/buffer_data_record[sectors][1][overflow_counter][0]} {jadepix_read_data/fifo_ctrl/buffer_data_record[sectors][1][overflow_counter][1]} {jadepix_read_data/fifo_ctrl/buffer_data_record[sectors][1][overflow_counter][2]} {jadepix_read_data/fifo_ctrl/buffer_data_record[sectors][1][overflow_counter][3]} {jadepix_read_data/fifo_ctrl/buffer_data_record[sectors][1][overflow_counter][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe44]
set_property port_width 5 [get_debug_ports u_ila_0/probe44]
connect_debug_port u_ila_0/probe44 [get_nets [list {jadepix_read_data/fifo_ctrl/buffer_data_record[sectors][2][overflow_counter][0]} {jadepix_read_data/fifo_ctrl/buffer_data_record[sectors][2][overflow_counter][1]} {jadepix_read_data/fifo_ctrl/buffer_data_record[sectors][2][overflow_counter][2]} {jadepix_read_data/fifo_ctrl/buffer_data_record[sectors][2][overflow_counter][3]} {jadepix_read_data/fifo_ctrl/buffer_data_record[sectors][2][overflow_counter][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe45]
set_property port_width 5 [get_debug_ports u_ila_0/probe45]
connect_debug_port u_ila_0/probe45 [get_nets [list {jadepix_read_data/fifo_ctrl/buffer_data_record[sectors][0][valid_counter][0]} {jadepix_read_data/fifo_ctrl/buffer_data_record[sectors][0][valid_counter][1]} {jadepix_read_data/fifo_ctrl/buffer_data_record[sectors][0][valid_counter][2]} {jadepix_read_data/fifo_ctrl/buffer_data_record[sectors][0][valid_counter][3]} {jadepix_read_data/fifo_ctrl/buffer_data_record[sectors][0][valid_counter][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe46]
set_property port_width 5 [get_debug_ports u_ila_0/probe46]
connect_debug_port u_ila_0/probe46 [get_nets [list {jadepix_read_data/fifo_ctrl/buffer_data_record[sectors][0][overflow_counter][0]} {jadepix_read_data/fifo_ctrl/buffer_data_record[sectors][0][overflow_counter][1]} {jadepix_read_data/fifo_ctrl/buffer_data_record[sectors][0][overflow_counter][2]} {jadepix_read_data/fifo_ctrl/buffer_data_record[sectors][0][overflow_counter][3]} {jadepix_read_data/fifo_ctrl/buffer_data_record[sectors][0][overflow_counter][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe47]
set_property port_width 9 [get_debug_ports u_ila_0/probe47]
connect_debug_port u_ila_0/probe47 [get_nets [list {jadepix_read_data/fifo_ctrl/buffer_data_record[row][0]} {jadepix_read_data/fifo_ctrl/buffer_data_record[row][1]} {jadepix_read_data/fifo_ctrl/buffer_data_record[row][2]} {jadepix_read_data/fifo_ctrl/buffer_data_record[row][3]} {jadepix_read_data/fifo_ctrl/buffer_data_record[row][4]} {jadepix_read_data/fifo_ctrl/buffer_data_record[row][5]} {jadepix_read_data/fifo_ctrl/buffer_data_record[row][6]} {jadepix_read_data/fifo_ctrl/buffer_data_record[row][7]} {jadepix_read_data/fifo_ctrl/buffer_data_record[row][8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe48]
set_property port_width 15 [get_debug_ports u_ila_0/probe48]
connect_debug_port u_ila_0/probe48 [get_nets [list {jadepix_read_data/fifo_ctrl/buffer_data_record[rbof][0]} {jadepix_read_data/fifo_ctrl/buffer_data_record[rbof][1]} {jadepix_read_data/fifo_ctrl/buffer_data_record[rbof][2]} {jadepix_read_data/fifo_ctrl/buffer_data_record[rbof][3]} {jadepix_read_data/fifo_ctrl/buffer_data_record[rbof][4]} {jadepix_read_data/fifo_ctrl/buffer_data_record[rbof][5]} {jadepix_read_data/fifo_ctrl/buffer_data_record[rbof][6]} {jadepix_read_data/fifo_ctrl/buffer_data_record[rbof][7]} {jadepix_read_data/fifo_ctrl/buffer_data_record[rbof][8]} {jadepix_read_data/fifo_ctrl/buffer_data_record[rbof][9]} {jadepix_read_data/fifo_ctrl/buffer_data_record[rbof][10]} {jadepix_read_data/fifo_ctrl/buffer_data_record[rbof][11]} {jadepix_read_data/fifo_ctrl/buffer_data_record[rbof][12]} {jadepix_read_data/fifo_ctrl/buffer_data_record[rbof][13]} {jadepix_read_data/fifo_ctrl/buffer_data_record[rbof][14]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe49]
set_property port_width 86 [get_debug_ports u_ila_0/probe49]
connect_debug_port u_ila_0/probe49 [get_nets [list {jadepix_read_data/fifo_ctrl/buffer_data_flat[0]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[1]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[2]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[3]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[4]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[5]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[6]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[7]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[8]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[9]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[10]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[11]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[12]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[13]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[14]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[15]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[16]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[17]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[18]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[19]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[20]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[21]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[22]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[23]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[24]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[25]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[26]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[27]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[28]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[29]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[30]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[31]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[32]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[33]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[34]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[35]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[36]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[37]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[38]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[39]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[40]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[41]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[42]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[43]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[44]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[45]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[46]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[47]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[48]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[49]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[50]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[51]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[52]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[53]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[54]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[55]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[56]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[57]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[58]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[59]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[60]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[61]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[62]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[63]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[64]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[65]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[66]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[67]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[68]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[69]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[70]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[71]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[72]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[73]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[74]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[75]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[76]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[77]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[78]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[79]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[80]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[81]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[82]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[83]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[84]} {jadepix_read_data/fifo_ctrl/buffer_data_flat[85]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe50]
set_property port_width 22 [get_debug_ports u_ila_0/probe50]
connect_debug_port u_ila_0/probe50 [get_nets [list {jadepix_read_data/fifo_ctrl/buffer_data_record[frame_num][0]} {jadepix_read_data/fifo_ctrl/buffer_data_record[frame_num][1]} {jadepix_read_data/fifo_ctrl/buffer_data_record[frame_num][2]} {jadepix_read_data/fifo_ctrl/buffer_data_record[frame_num][3]} {jadepix_read_data/fifo_ctrl/buffer_data_record[frame_num][4]} {jadepix_read_data/fifo_ctrl/buffer_data_record[frame_num][5]} {jadepix_read_data/fifo_ctrl/buffer_data_record[frame_num][6]} {jadepix_read_data/fifo_ctrl/buffer_data_record[frame_num][7]} {jadepix_read_data/fifo_ctrl/buffer_data_record[frame_num][8]} {jadepix_read_data/fifo_ctrl/buffer_data_record[frame_num][9]} {jadepix_read_data/fifo_ctrl/buffer_data_record[frame_num][10]} {jadepix_read_data/fifo_ctrl/buffer_data_record[frame_num][11]} {jadepix_read_data/fifo_ctrl/buffer_data_record[frame_num][12]} {jadepix_read_data/fifo_ctrl/buffer_data_record[frame_num][13]} {jadepix_read_data/fifo_ctrl/buffer_data_record[frame_num][14]} {jadepix_read_data/fifo_ctrl/buffer_data_record[frame_num][15]} {jadepix_read_data/fifo_ctrl/buffer_data_record[frame_num][16]} {jadepix_read_data/fifo_ctrl/buffer_data_record[frame_num][17]} {jadepix_read_data/fifo_ctrl/buffer_data_record[frame_num][18]} {jadepix_read_data/fifo_ctrl/buffer_data_record[frame_num][19]} {jadepix_read_data/fifo_ctrl/buffer_data_record[frame_num][20]} {jadepix_read_data/fifo_ctrl/buffer_data_record[frame_num][21]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe51]
set_property port_width 2 [get_debug_ports u_ila_0/probe51]
connect_debug_port u_ila_0/probe51 [get_nets [list {jadepix_read_data/fifo_ctrl/blk_select[0]} {jadepix_read_data/fifo_ctrl/blk_select[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe52]
set_property port_width 5 [get_debug_ports u_ila_0/probe52]
connect_debug_port u_ila_0/probe52 [get_nets [list {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[1].fifo_monitor_index/fifo_counters[valid_counter][0]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[1].fifo_monitor_index/fifo_counters[valid_counter][1]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[1].fifo_monitor_index/fifo_counters[valid_counter][2]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[1].fifo_monitor_index/fifo_counters[valid_counter][3]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[1].fifo_monitor_index/fifo_counters[valid_counter][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe53]
set_property port_width 5 [get_debug_ports u_ila_0/probe53]
connect_debug_port u_ila_0/probe53 [get_nets [list {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[1].fifo_monitor_index/fifo_counters[overflow_counter][0]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[1].fifo_monitor_index/fifo_counters[overflow_counter][1]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[1].fifo_monitor_index/fifo_counters[overflow_counter][2]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[1].fifo_monitor_index/fifo_counters[overflow_counter][3]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[1].fifo_monitor_index/fifo_counters[overflow_counter][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe54]
set_property port_width 5 [get_debug_ports u_ila_0/probe54]
connect_debug_port u_ila_0/probe54 [get_nets [list {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[2].fifo_monitor_index/fifo_counters[valid_counter][0]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[2].fifo_monitor_index/fifo_counters[valid_counter][1]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[2].fifo_monitor_index/fifo_counters[valid_counter][2]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[2].fifo_monitor_index/fifo_counters[valid_counter][3]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[2].fifo_monitor_index/fifo_counters[valid_counter][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe55]
set_property port_width 5 [get_debug_ports u_ila_0/probe55]
connect_debug_port u_ila_0/probe55 [get_nets [list {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[2].fifo_monitor_index/fifo_counters[overflow_counter][0]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[2].fifo_monitor_index/fifo_counters[overflow_counter][1]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[2].fifo_monitor_index/fifo_counters[overflow_counter][2]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[2].fifo_monitor_index/fifo_counters[overflow_counter][3]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[2].fifo_monitor_index/fifo_counters[overflow_counter][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe56]
set_property port_width 5 [get_debug_ports u_ila_0/probe56]
connect_debug_port u_ila_0/probe56 [get_nets [list {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[3].fifo_monitor_index/fifo_counters[valid_counter][0]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[3].fifo_monitor_index/fifo_counters[valid_counter][1]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[3].fifo_monitor_index/fifo_counters[valid_counter][2]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[3].fifo_monitor_index/fifo_counters[valid_counter][3]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[3].fifo_monitor_index/fifo_counters[valid_counter][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe57]
set_property port_width 5 [get_debug_ports u_ila_0/probe57]
connect_debug_port u_ila_0/probe57 [get_nets [list {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[3].fifo_monitor_index/fifo_counters[overflow_counter][0]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[3].fifo_monitor_index/fifo_counters[overflow_counter][1]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[3].fifo_monitor_index/fifo_counters[overflow_counter][2]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[3].fifo_monitor_index/fifo_counters[overflow_counter][3]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[3].fifo_monitor_index/fifo_counters[overflow_counter][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe58]
set_property port_width 5 [get_debug_ports u_ila_0/probe58]
connect_debug_port u_ila_0/probe58 [get_nets [list {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[0].fifo_monitor_index/fifo_counters[valid_counter][0]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[0].fifo_monitor_index/fifo_counters[valid_counter][1]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[0].fifo_monitor_index/fifo_counters[valid_counter][2]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[0].fifo_monitor_index/fifo_counters[valid_counter][3]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[0].fifo_monitor_index/fifo_counters[valid_counter][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe59]
set_property port_width 5 [get_debug_ports u_ila_0/probe59]
connect_debug_port u_ila_0/probe59 [get_nets [list {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[0].fifo_monitor_index/fifo_counters[overflow_counter][0]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[0].fifo_monitor_index/fifo_counters[overflow_counter][1]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[0].fifo_monitor_index/fifo_counters[overflow_counter][2]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[0].fifo_monitor_index/fifo_counters[overflow_counter][3]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[0].fifo_monitor_index/fifo_counters[overflow_counter][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe60]
set_property port_width 5 [get_debug_ports u_ila_0/probe60]
connect_debug_port u_ila_0/probe60 [get_nets [list {jadepix_read_data/fabric_sector/fifo_oc[0]} {jadepix_read_data/fabric_sector/fifo_oc[1]} {jadepix_read_data/fabric_sector/fifo_oc[2]} {jadepix_read_data/fabric_sector/fifo_oc[3]} {jadepix_read_data/fabric_sector/fifo_oc[4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe61]
set_property port_width 2 [get_debug_ports u_ila_0/probe61]
connect_debug_port u_ila_0/probe61 [get_nets [list {jadepix_read_data/fabric_sector/blk_select_delay[0]} {jadepix_read_data/fabric_sector/blk_select_delay[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe62]
set_property port_width 2 [get_debug_ports u_ila_0/probe62]
connect_debug_port u_ila_0/probe62 [get_nets [list {jadepix_read_data/fabric_sector/blk_select[0]} {jadepix_read_data/fabric_sector/blk_select[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe63]
set_property port_width 5 [get_debug_ports u_ila_0/probe63]
connect_debug_port u_ila_0/probe63 [get_nets [list {jadepix_ctrl_wrapper/jadepix_ctrl/state_reg[0]} {jadepix_ctrl_wrapper/jadepix_ctrl/state_reg[1]} {jadepix_ctrl_wrapper/jadepix_ctrl/state_reg[2]} {jadepix_ctrl_wrapper/jadepix_ctrl/state_reg[3]} {jadepix_ctrl_wrapper/jadepix_ctrl/state_reg[4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe64]
set_property port_width 5 [get_debug_ports u_ila_0/probe64]
connect_debug_port u_ila_0/probe64 [get_nets [list {jadepix_ctrl_wrapper/jadepix_ctrl/state_next[0]} {jadepix_ctrl_wrapper/jadepix_ctrl/state_next[1]} {jadepix_ctrl_wrapper/jadepix_ctrl/state_next[2]} {jadepix_ctrl_wrapper/jadepix_ctrl/state_next[3]} {jadepix_ctrl_wrapper/jadepix_ctrl/state_next[4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe65]
set_property port_width 22 [get_debug_ports u_ila_0/probe65]
connect_debug_port u_ila_0/probe65 [get_nets [list {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_cnt[0]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_cnt[1]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_cnt[2]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_cnt[3]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_cnt[4]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_cnt[5]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_cnt[6]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_cnt[7]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_cnt[8]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_cnt[9]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_cnt[10]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_cnt[11]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_cnt[12]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_cnt[13]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_cnt[14]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_cnt[15]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_cnt[16]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_cnt[17]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_cnt[18]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_cnt[19]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_cnt[20]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_cnt[21]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe66]
set_property port_width 3 [get_debug_ports u_ila_0/probe66]
connect_debug_port u_ila_0/probe66 [get_nets [list {jadepix_ctrl_wrapper/jadepix_ctrl/rs_hitmap_cnt[0]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_hitmap_cnt[1]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_hitmap_cnt[2]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe67]
set_property port_width 22 [get_debug_ports u_ila_0/probe67]
connect_debug_port u_ila_0/probe67 [get_nets [list {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_num_set[0]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_num_set[1]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_num_set[2]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_num_set[3]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_num_set[4]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_num_set[5]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_num_set[6]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_num_set[7]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_num_set[8]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_num_set[9]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_num_set[10]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_num_set[11]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_num_set[12]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_num_set[13]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_num_set[14]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_num_set[15]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_num_set[16]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_num_set[17]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_num_set[18]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_num_set[19]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_num_set[20]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_frame_num_set[21]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe68]
set_property port_width 5 [get_debug_ports u_ila_0/probe68]
connect_debug_port u_ila_0/probe68 [get_nets [list {jadepix_ctrl_wrapper/jadepix_ctrl/rs_cnt[0]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_cnt[1]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_cnt[2]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_cnt[3]} {jadepix_ctrl_wrapper/jadepix_ctrl/rs_cnt[4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe69]
set_property port_width 17 [get_debug_ports u_ila_0/probe69]
connect_debug_port u_ila_0/probe69 [get_nets [list {jadepix_ctrl_wrapper/jadepix_ctrl/pix_cnt[0]} {jadepix_ctrl_wrapper/jadepix_ctrl/pix_cnt[1]} {jadepix_ctrl_wrapper/jadepix_ctrl/pix_cnt[2]} {jadepix_ctrl_wrapper/jadepix_ctrl/pix_cnt[3]} {jadepix_ctrl_wrapper/jadepix_ctrl/pix_cnt[4]} {jadepix_ctrl_wrapper/jadepix_ctrl/pix_cnt[5]} {jadepix_ctrl_wrapper/jadepix_ctrl/pix_cnt[6]} {jadepix_ctrl_wrapper/jadepix_ctrl/pix_cnt[7]} {jadepix_ctrl_wrapper/jadepix_ctrl/pix_cnt[8]} {jadepix_ctrl_wrapper/jadepix_ctrl/pix_cnt[9]} {jadepix_ctrl_wrapper/jadepix_ctrl/pix_cnt[10]} {jadepix_ctrl_wrapper/jadepix_ctrl/pix_cnt[11]} {jadepix_ctrl_wrapper/jadepix_ctrl/pix_cnt[12]} {jadepix_ctrl_wrapper/jadepix_ctrl/pix_cnt[13]} {jadepix_ctrl_wrapper/jadepix_ctrl/pix_cnt[14]} {jadepix_ctrl_wrapper/jadepix_ctrl/pix_cnt[15]} {jadepix_ctrl_wrapper/jadepix_ctrl/pix_cnt[16]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe70]
set_property port_width 4 [get_debug_ports u_ila_0/probe70]
connect_debug_port u_ila_0/probe70 [get_nets [list {jadepix_ctrl_wrapper/jadepix_ctrl/hitmap_num[0]} {jadepix_ctrl_wrapper/jadepix_ctrl/hitmap_num[1]} {jadepix_ctrl_wrapper/jadepix_ctrl/hitmap_num[2]} {jadepix_ctrl_wrapper/jadepix_ctrl/hitmap_num[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe71]
set_property port_width 4 [get_debug_ports u_ila_0/probe71]
connect_debug_port u_ila_0/probe71 [get_nets [list {jadepix_ctrl_wrapper/jadepix_ctrl/hitmap_cnt[0]} {jadepix_ctrl_wrapper/jadepix_ctrl/hitmap_cnt[1]} {jadepix_ctrl_wrapper/jadepix_ctrl/hitmap_cnt[2]} {jadepix_ctrl_wrapper/jadepix_ctrl/hitmap_cnt[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe72]
set_property port_width 34 [get_debug_ports u_ila_0/probe72]
connect_debug_port u_ila_0/probe72 [get_nets [list {jadepix_ctrl_wrapper/jadepix_ctrl/gs_width_counter[0]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_width_counter[1]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_width_counter[2]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_width_counter[3]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_width_counter[4]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_width_counter[5]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_width_counter[6]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_width_counter[7]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_width_counter[8]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_width_counter[9]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_width_counter[10]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_width_counter[11]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_width_counter[12]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_width_counter[13]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_width_counter[14]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_width_counter[15]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_width_counter[16]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_width_counter[17]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_width_counter[18]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_width_counter[19]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_width_counter[20]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_width_counter[21]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_width_counter[22]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_width_counter[23]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_width_counter[24]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_width_counter[25]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_width_counter[26]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_width_counter[27]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_width_counter[28]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_width_counter[29]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_width_counter[30]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_width_counter[31]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_width_counter[32]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_width_counter[33]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe73]
set_property port_width 32 [get_debug_ports u_ila_0/probe73]
connect_debug_port u_ila_0/probe73 [get_nets [list {jadepix_ctrl_wrapper/jadepix_ctrl/gs_pulse_width_cnt_low[0]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_pulse_width_cnt_low[1]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_pulse_width_cnt_low[2]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_pulse_width_cnt_low[3]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_pulse_width_cnt_low[4]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_pulse_width_cnt_low[5]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_pulse_width_cnt_low[6]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_pulse_width_cnt_low[7]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_pulse_width_cnt_low[8]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_pulse_width_cnt_low[9]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_pulse_width_cnt_low[10]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_pulse_width_cnt_low[11]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_pulse_width_cnt_low[12]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_pulse_width_cnt_low[13]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_pulse_width_cnt_low[14]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_pulse_width_cnt_low[15]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_pulse_width_cnt_low[16]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_pulse_width_cnt_low[17]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_pulse_width_cnt_low[18]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_pulse_width_cnt_low[19]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_pulse_width_cnt_low[20]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_pulse_width_cnt_low[21]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_pulse_width_cnt_low[22]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_pulse_width_cnt_low[23]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_pulse_width_cnt_low[24]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_pulse_width_cnt_low[25]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_pulse_width_cnt_low[26]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_pulse_width_cnt_low[27]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_pulse_width_cnt_low[28]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_pulse_width_cnt_low[29]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_pulse_width_cnt_low[30]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_pulse_width_cnt_low[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe74]
set_property port_width 2 [get_debug_ports u_ila_0/probe74]
connect_debug_port u_ila_0/probe74 [get_nets [list {jadepix_ctrl_wrapper/jadepix_ctrl/gs_pulse_width_cnt_high[0]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_pulse_width_cnt_high[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe75]
set_property port_width 9 [get_debug_ports u_ila_0/probe75]
connect_debug_port u_ila_0/probe75 [get_nets [list {jadepix_ctrl_wrapper/jadepix_ctrl/gs_pulse_delay_counter[0]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_pulse_delay_counter[1]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_pulse_delay_counter[2]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_pulse_delay_counter[3]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_pulse_delay_counter[4]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_pulse_delay_counter[5]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_pulse_delay_counter[6]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_pulse_delay_counter[7]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_pulse_delay_counter[8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe76]
set_property port_width 9 [get_debug_ports u_ila_0/probe76]
connect_debug_port u_ila_0/probe76 [get_nets [list {jadepix_ctrl_wrapper/jadepix_ctrl/gs_pulse_delay_cnt[0]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_pulse_delay_cnt[1]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_pulse_delay_cnt[2]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_pulse_delay_cnt[3]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_pulse_delay_cnt[4]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_pulse_delay_cnt[5]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_pulse_delay_cnt[6]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_pulse_delay_cnt[7]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_pulse_delay_cnt[8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe77]
set_property port_width 9 [get_debug_ports u_ila_0/probe77]
connect_debug_port u_ila_0/probe77 [get_nets [list {jadepix_ctrl_wrapper/jadepix_ctrl/gs_pulse_deassert_counter[0]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_pulse_deassert_counter[1]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_pulse_deassert_counter[2]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_pulse_deassert_counter[3]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_pulse_deassert_counter[4]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_pulse_deassert_counter[5]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_pulse_deassert_counter[6]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_pulse_deassert_counter[7]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_pulse_deassert_counter[8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe78]
set_property port_width 9 [get_debug_ports u_ila_0/probe78]
connect_debug_port u_ila_0/probe78 [get_nets [list {jadepix_ctrl_wrapper/jadepix_ctrl/gs_pulse_deassert_cnt[0]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_pulse_deassert_cnt[1]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_pulse_deassert_cnt[2]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_pulse_deassert_cnt[3]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_pulse_deassert_cnt[4]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_pulse_deassert_cnt[5]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_pulse_deassert_cnt[6]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_pulse_deassert_cnt[7]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_pulse_deassert_cnt[8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe79]
set_property port_width 9 [get_debug_ports u_ila_0/probe79]
connect_debug_port u_ila_0/probe79 [get_nets [list {jadepix_ctrl_wrapper/jadepix_ctrl/gs_deassert_counter[0]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_deassert_counter[1]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_deassert_counter[2]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_deassert_counter[3]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_deassert_counter[4]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_deassert_counter[5]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_deassert_counter[6]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_deassert_counter[7]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_deassert_counter[8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe80]
set_property port_width 9 [get_debug_ports u_ila_0/probe80]
connect_debug_port u_ila_0/probe80 [get_nets [list {jadepix_ctrl_wrapper/jadepix_ctrl/gs_deassert_cnt[0]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_deassert_cnt[1]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_deassert_cnt[2]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_deassert_cnt[3]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_deassert_cnt[4]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_deassert_cnt[5]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_deassert_cnt[6]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_deassert_cnt[7]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_deassert_cnt[8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe81]
set_property port_width 9 [get_debug_ports u_ila_0/probe81]
connect_debug_port u_ila_0/probe81 [get_nets [list {jadepix_ctrl_wrapper/jadepix_ctrl/gs_col[0]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_col[1]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_col[2]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_col[3]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_col[4]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_col[5]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_col[6]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_col[7]} {jadepix_ctrl_wrapper/jadepix_ctrl/gs_col[8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe82]
set_property port_width 3 [get_debug_ports u_ila_0/probe82]
connect_debug_port u_ila_0/probe82 [get_nets [list {jadepix_ctrl_wrapper/jadepix_ctrl/cfg_sync[din][0]} {jadepix_ctrl_wrapper/jadepix_ctrl/cfg_sync[din][1]} {jadepix_ctrl_wrapper/jadepix_ctrl/cfg_sync[din][2]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe83]
set_property port_width 9 [get_debug_ports u_ila_0/probe83]
connect_debug_port u_ila_0/probe83 [get_nets [list {jadepix_ctrl_wrapper/jadepix_ctrl/RA[0]} {jadepix_ctrl_wrapper/jadepix_ctrl/RA[1]} {jadepix_ctrl_wrapper/jadepix_ctrl/RA[2]} {jadepix_ctrl_wrapper/jadepix_ctrl/RA[3]} {jadepix_ctrl_wrapper/jadepix_ctrl/RA[4]} {jadepix_ctrl_wrapper/jadepix_ctrl/RA[5]} {jadepix_ctrl_wrapper/jadepix_ctrl/RA[6]} {jadepix_ctrl_wrapper/jadepix_ctrl/RA[7]} {jadepix_ctrl_wrapper/jadepix_ctrl/RA[8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe84]
set_property port_width 17 [get_debug_ports u_ila_0/probe84]
connect_debug_port u_ila_0/probe84 [get_nets [list {jadepix_ctrl_wrapper/jadepix_ctrl/cfg_fifo_count[0]} {jadepix_ctrl_wrapper/jadepix_ctrl/cfg_fifo_count[1]} {jadepix_ctrl_wrapper/jadepix_ctrl/cfg_fifo_count[2]} {jadepix_ctrl_wrapper/jadepix_ctrl/cfg_fifo_count[3]} {jadepix_ctrl_wrapper/jadepix_ctrl/cfg_fifo_count[4]} {jadepix_ctrl_wrapper/jadepix_ctrl/cfg_fifo_count[5]} {jadepix_ctrl_wrapper/jadepix_ctrl/cfg_fifo_count[6]} {jadepix_ctrl_wrapper/jadepix_ctrl/cfg_fifo_count[7]} {jadepix_ctrl_wrapper/jadepix_ctrl/cfg_fifo_count[8]} {jadepix_ctrl_wrapper/jadepix_ctrl/cfg_fifo_count[9]} {jadepix_ctrl_wrapper/jadepix_ctrl/cfg_fifo_count[10]} {jadepix_ctrl_wrapper/jadepix_ctrl/cfg_fifo_count[11]} {jadepix_ctrl_wrapper/jadepix_ctrl/cfg_fifo_count[12]} {jadepix_ctrl_wrapper/jadepix_ctrl/cfg_fifo_count[13]} {jadepix_ctrl_wrapper/jadepix_ctrl/cfg_fifo_count[14]} {jadepix_ctrl_wrapper/jadepix_ctrl/cfg_fifo_count[15]} {jadepix_ctrl_wrapper/jadepix_ctrl/cfg_fifo_count[16]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe85]
set_property port_width 3 [get_debug_ports u_ila_0/probe85]
connect_debug_port u_ila_0/probe85 [get_nets [list {jadepix_ctrl_wrapper/jadepix_ctrl/cfg_dout[0]} {jadepix_ctrl_wrapper/jadepix_ctrl/cfg_dout[1]} {jadepix_ctrl_wrapper/jadepix_ctrl/cfg_dout[2]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe86]
set_property port_width 20 [get_debug_ports u_ila_0/probe86]
connect_debug_port u_ila_0/probe86 [get_nets [list {jadepix_ctrl_wrapper/jadepix_ctrl/cfg_cnt[0]} {jadepix_ctrl_wrapper/jadepix_ctrl/cfg_cnt[1]} {jadepix_ctrl_wrapper/jadepix_ctrl/cfg_cnt[2]} {jadepix_ctrl_wrapper/jadepix_ctrl/cfg_cnt[3]} {jadepix_ctrl_wrapper/jadepix_ctrl/cfg_cnt[4]} {jadepix_ctrl_wrapper/jadepix_ctrl/cfg_cnt[5]} {jadepix_ctrl_wrapper/jadepix_ctrl/cfg_cnt[6]} {jadepix_ctrl_wrapper/jadepix_ctrl/cfg_cnt[7]} {jadepix_ctrl_wrapper/jadepix_ctrl/cfg_cnt[8]} {jadepix_ctrl_wrapper/jadepix_ctrl/cfg_cnt[9]} {jadepix_ctrl_wrapper/jadepix_ctrl/cfg_cnt[10]} {jadepix_ctrl_wrapper/jadepix_ctrl/cfg_cnt[11]} {jadepix_ctrl_wrapper/jadepix_ctrl/cfg_cnt[12]} {jadepix_ctrl_wrapper/jadepix_ctrl/cfg_cnt[13]} {jadepix_ctrl_wrapper/jadepix_ctrl/cfg_cnt[14]} {jadepix_ctrl_wrapper/jadepix_ctrl/cfg_cnt[15]} {jadepix_ctrl_wrapper/jadepix_ctrl/cfg_cnt[16]} {jadepix_ctrl_wrapper/jadepix_ctrl/cfg_cnt[17]} {jadepix_ctrl_wrapper/jadepix_ctrl/cfg_cnt[18]} {jadepix_ctrl_wrapper/jadepix_ctrl/cfg_cnt[19]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe87]
set_property port_width 9 [get_debug_ports u_ila_0/probe87]
connect_debug_port u_ila_0/probe87 [get_nets [list {jadepix_ctrl_wrapper/jadepix_ctrl/CA[0]} {jadepix_ctrl_wrapper/jadepix_ctrl/CA[1]} {jadepix_ctrl_wrapper/jadepix_ctrl/CA[2]} {jadepix_ctrl_wrapper/jadepix_ctrl/CA[3]} {jadepix_ctrl_wrapper/jadepix_ctrl/CA[4]} {jadepix_ctrl_wrapper/jadepix_ctrl/CA[5]} {jadepix_ctrl_wrapper/jadepix_ctrl/CA[6]} {jadepix_ctrl_wrapper/jadepix_ctrl/CA[7]} {jadepix_ctrl_wrapper/jadepix_ctrl/CA[8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe88]
set_property port_width 16 [get_debug_ports u_ila_0/probe88]
connect_debug_port u_ila_0/probe88 [get_nets [list {hitmap_r[0]} {hitmap_r[1]} {hitmap_r[2]} {hitmap_r[3]} {hitmap_r[4]} {hitmap_r[5]} {hitmap_r[6]} {hitmap_r[7]} {hitmap_r[8]} {hitmap_r[9]} {hitmap_r[10]} {hitmap_r[11]} {hitmap_r[12]} {hitmap_r[13]} {hitmap_r[14]} {hitmap_r[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe89]
set_property port_width 9 [get_debug_ports u_ila_0/probe89]
connect_debug_port u_ila_0/probe89 [get_nets [list {ca_soft[0]} {ca_soft[1]} {ca_soft[2]} {ca_soft[3]} {ca_soft[4]} {ca_soft[5]} {ca_soft[6]} {ca_soft[7]} {ca_soft[8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe90]
set_property port_width 9 [get_debug_ports u_ila_0/probe90]
connect_debug_port u_ila_0/probe90 [get_nets [list {ca_logic[0]} {ca_logic[1]} {ca_logic[2]} {ca_logic[3]} {ca_logic[4]} {ca_logic[5]} {ca_logic[6]} {ca_logic[7]} {ca_logic[8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe91]
set_property port_width 32 [get_debug_ports u_ila_0/probe91]
connect_debug_port u_ila_0/probe91 [get_nets [list {ipbus_payload/slave3/rfifo_wr_din[0]} {ipbus_payload/slave3/rfifo_wr_din[1]} {ipbus_payload/slave3/rfifo_wr_din[2]} {ipbus_payload/slave3/rfifo_wr_din[3]} {ipbus_payload/slave3/rfifo_wr_din[4]} {ipbus_payload/slave3/rfifo_wr_din[5]} {ipbus_payload/slave3/rfifo_wr_din[6]} {ipbus_payload/slave3/rfifo_wr_din[7]} {ipbus_payload/slave3/rfifo_wr_din[8]} {ipbus_payload/slave3/rfifo_wr_din[9]} {ipbus_payload/slave3/rfifo_wr_din[10]} {ipbus_payload/slave3/rfifo_wr_din[11]} {ipbus_payload/slave3/rfifo_wr_din[12]} {ipbus_payload/slave3/rfifo_wr_din[13]} {ipbus_payload/slave3/rfifo_wr_din[14]} {ipbus_payload/slave3/rfifo_wr_din[15]} {ipbus_payload/slave3/rfifo_wr_din[16]} {ipbus_payload/slave3/rfifo_wr_din[17]} {ipbus_payload/slave3/rfifo_wr_din[18]} {ipbus_payload/slave3/rfifo_wr_din[19]} {ipbus_payload/slave3/rfifo_wr_din[20]} {ipbus_payload/slave3/rfifo_wr_din[21]} {ipbus_payload/slave3/rfifo_wr_din[22]} {ipbus_payload/slave3/rfifo_wr_din[23]} {ipbus_payload/slave3/rfifo_wr_din[24]} {ipbus_payload/slave3/rfifo_wr_din[25]} {ipbus_payload/slave3/rfifo_wr_din[26]} {ipbus_payload/slave3/rfifo_wr_din[27]} {ipbus_payload/slave3/rfifo_wr_din[28]} {ipbus_payload/slave3/rfifo_wr_din[29]} {ipbus_payload/slave3/rfifo_wr_din[30]} {ipbus_payload/slave3/rfifo_wr_din[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe92]
set_property port_width 9 [get_debug_ports u_ila_0/probe92]
connect_debug_port u_ila_0/probe92 [get_nets [list {ipbus_payload/slave3/hitmap_col_low[0]} {ipbus_payload/slave3/hitmap_col_low[1]} {ipbus_payload/slave3/hitmap_col_low[2]} {ipbus_payload/slave3/hitmap_col_low[3]} {ipbus_payload/slave3/hitmap_col_low[4]} {ipbus_payload/slave3/hitmap_col_low[5]} {ipbus_payload/slave3/hitmap_col_low[6]} {ipbus_payload/slave3/hitmap_col_low[7]} {ipbus_payload/slave3/hitmap_col_low[8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe93]
set_property port_width 9 [get_debug_ports u_ila_0/probe93]
connect_debug_port u_ila_0/probe93 [get_nets [list {ipbus_payload/slave3/hitmap_col_high[0]} {ipbus_payload/slave3/hitmap_col_high[1]} {ipbus_payload/slave3/hitmap_col_high[2]} {ipbus_payload/slave3/hitmap_col_high[3]} {ipbus_payload/slave3/hitmap_col_high[4]} {ipbus_payload/slave3/hitmap_col_high[5]} {ipbus_payload/slave3/hitmap_col_high[6]} {ipbus_payload/slave3/hitmap_col_high[7]} {ipbus_payload/slave3/hitmap_col_high[8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe94]
set_property port_width 16 [get_debug_ports u_ila_0/probe94]
connect_debug_port u_ila_0/probe94 [get_nets [list {ipbus_payload/slave3/cfg_multi_factor_t1[0]} {ipbus_payload/slave3/cfg_multi_factor_t1[1]} {ipbus_payload/slave3/cfg_multi_factor_t1[2]} {ipbus_payload/slave3/cfg_multi_factor_t1[3]} {ipbus_payload/slave3/cfg_multi_factor_t1[4]} {ipbus_payload/slave3/cfg_multi_factor_t1[5]} {ipbus_payload/slave3/cfg_multi_factor_t1[6]} {ipbus_payload/slave3/cfg_multi_factor_t1[7]} {ipbus_payload/slave3/cfg_multi_factor_t1[8]} {ipbus_payload/slave3/cfg_multi_factor_t1[9]} {ipbus_payload/slave3/cfg_multi_factor_t1[10]} {ipbus_payload/slave3/cfg_multi_factor_t1[11]} {ipbus_payload/slave3/cfg_multi_factor_t1[12]} {ipbus_payload/slave3/cfg_multi_factor_t1[13]} {ipbus_payload/slave3/cfg_multi_factor_t1[14]} {ipbus_payload/slave3/cfg_multi_factor_t1[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe95]
set_property port_width 8 [get_debug_ports u_ila_0/probe95]
connect_debug_port u_ila_0/probe95 [get_nets [list {ipbus_payload/slave3/cfg_multi_factor_t0[0]} {ipbus_payload/slave3/cfg_multi_factor_t0[1]} {ipbus_payload/slave3/cfg_multi_factor_t0[2]} {ipbus_payload/slave3/cfg_multi_factor_t0[3]} {ipbus_payload/slave3/cfg_multi_factor_t0[4]} {ipbus_payload/slave3/cfg_multi_factor_t0[5]} {ipbus_payload/slave3/cfg_multi_factor_t0[6]} {ipbus_payload/slave3/cfg_multi_factor_t0[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe96]
set_property port_width 8 [get_debug_ports u_ila_0/probe96]
connect_debug_port u_ila_0/probe96 [get_nets [list {ipbus_payload/slave3/cfg_multi_factor_t2[0]} {ipbus_payload/slave3/cfg_multi_factor_t2[1]} {ipbus_payload/slave3/cfg_multi_factor_t2[2]} {ipbus_payload/slave3/cfg_multi_factor_t2[3]} {ipbus_payload/slave3/cfg_multi_factor_t2[4]} {ipbus_payload/slave3/cfg_multi_factor_t2[5]} {ipbus_payload/slave3/cfg_multi_factor_t2[6]} {ipbus_payload/slave3/cfg_multi_factor_t2[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe97]
set_property port_width 9 [get_debug_ports u_ila_0/probe97]
connect_debug_port u_ila_0/probe97 [get_nets [list {ipbus_payload/slave3/ca_soft[0]} {ipbus_payload/slave3/ca_soft[1]} {ipbus_payload/slave3/ca_soft[2]} {ipbus_payload/slave3/ca_soft[3]} {ipbus_payload/slave3/ca_soft[4]} {ipbus_payload/slave3/ca_soft[5]} {ipbus_payload/slave3/ca_soft[6]} {ipbus_payload/slave3/ca_soft[7]} {ipbus_payload/slave3/ca_soft[8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe98]
set_property port_width 2 [get_debug_ports u_ila_0/probe98]
connect_debug_port u_ila_0/probe98 [get_nets [list {ipbus_payload/slave3/blk_sel_def[0]} {ipbus_payload/slave3/blk_sel_def[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe99]
set_property port_width 4 [get_debug_ports u_ila_0/probe99]
connect_debug_port u_ila_0/probe99 [get_nets [list {ipbus_payload/slave3/CACHE_BIT_SET[0]} {ipbus_payload/slave3/CACHE_BIT_SET[1]} {ipbus_payload/slave3/CACHE_BIT_SET[2]} {ipbus_payload/slave3/CACHE_BIT_SET[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe100]
set_property port_width 1 [get_debug_ports u_ila_0/probe100]
connect_debug_port u_ila_0/probe100 [get_nets [list ANASEL_EN_OBUF]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe101]
set_property port_width 1 [get_debug_ports u_ila_0/probe101]
connect_debug_port u_ila_0/probe101 [get_nets [list anasel_en_soft]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe102]
set_property port_width 1 [get_debug_ports u_ila_0/probe102]
connect_debug_port u_ila_0/probe102 [get_nets [list ipbus_payload/slave3/anasel_en_soft]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe103]
set_property port_width 1 [get_debug_ports u_ila_0/probe103]
connect_debug_port u_ila_0/probe103 [get_nets [list jadepix_ctrl_wrapper/jadepix_ctrl/aplse_gs]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe104]
set_property port_width 1 [get_debug_ports u_ila_0/probe104]
connect_debug_port u_ila_0/probe104 [get_nets [list APLSE_OBUF]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe105]
set_property port_width 1 [get_debug_ports u_ila_0/probe105]
connect_debug_port u_ila_0/probe105 [get_nets [list aplse_soft]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe106]
set_property port_width 1 [get_debug_ports u_ila_0/probe106]
connect_debug_port u_ila_0/probe106 [get_nets [list jadepix_read_data/fifo_ctrl/buffer_data_valid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe107]
set_property port_width 1 [get_debug_ports u_ila_0/probe107]
connect_debug_port u_ila_0/probe107 [get_nets [list jadepix_read_data/fifo_ctrl/buffer_empty]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe108]
set_property port_width 1 [get_debug_ports u_ila_0/probe108]
connect_debug_port u_ila_0/probe108 [get_nets [list jadepix_read_data/fifo_ctrl/buffer_full]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe109]
set_property port_width 1 [get_debug_ports u_ila_0/probe109]
connect_debug_port u_ila_0/probe109 [get_nets [list jadepix_read_data/fifo_ctrl/buffer_read_en]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe110]
set_property port_width 1 [get_debug_ports u_ila_0/probe110]
connect_debug_port u_ila_0/probe110 [get_nets [list jadepix_ctrl_wrapper/jadepix_ctrl/CA_EN]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe111]
set_property port_width 1 [get_debug_ports u_ila_0/probe111]
connect_debug_port u_ila_0/probe111 [get_nets [list ipbus_payload/slave3/ca_en]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe112]
set_property port_width 1 [get_debug_ports u_ila_0/probe112]
connect_debug_port u_ila_0/probe112 [get_nets [list ca_en_logic]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe113]
set_property port_width 1 [get_debug_ports u_ila_0/probe113]
connect_debug_port u_ila_0/probe113 [get_nets [list CA_EN_OBUF]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe114]
set_property port_width 1 [get_debug_ports u_ila_0/probe114]
connect_debug_port u_ila_0/probe114 [get_nets [list ca_en_soft]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe115]
set_property port_width 1 [get_debug_ports u_ila_0/probe115]
connect_debug_port u_ila_0/probe115 [get_nets [list jadepix_ctrl_wrapper/jadepix_ctrl/cfg_busy]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe116]
set_property port_width 1 [get_debug_ports u_ila_0/probe116]
connect_debug_port u_ila_0/probe116 [get_nets [list jadepix_ctrl_wrapper/jadepix_ctrl/cfg_dout_valid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe117]
set_property port_width 1 [get_debug_ports u_ila_0/probe117]
connect_debug_port u_ila_0/probe117 [get_nets [list jadepix_ctrl_wrapper/jadepix_ctrl/cfg_fifo_empty]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe118]
set_property port_width 1 [get_debug_ports u_ila_0/probe118]
connect_debug_port u_ila_0/probe118 [get_nets [list jadepix_ctrl_wrapper/jadepix_ctrl/cfg_fifo_pfull]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe119]
set_property port_width 1 [get_debug_ports u_ila_0/probe119]
connect_debug_port u_ila_0/probe119 [get_nets [list jadepix_ctrl_wrapper/jadepix_ctrl/cfg_rd_en]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe120]
set_property port_width 1 [get_debug_ports u_ila_0/probe120]
connect_debug_port u_ila_0/probe120 [get_nets [list jadepix_ctrl_wrapper/jadepix_ctrl/cfg_start]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe121]
set_property port_width 1 [get_debug_ports u_ila_0/probe121]
connect_debug_port u_ila_0/probe121 [get_nets [list {jadepix_ctrl_wrapper/jadepix_ctrl/cfg_sync[wr_en]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe122]
set_property port_width 1 [get_debug_ports u_ila_0/probe122]
connect_debug_port u_ila_0/probe122 [get_nets [list jadepix_read_data/clk_cache]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe123]
set_property port_width 1 [get_debug_ports u_ila_0/probe123]
connect_debug_port u_ila_0/probe123 [get_nets [list jadepix_read_data/clk_cache_delay]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe124]
set_property port_width 1 [get_debug_ports u_ila_0/probe124]
connect_debug_port u_ila_0/probe124 [get_nets [list ipbus_payload/slave3/CLK_SEL]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe125]
set_property port_width 1 [get_debug_ports u_ila_0/probe125]
connect_debug_port u_ila_0/probe125 [get_nets [list jadepix_ctrl_wrapper/jadepix_ctrl/CON_DATA]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe126]
set_property port_width 1 [get_debug_ports u_ila_0/probe126]
connect_debug_port u_ila_0/probe126 [get_nets [list jadepix_ctrl_wrapper/jadepix_ctrl/CON_SELM]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe127]
set_property port_width 1 [get_debug_ports u_ila_0/probe127]
connect_debug_port u_ila_0/probe127 [get_nets [list jadepix_ctrl_wrapper/jadepix_ctrl/CON_SELP]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe128]
set_property port_width 1 [get_debug_ports u_ila_0/probe128]
connect_debug_port u_ila_0/probe128 [get_nets [list ipbus_payload/slave3/D_RST]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe129]
set_property port_width 1 [get_debug_ports u_ila_0/probe129]
connect_debug_port u_ila_0/probe129 [get_nets [list jadepix_read_data/fifo_data/data_fifo_almost_full]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe130]
set_property port_width 1 [get_debug_ports u_ila_0/probe130]
connect_debug_port u_ila_0/probe130 [get_nets [list jadepix_read_data/data_fifo_full]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe131]
set_property port_width 1 [get_debug_ports u_ila_0/probe131]
connect_debug_port u_ila_0/probe131 [get_nets [list jadepix_read_data/fifo_data/data_fifo_full]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe132]
set_property port_width 1 [get_debug_ports u_ila_0/probe132]
connect_debug_port u_ila_0/probe132 [get_nets [list jadepix_read_data/data_fifo_rst]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe133]
set_property port_width 1 [get_debug_ports u_ila_0/probe133]
connect_debug_port u_ila_0/probe133 [get_nets [list jadepix_read_data/fifo_data/data_fifo_rst]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe134]
set_property port_width 1 [get_debug_ports u_ila_0/probe134]
connect_debug_port u_ila_0/probe134 [get_nets [list jadepix_read_data/fifo_data/data_fifo_wr_en]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe135]
set_property port_width 1 [get_debug_ports u_ila_0/probe135]
connect_debug_port u_ila_0/probe135 [get_nets [list jadepix_read_data/data_fifo_wr_en]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe136]
set_property port_width 1 [get_debug_ports u_ila_0/probe136]
connect_debug_port u_ila_0/probe136 [get_nets [list ipbus_payload/slave3/debug]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe137]
set_property port_width 1 [get_debug_ports u_ila_0/probe137]
connect_debug_port u_ila_0/probe137 [get_nets [list debug]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe138]
set_property port_width 1 [get_debug_ports u_ila_0/probe138]
connect_debug_port u_ila_0/probe138 [get_nets [list DIGSEL_EN_OBUF]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe139]
set_property port_width 1 [get_debug_ports u_ila_0/probe139]
connect_debug_port u_ila_0/probe139 [get_nets [list ipbus_payload/slave3/digsel_en_soft]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe140]
set_property port_width 1 [get_debug_ports u_ila_0/probe140]
connect_debug_port u_ila_0/probe140 [get_nets [list digsel_en_soft]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe141]
set_property port_width 1 [get_debug_ports u_ila_0/probe141]
connect_debug_port u_ila_0/probe141 [get_nets [list jadepix_ctrl_wrapper/jadepix_ctrl/dplse_gs]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe142]
set_property port_width 1 [get_debug_ports u_ila_0/probe142]
connect_debug_port u_ila_0/probe142 [get_nets [list DPLSE_OBUF]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe143]
set_property port_width 1 [get_debug_ports u_ila_0/probe143]
connect_debug_port u_ila_0/probe143 [get_nets [list dplse_soft]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe144]
set_property port_width 1 [get_debug_ports u_ila_0/probe144]
connect_debug_port u_ila_0/probe144 [get_nets [list ipbus_payload/slave3/EN_diff]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe145]
set_property port_width 1 [get_debug_ports u_ila_0/probe145]
connect_debug_port u_ila_0/probe145 [get_nets [list jadepix_read_data/fifo_data/fifo_data_valid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe146]
set_property port_width 1 [get_debug_ports u_ila_0/probe146]
connect_debug_port u_ila_0/probe146 [get_nets [list jadepix_read_data/fabric_sector/fifo_data_valid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe147]
set_property port_width 1 [get_debug_ports u_ila_0/probe147]
connect_debug_port u_ila_0/probe147 [get_nets [list FIFO_READ_EN_OBUF]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe148]
set_property port_width 1 [get_debug_ports u_ila_0/probe148]
connect_debug_port u_ila_0/probe148 [get_nets [list jadepix_ctrl_wrapper/jadepix_ctrl/fifo_rst]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe149]
set_property port_width 1 [get_debug_ports u_ila_0/probe149]
connect_debug_port u_ila_0/probe149 [get_nets [list jadepix_ctrl_wrapper/jadepix_ctrl/gs_busy]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe150]
set_property port_width 1 [get_debug_ports u_ila_0/probe150]
connect_debug_port u_ila_0/probe150 [get_nets [list ipbus_payload/slave3/gs_sel_pulse]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe151]
set_property port_width 1 [get_debug_ports u_ila_0/probe151]
connect_debug_port u_ila_0/probe151 [get_nets [list jadepix_ctrl_wrapper/jadepix_ctrl/gs_sel_pulse]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe152]
set_property port_width 1 [get_debug_ports u_ila_0/probe152]
connect_debug_port u_ila_0/probe152 [get_nets [list jadepix_ctrl_wrapper/jadepix_ctrl/gs_start]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe153]
set_property port_width 1 [get_debug_ports u_ila_0/probe153]
connect_debug_port u_ila_0/probe153 [get_nets [list jadepix_ctrl_wrapper/jadepix_ctrl/gshutter_gs]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe154]
set_property port_width 1 [get_debug_ports u_ila_0/probe154]
connect_debug_port u_ila_0/probe154 [get_nets [list GSHUTTER_OBUF]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe155]
set_property port_width 1 [get_debug_ports u_ila_0/probe155]
connect_debug_port u_ila_0/probe155 [get_nets [list jadepix_ctrl_wrapper/jadepix_ctrl/HIT_RST]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe156]
set_property port_width 1 [get_debug_ports u_ila_0/probe156]
connect_debug_port u_ila_0/probe156 [get_nets [list hit_rst_logic]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe157]
set_property port_width 1 [get_debug_ports u_ila_0/probe157]
connect_debug_port u_ila_0/probe157 [get_nets [list HIT_RST_OBUF]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe158]
set_property port_width 1 [get_debug_ports u_ila_0/probe158]
connect_debug_port u_ila_0/probe158 [get_nets [list hit_rst_soft]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe159]
set_property port_width 1 [get_debug_ports u_ila_0/probe159]
connect_debug_port u_ila_0/probe159 [get_nets [list ipbus_payload/slave3/hitmap_en]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe160]
set_property port_width 1 [get_debug_ports u_ila_0/probe160]
connect_debug_port u_ila_0/probe160 [get_nets [list jadepix_read_data/is_busy_cache]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe161]
set_property port_width 1 [get_debug_ports u_ila_0/probe161]
connect_debug_port u_ila_0/probe161 [get_nets [list ipbus_payload/slave3/load_soft]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe162]
set_property port_width 1 [get_debug_ports u_ila_0/probe162]
connect_debug_port u_ila_0/probe162 [get_nets [list ipbus_payload/slave3/PDB]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe163]
set_property port_width 1 [get_debug_ports u_ila_0/probe163]
connect_debug_port u_ila_0/probe163 [get_nets [list ipbus_payload/slave3/POR]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe164]
set_property port_width 1 [get_debug_ports u_ila_0/probe164]
connect_debug_port u_ila_0/probe164 [get_nets [list jadepix_ctrl_wrapper/jadepix_ctrl/pulse_out]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe165]
set_property port_width 1 [get_debug_ports u_ila_0/probe165]
connect_debug_port u_ila_0/probe165 [get_nets [list jadepix_ctrl_wrapper/jadepix_ctrl/RA_EN]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe166]
set_property port_width 1 [get_debug_ports u_ila_0/probe166]
connect_debug_port u_ila_0/probe166 [get_nets [list jadepix_ctrl_wrapper/jadepix_ctrl/RD_EN]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe167]
set_property port_width 1 [get_debug_ports u_ila_0/probe167]
connect_debug_port u_ila_0/probe167 [get_nets [list jadepix_read_data/fifo_data/read_frame_start]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe168]
set_property port_width 1 [get_debug_ports u_ila_0/probe168]
connect_debug_port u_ila_0/probe168 [get_nets [list jadepix_read_data/fifo_data/read_frame_stop]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe169]
set_property port_width 1 [get_debug_ports u_ila_0/probe169]
connect_debug_port u_ila_0/probe169 [get_nets [list ipbus_payload/slave3/Ref_clk_1G_f]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe170]
set_property port_width 1 [get_debug_ports u_ila_0/probe170]
connect_debug_port u_ila_0/probe170 [get_nets [list ipbus_payload/slave3/rfifo_almost_full]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe171]
set_property port_width 1 [get_debug_ports u_ila_0/probe171]
connect_debug_port u_ila_0/probe171 [get_nets [list ipbus_payload/slave3/rfifo_full]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe172]
set_property port_width 1 [get_debug_ports u_ila_0/probe172]
connect_debug_port u_ila_0/probe172 [get_nets [list ipbus_payload/slave3/rfifo_wr_en]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe173]
set_property port_width 1 [get_debug_ports u_ila_0/probe173]
connect_debug_port u_ila_0/probe173 [get_nets [list jadepix_ctrl_wrapper/jadepix_ctrl/rs_busy]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe174]
set_property port_width 1 [get_debug_ports u_ila_0/probe174]
connect_debug_port u_ila_0/probe174 [get_nets [list jadepix_ctrl_wrapper/jadepix_ctrl/rs_start]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe175]
set_property port_width 1 [get_debug_ports u_ila_0/probe175]
connect_debug_port u_ila_0/probe175 [get_nets [list sel_chip_clk]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe176]
set_property port_width 1 [get_debug_ports u_ila_0/probe176]
connect_debug_port u_ila_0/probe176 [get_nets [list ipbus_payload/slave3/SERIALIZER_RST]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe177]
set_property port_width 1 [get_debug_ports u_ila_0/probe177]
connect_debug_port u_ila_0/probe177 [get_nets [list ipbus_payload/slave3/SN_OEn]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe178]
set_property port_width 1 [get_debug_ports u_ila_0/probe178]
connect_debug_port u_ila_0/probe178 [get_nets [list ipbus_payload/slave3/spi_rst]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe179]
set_property port_width 1 [get_debug_ports u_ila_0/probe179]
connect_debug_port u_ila_0/probe179 [get_nets [list jadepix_read_data/start_cache]]
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
connect_debug_port u_ila_1/clk [get_nets [list jadepix_clocks/clk_fpga]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe0]
set_property port_width 4 [get_debug_ports u_ila_1/probe0]
connect_debug_port u_ila_1/probe0 [get_nets [list {jadepix_read_data/VALID_IN[0]} {jadepix_read_data/VALID_IN[1]} {jadepix_read_data/VALID_IN[2]} {jadepix_read_data/VALID_IN[3]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe1]
set_property port_width 5 [get_debug_ports u_ila_1/probe1]
connect_debug_port u_ila_1/probe1 [get_nets [list {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[1].fifo_monitor_index/valid_num[0]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[1].fifo_monitor_index/valid_num[1]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[1].fifo_monitor_index/valid_num[2]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[1].fifo_monitor_index/valid_num[3]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[1].fifo_monitor_index/valid_num[4]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe2]
set_property port_width 5 [get_debug_ports u_ila_1/probe2]
connect_debug_port u_ila_1/probe2 [get_nets [list {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[1].fifo_monitor_index/valid_cnt[0]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[1].fifo_monitor_index/valid_cnt[1]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[1].fifo_monitor_index/valid_cnt[2]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[1].fifo_monitor_index/valid_cnt[3]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[1].fifo_monitor_index/valid_cnt[4]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe3]
set_property port_width 3 [get_debug_ports u_ila_1/probe3]
connect_debug_port u_ila_1/probe3 [get_nets [list {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[1].fifo_monitor_index/state_reg[0]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[1].fifo_monitor_index/state_reg[1]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[1].fifo_monitor_index/state_reg[2]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe4]
set_property port_width 3 [get_debug_ports u_ila_1/probe4]
connect_debug_port u_ila_1/probe4 [get_nets [list {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[1].fifo_monitor_index/state_next[0]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[1].fifo_monitor_index/state_next[1]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[1].fifo_monitor_index/state_next[2]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe5]
set_property port_width 5 [get_debug_ports u_ila_1/probe5]
connect_debug_port u_ila_1/probe5 [get_nets [list {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[1].fifo_monitor_index/overflow_num[0]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[1].fifo_monitor_index/overflow_num[1]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[1].fifo_monitor_index/overflow_num[2]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[1].fifo_monitor_index/overflow_num[3]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[1].fifo_monitor_index/overflow_num[4]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe6]
set_property port_width 5 [get_debug_ports u_ila_1/probe6]
connect_debug_port u_ila_1/probe6 [get_nets [list {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[1].fifo_monitor_index/overflow_cnt[0]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[1].fifo_monitor_index/overflow_cnt[1]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[1].fifo_monitor_index/overflow_cnt[2]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[1].fifo_monitor_index/overflow_cnt[3]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[1].fifo_monitor_index/overflow_cnt[4]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe7]
set_property port_width 6 [get_debug_ports u_ila_1/probe7]
connect_debug_port u_ila_1/probe7 [get_nets [list {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[1].fifo_monitor_index/fifo_cnt[0]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[1].fifo_monitor_index/fifo_cnt[1]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[1].fifo_monitor_index/fifo_cnt[2]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[1].fifo_monitor_index/fifo_cnt[3]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[1].fifo_monitor_index/fifo_cnt[4]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[1].fifo_monitor_index/fifo_cnt[5]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe8]
set_property port_width 5 [get_debug_ports u_ila_1/probe8]
connect_debug_port u_ila_1/probe8 [get_nets [list {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[2].fifo_monitor_index/valid_num[0]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[2].fifo_monitor_index/valid_num[1]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[2].fifo_monitor_index/valid_num[2]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[2].fifo_monitor_index/valid_num[3]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[2].fifo_monitor_index/valid_num[4]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe9]
set_property port_width 5 [get_debug_ports u_ila_1/probe9]
connect_debug_port u_ila_1/probe9 [get_nets [list {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[2].fifo_monitor_index/valid_cnt[0]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[2].fifo_monitor_index/valid_cnt[1]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[2].fifo_monitor_index/valid_cnt[2]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[2].fifo_monitor_index/valid_cnt[3]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[2].fifo_monitor_index/valid_cnt[4]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe10]
set_property port_width 5 [get_debug_ports u_ila_1/probe10]
connect_debug_port u_ila_1/probe10 [get_nets [list {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[2].fifo_monitor_index/overflow_num[0]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[2].fifo_monitor_index/overflow_num[1]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[2].fifo_monitor_index/overflow_num[2]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[2].fifo_monitor_index/overflow_num[3]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[2].fifo_monitor_index/overflow_num[4]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe11]
set_property port_width 3 [get_debug_ports u_ila_1/probe11]
connect_debug_port u_ila_1/probe11 [get_nets [list {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[2].fifo_monitor_index/state_reg[0]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[2].fifo_monitor_index/state_reg[1]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[2].fifo_monitor_index/state_reg[2]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe12]
set_property port_width 3 [get_debug_ports u_ila_1/probe12]
connect_debug_port u_ila_1/probe12 [get_nets [list {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[2].fifo_monitor_index/state_next[0]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[2].fifo_monitor_index/state_next[1]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[2].fifo_monitor_index/state_next[2]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe13]
set_property port_width 5 [get_debug_ports u_ila_1/probe13]
connect_debug_port u_ila_1/probe13 [get_nets [list {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[2].fifo_monitor_index/overflow_cnt[0]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[2].fifo_monitor_index/overflow_cnt[1]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[2].fifo_monitor_index/overflow_cnt[2]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[2].fifo_monitor_index/overflow_cnt[3]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[2].fifo_monitor_index/overflow_cnt[4]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe14]
set_property port_width 6 [get_debug_ports u_ila_1/probe14]
connect_debug_port u_ila_1/probe14 [get_nets [list {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[2].fifo_monitor_index/fifo_cnt[0]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[2].fifo_monitor_index/fifo_cnt[1]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[2].fifo_monitor_index/fifo_cnt[2]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[2].fifo_monitor_index/fifo_cnt[3]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[2].fifo_monitor_index/fifo_cnt[4]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[2].fifo_monitor_index/fifo_cnt[5]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe15]
set_property port_width 5 [get_debug_ports u_ila_1/probe15]
connect_debug_port u_ila_1/probe15 [get_nets [list {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[3].fifo_monitor_index/valid_num[0]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[3].fifo_monitor_index/valid_num[1]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[3].fifo_monitor_index/valid_num[2]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[3].fifo_monitor_index/valid_num[3]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[3].fifo_monitor_index/valid_num[4]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe16]
set_property port_width 5 [get_debug_ports u_ila_1/probe16]
connect_debug_port u_ila_1/probe16 [get_nets [list {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[3].fifo_monitor_index/valid_cnt[0]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[3].fifo_monitor_index/valid_cnt[1]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[3].fifo_monitor_index/valid_cnt[2]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[3].fifo_monitor_index/valid_cnt[3]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[3].fifo_monitor_index/valid_cnt[4]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe17]
set_property port_width 3 [get_debug_ports u_ila_1/probe17]
connect_debug_port u_ila_1/probe17 [get_nets [list {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[3].fifo_monitor_index/state_reg[0]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[3].fifo_monitor_index/state_reg[1]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[3].fifo_monitor_index/state_reg[2]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe18]
set_property port_width 3 [get_debug_ports u_ila_1/probe18]
connect_debug_port u_ila_1/probe18 [get_nets [list {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[3].fifo_monitor_index/state_next[0]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[3].fifo_monitor_index/state_next[1]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[3].fifo_monitor_index/state_next[2]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe19]
set_property port_width 5 [get_debug_ports u_ila_1/probe19]
connect_debug_port u_ila_1/probe19 [get_nets [list {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[3].fifo_monitor_index/overflow_num[0]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[3].fifo_monitor_index/overflow_num[1]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[3].fifo_monitor_index/overflow_num[2]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[3].fifo_monitor_index/overflow_num[3]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[3].fifo_monitor_index/overflow_num[4]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe20]
set_property port_width 5 [get_debug_ports u_ila_1/probe20]
connect_debug_port u_ila_1/probe20 [get_nets [list {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[3].fifo_monitor_index/overflow_cnt[0]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[3].fifo_monitor_index/overflow_cnt[1]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[3].fifo_monitor_index/overflow_cnt[2]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[3].fifo_monitor_index/overflow_cnt[3]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[3].fifo_monitor_index/overflow_cnt[4]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe21]
set_property port_width 6 [get_debug_ports u_ila_1/probe21]
connect_debug_port u_ila_1/probe21 [get_nets [list {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[3].fifo_monitor_index/fifo_cnt[0]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[3].fifo_monitor_index/fifo_cnt[1]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[3].fifo_monitor_index/fifo_cnt[2]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[3].fifo_monitor_index/fifo_cnt[3]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[3].fifo_monitor_index/fifo_cnt[4]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[3].fifo_monitor_index/fifo_cnt[5]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe22]
set_property port_width 5 [get_debug_ports u_ila_1/probe22]
connect_debug_port u_ila_1/probe22 [get_nets [list {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[0].fifo_monitor_index/valid_num[0]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[0].fifo_monitor_index/valid_num[1]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[0].fifo_monitor_index/valid_num[2]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[0].fifo_monitor_index/valid_num[3]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[0].fifo_monitor_index/valid_num[4]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe23]
set_property port_width 5 [get_debug_ports u_ila_1/probe23]
connect_debug_port u_ila_1/probe23 [get_nets [list {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[0].fifo_monitor_index/valid_cnt[0]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[0].fifo_monitor_index/valid_cnt[1]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[0].fifo_monitor_index/valid_cnt[2]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[0].fifo_monitor_index/valid_cnt[3]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[0].fifo_monitor_index/valid_cnt[4]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe24]
set_property port_width 3 [get_debug_ports u_ila_1/probe24]
connect_debug_port u_ila_1/probe24 [get_nets [list {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[0].fifo_monitor_index/state_reg[0]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[0].fifo_monitor_index/state_reg[1]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[0].fifo_monitor_index/state_reg[2]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe25]
set_property port_width 3 [get_debug_ports u_ila_1/probe25]
connect_debug_port u_ila_1/probe25 [get_nets [list {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[0].fifo_monitor_index/state_next[0]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[0].fifo_monitor_index/state_next[1]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[0].fifo_monitor_index/state_next[2]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe26]
set_property port_width 5 [get_debug_ports u_ila_1/probe26]
connect_debug_port u_ila_1/probe26 [get_nets [list {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[0].fifo_monitor_index/overflow_num[0]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[0].fifo_monitor_index/overflow_num[1]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[0].fifo_monitor_index/overflow_num[2]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[0].fifo_monitor_index/overflow_num[3]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[0].fifo_monitor_index/overflow_num[4]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe27]
set_property port_width 5 [get_debug_ports u_ila_1/probe27]
connect_debug_port u_ila_1/probe27 [get_nets [list {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[0].fifo_monitor_index/overflow_cnt[0]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[0].fifo_monitor_index/overflow_cnt[1]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[0].fifo_monitor_index/overflow_cnt[2]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[0].fifo_monitor_index/overflow_cnt[3]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[0].fifo_monitor_index/overflow_cnt[4]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe28]
set_property port_width 6 [get_debug_ports u_ila_1/probe28]
connect_debug_port u_ila_1/probe28 [get_nets [list {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[0].fifo_monitor_index/fifo_cnt[0]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[0].fifo_monitor_index/fifo_cnt[1]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[0].fifo_monitor_index/fifo_cnt[2]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[0].fifo_monitor_index/fifo_cnt[3]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[0].fifo_monitor_index/fifo_cnt[4]} {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[0].fifo_monitor_index/fifo_cnt[5]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe29]
set_property port_width 4 [get_debug_ports u_ila_1/probe29]
connect_debug_port u_ila_1/probe29 [get_nets [list {VALID_IN_IBUF[0]} {VALID_IN_IBUF[1]} {VALID_IN_IBUF[2]} {VALID_IN_IBUF[3]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe30]
set_property port_width 1 [get_debug_ports u_ila_1/probe30]
connect_debug_port u_ila_1/probe30 [get_nets [list {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[0].fifo_monitor_index/fifo_read_cnt}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe31]
set_property port_width 1 [get_debug_ports u_ila_1/probe31]
connect_debug_port u_ila_1/probe31 [get_nets [list {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[2].fifo_monitor_index/fifo_read_cnt}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe32]
set_property port_width 1 [get_debug_ports u_ila_1/probe32]
connect_debug_port u_ila_1/probe32 [get_nets [list {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[1].fifo_monitor_index/fifo_read_cnt}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe33]
set_property port_width 1 [get_debug_ports u_ila_1/probe33]
connect_debug_port u_ila_1/probe33 [get_nets [list {jadepix_read_data/fifo_monitor_wrapper/fifo_monitor[3].fifo_monitor_index/fifo_read_cnt}]]
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
connect_debug_port u_ila_2/probe0 [get_nets [list {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_port[0]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_port[1]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_port[2]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_port[3]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_port[4]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_port[5]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_port[6]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_port[7]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_port[8]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_port[9]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_port[10]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_port[11]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_port[12]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_port[13]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_port[14]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_port[15]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_port[16]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_port[17]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_port[18]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_port[19]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_port[20]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_port[21]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_port[22]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_port[23]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_port[24]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_port[25]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_port[26]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_port[27]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_port[28]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_port[29]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_port[30]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_port[31]}]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe1]
set_property port_width 17 [get_debug_ports u_ila_2/probe1]
connect_debug_port u_ila_2/probe1 [get_nets [list {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_count[0]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_count[1]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_count[2]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_count[3]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_count[4]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_count[5]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_count[6]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_count[7]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_count[8]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_count[9]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_count[10]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_count[11]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_count[12]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_count[13]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_count[14]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_count[15]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_count[16]}]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe2]
set_property port_width 18 [get_debug_ports u_ila_2/probe2]
connect_debug_port u_ila_2/probe2 [get_nets [list {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/rd_data_count[0]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/rd_data_count[1]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/rd_data_count[2]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/rd_data_count[3]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/rd_data_count[4]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/rd_data_count[5]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/rd_data_count[6]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/rd_data_count[7]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/rd_data_count[8]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/rd_data_count[9]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/rd_data_count[10]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/rd_data_count[11]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/rd_data_count[12]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/rd_data_count[13]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/rd_data_count[14]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/rd_data_count[15]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/rd_data_count[16]} {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/rd_data_count[17]}]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe3]
set_property port_width 1 [get_debug_ports u_ila_2/probe3]
connect_debug_port u_ila_2/probe3 [get_nets [list {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/empty}]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe4]
set_property port_width 1 [get_debug_ports u_ila_2/probe4]
connect_debug_port u_ila_2/probe4 [get_nets [list {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/ipb_rd_ack}]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe5]
set_property port_width 1 [get_debug_ports u_ila_2/probe5]
connect_debug_port u_ila_2/probe5 [get_nets [list LOAD_OBUF]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe6]
set_property port_width 1 [get_debug_ports u_ila_2/probe6]
connect_debug_port u_ila_2/probe6 [get_nets [list {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/rd_addr_match}]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe7]
set_property port_width 1 [get_debug_ports u_ila_2/probe7]
connect_debug_port u_ila_2/probe7 [get_nets [list {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/rd_en}]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe8]
set_property port_width 1 [get_debug_ports u_ila_2/probe8]
connect_debug_port u_ila_2/probe8 [get_nets [list ipbus_payload/slave3/spi_busy]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe9]
set_property port_width 1 [get_debug_ports u_ila_2/probe9]
connect_debug_port u_ila_2/probe9 [get_nets [list {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid}]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe10]
set_property port_width 1 [get_debug_ports u_ila_2/probe10]
connect_debug_port u_ila_2/probe10 [get_nets [list {ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo.rfifo_gen[0].rfifo_i/valid_rdata_en}]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk_ipb]
