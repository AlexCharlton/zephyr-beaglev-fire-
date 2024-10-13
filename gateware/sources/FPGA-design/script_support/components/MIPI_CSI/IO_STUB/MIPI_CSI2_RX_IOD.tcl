# Exporting Component Description of MIPI_CSI2_RX_IOD to TCL
# Family: PolarFireSoC
# Part Number: MPFS250T-FCVG484E
# Create and Configure the core component MIPI_CSI2_RX_IOD
create_and_configure_core -core_vlnv {Actel:SystemBuilder:PF_IOD_GENERIC_RX:*} -component_name {MIPI_CSI2_RX_IOD} -params {\
"CLOCK_DELAY_VALUE:0" \
"DATA_RATE:250" \
"DATA_RATIO:2" \
"DATA_WIDTH:1" \
"DDR_MODE:DDR" \
"DELAY_LINE_SIMULATION_MODE_EN:false" \
"DYN_USE_WIDE_MODE:false" \
"EXPOSE_CLK_TRAIN_PORTS:false" \
"EXPOSE_DYNAMIC_DELAY_CTRL:false" \
"EXPOSE_EXTRA_TRAINING_PORTS:false" \
"EXPOSE_FA_CLK_DATA:false" \
"EXPOSE_RX_RAW_DATA:false" \
"FABRIC_CLK_SOURCE:GLOBAL" \
"FRACTIONAL_CLOCK_RATIO:RATIO" \
"ICB_BCLK_OFFSET:0" \
"ICB_USE_WIDE_MODE:true" \
"IO_NUMBER:4" \
"NEED_LANECTRL:false" \
"NEED_TIP:false" \
"PLL_BCLK_OFFSET:3" \
"RATIO:1" \
"RXCTL_SPLIT_WIDTH:1" \
"RXD_LVDS_FAILSAFE_EN:false" \
"RXD_SPLIT_WIDTH:4" \
"RX_BIT_SLIP_EN:false" \
"RX_CLK_DIFFERENTIAL:true" \
"RX_CLK_LVDS_FAILSAFE_EN:false" \
"RX_CLK_SOURCE:FABRIC" \
"RX_CLK_TO_DATA:ALIGNED" \
"RX_DATA_BUS_MODE:RX_DATA_PER_IO" \
"RX_DATA_DIFFERENTIAL:true" \
"RX_ENABLED:true" \
"RX_INTERFACE_NAME:RX_DDR_G_A" \
"RX_IOG_ARCHETYPE:RX_DDR_GR" \
"RX_MIPI_MODE:false" \
"SIMULATION_MODE:FULL" \
"USE_SHARED_PLL:false" \
"X1_ADD_DELAY_LINE_ON_CLOCK:false" }
# Exporting Component Description of MIPI_CSI2_RX_IOD to TCL done
