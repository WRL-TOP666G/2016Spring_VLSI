wvResizeWindow -win $_nWave1 -2 29 1916 1000
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 {/home/user2/vlsi16/vlsi1641/lab5/ProbA/ALU.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/ALU_tb"
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/ALU_tb/alu_op\[3:0\]} \
{/ALU_tb/alu_out\[31:0\]} \
{/ALU_tb/src1\[31:0\]} \
{/ALU_tb/src2\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 )} 
wvSetPosition -win $_nWave1 {("G1" 4)}
wvGetSignalClose -win $_nWave1
wvZoomAll -win $_nWave1
wvZoom -win $_nWave1 1010.695187 20975.044563
wvZoom -win $_nWave1 1010.695187 1034.419904
wvZoomAll -win $_nWave1
wvZoom -win $_nWave1 1010.695187 10032.085561
wvExit
