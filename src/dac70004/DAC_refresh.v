`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/08/30 14:58:54
// Design Name: 
// Module Name: DAC_refresh
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module DAC_refresh(
    input CLK_50M,
    input DLL_LOCKED,
    input DAC_WE,
    input [31:0] DAC_DATA,
    output DAC_SCLK,
    output DAC_LOAD,
    output DAC_SYNC,
    output DAC_SDIN,
    output DAC_CLR,
    output DAC_BUSY//0:busy
    );
    
//----------- Devide CLK_50M frequency by 2 ---------	
       reg SCLK_reg = 1'b0;
       always @(posedge CLK_50M) begin
             SCLK_reg <= ~SCLK_reg;
       end
    
       assign DAC_SCLK = SCLK_reg;
    
    //----------- START OF FSM-MOORE-BINARY ---------    
       reg [4:0] BS_cnt = 5'b0;
       reg [31:0] DATA_shift_register = 32'b0;
       reg [1:0] state = 2'b0;
       reg DAC_BUSY_reg = 1'b1;
       reg DAC_SYNC_reg = 1'b1;
       reg DAC_LOAD_reg = 1'b0;
       reg DAC_CLR_reg = 1'b1;
       parameter LOAD = 2'b00;
       parameter SYNC = 2'b01;
       parameter SHIFT = 2'b11;
       
       always@(posedge CLK_50M)
          if (~DLL_LOCKED) begin
             state <= LOAD;
             DAC_SYNC_reg <= 1'b1;
             DAC_BUSY_reg <= 1'b1;
             DAC_LOAD_reg <= 1'b0;
             DAC_CLR_reg <= 1'b1;
             BS_cnt <= 5'b0;
          end
          else
             case (state)
                LOAD : begin
                   if (DAC_WE) begin
                      state <= SYNC;   
                      DATA_shift_register[31:0] <= DAC_DATA[31:0];
                      DAC_BUSY_reg <= 1'b0;
                   end
                end
                SYNC : begin
                    if(~SCLK_reg) begin
                        state <= SHIFT;
                        DAC_SYNC_reg <= 1'b0;
                    end
                end
                SHIFT : begin
                   if (~SCLK_reg) begin
                      BS_cnt <= BS_cnt + 1;
                      DATA_shift_register[31:0] <= {DATA_shift_register[30:0],1'b0};
                      if (BS_cnt[4:0] == 5'b11111) begin
                         state <= LOAD;
                         BS_cnt[4:0] <= 5'b0;
                         DAC_SYNC_reg <= 1'b1;
                         DAC_BUSY_reg <= 1'b1;
                      end
                   end
                end
                default : begin  // Fault Recovery
                   state <= LOAD;
                   DAC_SYNC_reg <= 1'b1;
                   DAC_BUSY_reg <= 1'b1;
                   DAC_LOAD_reg <= 1'b0;
                   DAC_CLR_reg <= 1'b1;
                   BS_cnt <= 5'b0;
                end 
             endcase
             
       assign DAC_SYNC = DAC_SYNC_reg;
       assign DAC_SDIN = DATA_shift_register[31];
       assign DAC_BUSY = DAC_BUSY_reg;
       assign DAC_LOAD = DAC_LOAD_reg;
       assign DAC_CLR = DAC_CLR_reg;
endmodule
