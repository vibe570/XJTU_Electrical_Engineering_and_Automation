`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/04 09:25:56
// Design Name: 
// Module Name: My_clkd
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


module My_clkdiv(
    input clk,
    input rst,
    output reg clko
    );
    
    parameter N=100000000;
    integer cnt;
    always @(posedge clk or posedge rst)
    begin
    if(rst==1)
    cnt<=0;
    else if(cnt==N/2)
    cnt<=0;
    else
    cnt<=cnt+1;
    end
    
    always @(posedge clk or posedge rst)
    begin
    if(rst==1)
    clko<=0;
    else if(cnt==N/2)
    clko<=~clko;
    end
endmodule
