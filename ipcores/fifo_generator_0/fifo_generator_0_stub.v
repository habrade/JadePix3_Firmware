// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (lin64) Build 2708876 Wed Nov  6 21:39:14 MST 2019
// Date        : Thu Aug 27 16:44:35 2020
// Host        : sdong-ubuntu running 64-bit Ubuntu 20.04.1 LTS
// Command     : write_verilog -force -mode synth_stub -rename_top fifo_generator_0 -prefix
//               fifo_generator_0_ fifo_generator_0_stub.v
// Design      : fifo_generator_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k325tffg900-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "fifo_generator_v13_2_5,Vivado 2019.2" *)
module fifo_generator_0(clk, srst, din, wr_en, rd_en, dout, full, empty, valid, 
  data_count, prog_full)
/* synthesis syn_black_box black_box_pad_pin="clk,srst,din[2:0],wr_en,rd_en,dout[2:0],full,empty,valid,data_count[16:0],prog_full" */;
  input clk;
  input srst;
  input [2:0]din;
  input wr_en;
  input rd_en;
  output [2:0]dout;
  output full;
  output empty;
  output valid;
  output [16:0]data_count;
  output prog_full;
endmodule
