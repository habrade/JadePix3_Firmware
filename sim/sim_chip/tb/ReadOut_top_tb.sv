`timescale 1ps/1ps

module PeripheraReadOut_tb;
  reg          PReadCLK ; 
  reg [8:0]    RowAddr  ; 
  
  reg  [47:0] DataInBk1;
  reg  [47:0] DataInBk2;
  reg  [47:0] DataInBk3;
  reg  [47:0] DataInBk4;
  
  wire [15:0]  ReadTree1CLK;
  wire [15:0]  ReadTree2CLK;
  wire [15:0]  ReadTree3CLK;
  wire [15:0]  ReadTree4CLK;

  wire [3:0]  ValidOut;
  reg         Rstn    ;
  reg         ReadEn  ;

  reg [1:0]   Inquiry ;
  reg [1:0]   Select  ;
  wire [7:0]  DataOut;
  wire [9:0]  BitStream;
  
  bit [47:0] hitval;
  int        bitnhit;
  int        hitnumbers;  
  
/////////////////////////////////////////////////////////////
//           Clock
  parameter  Period = 12500; // 4ns
  reg        sysclk;
  initial begin
    sysclk  = 0;
    forever #(Period/2) sysclk = ~sysclk;
  end

  
  initial begin
    ReadEn  = 0;
    RowAddr = 0;
    Inquiry = 2'b11;
    Select  = 0;
    genRst(2);  
    
    //test flow
    @(posedge sysclk);
  
    fork
      begin
         repeat(2) getOnceAllCol();
         repeat(24)  @(posedge sysclk);
         repeat(98) getOnceAllCol();
      end
      readOutFlow();
    join

  end
  
  task readOutFlow();
    @(posedge sysclk);
    ctrlSymOut();
    repeat(5) fStatusOut();
    
    ReadEn = 1'b1;
    ctrlSymOut();
    repeat(160) fDataOut(2'b00);  //FIFO1
    fStatusOut();  
    
    ctrlSymOut();
    repeat(4) fDataOut(2'b01);  //FIFO2
    fStatusOut(); 
    
    ctrlSymOut();
    repeat(4) fDataOut(2'b01);  //FIFO3
    fStatusOut(); 
    
    ctrlSymOut();
    repeat(4) fDataOut(2'b10);  //FIFO3
    repeat(3) fDataOut(2'b10);  //FIFO3
    fStatusOut(); 
    
    ctrlSymOut();
    repeat(4) begin
      fDataOut(2'b10);  //FIFO3
      fStatusOut();
    end
    repeat(2) fDataOut(2'b10);  //FIFO3
    repeat(3) begin 
      fDataOut(2'b10);  //FIFO3
      fDataOut(2'b11);  //FIFO4
    end

  endtask

  task genRst(input int cycle);
    Rstn = 1'b1;
    genBank1Hit(0,0,0);
    genBank2Hit(0,0,0);
    genBank3Hit(0,0,0);
    genBank4Hit(0,0,0);
    #100 Rstn = 1'b0;
    #(Period*cycle+4000) Rstn = 1'b1;
  endtask
 
  task getOnceAllCol();
     RowAddr = RowAddr + 1;
       genBank1Hit(1,0,0);
       genBank2Hit(1,0,0);
       genBank3Hit(1,0,0);
       genBank4Hit(1,0,0);
       resetIN();
  endtask

  task genBank1Hit(bit randEn,int hitnum, bit[47:0] hitdata);
    bit[47:0] hits = 0;
    if(randEn) begin
      if(hitnum>0) begin
        repeat(hitnum) begin
          bitnhit = $urandom_range(47,0);
          $display("@%t nth bit hit:%d ",$realtime, bitnhit);
          hits |= (1<<bitnhit);
          $display("@%t   hits    :%h ",$realtime, hits);
        end   
      end
      else begin
        hitnumbers = $urandom_range(10,1);
        repeat(hitnumbers) begin
          bitnhit = $urandom_range(47,0);
          $display("@%t nth bit hit:%d ",$realtime, bitnhit);
          hits |= (1<<bitnhit);
          $display("@%t   hits    :%h ",$realtime, hits);
        end  
      end 
    end
    else begin
        hits = hitdata;      
    end 
    DataInBk1  =  hits;
 //   #200_000; // 200ns
  endtask
  
  task genBank2Hit(bit randEn,int hitnum, bit[47:0] hitdata);
    bit[47:0] hits    = 0;
    if(randEn) begin
      if(hitnum>0) begin
        repeat(hitnum) begin
          bitnhit = $urandom_range(47,0);
          $display("@%t nth bit hit:%d ",$realtime, bitnhit);
          hits |= (1<<bitnhit);
          $display("@%t   hits    :%h ",$realtime, hits);
        end   
      end
      else begin
        hitnumbers = $urandom_range(10,1);
        repeat(hitnumbers) begin
          bitnhit = $urandom_range(47,0);
          $display("@%t nth bit hit:%d ",$realtime, bitnhit);
          hits |= (1<<bitnhit);
          $display("@%t   hits    :%h ",$realtime, hits);
        end  
      end 
    end
    else begin
        hits = hitdata;      
    end 
        DataInBk2  =  hits;
 //       #200_000; // 200ns
  endtask
  
  task genBank3Hit(bit randEn,int hitnum, bit[47:0] hitdata);
    bit[47:0] hits    = 0;
    if(randEn) begin
      if(hitnum>0) begin
        repeat(hitnum) begin
          bitnhit = $urandom_range(47,0);
          $display("@%t nth bit hit:%d ",$realtime, bitnhit);
          hits |= (1<<bitnhit);
          $display("@%t   hits    :%h ",$realtime, hits);
        end   
      end
      else begin
        hitnumbers = $urandom_range(10,1);
        repeat(hitnumbers) begin
          bitnhit = $urandom_range(47,0);
          $display("@%t nth bit hit:%d ",$realtime, bitnhit);
          hits |= (1<<bitnhit);
          $display("@%t   hits    :%h ",$realtime, hits);
        end  
      end 
    end
    else begin
        hits = hitdata;      
    end 
    DataInBk3  =  hits;
//    #200_000; // 200ns
  endtask
  
  task genBank4Hit(bit randEn,int hitnum, bit[47:0] hitdata);
    bit[47:0] hits    = 0;
    if(randEn) begin
      if(hitnum>0) begin
        repeat(hitnum) begin
          bitnhit = $urandom_range(47,0);
          $display("@%t nth bit hit:%d ",$realtime, bitnhit);
          hits |= (1<<bitnhit);
          $display("@%t   hits    :%h ",$realtime, hits);
        end   
      end
      else begin
        hitnumbers = $urandom_range(10,1);
        repeat(hitnumbers) begin
          bitnhit = $urandom_range(47,0);
          $display("@%t nth bit hit:%d ",$realtime, bitnhit);
          hits |= (1<<bitnhit);
          $display("@%t   hits    :%h ",$realtime, hits);
        end  
      end 
    end
    else begin
        hits = hitdata;      
    end 
    DataInBk4  =  hits;
//    #200_000; // 200ns
  endtask
  
  task resetIN();
    fork: thread
      begin   wait(ReadTree1CLK[0]);   DataInBk1[2:0]   <= #2000 0;   end
      begin   wait(ReadTree1CLK[1]);   DataInBk1[5:3]   <= #2000 0;   end
      begin   wait(ReadTree1CLK[2]);   DataInBk1[8:6]   <= #2000 0;   end
      begin   wait(ReadTree1CLK[3]);   DataInBk1[11:9]  <= #2000 0;   end
      begin   wait(ReadTree1CLK[4]);   DataInBk1[14:12] <= #2000 0;   end
      begin   wait(ReadTree1CLK[5]);   DataInBk1[17:15] <= #2000 0;   end
      begin   wait(ReadTree1CLK[6]);   DataInBk1[20:18] <= #2000 0;   end
      begin   wait(ReadTree1CLK[7]);   DataInBk1[23:21] <= #2000 0;   end
                                                
      begin   wait(ReadTree1CLK[8] );  DataInBk1[26:24] <= #2000 0;   end
      begin   wait(ReadTree1CLK[9] );  DataInBk1[29:27] <= #2000 0;   end
      begin   wait(ReadTree1CLK[10]);  DataInBk1[32:30] <= #2000 0;   end
      begin   wait(ReadTree1CLK[11]);  DataInBk1[35:33] <= #2000 0;   end
      begin   wait(ReadTree1CLK[12]);  DataInBk1[38:36] <= #2000 0;   end
      begin   wait(ReadTree1CLK[13]);  DataInBk1[41:39] <= #2000 0;   end
      begin   wait(ReadTree1CLK[14]);  DataInBk1[44:42] <= #2000 0;   end
      begin   wait(ReadTree1CLK[15]);  DataInBk1[47:45] <= #2000 0;   end
      
      begin   wait(ReadTree2CLK[0]);   DataInBk2[2:0]   <= #2000 0;   end
      begin   wait(ReadTree2CLK[1]);   DataInBk2[5:3]   <= #2000 0;   end
      begin   wait(ReadTree2CLK[2]);   DataInBk2[8:6]   <= #2000 0;   end
      begin   wait(ReadTree2CLK[3]);   DataInBk2[11:9]  <= #2000 0;   end
      begin   wait(ReadTree2CLK[4]);   DataInBk2[14:12] <= #2000 0;   end
      begin   wait(ReadTree2CLK[5]);   DataInBk2[17:15] <= #2000 0;   end
      begin   wait(ReadTree2CLK[6]);   DataInBk2[20:18] <= #2000 0;   end
      begin   wait(ReadTree2CLK[7]);   DataInBk2[23:21] <= #2000 0;   end
                                                
      begin   wait(ReadTree2CLK[8] );  DataInBk2[26:24] <= #2000 0;   end
      begin   wait(ReadTree2CLK[9] );  DataInBk2[29:27] <= #2000 0;   end
      begin   wait(ReadTree2CLK[10]);  DataInBk2[32:30] <= #2000 0;   end
      begin   wait(ReadTree2CLK[11]);  DataInBk2[35:33] <= #2000 0;   end
      begin   wait(ReadTree2CLK[12]);  DataInBk2[38:36] <= #2000 0;   end
      begin   wait(ReadTree2CLK[13]);  DataInBk2[41:39] <= #2000 0;   end
      begin   wait(ReadTree2CLK[14]);  DataInBk2[44:42] <= #2000 0;   end
      begin   wait(ReadTree2CLK[15]);  DataInBk2[47:45] <= #2000 0;   end
                                                          
      begin   wait(ReadTree3CLK[0]);   DataInBk3[2:0]   <= #2000 0;   end
      begin   wait(ReadTree3CLK[1]);   DataInBk3[5:3]   <= #2000 0;   end
      begin   wait(ReadTree3CLK[2]);   DataInBk3[8:6]   <= #2000 0;   end
      begin   wait(ReadTree3CLK[3]);   DataInBk3[11:9]  <= #2000 0;   end
      begin   wait(ReadTree3CLK[4]);   DataInBk3[14:12] <= #2000 0;   end
      begin   wait(ReadTree3CLK[5]);   DataInBk3[17:15] <= #2000 0;   end
      begin   wait(ReadTree3CLK[6]);   DataInBk3[20:18] <= #2000 0;   end
      begin   wait(ReadTree3CLK[7]);   DataInBk3[23:21] <= #2000 0;   end
                                                
      begin   wait(ReadTree3CLK[8] );  DataInBk3[26:24] <= #2000 0;   end
      begin   wait(ReadTree3CLK[9] );  DataInBk3[29:27] <= #2000 0;   end
      begin   wait(ReadTree3CLK[10]);  DataInBk3[32:30] <= #2000 0;   end
      begin   wait(ReadTree3CLK[11]);  DataInBk3[35:33] <= #2000 0;   end
      begin   wait(ReadTree3CLK[12]);  DataInBk3[38:36] <= #2000 0;   end
      begin   wait(ReadTree3CLK[13]);  DataInBk3[41:39] <= #2000 0;   end
      begin   wait(ReadTree3CLK[14]);  DataInBk3[44:42] <= #2000 0;   end
      begin   wait(ReadTree3CLK[15]);  DataInBk3[47:45] <= #2000 0;   end
                                                       
      begin   wait(ReadTree4CLK[0]);   DataInBk4[2:0]   <= #2000 0;   end
      begin   wait(ReadTree4CLK[1]);   DataInBk4[5:3]   <= #2000 0;   end
      begin   wait(ReadTree4CLK[2]);   DataInBk4[8:6]   <= #2000 0;   end
      begin   wait(ReadTree4CLK[3]);   DataInBk4[11:9]  <= #2000 0;   end
      begin   wait(ReadTree4CLK[4]);   DataInBk4[14:12] <= #2000 0;   end
      begin   wait(ReadTree4CLK[5]);   DataInBk4[17:15] <= #2000 0;   end
      begin   wait(ReadTree4CLK[6]);   DataInBk4[20:18] <= #2000 0;   end
      begin   wait(ReadTree4CLK[7]);   DataInBk4[23:21] <= #2000 0;   end
                                                
      begin   wait(ReadTree4CLK[8] );  DataInBk4[26:24] <= #2000 0;   end
      begin   wait(ReadTree4CLK[9] );  DataInBk4[29:27] <= #2000 0;   end
      begin   wait(ReadTree4CLK[10]);  DataInBk4[32:30] <= #2000 0;   end
      begin   wait(ReadTree4CLK[11]);  DataInBk4[35:33] <= #2000 0;   end
      begin   wait(ReadTree4CLK[12]);  DataInBk4[38:36] <= #2000 0;   end
      begin   wait(ReadTree4CLK[13]);  DataInBk4[41:39] <= #2000 0;   end
      begin   wait(ReadTree4CLK[14]);  DataInBk4[44:42] <= #2000 0;   end
      begin   wait(ReadTree4CLK[15]);  DataInBk4[47:45] <= #2000 0;   end
      #200_000 disable thread;
    join
  endtask
  
  task ctrlSymOut();
    Inquiry = 2'b00;
    @(posedge sysclk);      
  endtask
   
  task fDataOut(bit [1:0] fsel);
    repeat(2) begin 
      Select = fsel;
      Inquiry = 2'b01; 
      @(posedge sysclk);   
    end     
  endtask
  
  task fStatusOut();
    Inquiry = 2'b10;
    @(posedge sysclk);
  endtask
 
  
  PeripheraReadOut dut( 
    .DataIn1     (DataInBk1),
    .DataIn2     (DataInBk2),
    .DataIn3     (DataInBk3),
    .DataIn4     (DataInBk4),
    
    .ReadTree1Clk(ReadTree1CLK),
    .ReadTree2Clk(ReadTree2CLK),
    .ReadTree3Clk(ReadTree3CLK),
    .ReadTree4Clk(ReadTree4CLK),

    .ValidOut    ( ValidOut ),
    .RowAddr     ( RowAddr  ),   
    .CLK_80M     ( sysclk   ),
    .RST_n       ( Rstn     ),
    .ReadEn      ( ReadEn   ),

    .Inquiry     ( Inquiry ),
    .Select      ( Select  ),
    .DataOut     ( DataOut ),
    .BitStream   (BitStream)
  );
  
  wire [7:0]  Format_Data;
  wire   KO;

  dec_8b10b DEC8b10 (
     .RESET(~Rstn      ),
     .RBYTECLK(sysclk  ),
     .AI(BitStream[0]  ),
     .BI(BitStream[1]  ),
     .CI(BitStream[2]  ),
     .DI(BitStream[3]  ),
     .EI(BitStream[4]  ),
     .II(BitStream[5]  ),
     .FI(BitStream[6]  ),
     .GI(BitStream[7]  ),
     .HI(BitStream[8]  ),
     .JI(BitStream[9]  ),
     .KO( KO),
     .HO(Format_Data[7]),
     .GO(Format_Data[6]),
     .FO(Format_Data[5]),
     .EO(Format_Data[4]), 
     .DO(Format_Data[3]), 
     .CO(Format_Data[2]), 
     .BO(Format_Data[1]), 
     .AO(Format_Data[0])
  );
 
endmodule
  
  
  
  
  
  
