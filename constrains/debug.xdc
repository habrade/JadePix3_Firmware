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
set_property port_width 5 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {jadepix_ctrl/state_reg[0]} {jadepix_ctrl/state_reg[1]} {jadepix_ctrl/state_reg[2]} {jadepix_ctrl/state_reg[3]} {jadepix_ctrl/state_reg[4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 5 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {jadepix_ctrl/state_next[0]} {jadepix_ctrl/state_next[1]} {jadepix_ctrl/state_next[2]} {jadepix_ctrl/state_next[3]} {jadepix_ctrl/state_next[4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 5 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {jadepix_ctrl/rs_cnt[0]} {jadepix_ctrl/rs_cnt[1]} {jadepix_ctrl/rs_cnt[2]} {jadepix_ctrl/rs_cnt[3]} {jadepix_ctrl/rs_cnt[4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 17 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {jadepix_ctrl/pix_cnt[0]} {jadepix_ctrl/pix_cnt[1]} {jadepix_ctrl/pix_cnt[2]} {jadepix_ctrl/pix_cnt[3]} {jadepix_ctrl/pix_cnt[4]} {jadepix_ctrl/pix_cnt[5]} {jadepix_ctrl/pix_cnt[6]} {jadepix_ctrl/pix_cnt[7]} {jadepix_ctrl/pix_cnt[8]} {jadepix_ctrl/pix_cnt[9]} {jadepix_ctrl/pix_cnt[10]} {jadepix_ctrl/pix_cnt[11]} {jadepix_ctrl/pix_cnt[12]} {jadepix_ctrl/pix_cnt[13]} {jadepix_ctrl/pix_cnt[14]} {jadepix_ctrl/pix_cnt[15]} {jadepix_ctrl/pix_cnt[16]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 4 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {jadepix_ctrl/hitmap_num[0]} {jadepix_ctrl/hitmap_num[1]} {jadepix_ctrl/hitmap_num[2]} {jadepix_ctrl/hitmap_num[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 9 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {jadepix_ctrl/RA[0]} {jadepix_ctrl/RA[1]} {jadepix_ctrl/RA[2]} {jadepix_ctrl/RA[3]} {jadepix_ctrl/RA[4]} {jadepix_ctrl/RA[5]} {jadepix_ctrl/RA[6]} {jadepix_ctrl/RA[7]} {jadepix_ctrl/RA[8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 9 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {jadepix_ctrl/CA[0]} {jadepix_ctrl/CA[1]} {jadepix_ctrl/CA[2]} {jadepix_ctrl/CA[3]} {jadepix_ctrl/CA[4]} {jadepix_ctrl/CA[5]} {jadepix_ctrl/CA[6]} {jadepix_ctrl/CA[7]} {jadepix_ctrl/CA[8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 9 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {ipbus_payload/slave3/hitmap_col_low[0]} {ipbus_payload/slave3/hitmap_col_low[1]} {ipbus_payload/slave3/hitmap_col_low[2]} {ipbus_payload/slave3/hitmap_col_low[3]} {ipbus_payload/slave3/hitmap_col_low[4]} {ipbus_payload/slave3/hitmap_col_low[5]} {ipbus_payload/slave3/hitmap_col_low[6]} {ipbus_payload/slave3/hitmap_col_low[7]} {ipbus_payload/slave3/hitmap_col_low[8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 9 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {ipbus_payload/slave3/hitmap_col_high[0]} {ipbus_payload/slave3/hitmap_col_high[1]} {ipbus_payload/slave3/hitmap_col_high[2]} {ipbus_payload/slave3/hitmap_col_high[3]} {ipbus_payload/slave3/hitmap_col_high[4]} {ipbus_payload/slave3/hitmap_col_high[5]} {ipbus_payload/slave3/hitmap_col_high[6]} {ipbus_payload/slave3/hitmap_col_high[7]} {ipbus_payload/slave3/hitmap_col_high[8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 4 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list {ipbus_payload/slave3/CACHE_BIT_SET[0]} {ipbus_payload/slave3/CACHE_BIT_SET[1]} {ipbus_payload/slave3/CACHE_BIT_SET[2]} {ipbus_payload/slave3/CACHE_BIT_SET[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 1 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list jadepix_ctrl/CA_EN]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 1 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list jadepix_ctrl/HIT_RST]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 1 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list ipbus_payload/slave3/hitmap_en]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 1 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list ipbus_payload/LOAD]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 1 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list ipbus_payload/slave3/LOAD]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 1 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list ipbus_payload/slave3/MATRIX_GRST]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
set_property port_width 1 [get_debug_ports u_ila_0/probe16]
connect_debug_port u_ila_0/probe16 [get_nets [list ipbus_payload/slave3/PDB]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe17]
set_property port_width 1 [get_debug_ports u_ila_0/probe17]
connect_debug_port u_ila_0/probe17 [get_nets [list jadepix_ctrl/RA_EN]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe18]
set_property port_width 1 [get_debug_ports u_ila_0/probe18]
connect_debug_port u_ila_0/probe18 [get_nets [list jadepix_ctrl/RD_EN]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe19]
set_property port_width 1 [get_debug_ports u_ila_0/probe19]
connect_debug_port u_ila_0/probe19 [get_nets [list jadepix_ctrl/rs_busy]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe20]
set_property port_width 1 [get_debug_ports u_ila_0/probe20]
connect_debug_port u_ila_0/probe20 [get_nets [list jadepix_ctrl/rs_start]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk_sys]
