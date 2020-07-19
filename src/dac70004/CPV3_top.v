`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: IHEP
// Engineer: Zhigang Wu
// 
// Create Date: 2019/08/25 20:06:10
// Design Name: top module for CPV3 FPGA
// Module Name: CPV3_top
// Project Name: CPV3
// Target Devices: KC705
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


module CPV3_top(
    input SYSCLK_P,
    input SYSCLK_N,
    input CPU_RESET,
    //DIP_SW
    input GPIO_DIP_SW0,
    input GPIO_DIP_SW1,
    input GPIO_DIP_SW2,
    input GPIO_DIP_SW3,
    //GPIO PUSHBUTTON SW
    input GPIO_SW_C,
    input GPIO_SW_E,
    input GPIO_SW_N,
    input GPIO_SW_S,
    input GPIO_SW_W,
    //LED
    input [7:0] GPIO_LED,
    //LCD
    inout [3:0] LCD_DB,
    output LCD_E,
    output LCD_RS,
    output LCD_RW,
    //EEPROW
    output IIC_MUX_RESET_B,
    output IIC_SCL_MAIN,
    inout IIC_SDA_MAIN,
    //Ethernet
    output PHY_TXC_GTXCLK,
    input PHY_TXCLK,
    output PHY_TXCTL_TXEN,
    output PHY_TXER,
    output [7:0] PHY_TXD,
    input PHY_RXCLK,
    input PHY_RXCTL_RXDV,
    input PHY_RXER,
    input [7:0] PHY_RXD,
    output PHY_MDC,
    input PHY_CRS,
    input PHY_COL,
    inout PHY_MDIO,
    output PHY_RESET,
    input PHY_INT,
    //SOI I/O
    input [11:0] ADC_D,
    input ADC_OTR,
    //output ADC_PDWN,
    output ADC_CLK,
    output DAC_CLR,
    output DAC_SCLK,
    output DAC_SDIN,
    output DAC_SYNC,
    output DAC_LOAD,
    input DAC_SDO,
    output [6:0] chip_CA,
    output chip_EN_col_a,
    output [2:0] chip_DA,
    output chip_EN_col_d,
    input [15:0] chip_out_D,
    output [7:0] chip_RA,
    output chip_RST_in,
    output chip_power_on_in,
    output chip_RST_x_in,
    output chip_Clamp_in,
    output chip_Row_sel_in,
    output chip_SEL_low,
    output chip_SEL_high,
    output chip_RST_en,
    output chip_TEST_en
    );
    
    wire CLK_100M;
    wire CLK_50M;
    wire CLK_125M;
    wire Locked;
      clk_wiz_0 inst_CLK
    (
    // Clock out ports  
    .CLK_100M(CLK_100M),
    .CLK_50M(CLK_50M),
    .CLK_125M(CLK_125M),
    // Status and control signals               
    .reset(CPU_RESET), 
    .locked(Locked),
   // Clock in ports
    .clk_in1_p(SYSCLK_P),
    .clk_in1_n(SYSCLK_N)
    );
    
    wire CS;
    wire SK;
    wire DI;
    wire DO;
    wire SDI;
    wire SDO;
    wire SDT;
    wire SiTCP_RESET_EEP;
    wire SDO_EEP;
    wire SDT_EEP;
    wire IIC_SCL_MAIN_EEP;
    assign SDO = SDO_EEP;
    assign SDT = SDT_EEP;
    assign IIC_SCL_MAIN = IIC_SCL_MAIN_EEP;
    
    IOBUF sda_buf( .O(SDI), .I(SDO), .T(SDT), .IO(IIC_SDA_MAIN) );
    
    assign IIC_MUX_RESET_B = (CPU_RESET) ? 1'b0 : 1'b1;
    
    AT93C46_M24C08 #(.SYSCLK_FREQ_IN_MHz(100)) AT93C46_M24C08(
      .AT93C46_CS_IN(CS),
      .AT93C46_SK_IN(SK),
      .AT93C46_DI_IN(DI),
      .AT93C46_DO_OUT(DO),
      
      .M24C08_SCL_OUT(IIC_SCL_MAIN_EEP),
      .M24C08_SDA_OUT(SDO_EEP),
      .M24C08_SDA_IN(SDI),
      .M24C08_SDAT_OUT(SDT_EEP),
      
      .RESET_IN(CPU_RESET),
      .SiTCP_RESET_OUT(SiTCP_RESET_EEP),
      
      .SYSCLK_IN(CLK_100M)
    );
    
    // Ethernet / SiTCP
    reg [1:0]RXCNT;
    always@(posedge PHY_RXCLK or posedge SiTCP_RESET_EEP)begin
      if (SiTCP_RESET_EEP == 1'b1) begin
        RXCNT[1:0] <= 2'b00;
      end
      else begin
        RXCNT[1:0] <= RXCNT[1:0] + 2'b01;
      end
    end
    
    reg [2:0]SYNC_RCT;
    reg EDGE_DET;
    reg [3:0]SEL_CNT;
    reg GMII_1000M;
    always@(posedge CLK_125M)begin
      SYNC_RCT[0] <= RXCNT[1];
      SYNC_RCT[2:1] <= SYNC_RCT[1:0];
      EDGE_DET <= (SYNC_RCT[2:1] == 2'b10);
      SEL_CNT[3:0] <= EDGE_DET ? 4'b1000: (SEL_CNT[3:0] + {3'b000,SEL_CNT[3]});
      GMII_1000M <= EDGE_DET ? SEL_CNT[3]: GMII_1000M;
    end
  
    wire GMII_TCLK;
    BUFGMUX GMIIMUX(.O(GMII_TCLK),    .I0(PHY_TXCLK),   .I1(CLK_125M), .S(GMII_1000M));
    ODDR2 GTXCLK_OR(.Q(PHY_TXC_GTXCLK), .C0(GMII_TCLK), .C1(~GMII_TCLK), .CE(1'b1), .D0(1'b0), .D1(1'b1), .R(1'b0), .S(1'b0));
    
    wire TCP_OPEN_ACK;
    wire TCP_ERROR;
    wire TCP_CLOSE_REQ;
    //wire TCP_CLOSE_ACK;
    wire TCP_RX_WR;
    wire [7:0]TCP_RX_DATA;
    wire TCP_TX_FULL;
    wire TCP_TX_WR;
    wire [7:0]TCP_TX_DATA;
    
    wire RBCP_ACT;
    wire [31:0]RBCP_ADDR;
    wire [7:0]RBCP_WD;
    wire RBCP_WE;
    wire RBCP_RE;
    wire RBCP_ACK;
    wire [7:0]RBCP_RD;
    
    wire [9:0]RX_DATA_COUNT;
    
    wire SiTCP_RESET_OUTDS;
    
    WRAP_SiTCP_GMII_XC7K_32K WRAP_SiTCP_GMII_XC7K_32K(
      .CLK(CLK_100M), // in : System Clock >129MHz
      .RST(SiTCP_RESET_EEP), // in : System reset
    // Configuration parameters
      .FORCE_DEFAULTn(GPIO_DIP_SW0), // in : Load default parameters
      .EXT_IP_ADDR(32'hC0A80A10), // in : IP address[31:0] 
      .EXT_TCP_PORT(16'd24), // in : TCP port #[15:0]
      .EXT_RBCP_PORT(16'd4660), // in : RBCP port #[15:0]
      .PHY_ADDR(5'd30), // in    : PHY-device MIF address[4:0]
      .MY_MAC_ADDR(), // out : My MAC address[47:0]
    // EEPROM
      .EEPROM_CS(CS), // out : Chip select
      .EEPROM_SK(SK), // out : Serial data clock
      .EEPROM_DI(DI), // out : Serial write data
      .EEPROM_DO(DO), // in : Serial read data
    // user data, intialial values are stored in the EEPROM, 0xFFFF_FC3C-3F
      .USR_REG_X3C(), // out : Stored at 0xFFFF_FF3C
      .USR_REG_X3D(), // out : Stored at 0xFFFF_FF3D
      .USR_REG_X3E(), // out : Stored at 0xFFFF_FF3E
      .USR_REG_X3F(), // out : Stored at 0xFFFF_FF3F
    // MII interface
      .GMII_RSTn(PHY_RESET), // out : PHY reset
      .GMII_1000M(GMII_1000M), // in : GMII mode (0:MII, 1:GMII)
    // TX
      .GMII_TX_CLK(GMII_TCLK), // in : Tx clock
      .GMII_TX_EN(PHY_TXCTL_TXEN), // out : Tx enable
      .GMII_TXD(PHY_TXD), // out : Tx data[7:0]
      .GMII_TX_ER(PHY_TXER), // out : TX error
    // RX
      .GMII_RX_CLK(PHY_RXCLK), // in : Rx clock
      .GMII_RX_DV(PHY_RXCTL_RXDV), // in : Rx data valid
      .GMII_RXD(PHY_RXD), // in : Rx data[7:0]
      .GMII_RX_ER(PHY_RXER), // in : Rx error
      .GMII_CRS(PHY_CRS), // in : Carrier sense
      .GMII_COL(PHY_COL), // in : Collision detected
    // Management IF
      .GMII_MDC(PHY_MDC), // out : Clock for MDIO
      .GMII_MDIO_IN(PHY_MDIO), // in : Data
      .GMII_MDIO_OUT(PHY_MDIO), // out : Data
      .GMII_MDIO_OE(), // out : MDIO output enable
    // User I/F
      .SiTCP_RST(SiTCP_RESET_OUTDS), // out : Reset for SiTCP and related circuits
    // TCP connection control
      .TCP_OPEN_REQ(1'b0), // in : Reserved input, shoud be 0
      .TCP_OPEN_ACK(TCP_OPEN_ACK), // out : Acknowledge for open (=Socket busy)
      .TCP_ERROR(TCP_ERROR), // out : TCP error, its active period is equal to MSL
      .TCP_CLOSE_REQ(TCP_CLOSE_REQ), // out : Connection close request
      .TCP_CLOSE_ACK(TCP_CLOSE_REQ/*TCP_CLOSE_ACK*/), // in : Acknowledge for closing
    // FIFO I/F
      .TCP_RX_WC({6'b111111,RX_DATA_COUNT[9:0]}), // in : Rx FIFO write count[15:0] (Unused bits should be set 1)
      .TCP_RX_WR(TCP_RX_WR), // out : Write enable
      .TCP_RX_DATA(TCP_RX_DATA[7:0]), // out : Write data[7:0]
      .TCP_TX_FULL(TCP_TX_FULL), // out : Almost full flag
      .TCP_TX_WR(TCP_TX_WR), // in : Write enable
      .TCP_TX_DATA(TCP_TX_DATA[7:0]), // in : Write data[7:0]
    // RBCP
      .RBCP_ACT(RBCP_ACT), // out : RBCP active
      .RBCP_ADDR(RBCP_ADDR[31:0]), // out : Address[31:0]
      .RBCP_WD(RBCP_WD[7:0]), // out : Data[7:0]
      .RBCP_WE(RBCP_WE), // out : Write enable
      .RBCP_RE(RBCP_RE), // out : Read enable
      //.RBCP_ACK(RBCP_ACK), // in : Access acknowledge
      .RBCP_ACK(1'b0),
      .RBCP_RD(8'b0)
      //.RBCP_RD(RBCP_RD[7:0]) // in : Read data[7:0]
    );
    
    wire [7:0] DAQ_STATE;
    wire [31:0] DAC_DATA;
    wire DAC_WE;
    wire [15:0] ROW_START;
    wire [15:0] ROW_END;
    wire [15:0] COL_START;
    wire [15:0] COL_END;
    wire [7:0] PIX_SEL;
    wire [7:0] POWER_ON_WAIT;
    wire [7:0] READ_PERIOD;
    wire [7:0] RST_PERIOD;
    wire [7:0] CLAMP_PERIOD;
    wire DAC_BUSY;
    
    TCP_Reciever TCP_Reciever(
        .CLK(CLK_100M),
        .RST(~TCP_OPEN_ACK || SiTCP_RESET_OUTDS),
        .DATA_IN(TCP_RX_DATA[7:0]),
        .DATA_IN_EN(TCP_RX_WR),
        .DATA_OUT_EN(DAC_BUSY),
        .DAQ_STATE(DAQ_STATE[7:0]),
        .DAC_DATA(DAC_DATA[31:0]),
        .DAC_WE(DAC_WE),
        .ROW_START(ROW_START[15:0]),
        .ROW_END(ROW_END[15:0]),
        .COL_START(COL_START[15:0]),
        .COL_END(COL_END[15:0]),
        .PIX_SEL(PIX_SEL[7:0]),
        .POWER_ON_WAIT(POWER_ON_WAIT[7:0]),
        .READ_PERIOD(READ_PERIOD[7:0]),
        .RST_PERIOD(RST_PERIOD[7:0]),
        .CLAMP_PERIOD(CLAMP_PERIOD[7:0]),
        .RX_DATA_COUNT(RX_DATA_COUNT[9:0])
    );
    
    DAC_refresh DAC_refresh(
        .CLK_50M(CLK_50M),
        .DLL_LOCKED(Locked),
        .DAC_WE(DAC_WE),
        .DAC_DATA(DAC_DATA[31:0]),
        .DAC_SCLK(DAC_SCLK),
        .DAC_LOAD(DAC_LOAD),
        .DAC_SYNC(DAC_SYNC),
        .DAC_SDIN(DAC_SDIN),
        .DAC_CLR(DAC_CLR),
        .DAC_BUSY(DAC_BUSY)
    );
    
    wire TX_EN;
    wire [15:0] TXDATA_IN;
    wire TX_BUSY;
    DATA_TX DATA_TX(
        .CLK_100M(CLK_100M),
        .CLK_50M(CLK_50M),
        .RST(~TCP_OPEN_ACK || SiTCP_RESET_OUTDS),
        .TX_EN(TX_EN),
        .DATA_IN(TXDATA_IN[15:0]),
        .TCP_AFULL(TCP_TX_FULL),
        .TCP_ACTIVE(TCP_OPEN_ACK),
        .TCP_CLOSE_REQ(TCP_CLOSE_REQ),
        .TX_BUSY(TX_BUSY),
        .TX_WE(TCP_TX_WR),
        .TX_WD(TCP_TX_DATA[7:0])
    );
    
    wire chip_SOF;
    wire chip_STROBE;
    Data_Alignment Data_Alignment(
        .CLK_50M(CLK_50M),
        .ADC_D(ADC_D[11:0]),
        .ADC_OTR(ADC_OTR),
        //.ADC_PDW(ADC_PDWN),
        .ADC_CLK(ADC_CLK),
        .BIT_STREAM(chip_out_D[15:0]),
        .DAQ_STATE(DAQ_STATE[7:0]),
        .SOF(chip_SOF),
        .STROBE(chip_STROBE),
        .ALIGHED_WD(TXDATA_IN[15:0]),
        .ALIGHED_WE(TX_EN),
        .FIFO_AVAILABLE(~TX_BUSY),
        .PIX_SEL(PIX_SEL[7:0])
    );
    
    DUT_control DUT_control(
        .ROW_START(ROW_START[15:0]),
        .ROW_END(ROW_END[15:0]),
        .COL_START(COL_START[15:0]),
        .COL_END(COL_END[15:0]),
        .PIX_SEL(PIX_SEL[7:0]),
        .POWER_ON_WAIT(POWER_ON_WAIT[7:0]),
        .READ_PERIOD(READ_PERIOD[7:0]),
        .RST_PERIOD(RST_PERIOD[7:0]),
        .CLAMP_PERIOD(CLAMP_PERIOD[7:0]),
        .CLK_50M(CLK_50M),
        .DLL_LOCKED(Locked),
        .RA(chip_RA[7:0]),
        .CA(chip_CA[6:0]),
        .EN_col_a(chip_EN_col_a),
        .DA(chip_DA[2:0]),
        .EN_col_d(chip_EN_col_d),
        .power_on_in(chip_power_on_in),
        .RST_in(chip_RST_in),
        .RST_x_in(chip_RST_x_in),
        .Clamp_in(chip_Clamp_in),
        .Row_sel_in(chip_Row_sel_in),
        .SEL_high(chip_SEL_high),
        .SEL_low(chip_SEL_low),
        .RST_en(chip_RST_en),
        .TEST_en(chip_TEST_en),
        .SOF(chip_SOF),
        .STROBE(chip_STROBE)
    );
    
endmodule
