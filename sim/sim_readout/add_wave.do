add wave -position insertpoint -divider read_data_top sim:/tb_data_readout/jadepix_read_data/*
add wave -position insertpoint -divider fifo_monitor(0) sim:/tb_data_readout/jadepix_read_data/fifo_monitor_wrapper/fifo_monitor(0)/fifo_monitor_index/*
add wave -position insertpoint -divider fifo_monitor(1) sim:/tb_data_readout/jadepix_read_data/fifo_monitor_wrapper/fifo_monitor(1)/fifo_monitor_index/*
add wave -position insertpoint -divider fifo_status_buffer sim:/tb_data_readout/jadepix_read_data/fifo_status_buffer/*
add wave -position insertpoint -divider ring_buffer sim:/tb_data_readout/jadepix_read_data/fifo_status_buffer/ring_buffer/*
add wave -position insertpoint -divider fifo_read sim:/tb_data_readout/jadepix_read_data/fifo_read/*
run -all

wave zoom full
