



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
set_property port_width 3 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {jadepix_ctrl/cfg_dout_reg[0]} {jadepix_ctrl/cfg_dout_reg[1]} {jadepix_ctrl/cfg_dout_reg[2]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 17 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {jadepix_ctrl/cfg_fifo_count[0]} {jadepix_ctrl/cfg_fifo_count[1]} {jadepix_ctrl/cfg_fifo_count[2]} {jadepix_ctrl/cfg_fifo_count[3]} {jadepix_ctrl/cfg_fifo_count[4]} {jadepix_ctrl/cfg_fifo_count[5]} {jadepix_ctrl/cfg_fifo_count[6]} {jadepix_ctrl/cfg_fifo_count[7]} {jadepix_ctrl/cfg_fifo_count[8]} {jadepix_ctrl/cfg_fifo_count[9]} {jadepix_ctrl/cfg_fifo_count[10]} {jadepix_ctrl/cfg_fifo_count[11]} {jadepix_ctrl/cfg_fifo_count[12]} {jadepix_ctrl/cfg_fifo_count[13]} {jadepix_ctrl/cfg_fifo_count[14]} {jadepix_ctrl/cfg_fifo_count[15]} {jadepix_ctrl/cfg_fifo_count[16]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 3 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {jadepix_ctrl/cfg_dout[0]} {jadepix_ctrl/cfg_dout[1]} {jadepix_ctrl/cfg_dout[2]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 3 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {jadepix_ctrl/cfg_sync[din][0]} {jadepix_ctrl/cfg_sync[din][1]} {jadepix_ctrl/cfg_sync[din][2]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 17 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {jadepix_ctrl/pix_cnt[0]} {jadepix_ctrl/pix_cnt[1]} {jadepix_ctrl/pix_cnt[2]} {jadepix_ctrl/pix_cnt[3]} {jadepix_ctrl/pix_cnt[4]} {jadepix_ctrl/pix_cnt[5]} {jadepix_ctrl/pix_cnt[6]} {jadepix_ctrl/pix_cnt[7]} {jadepix_ctrl/pix_cnt[8]} {jadepix_ctrl/pix_cnt[9]} {jadepix_ctrl/pix_cnt[10]} {jadepix_ctrl/pix_cnt[11]} {jadepix_ctrl/pix_cnt[12]} {jadepix_ctrl/pix_cnt[13]} {jadepix_ctrl/pix_cnt[14]} {jadepix_ctrl/pix_cnt[15]} {jadepix_ctrl/pix_cnt[16]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 9 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {jadepix_ctrl/RA[0]} {jadepix_ctrl/RA[1]} {jadepix_ctrl/RA[2]} {jadepix_ctrl/RA[3]} {jadepix_ctrl/RA[4]} {jadepix_ctrl/RA[5]} {jadepix_ctrl/RA[6]} {jadepix_ctrl/RA[7]} {jadepix_ctrl/RA[8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 4 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {jadepix_ctrl/state_next[0]} {jadepix_ctrl/state_next[1]} {jadepix_ctrl/state_next[2]} {jadepix_ctrl/state_next[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 4 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {jadepix_ctrl/state_reg[0]} {jadepix_ctrl/state_reg[1]} {jadepix_ctrl/state_reg[2]} {jadepix_ctrl/state_reg[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 4 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list {jadepix_ctrl/cfg_cnt[0]} {jadepix_ctrl/cfg_cnt[1]} {jadepix_ctrl/cfg_cnt[2]} {jadepix_ctrl/cfg_cnt[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 1 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list jadepix_ctrl/CA_EN]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 1 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list jadepix_ctrl/cfg_busy]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 1 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list jadepix_ctrl/cfg_dout_valid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 1 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list jadepix_ctrl/cfg_fifo_empty]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 1 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list jadepix_ctrl/cfg_fifo_pfull]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 1 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list jadepix_ctrl/cfg_rd_en]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
set_property port_width 1 [get_debug_ports u_ila_0/probe16]
connect_debug_port u_ila_0/probe16 [get_nets [list jadepix_ctrl/cfg_start]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe17]
set_property port_width 1 [get_debug_ports u_ila_0/probe17]
connect_debug_port u_ila_0/probe17 [get_nets [list {jadepix_ctrl/cfg_sync[wr_en]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe18]
set_property port_width 1 [get_debug_ports u_ila_0/probe18]
connect_debug_port u_ila_0/probe18 [get_nets [list jadepix_ctrl/CON_DATA]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe19]
set_property port_width 1 [get_debug_ports u_ila_0/probe19]
connect_debug_port u_ila_0/probe19 [get_nets [list jadepix_ctrl/CON_SELM]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe20]
set_property port_width 1 [get_debug_ports u_ila_0/probe20]
connect_debug_port u_ila_0/probe20 [get_nets [list jadepix_ctrl/CON_SELP]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe21]
set_property port_width 1 [get_debug_ports u_ila_0/probe21]
connect_debug_port u_ila_0/probe21 [get_nets [list jadepix_ctrl/fifo_rst]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe22]
set_property port_width 1 [get_debug_ports u_ila_0/probe22]
connect_debug_port u_ila_0/probe22 [get_nets [list jadepix_ctrl/RA_EN]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk_sys]
