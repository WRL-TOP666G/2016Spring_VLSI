wvResizeWindow -win $_nWave1 56 260 960 332
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/home/user2/vlsi16/vlsi1641/lab4/Lab4_E24039122/ProC/BCD_Adder.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/BCD_Adder_tb"
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/BCD_Adder_tb/A1\[3:0\]} \
{/BCD_Adder_tb/A2\[3:0\]} \
{/BCD_Adder_tb/B1\[3:0\]} \
{/BCD_Adder_tb/B2\[3:0\]} \
{/BCD_Adder_tb/Out_0\[6:0\]} \
{/BCD_Adder_tb/Out_1\[6:0\]} \
{/BCD_Adder_tb/ov_flag} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 )} 
wvSetPosition -win $_nWave1 {("G1" 7)}
wvGetSignalClose -win $_nWave1
wvResizeWindow -win $_nWave1 56 260 1514 654
wvZoomAll -win $_nWave1
wvExit
