add wave -position insertpoint  \
sim:/tb_fifo_monitor/fifo_monitor_index/clk \
sim:/tb_fifo_monitor/fifo_monitor_index/clk_cache \
sim:/tb_fifo_monitor/fifo_monitor_index/rst \
sim:/tb_fifo_monitor/fifo_monitor_index/fifo_valid_in \
sim:/tb_fifo_monitor/fifo_monitor_index/fifo_read_en \
sim:/tb_fifo_monitor/fifo_monitor_index/valid_cnt \
sim:/tb_fifo_monitor/fifo_monitor_index/overflow_cnt \
sim:/tb_fifo_monitor/fifo_monitor_index/fifo_cnt \
sim:/tb_fifo_monitor/fifo_monitor_index/fifo_status \
sim:/tb_fifo_monitor/fifo_monitor_index/state_reg \
sim:/tb_fifo_monitor/fifo_monitor_index/state_next

run -all
