// Generator : SpinalHDL v1.4.2    git head : 804c7bd7b7feaddcc1d25ecef6c208fd5f776f79
// Component : top_module
// Git hash  : dc2e7e237db31ab3a9b8a328557ea33d950732f5



module top_module (
  input               clk,
  input               reset,
  output     [3:0]    q
);
  wire       [0:0]    _zz_1;
  wire       [3:0]    _zz_2;
  reg                 mainCD_counter_willIncrement;
  wire                mainCD_counter_willClear;
  reg        [3:0]    mainCD_counter_valueNext;
  reg        [3:0]    mainCD_counter_value;
  wire                mainCD_counter_willOverflowIfInc;
  wire                mainCD_counter_willOverflow;
  function  zz_mainCD_counter_willIncrement(input dummy);
    begin
      zz_mainCD_counter_willIncrement = 1'b0;
      if(1'b1)begin
        zz_mainCD_counter_willIncrement = 1'b1;
      end
    end
  endfunction
  wire  _zz_3;

  assign _zz_1 = mainCD_counter_willIncrement;
  assign _zz_2 = {3'd0, _zz_1};
  assign _zz_3 = zz_mainCD_counter_willIncrement(1'b0);
  always @ (*) mainCD_counter_willIncrement = _zz_3;
  assign mainCD_counter_willClear = 1'b0;
  assign mainCD_counter_willOverflowIfInc = (mainCD_counter_value == 4'b1001);
  assign mainCD_counter_willOverflow = (mainCD_counter_willOverflowIfInc && mainCD_counter_willIncrement);
  always @ (*) begin
    if(mainCD_counter_willOverflow)begin
      mainCD_counter_valueNext = 4'b0000;
    end else begin
      mainCD_counter_valueNext = (mainCD_counter_value + _zz_2);
    end
    if(mainCD_counter_willClear)begin
      mainCD_counter_valueNext = 4'b0000;
    end
  end

  assign q = mainCD_counter_value;
  always @ (posedge clk) begin
    if(reset) begin
      mainCD_counter_value <= 4'b0000;
    end else begin
      mainCD_counter_value <= mainCD_counter_valueNext;
    end
  end


endmodule
