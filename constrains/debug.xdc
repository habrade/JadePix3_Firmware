





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
connect_debug_port u_ila_0/clk [get_nets [list jadepix_clocks/clk50M]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 32 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {dac70004/DATA_shift_register[0]} {dac70004/DATA_shift_register[1]} {dac70004/DATA_shift_register[2]} {dac70004/DATA_shift_register[3]} {dac70004/DATA_shift_register[4]} {dac70004/DATA_shift_register[5]} {dac70004/DATA_shift_register[6]} {dac70004/DATA_shift_register[7]} {dac70004/DATA_shift_register[8]} {dac70004/DATA_shift_register[9]} {dac70004/DATA_shift_register[10]} {dac70004/DATA_shift_register[11]} {dac70004/DATA_shift_register[12]} {dac70004/DATA_shift_register[13]} {dac70004/DATA_shift_register[14]} {dac70004/DATA_shift_register[15]} {dac70004/DATA_shift_register[16]} {dac70004/DATA_shift_register[17]} {dac70004/DATA_shift_register[18]} {dac70004/DATA_shift_register[19]} {dac70004/DATA_shift_register[20]} {dac70004/DATA_shift_register[21]} {dac70004/DATA_shift_register[22]} {dac70004/DATA_shift_register[23]} {dac70004/DATA_shift_register[24]} {dac70004/DATA_shift_register[25]} {dac70004/DATA_shift_register[26]} {dac70004/DATA_shift_register[27]} {dac70004/DATA_shift_register[28]} {dac70004/DATA_shift_register[29]} {dac70004/DATA_shift_register[30]} {dac70004/DATA_shift_register[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 2 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {dac70004/state[0]} {dac70004/state[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 32 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {DAC_DATA[0]} {DAC_DATA[1]} {DAC_DATA[2]} {DAC_DATA[3]} {DAC_DATA[4]} {DAC_DATA[5]} {DAC_DATA[6]} {DAC_DATA[7]} {DAC_DATA[8]} {DAC_DATA[9]} {DAC_DATA[10]} {DAC_DATA[11]} {DAC_DATA[12]} {DAC_DATA[13]} {DAC_DATA[14]} {DAC_DATA[15]} {DAC_DATA[16]} {DAC_DATA[17]} {DAC_DATA[18]} {DAC_DATA[19]} {DAC_DATA[20]} {DAC_DATA[21]} {DAC_DATA[22]} {DAC_DATA[23]} {DAC_DATA[24]} {DAC_DATA[25]} {DAC_DATA[26]} {DAC_DATA[27]} {DAC_DATA[28]} {DAC_DATA[29]} {DAC_DATA[30]} {DAC_DATA[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 5 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {dac70004/BS_cnt[0]} {dac70004/BS_cnt[1]} {dac70004/BS_cnt[2]} {dac70004/BS_cnt[3]} {dac70004/BS_cnt[4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 1 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list DAC_BUSY]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 1 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list dac70004/DAC_CLR_reg]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 1 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list dac70004/DAC_LOAD_reg]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 1 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list dac70004/DAC_SYNC_reg]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 1 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list DAC_WE]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 1 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list DACCLK]]
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
connect_debug_port u_ila_1/clk [get_nets [list ipbus_infra/clocks/mmcm_1]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe0]
set_property port_width 32 [get_debug_ports u_ila_1/probe0]
connect_debug_port u_ila_1/probe0 [get_nets [list {ipbus_payload/slave3/inst_ipbus_slave_reg_ram/inst_device_fabric/sel[0]} {ipbus_payload/slave3/inst_ipbus_slave_reg_ram/inst_device_fabric/sel[1]} {ipbus_payload/slave3/inst_ipbus_slave_reg_ram/inst_device_fabric/sel[2]} {ipbus_payload/slave3/inst_ipbus_slave_reg_ram/inst_device_fabric/sel[3]} {ipbus_payload/slave3/inst_ipbus_slave_reg_ram/inst_device_fabric/sel[4]} {ipbus_payload/slave3/inst_ipbus_slave_reg_ram/inst_device_fabric/sel[5]} {ipbus_payload/slave3/inst_ipbus_slave_reg_ram/inst_device_fabric/sel[6]} {ipbus_payload/slave3/inst_ipbus_slave_reg_ram/inst_device_fabric/sel[7]} {ipbus_payload/slave3/inst_ipbus_slave_reg_ram/inst_device_fabric/sel[8]} {ipbus_payload/slave3/inst_ipbus_slave_reg_ram/inst_device_fabric/sel[9]} {ipbus_payload/slave3/inst_ipbus_slave_reg_ram/inst_device_fabric/sel[10]} {ipbus_payload/slave3/inst_ipbus_slave_reg_ram/inst_device_fabric/sel[11]} {ipbus_payload/slave3/inst_ipbus_slave_reg_ram/inst_device_fabric/sel[12]} {ipbus_payload/slave3/inst_ipbus_slave_reg_ram/inst_device_fabric/sel[13]} {ipbus_payload/slave3/inst_ipbus_slave_reg_ram/inst_device_fabric/sel[14]} {ipbus_payload/slave3/inst_ipbus_slave_reg_ram/inst_device_fabric/sel[15]} {ipbus_payload/slave3/inst_ipbus_slave_reg_ram/inst_device_fabric/sel[16]} {ipbus_payload/slave3/inst_ipbus_slave_reg_ram/inst_device_fabric/sel[17]} {ipbus_payload/slave3/inst_ipbus_slave_reg_ram/inst_device_fabric/sel[18]} {ipbus_payload/slave3/inst_ipbus_slave_reg_ram/inst_device_fabric/sel[19]} {ipbus_payload/slave3/inst_ipbus_slave_reg_ram/inst_device_fabric/sel[20]} {ipbus_payload/slave3/inst_ipbus_slave_reg_ram/inst_device_fabric/sel[21]} {ipbus_payload/slave3/inst_ipbus_slave_reg_ram/inst_device_fabric/sel[22]} {ipbus_payload/slave3/inst_ipbus_slave_reg_ram/inst_device_fabric/sel[23]} {ipbus_payload/slave3/inst_ipbus_slave_reg_ram/inst_device_fabric/sel[24]} {ipbus_payload/slave3/inst_ipbus_slave_reg_ram/inst_device_fabric/sel[25]} {ipbus_payload/slave3/inst_ipbus_slave_reg_ram/inst_device_fabric/sel[26]} {ipbus_payload/slave3/inst_ipbus_slave_reg_ram/inst_device_fabric/sel[27]} {ipbus_payload/slave3/inst_ipbus_slave_reg_ram/inst_device_fabric/sel[28]} {ipbus_payload/slave3/inst_ipbus_slave_reg_ram/inst_device_fabric/sel[29]} {ipbus_payload/slave3/inst_ipbus_slave_reg_ram/inst_device_fabric/sel[30]} {ipbus_payload/slave3/inst_ipbus_slave_reg_ram/inst_device_fabric/sel[31]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe1]
set_property port_width 1 [get_debug_ports u_ila_1/probe1]
connect_debug_port u_ila_1/probe1 [get_nets [list {ipbus_payload/ss[0]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe2]
set_property port_width 32 [get_debug_ports u_ila_1/probe2]
connect_debug_port u_ila_1/probe2 [get_nets [list {ipb_out[ipb_wdata][0]} {ipb_out[ipb_wdata][1]} {ipb_out[ipb_wdata][2]} {ipb_out[ipb_wdata][3]} {ipb_out[ipb_wdata][4]} {ipb_out[ipb_wdata][5]} {ipb_out[ipb_wdata][6]} {ipb_out[ipb_wdata][7]} {ipb_out[ipb_wdata][8]} {ipb_out[ipb_wdata][9]} {ipb_out[ipb_wdata][10]} {ipb_out[ipb_wdata][11]} {ipb_out[ipb_wdata][12]} {ipb_out[ipb_wdata][13]} {ipb_out[ipb_wdata][14]} {ipb_out[ipb_wdata][15]} {ipb_out[ipb_wdata][16]} {ipb_out[ipb_wdata][17]} {ipb_out[ipb_wdata][18]} {ipb_out[ipb_wdata][19]} {ipb_out[ipb_wdata][20]} {ipb_out[ipb_wdata][21]} {ipb_out[ipb_wdata][22]} {ipb_out[ipb_wdata][23]} {ipb_out[ipb_wdata][24]} {ipb_out[ipb_wdata][25]} {ipb_out[ipb_wdata][26]} {ipb_out[ipb_wdata][27]} {ipb_out[ipb_wdata][28]} {ipb_out[ipb_wdata][29]} {ipb_out[ipb_wdata][30]} {ipb_out[ipb_wdata][31]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe3]
set_property port_width 32 [get_debug_ports u_ila_1/probe3]
connect_debug_port u_ila_1/probe3 [get_nets [list {ipb_out[ipb_addr][0]} {ipb_out[ipb_addr][1]} {ipb_out[ipb_addr][2]} {ipb_out[ipb_addr][3]} {ipb_out[ipb_addr][4]} {ipb_out[ipb_addr][5]} {ipb_out[ipb_addr][6]} {ipb_out[ipb_addr][7]} {ipb_out[ipb_addr][8]} {ipb_out[ipb_addr][9]} {ipb_out[ipb_addr][10]} {ipb_out[ipb_addr][11]} {ipb_out[ipb_addr][12]} {ipb_out[ipb_addr][13]} {ipb_out[ipb_addr][14]} {ipb_out[ipb_addr][15]} {ipb_out[ipb_addr][16]} {ipb_out[ipb_addr][17]} {ipb_out[ipb_addr][18]} {ipb_out[ipb_addr][19]} {ipb_out[ipb_addr][20]} {ipb_out[ipb_addr][21]} {ipb_out[ipb_addr][22]} {ipb_out[ipb_addr][23]} {ipb_out[ipb_addr][24]} {ipb_out[ipb_addr][25]} {ipb_out[ipb_addr][26]} {ipb_out[ipb_addr][27]} {ipb_out[ipb_addr][28]} {ipb_out[ipb_addr][29]} {ipb_out[ipb_addr][30]} {ipb_out[ipb_addr][31]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe4]
set_property port_width 32 [get_debug_ports u_ila_1/probe4]
connect_debug_port u_ila_1/probe4 [get_nets [list {ipb_in[ipb_rdata][0]} {ipb_in[ipb_rdata][1]} {ipb_in[ipb_rdata][2]} {ipb_in[ipb_rdata][3]} {ipb_in[ipb_rdata][4]} {ipb_in[ipb_rdata][5]} {ipb_in[ipb_rdata][6]} {ipb_in[ipb_rdata][7]} {ipb_in[ipb_rdata][8]} {ipb_in[ipb_rdata][9]} {ipb_in[ipb_rdata][10]} {ipb_in[ipb_rdata][11]} {ipb_in[ipb_rdata][12]} {ipb_in[ipb_rdata][13]} {ipb_in[ipb_rdata][14]} {ipb_in[ipb_rdata][15]} {ipb_in[ipb_rdata][16]} {ipb_in[ipb_rdata][17]} {ipb_in[ipb_rdata][18]} {ipb_in[ipb_rdata][19]} {ipb_in[ipb_rdata][20]} {ipb_in[ipb_rdata][21]} {ipb_in[ipb_rdata][22]} {ipb_in[ipb_rdata][23]} {ipb_in[ipb_rdata][24]} {ipb_in[ipb_rdata][25]} {ipb_in[ipb_rdata][26]} {ipb_in[ipb_rdata][27]} {ipb_in[ipb_rdata][28]} {ipb_in[ipb_rdata][29]} {ipb_in[ipb_rdata][30]} {ipb_in[ipb_rdata][31]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe5]
set_property port_width 1 [get_debug_ports u_ila_1/probe5]
connect_debug_port u_ila_1/probe5 [get_nets [list {ipb_in[ipb_ack]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe6]
set_property port_width 1 [get_debug_ports u_ila_1/probe6]
connect_debug_port u_ila_1/probe6 [get_nets [list {ipb_in[ipb_err]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe7]
set_property port_width 1 [get_debug_ports u_ila_1/probe7]
connect_debug_port u_ila_1/probe7 [get_nets [list {ipb_out[ipb_strobe]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe8]
set_property port_width 1 [get_debug_ports u_ila_1/probe8]
connect_debug_port u_ila_1/probe8 [get_nets [list {ipb_out[ipb_write]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe9]
set_property port_width 1 [get_debug_ports u_ila_1/probe9]
connect_debug_port u_ila_1/probe9 [get_nets [list ipbus_payload/miso]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe10]
set_property port_width 1 [get_debug_ports u_ila_1/probe10]
connect_debug_port u_ila_1/probe10 [get_nets [list ipbus_payload/mosi]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe11]
set_property port_width 1 [get_debug_ports u_ila_1/probe11]
connect_debug_port u_ila_1/probe11 [get_nets [list ipbus_payload/sclk]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk_ipb]
