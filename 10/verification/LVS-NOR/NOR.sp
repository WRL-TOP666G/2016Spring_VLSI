* SPICE NETLIST
***************************************

.SUBCKT L POS NEG
.ENDS
***************************************
.SUBCKT NOR F X Y GND VDD
** N=6 EP=5 IP=0 FDC=4
M0 F X GND GND N_18 L=1.8e-07 W=5e-07 AD=1.275e-13 AS=2.45e-13 PD=5.1e-07 PS=1.48e-06 $X=1365 $Y=1105 $D=0
M1 GND Y F GND N_18 L=1.8e-07 W=5e-07 AD=2.45e-13 AS=1.275e-13 PD=1.48e-06 PS=5.1e-07 $X=2055 $Y=1105 $D=0
M2 3 X F VDD P_18 L=1.8e-07 W=1e-06 AD=2.55e-13 AS=4.9e-13 PD=5.1e-07 PS=1.98e-06 $X=1365 $Y=3250 $D=1
M3 VDD Y 3 VDD P_18 L=1.8e-07 W=1e-06 AD=4.9e-13 AS=2.55e-13 PD=1.98e-06 PS=5.1e-07 $X=2055 $Y=3250 $D=1
.ENDS
***************************************
