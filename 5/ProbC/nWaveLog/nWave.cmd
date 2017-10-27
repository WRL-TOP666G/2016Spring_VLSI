wvResizeWindow -win $_nWave1 -2 26 1916 1003
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 {/home/user2/vlsi16/vlsi1641/lab5/ProbC/regfile.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/regfile_sipo_tb"
wvSetPosition -win $_nWave1 {("G1" 12)}
wvSetPosition -win $_nWave1 {("G1" 12)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/regfile_sipo_tb/clk} \
{/regfile_sipo_tb/reg_enable} \
{/regfile_sipo_tb/reg_write} \
{/regfile_sipo_tb/rst} \
{/regfile_sipo_tb/src1\[31:0\]} \
{/regfile_sipo_tb/src2\[31:0\]} \
{/regfile_sipo_tb/src3\[31:0\]} \
{/regfile_sipo_tb/src4\[31:0\]} \
{/regfile_sipo_tb/src5\[31:0\]} \
{/regfile_sipo_tb/src_addr\[6:0\]} \
{/regfile_sipo_tb/write_addr\[6:0\]} \
{/regfile_sipo_tb/write_data\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 9 10 11 12 )} 
wvSetPosition -win $_nWave1 {("G1" 12)}
wvGetSignalClose -win $_nWave1
wvZoomAll -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoom -win $_nWave1 0.000000 0.000000
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomAll -win $_nWave1
wvExit
