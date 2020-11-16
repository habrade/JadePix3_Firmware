add wave -position insertpoint -divider read_data_top sim:/ipbus_bfm_tb/jadepix_read_data/*
add wave -position insertpoint -divider fifo_monitor(0) sim:/ipbus_bfm_tb/jadepix_read_data/fifo_monitor_wrapper/fifo_monitor(0)/fifo_monitor_index/*
add wave -position insertpoint -divider fifo_monitor(1) sim:/ipbus_bfm_tb/jadepix_read_data/fifo_monitor_wrapper/fifo_monitor(1)/fifo_monitor_index/*
add wave -position insertpoint -divider fifo_status_buffer sim:/ipbus_bfm_tb/jadepix_read_data/fifo_status_buffer/*
add wave -position insertpoint -divider ring_buffer sim:/ipbus_bfm_tb/jadepix_read_data/fifo_status_buffer/ring_buffer/*
add wave -position insertpoint -divider fabric sim:/ipbus_bfm_tb/jadepix_read_data/fabric_sector/*
add wave -position insertpoint -divider fifo_ctrl sim:/ipbus_bfm_tb/jadepix_read_data/fifo_ctrl/*
add wave -position insertpoint -divider fifo_data sim:/ipbus_bfm_tb/jadepix_read_data/fifo_data/*
add wave -position insertpoint -divider jadepix_ctrl sim:/ipbus_bfm_tb/jadepix_ctrl_wrapper/jadepix_ctrl/*
add wave -position insertpoint -divider inside_device_fabric sim:/ipbus_bfm_tb/ipbus_payload/slave3/ipbus_slave_reg_fifo/inst_device_fabric/*
add wave -position insertpoint -divider rfifo sim:/ipbus_bfm_tb/ipbus_payload/slave3/ipbus_slave_reg_fifo/rfifo/rfifo_gen(0)/rfifo_i/*

run -all

wave zoom range 0 60us
