VSTD=-2008

UVVM_UTIL_DIR=/opt/UVVM/UVVM/uvvm_util/sim/uvvm_util

IPBUS_SRCS_CORE_DIR=../../src/ipbus/ipbus_core
IPBUS_SRCS_CORE_FILE= \
	${IPBUS_SRCS_CORE_DIR}/ipbus_package.vhd \
	${IPBUS_SRCS_CORE_DIR}/ipbus_trans_decl.vhd \
	${IPBUS_SRCS_CORE_DIR}/transactor_if.vhd \
	${IPBUS_SRCS_CORE_DIR}/transactor_sm.vhd \
	${IPBUS_SRCS_CORE_DIR}/transactor_cfg.vhd \
	${IPBUS_SRCS_CORE_DIR}/transactor.vhd \
	${IPBUS_SRCS_CORE_DIR}/ipbus_fabric_sel.vhd

OPEN_CORES_SPI_DIR=../../src/ipbus/opencores_spi/firmware/hdl
OPEN_CORES_SPI_FILE= \
	${OPEN_CORES_SPI_DIR}/*.v \

IPBUS_SRCS_SLV_DIR=../../src/ipbus/ipbus_slaves
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


LOGIC_SRC_DIR=../../src
LOGIC_SRC_FILE= \
	${LOGIC_SRC_DIR}/dac70004/*.vhd \
	${LOGIC_SRC_DIR}/global_defines.vhd \
	${LOGIC_SRC_DIR}/ipbus_global_device.vhd \
	${LOGIC_SRC_DIR}/ipbus_decode_payload.vhd \
	${LOGIC_SRC_DIR}/jadepix_defines.vhd \
	${LOGIC_SRC_DIR}/ipbus_fabric_inside_device.vhd \
	${LOGIC_SRC_DIR}/ipbus_slave_reg_ram.vhd \
	${LOGIC_SRC_DIR}/ipbus_jadepix_device.vhd \
	${LOGIC_SRC_DIR}/ipbus_payload.vhd


comp_ipbus_lib:
	vcom -work work ${VSTD} ${IPBUS_SRCS_CORE_FILE}
	vcom -work work ${VSTD} ${IPBUS_SRCS_SLV_FILE}
	vlog -work work ${OPEN_CORES_SPI_FILE}

map_uvvm_util:
	vmap uvvm_util ${UVVM_UTIL_DIR}

comp_payload: comp_ipbus_lib
	vlog -work work ${LOGIC_SRC_DIR}/dac70004/DAC_refresh.v
	vcom -work work ${VSTD} ${LOGIC_SRC_FILE}

comp_tb:
	vcom -work work ${VSTD} ${TB_SRCS}

pre_config: map_uvvm_util comp_ipbus_lib comp_tb comp_payload

sim: pre_config
	vsim -voptargs=+acc -c work.ipbus_bfm_tb 

.PHONY: clean
clean:
	rm -rf work transcript _Alert.txt _Log.txt
