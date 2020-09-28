VSTD=-2008

XILINX_LIB_PATH=/opt/Questasim/10.7c/xilinx_lib_2019.2
UVVM_UTIL_DIR=/opt/UVVM/UVVM/uvvm_util/sim/uvvm_util

FIRMWARE_SRC_DIR=../../src
FIRMWARE_IPCORE_DIR=../../ipcores

IPBUS_SRCS_CORE_DIR=${FIRMWARE_SRC_DIR}/ipbus/ipbus_core
IPBUS_SRCS_CORE_FILE= \
	${IPBUS_SRCS_CORE_DIR}/ipbus_package.vhd \
	${IPBUS_SRCS_CORE_DIR}/ipbus_trans_decl.vhd \
	${IPBUS_SRCS_CORE_DIR}/transactor_if.vhd \
	${IPBUS_SRCS_CORE_DIR}/transactor_sm.vhd \
	${IPBUS_SRCS_CORE_DIR}/transactor_cfg.vhd \
	${IPBUS_SRCS_CORE_DIR}/transactor.vhd \
	${IPBUS_SRCS_CORE_DIR}/ipbus_fabric_sel.vhd

OPEN_CORES_SPI_DIR=${FIRMWARE_SRC_DIR}/ipbus/opencores_spi/firmware/hdl
OPEN_CORES_SPI_FILE= \
	${OPEN_CORES_SPI_DIR}/*.v \

IPBUS_SRCS_SLV_DIR=${FIRMWARE_SRC_DIR}/ipbus/ipbus_slaves
IPBUS_SRCS_SLV_FILE= \
	${IPBUS_SRCS_SLV_DIR}/ipbus_reg_types.vhd \
	${IPBUS_SRCS_SLV_DIR}/ipbus_reg_types_new.vhd \
	${IPBUS_SRCS_SLV_DIR}/ipbus_ctrlreg_v.vhd \
	${IPBUS_SRCS_SLV_DIR}/ipbus_reg_v.vhd \
	${IPBUS_SRCS_SLV_DIR}/syncreg_w.vhd \
	${IPBUS_SRCS_SLV_DIR}/syncreg_r.vhd \
	${IPBUS_SRCS_SLV_DIR}/ipbus_syncreg_v.vhd \
	${OPEN_CORES_SPI_DIR}/ipbus_spi.vhd


TB_DIR= tb
TB_SRCS= \
	${TB_DIR}/ipbus_bfm_pkg.vhd \
	${TB_DIR}/ipbus_transactor_wrapper.vhd \
	${TB_DIR}/ipbus_bfm_tb.vhd


LOGIC_SRC_DIR=${FIRMWARE_SRC_DIR}
LOGIC_SRC_FILE= \
	${LOGIC_SRC_DIR}/dac70004/*.vhd \
	${LOGIC_SRC_DIR}/global_defines.vhd \
	${LOGIC_SRC_DIR}/ipbus_global_device.vhd \
	${LOGIC_SRC_DIR}/ipbus_decode_payload.vhd \
	${LOGIC_SRC_DIR}/jadepix_defines.vhd \
	${LOGIC_SRC_DIR}/jadepix_clock_gen.vhd \
	${LOGIC_SRC_DIR}/ipbus_fabric_inside_device.vhd \
	${LOGIC_SRC_DIR}/ipbus_slave_reg_ram.vhd \
	${LOGIC_SRC_DIR}/ipbus_jadepix_device.vhd \
	${LOGIC_SRC_DIR}/ipbus_payload.vhd \
	${LOGIC_SRC_DIR}/jadepix_ctrl.vhd \
	${LOGIC_SRC_DIR}/jadepix_spi_load.vhd \
	${LOGIC_SRC_DIR}/gen_clk_cache.vhd \
	${LOGIC_SRC_DIR}/jadepix_ctrl_wrapper.vhd

all: sim

ipcores:
	#vmap -modelsimini ${XILINX_LIB_PATH}/modelsim.ini
	vmap fifo_generator_v13_2_5 ${XILINX_LIB_PATH}/fifo_generator_v13_2_5
	vlog -work work ${FIRMWARE_IPCORE_DIR}/fifo_generator_0/sim/*.v

comp_ipbus_lib:
	vcom -work work ${VSTD} ${IPBUS_SRCS_CORE_FILE}
	vcom -work work ${VSTD} ${IPBUS_SRCS_SLV_FILE}
	vlog -work work ${OPEN_CORES_SPI_FILE}

map_uvvm_util:
	vmap uvvm_util ${UVVM_UTIL_DIR}

map_unisim:
	vmap UNISIM ${XILINX_LIB_PATH}/unisim 

comp_logic: map_unisim comp_ipbus_lib ipcores
	vlog -work work ${LOGIC_SRC_DIR}/dac70004/DAC_refresh.v
	vcom -work work ${VSTD} ${LOGIC_SRC_FILE}

comp_tb: map_uvvm_util comp_logic comp_ipbus_lib
	vcom -work work ${VSTD} ${TB_SRCS}

pre_config: map_unisim map_uvvm_util comp_ipbus_lib ipcores comp_logic comp_tb 

sim: pre_config
	vsim -fsmdebug -voptargs=+acc -t 1ps -L fifo_generator_v13_2_5  work.ipbus_bfm_tb 

sim_nogui: pre_config
	vsim -voptargs=+acc -t 1ps -c -L fifo_generator_v13_2_5 -L unisim work.ipbus_bfm_tb 
.PHONY: clean
clean:
	rm -rf work 
realclean:
	rm -rf work transcript _Alert.txt _Log.txt
