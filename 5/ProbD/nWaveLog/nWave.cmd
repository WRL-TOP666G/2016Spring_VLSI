wvResizeWindow -win $_nWave1 -2 26 1916 1003
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 {/home/user2/vlsi16/vlsi1641/lab5/ProbD/subsystem.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/subsystem_tb"
wvSetPosition -win $_nWave1 {("G1" 12)}
wvSetPosition -win $_nWave1 {("G1" 12)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/subsystem_tb/alu_enable} \
{/subsystem_tb/alu_op\[3:0\]} \
{/subsystem_tb/alu_overflow} \
{/subsystem_tb/clk} \
{/subsystem_tb/reg_enable} \
{/subsystem_tb/reg_write} \
{/subsystem_tb/rst} \
{/subsystem_tb/src1_addr\[5:0\]} \
{/subsystem_tb/src2_addr\[5:0\]} \
{/subsystem_tb/write_addr\[5:0\]} \
{/subsystem_tb/write_data\[31:0\]} \
{/subsystem_tb/write_sel} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 9 10 11 12 )} 
wvSetPosition -win $_nWave1 {("G1" 12)}
wvGetSignalClose -win $_nWave1
wvZoomAll -win $_nWave1
wvResizeWindow -win $_nWave1 -2 26 1916 1003
wvResizeWindow -win $_nWave1 -2 26 1916 1003
wvSetCursor -win $_nWave1 44296.431331 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 42700.000000
wvSetCursor -win $_nWave1 42700.000000
wvSetCursor -win $_nWave1 42700.000000
wvZoomIn -win $_nWave1
wvZoom -win $_nWave1 32759.768626 37657.408453
wvSetCursor -win $_nWave1 35137.522423 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 34545.568139
wvSetCursor -win $_nWave1 34595.906638
wvSetCursor -win $_nWave1 34495.229640
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvSelectSignal -win $_nWave1 {( "G1" 9 )} 
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvSetPosition -win $_nWave1 {("G1" 8)}
wvExpandBus -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 18)}
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvSetPosition -win $_nWave1 {("G1" 8)}
wvCollapseBus -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 12)}
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvSetPosition -win $_nWave1 {("G1" 8)}
wvExpandBus -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 18)}
wvSelectSignal -win $_nWave1 {( "G1" 15 )} 
wvSetPosition -win $_nWave1 {("G1" 15)}
wvExpandBus -win $_nWave1 {("G1" 15)}
wvSetPosition -win $_nWave1 {("G1" 24)}
wvSelectSignal -win $_nWave1 {( "G1" 22 )} 
wvSetPosition -win $_nWave1 {("G1" 22)}
wvExpandBus -win $_nWave1 {("G1" 22)}
wvSetPosition -win $_nWave1 {("G1" 30)}
wvSelectSignal -win $_nWave1 {( "G1" 22 )} 
wvSetPosition -win $_nWave1 {("G1" 22)}
wvCollapseBus -win $_nWave1 {("G1" 22)}
wvSetPosition -win $_nWave1 {("G1" 22)}
wvSetPosition -win $_nWave1 {("G1" 24)}
wvSelectSignal -win $_nWave1 {( "G1" 22 )} 
wvSetPosition -win $_nWave1 {("G1" 22)}
wvExpandBus -win $_nWave1 {("G1" 22)}
wvSetPosition -win $_nWave1 {("G1" 30)}
wvSelectSignal -win $_nWave1 {( "G1" 22 )} 
wvSetPosition -win $_nWave1 {("G1" 22)}
wvCollapseBus -win $_nWave1 {("G1" 22)}
wvSetPosition -win $_nWave1 {("G1" 22)}
wvSetPosition -win $_nWave1 {("G1" 24)}
wvSelectSignal -win $_nWave1 {( "G1" 15 )} 
wvSetPosition -win $_nWave1 {("G1" 15)}
wvCollapseBus -win $_nWave1 {("G1" 15)}
wvSetPosition -win $_nWave1 {("G1" 15)}
wvSetPosition -win $_nWave1 {("G1" 18)}
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvSetPosition -win $_nWave1 {("G1" 8)}
wvCollapseBus -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 12)}
wvSelectSignal -win $_nWave1 {( "G1" 11 )} 
wvSelectSignal -win $_nWave1 {( "G1" 11 )} 
wvSetPosition -win $_nWave1 {("G1" 11)}
wvExpandBus -win $_nWave1 {("G1" 11)}
wvSetPosition -win $_nWave1 {("G1" 44)}
wvSelectSignal -win $_nWave1 {( "G1" 11 )} 
wvSetPosition -win $_nWave1 {("G1" 11)}
wvCollapseBus -win $_nWave1 {("G1" 11)}
wvSetPosition -win $_nWave1 {("G1" 11)}
wvSetPosition -win $_nWave1 {("G1" 12)}
wvSelectSignal -win $_nWave1 {( "G1" 11 )} 
wvSetPosition -win $_nWave1 {("G1" 11)}
wvExpandBus -win $_nWave1 {("G1" 11)}
wvSetPosition -win $_nWave1 {("G1" 44)}
wvSelectSignal -win $_nWave1 {( "G1" 11 )} 
wvSetPosition -win $_nWave1 {("G1" 11)}
wvCollapseBus -win $_nWave1 {("G1" 11)}
wvSetPosition -win $_nWave1 {("G1" 11)}
wvSetPosition -win $_nWave1 {("G1" 12)}
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoom -win $_nWave1 6141.112455 35027.085852
wvZoom -win $_nWave1 8952.866818 9651.439331
wvSetCursor -win $_nWave1 9023.822188 -snap {("G2" 0)}
wvSetCursor -win $_nWave1 8503.175579 -snap {("G2" 0)}
wvSetCursor -win $_nWave1 2662.945011 -snap {("G1" 12)}
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomAll -win $_nWave1
wvSetCursor -win $_nWave1 14859.975816 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 16186.759371 -snap {("G1" 9)}
wvSetCursor -win $_nWave1 23237.666264 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 25587.968561 -snap {("G1" 9)}
wvSetCursor -win $_nWave1 24109.552600 -snap {("G1" 9)}
wvSetCursor -win $_nWave1 18726.602177 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 15087.424426 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 13078.295042 -snap {("G1" 9)}
wvSetCursor -win $_nWave1 9856.106409 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 8718.863362 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 7467.896010 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 3146.372430 -snap {("G1" 9)}
wvSetCursor -win $_nWave1 2236.577993 -snap {("G1" 9)}
wvSetCursor -win $_nWave1 2918.923821 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 5155.501814 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 6937.182588 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 10273.095526 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 9401.209190 -snap {("G1" 10)}
