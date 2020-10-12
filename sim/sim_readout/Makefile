VSTD=-2008

XILINX_LIB_PATH=/opt/Questasim/10.7c/xilinx_lib_2019.2
UVVM_UTIL_DIR=/opt/UVVM/UVVM/uvvm_util/sim/uvvm_util

FIRMWARE_SRC_DIR=../../src

SRCS=\
	${FIRMWARE_SRC_DIR}/jadepix_defines.vhd \
	${FIRMWARE_SRC_DIR}/jadepix_fifo_monitor.vhd \
	${FIRMWARE_SRC_DIR}/fifo_monitor_wrapper.vhd \
	${FIRMWARE_SRC_DIR}/ring_buffer.vhd \
	${FIRMWARE_SRC_DIR}/gen_clk_cache_delay.vhd \
	${FIRMWARE_SRC_DIR}/jadepix_data_buffer.vhd \
	${FIRMWARE_SRC_DIR}/jadepix_fifo_read.vhd \
	${FIRMWARE_SRC_DIR}/jadepix_read_data.vhd

TB_DIR= tb
TB_TOP_NAME=tb_data_readout
TB_SRCS= \
	${TB_DIR}/${TB_TOP_NAME}.vhd


all: sim

comp_logic: 
	vcom -work work ${VSTD} ${SRCS}

comp_tb:
	vcom -work work ${VSTD} ${TB_SRCS}

map_uvvm_util:
	vmap uvvm_util ${UVVM_UTIL_DIR}

sim: map_uvvm_util comp_logic comp_tb
	vsim -fsmdebug -voptargs=+acc -t 1ps work.${TB_TOP_NAME} -do add_wave.do

sim_nogui: map_uvvm_util comp_logic comp_tb
	vsim -voptargs=+acc -t 1ps -c work.${TB_TOP_NAME} -do add_wave.do

.PHONY: clean
clean:
	rm -rf work 
realclean:
	rm -rf work transcript _Alert.txt _Log.txt modelsim.ini vsim.wlf
