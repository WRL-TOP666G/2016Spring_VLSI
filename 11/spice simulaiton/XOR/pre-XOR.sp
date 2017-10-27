*XOR_gate
.subckt xor A B Y GND VDD

Mp1 Ai A VDD VDD p_18 w=1u   L=0.18u
Mn1 Ai A GND GND n_18 w=1u L=0.18u


Mp2 Bi B VDD VDD p_18 w=1u   L=0.18u
Mn2 Bi B GND GND n_18 w=1u L=0.18u


Mp3 d  A  VDD VDD p_18 w=1u L=0.18u
Mp4 Y  Bi d   VDD p_18 w=1u L=0.18u
Mp5 Y  B  f   VDD p_18 w=1u L=0.18u
Mp6 f  Ai VDD VDD p_18 w=1u L=0.18u


Mn3 Y A  e   GND n_18 w=0.5u L=0.18u
Mn4 e Ai GND GND n_18 w=0.5u L=0.18u
Mn5 e B  GND GND n_18 w=0.5u L=0.18u
Mn6 Y Bi e   GND n_18 w=0.5u L=0.18u

.ends


.GLOBAL GND VDD
VGND GND 0v DC 0v
VVDD VDD GND DC 1.8v
V1 A GND PULSE ( 0V 1.8V 0u 0u 0u 5u 10u )
V2 B GND PULSE ( 0V 1.8V 0u 0u 0u 10u 20u )

XXOR A B Y  GND VDD XOR

.protect
.lib 'cic018.l' TT
.unprotect
.options post
.tran 0.01u 140u
.end
