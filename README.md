## JadePix3 Readout

### Environment
The readout system is developed and tested on:
* Ubuntu 20.04 LTS, Debian 10
* Xilinx Vivado 2020.2
* Python 3.7.3 or higher
* IPbus Software: main branch
* IPbus Firmware: main branch

### Simulation
Simulator: QuestaSim 10.7c Linux 64 bit

Directory: sim
		/sim_chip
		/sim_design_logic

For FPGA logic simulation (sim chip):
	make sim
	or
	make sim_nogui
