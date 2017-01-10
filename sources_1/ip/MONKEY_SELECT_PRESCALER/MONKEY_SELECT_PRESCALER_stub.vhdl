-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.2 (win64) Build 1577090 Thu Jun  2 16:32:40 MDT 2016
-- Date        : Mon Jan 09 23:58:55 2017
-- Host        : DESKTOP-IB3KRIO running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/Tibo/Documents/programmable_logic/_game/_game.srcs/sources_1/ip/MONKEY_SELECT_PRESCALER/MONKEY_SELECT_PRESCALER_stub.vhdl
-- Design      : MONKEY_SELECT_PRESCALER
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MONKEY_SELECT_PRESCALER is
  Port ( 
    CLK : in STD_LOGIC;
    SCLR : in STD_LOGIC;
    LOAD : in STD_LOGIC;
    L : in STD_LOGIC_VECTOR ( 24 downto 0 );
    THRESH0 : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 24 downto 0 )
  );

end MONKEY_SELECT_PRESCALER;

architecture stub of MONKEY_SELECT_PRESCALER is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "CLK,SCLR,LOAD,L[24:0],THRESH0,Q[24:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "c_counter_binary_v12_0_9,Vivado 2016.2";
begin
end;
