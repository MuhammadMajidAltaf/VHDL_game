# I/O - BUTTONS #
set_property PACKAGE_PIN Y16 [get_ports START]
set_property PACKAGE_PIN V16 [get_ports DIFF_CHANGE]
set_property PACKAGE_PIN R18 [get_ports RST_BTN]

# I/O - LEDS #
set_property PACKAGE_PIN D18 [get_ports {LEDS[3]}]
set_property PACKAGE_PIN G14 [get_ports {LEDS[2]}]
set_property PACKAGE_PIN M15 [get_ports {LEDS[1]}]
set_property PACKAGE_PIN M14 [get_ports {LEDS[0]}]

# GLOBAL CLK #
set_property PACKAGE_PIN L16 [get_ports CLK]

# VGA #
set_property PACKAGE_PIN Y17 [get_ports H_SYNC_O]
set_property PACKAGE_PIN H15 [get_ports V_SYNC_O]
set_property PACKAGE_PIN W16 [get_ports {BLUE_OUT[7]}]
set_property PACKAGE_PIN U17 [get_ports {BLUE_OUT[6]}]
set_property PACKAGE_PIN V12 [get_ports {BLUE_OUT[5]}]
set_property PACKAGE_PIN V13 [get_ports {BLUE_OUT[4]}]
set_property PACKAGE_PIN P14 [get_ports {GREEN_OUT[7]}]
set_property PACKAGE_PIN V17 [get_ports {GREEN_OUT[6]}]
set_property PACKAGE_PIN T15 [get_ports {GREEN_OUT[5]}]
set_property PACKAGE_PIN U15 [get_ports {GREEN_OUT[4]}]
set_property PACKAGE_PIN T14 [get_ports {GREEN_OUT[3]}]
set_property PACKAGE_PIN U14 [get_ports {GREEN_OUT[2]}]
set_property PACKAGE_PIN T10 [get_ports {RED_OUT[7]}]
set_property PACKAGE_PIN U12 [get_ports {RED_OUT[6]}]
set_property PACKAGE_PIN T11 [get_ports {RED_OUT[5]}]
set_property PACKAGE_PIN T12 [get_ports {RED_OUT[4]}]
set_property PACKAGE_PIN W15 [get_ports {RED_OUT[3]}]
set_property PACKAGE_PIN Y14 [get_ports {RED_OUT[2]}]
set_property PACKAGE_PIN V15 [get_ports {RED_OUT[1]}]
set_property PACKAGE_PIN W14 [get_ports {RED_OUT[0]}]

# TOUCH CONTROLLER #
set_property PACKAGE_PIN J15 [get_ports DISP]
set_property PACKAGE_PIN T20 [get_ports MISO]
set_property PACKAGE_PIN Y18 [get_ports MOSI]
set_property PACKAGE_PIN W18 [get_ports BL_EN]
set_property PACKAGE_PIN Y19 [get_ports SCK]
set_property PACKAGE_PIN U20 [get_ports SSEL]
set_property PACKAGE_PIN T17 [get_ports DCLK]
set_property PACKAGE_PIN W19 [get_ports BUSY]

# OTHER #
set_property PACKAGE_PIN V20 [get_ports GND]


##################################################################
# TYPES #
set_property IOSTANDARD LVCMOS33 [get_ports START]
set_property IOSTANDARD LVCMOS33 [get_ports DIFF_CHANGE]
set_property IOSTANDARD LVCMOS33 [get_ports RST_BTN]
set_property IOSTANDARD LVCMOS33 [get_ports {LEDS[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LEDS[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LEDS[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LEDS[0]}]

set_property IOSTANDARD LVCMOS33 [get_ports H_SYNC_O]
set_property IOSTANDARD LVCMOS33 [get_ports V_SYNC_O]

set_property IOSTANDARD LVCMOS33 [get_ports CLK]

set_property IOSTANDARD LVCMOS33 [get_ports {BLUE_OUT[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {BLUE_OUT[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {BLUE_OUT[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {BLUE_OUT[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {GREEN_OUT[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {GREEN_OUT[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {GREEN_OUT[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {GREEN_OUT[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {GREEN_OUT[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {GREEN_OUT[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {RED_OUT[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {RED_OUT[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {RED_OUT[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {RED_OUT[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {RED_OUT[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {RED_OUT[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {RED_OUT[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {RED_OUT[0]}]

set_property IOSTANDARD LVCMOS33 [get_ports BUSY]
set_property IOSTANDARD LVCMOS33 [get_ports DCLK]
set_property IOSTANDARD LVCMOS33 [get_ports DISP]
set_property IOSTANDARD LVCMOS33 [get_ports MISO]
set_property IOSTANDARD LVCMOS33 [get_ports MOSI]
set_property IOSTANDARD LVCMOS33 [get_ports BL_EN]
set_property IOSTANDARD LVCMOS33 [get_ports SCK]
set_property IOSTANDARD LVCMOS33 [get_ports SSEL]

set_property IOSTANDARD LVCMOS33 [get_ports GND]



##################################################################
# DEBUG #
set_property MARK_DEBUG false [get_nets {TOUCH_CONTROLLER/out_port[0]}]

set_property MARK_DEBUG false [get_nets {TOUCH_CONTROLLER/out_port[1]}]
set_property MARK_DEBUG false [get_nets {TOUCH_CONTROLLER/out_port[2]}]
set_property MARK_DEBUG false [get_nets {TOUCH_CONTROLLER/out_port[3]}]
set_property MARK_DEBUG false [get_nets {TOUCH_CONTROLLER/out_port[4]}]
set_property MARK_DEBUG false [get_nets {TOUCH_CONTROLLER/out_port[5]}]
set_property MARK_DEBUG false [get_nets {TOUCH_CONTROLLER/out_port[6]}]
set_property MARK_DEBUG false [get_nets {TOUCH_CONTROLLER/out_port[7]}]

set_property MARK_DEBUG false [get_nets {X_TOUCH[0]}]
set_property MARK_DEBUG false [get_nets {X_TOUCH[1]}]
set_property MARK_DEBUG false [get_nets {X_TOUCH[2]}]
set_property MARK_DEBUG false [get_nets {X_TOUCH[3]}]
set_property MARK_DEBUG false [get_nets {X_TOUCH[4]}]
set_property MARK_DEBUG false [get_nets {X_TOUCH[5]}]
set_property MARK_DEBUG false [get_nets {X_TOUCH[6]}]
set_property MARK_DEBUG false [get_nets {X_TOUCH[7]}]
set_property MARK_DEBUG false [get_nets {Y_TOUCH[0]}]
set_property MARK_DEBUG false [get_nets {Y_TOUCH[1]}]
set_property MARK_DEBUG false [get_nets {Y_TOUCH[2]}]
set_property MARK_DEBUG false [get_nets {Y_TOUCH[3]}]
set_property MARK_DEBUG false [get_nets {Y_TOUCH[4]}]
set_property MARK_DEBUG false [get_nets {Y_TOUCH[5]}]
set_property MARK_DEBUG false [get_nets {Y_TOUCH[6]}]
set_property MARK_DEBUG false [get_nets {Y_TOUCH[7]}]

set_property MARK_DEBUG false [get_nets RST]
set_property MARK_DEBUG false [get_nets RST_BTN_IBUF]