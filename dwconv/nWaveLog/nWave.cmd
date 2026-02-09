wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/RAID2/COURSE/2025_Fall/ea25vlsiintro/ea25vlsiintro056/wuyizhong/dwconv/waves.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/TESTBED"
wvGetSignalSetScope -win $_nWave1 "/TESTBED/I_DUT"
wvRestoreSignal -win $_nWave1 \
           "/RAID2/LAB/icssl/icsslRA21/Mix_ffn/dwconv/signal.rc" \
           -overWriteAutoAlias on -appendSignals on
wvScrollDown -win $_nWave1 20
wvScrollUp -win $_nWave1 25
wvScrollDown -win $_nWave1 0
wvGetSignalOpen -win $_nWave1
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
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 958642814.055081 -snap {("G1" 8)}
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 1354491603.662156 -snap {("G1" 7)}
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 1357107501.454179 -snap {("G1" 12)}
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/TESTBED/I_DUT/dw"
wvSetPosition -win $_nWave1 {("G6" 15)}
wvSetPosition -win $_nWave1 {("G6" 15)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/I_DUT/clk} \
{/TESTBED/I_DUT/rst_n} \
{/TESTBED/I_DUT/state\[1:0\]} \
{/TESTBED/I_DUT/in_valid} \
{/TESTBED/I_DUT/out_valid} \
{/TESTBED/I_DUT/sum\[20:0\]} \
{/TESTBED/I_DUT/in_data\[15:0\]} \
{/TESTBED/I_DUT/weight\[143:0\]} \
{/TESTBED/I_DUT/bias\[15:0\]} \
{/TESTBED/I_DUT/dw/bias_reg\[0:1\]} \
{/TESTBED/I_DUT/dw/bias_reg\[0\]\[15:0\]} \
{/TESTBED/I_DUT/dw/bias_reg\[1\]\[15:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/TESTBED/I_DUT/in_count\[8:0\]} \
{/TESTBED/I_DUT/conv_col\[7:0\]} \
{/TESTBED/I_DUT/conv_row\[6:0\]} \
{/TESTBED/I_DUT/in_col\[7:0\]} \
{/TESTBED/I_DUT/in_row\[6:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/TESTBED/I_DUT/dw/row_reg\[6:0\]} \
{/TESTBED/I_DUT/conv_flag} \
{/TESTBED/I_DUT/conv_col_n\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvAddSignal -win $_nWave1 -group {"G5" \
{/TESTBED/I_DUT/dw/weight_reg\[0:8\]} \
{/TESTBED/I_DUT/dw/weight_reg\[0\]\[15:0\]} \
{/TESTBED/I_DUT/dw/weight_reg\[1\]\[15:0\]} \
{/TESTBED/I_DUT/dw/weight_reg\[2\]\[15:0\]} \
{/TESTBED/I_DUT/dw/weight_reg\[3\]\[15:0\]} \
{/TESTBED/I_DUT/dw/weight_reg\[4\]\[15:0\]} \
{/TESTBED/I_DUT/dw/weight_reg\[5\]\[15:0\]} \
{/TESTBED/I_DUT/dw/weight_reg\[6\]\[15:0\]} \
{/TESTBED/I_DUT/dw/weight_reg\[7\]\[15:0\]} \
{/TESTBED/I_DUT/dw/weight_reg\[8\]\[15:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
{/TESTBED/I_DUT/dw/mul\[0:8\]} \
{/TESTBED/I_DUT/dw/mul\[0\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul\[1\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul\[2\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul\[3\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul\[4\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul\[5\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul\[6\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul\[7\]\[31:0\]} \
{/TESTBED/I_DUT/dw/addr\[18:0\]} \
{/TESTBED/I_DUT/dw/addr_cnt_n\[16:0\]} \
{/TESTBED/I_DUT/dw/addr_temp\[18:0\]} \
{/TESTBED/I_DUT/dw/base_addr_n\[16:0\]} \
{/TESTBED/I_DUT/dw/offset_cnt\[8:0\]} \
{/TESTBED/I_DUT/dw/offset_cnt_reg\[8:0\]} \
{/TESTBED/I_DUT/dw/mul\[8\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul_closed\[0:8\]} \
{/TESTBED/I_DUT/dw/mul_closed\[0\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul_closed\[1\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul_closed\[2\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul_closed\[3\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul_closed\[4\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul_closed\[5\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul_closed\[6\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul_closed\[7\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul_closed\[8\]\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G7" \
{/TESTBED/I_DUT/dw/bias_extended\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G8" \
}
wvSelectSignal -win $_nWave1 {( "G6" 10 11 12 13 14 15 )} 
wvSetPosition -win $_nWave1 {("G6" 15)}
wvSelectSignal -win $_nWave1 {( "G6" 10 11 12 13 14 15 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSetRadix -win $_nWave1 -2Com
wvSetCursor -win $_nWave1 1359784603.929250 -snap {("G6" 10)}
wvSetCursor -win $_nWave1 1359836009.437322 -snap {("G6" 10)}
wvSetCursor -win $_nWave1 1359890627.789649 -snap {("G6" 10)}
wvSetCursor -win $_nWave1 1360467333.333333 -snap {("G6" 10)}
wvSetCursor -win $_nWave1 1360586208.570750 -snap {("G6" 9)}
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvSetPosition -win $_nWave1 {("G6" 12)}
wvSetPosition -win $_nWave1 {("G6" 7)}
wvSetPosition -win $_nWave1 {("G6" 5)}
wvSetPosition -win $_nWave1 {("G6" 2)}
wvSetPosition -win $_nWave1 {("G6" 0)}
wvSetPosition -win $_nWave1 {("G5" 10)}
wvSetPosition -win $_nWave1 {("G5" 7)}
wvSetPosition -win $_nWave1 {("G5" 5)}
wvSetPosition -win $_nWave1 {("G5" 2)}
wvSetPosition -win $_nWave1 {("G5" 1)}
wvSetPosition -win $_nWave1 {("G4" 0)}
wvSetPosition -win $_nWave1 {("G3" 3)}
wvSetPosition -win $_nWave1 {("G4" 0)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G4" 0)}
wvSetPosition -win $_nWave1 {("G4" 6)}
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvSetCursor -win $_nWave1 1361462953.302813 -snap {("G4" 3)}
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 1359475869.371478 -snap {("G4" 1)}
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 1359462596.308901 -snap {("G4" 1)}
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvZoomIn -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSetRadix -win $_nWave1 -2Com
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
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
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
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 1362034980.142302 -snap {("G1" 5)}
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 1362039939.970370 -snap {("G4" 1)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/TESTBED/I_DUT/dw/u_sram"
wvGetSignalSetScope -win $_nWave1 "/TESTBED/I_DUT/dw"
wvSetPosition -win $_nWave1 {("G4" 7)}
wvSetPosition -win $_nWave1 {("G4" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/I_DUT/clk} \
{/TESTBED/I_DUT/rst_n} \
{/TESTBED/I_DUT/state\[1:0\]} \
{/TESTBED/I_DUT/in_valid} \
{/TESTBED/I_DUT/out_valid} \
{/TESTBED/I_DUT/sum\[20:0\]} \
{/TESTBED/I_DUT/in_data\[15:0\]} \
{/TESTBED/I_DUT/weight\[143:0\]} \
{/TESTBED/I_DUT/bias\[15:0\]} \
{/TESTBED/I_DUT/dw/bias_reg\[0:1\]} \
{/TESTBED/I_DUT/dw/bias_reg\[0\]\[15:0\]} \
{/TESTBED/I_DUT/dw/bias_reg\[1\]\[15:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/TESTBED/I_DUT/in_count\[8:0\]} \
{/TESTBED/I_DUT/conv_col\[7:0\]} \
{/TESTBED/I_DUT/conv_row\[6:0\]} \
{/TESTBED/I_DUT/in_col\[7:0\]} \
{/TESTBED/I_DUT/in_row\[6:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/TESTBED/I_DUT/dw/row_reg\[6:0\]} \
{/TESTBED/I_DUT/conv_flag} \
{/TESTBED/I_DUT/conv_col_n\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/TESTBED/I_DUT/dw/addr\[18:0\]} \
{/TESTBED/I_DUT/dw/addr_cnt_n\[16:0\]} \
{/TESTBED/I_DUT/dw/addr_temp\[18:0\]} \
{/TESTBED/I_DUT/dw/base_addr_n\[16:0\]} \
{/TESTBED/I_DUT/dw/offset_cnt\[8:0\]} \
{/TESTBED/I_DUT/dw/offset_cnt_reg\[8:0\]} \
{/TESTBED/I_DUT/dw/sram_rdata\[15:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
{/TESTBED/I_DUT/dw/weight_reg\[0:8\]} \
{/TESTBED/I_DUT/dw/weight_reg\[0\]\[15:0\]} \
{/TESTBED/I_DUT/dw/weight_reg\[1\]\[15:0\]} \
{/TESTBED/I_DUT/dw/weight_reg\[2\]\[15:0\]} \
{/TESTBED/I_DUT/dw/weight_reg\[3\]\[15:0\]} \
{/TESTBED/I_DUT/dw/weight_reg\[4\]\[15:0\]} \
{/TESTBED/I_DUT/dw/weight_reg\[5\]\[15:0\]} \
{/TESTBED/I_DUT/dw/weight_reg\[6\]\[15:0\]} \
{/TESTBED/I_DUT/dw/weight_reg\[7\]\[15:0\]} \
{/TESTBED/I_DUT/dw/weight_reg\[8\]\[15:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
{/TESTBED/I_DUT/dw/mul\[0:8\]} \
{/TESTBED/I_DUT/dw/mul\[0\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul\[1\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul\[2\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul\[3\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul\[4\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul\[5\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul\[6\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul\[7\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul\[8\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul_closed\[0:8\]} \
{/TESTBED/I_DUT/dw/mul_closed\[0\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul_closed\[1\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul_closed\[2\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul_closed\[3\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul_closed\[4\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul_closed\[5\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul_closed\[6\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul_closed\[7\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul_closed\[8\]\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G7" \
{/TESTBED/I_DUT/dw/bias_extended\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G8" \
}
wvSelectSignal -win $_nWave1 {( "G4" 7 )} 
wvSetPosition -win $_nWave1 {("G4" 7)}
wvSelectSignal -win $_nWave1 {( "G5" 1 )} 
wvSelectSignal -win $_nWave1 {( "G5" 1 2 3 4 5 6 7 8 9 10 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G4" 7)}
wvSelectSignal -win $_nWave1 {( "G4" 7 )} 
wvSelectSignal -win $_nWave1 {( "G4" 7 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSetRadix -win $_nWave1 -2Com
wvScrollUp -win $_nWave1 22
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/TESTBED/I_DUT/dw"
wvSetPosition -win $_nWave1 {("G4" 8)}
wvSetPosition -win $_nWave1 {("G4" 8)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/I_DUT/clk} \
{/TESTBED/I_DUT/rst_n} \
{/TESTBED/I_DUT/state\[1:0\]} \
{/TESTBED/I_DUT/in_valid} \
{/TESTBED/I_DUT/out_valid} \
{/TESTBED/I_DUT/sum\[20:0\]} \
{/TESTBED/I_DUT/in_data\[15:0\]} \
{/TESTBED/I_DUT/weight\[143:0\]} \
{/TESTBED/I_DUT/bias\[15:0\]} \
{/TESTBED/I_DUT/dw/bias_reg\[0:1\]} \
{/TESTBED/I_DUT/dw/bias_reg\[0\]\[15:0\]} \
{/TESTBED/I_DUT/dw/bias_reg\[1\]\[15:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/TESTBED/I_DUT/in_count\[8:0\]} \
{/TESTBED/I_DUT/conv_col\[7:0\]} \
{/TESTBED/I_DUT/conv_row\[6:0\]} \
{/TESTBED/I_DUT/in_col\[7:0\]} \
{/TESTBED/I_DUT/in_row\[6:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/TESTBED/I_DUT/dw/row_reg\[6:0\]} \
{/TESTBED/I_DUT/conv_flag} \
{/TESTBED/I_DUT/conv_col_n\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/TESTBED/I_DUT/dw/addr\[18:0\]} \
{/TESTBED/I_DUT/dw/addr_cnt_n\[16:0\]} \
{/TESTBED/I_DUT/dw/addr_temp\[18:0\]} \
{/TESTBED/I_DUT/dw/base_addr_n\[16:0\]} \
{/TESTBED/I_DUT/dw/offset_cnt\[8:0\]} \
{/TESTBED/I_DUT/dw/offset_cnt_reg\[8:0\]} \
{/TESTBED/I_DUT/dw/sram_rdata\[15:0\]} \
{/TESTBED/I_DUT/dw/sub\[8:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvAddSignal -win $_nWave1 -group {"G6" \
{/TESTBED/I_DUT/dw/mul\[0:8\]} \
{/TESTBED/I_DUT/dw/mul\[0\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul\[1\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul\[2\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul\[3\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul\[4\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul\[5\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul\[6\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul\[7\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul\[8\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul_closed\[0:8\]} \
{/TESTBED/I_DUT/dw/mul_closed\[0\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul_closed\[1\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul_closed\[2\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul_closed\[3\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul_closed\[4\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul_closed\[5\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul_closed\[6\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul_closed\[7\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul_closed\[8\]\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G7" \
{/TESTBED/I_DUT/dw/bias_extended\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G8" \
}
wvSelectSignal -win $_nWave1 {( "G4" 8 )} 
wvSetPosition -win $_nWave1 {("G4" 8)}
wvSetRadix -win $_nWave1 -2Com
wvSelectSignal -win $_nWave1 {( "G4" 8 )} 
wvSetRadix -win $_nWave1 -format UDec
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvSelectSignal -win $_nWave1 {( "G4" 8 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G5" 0)}
wvSetPosition -win $_nWave1 {("G4" 7)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/TESTBED/I_DUT/dw"
wvSetPosition -win $_nWave1 {("G4" 9)}
wvSetPosition -win $_nWave1 {("G4" 9)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/I_DUT/clk} \
{/TESTBED/I_DUT/rst_n} \
{/TESTBED/I_DUT/state\[1:0\]} \
{/TESTBED/I_DUT/in_valid} \
{/TESTBED/I_DUT/out_valid} \
{/TESTBED/I_DUT/sum\[20:0\]} \
{/TESTBED/I_DUT/in_data\[15:0\]} \
{/TESTBED/I_DUT/weight\[143:0\]} \
{/TESTBED/I_DUT/bias\[15:0\]} \
{/TESTBED/I_DUT/dw/bias_reg\[0:1\]} \
{/TESTBED/I_DUT/dw/bias_reg\[0\]\[15:0\]} \
{/TESTBED/I_DUT/dw/bias_reg\[1\]\[15:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/TESTBED/I_DUT/in_count\[8:0\]} \
{/TESTBED/I_DUT/conv_col\[7:0\]} \
{/TESTBED/I_DUT/conv_row\[6:0\]} \
{/TESTBED/I_DUT/in_col\[7:0\]} \
{/TESTBED/I_DUT/in_row\[6:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/TESTBED/I_DUT/dw/row_reg\[6:0\]} \
{/TESTBED/I_DUT/conv_flag} \
{/TESTBED/I_DUT/conv_col_n\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/TESTBED/I_DUT/dw/addr\[18:0\]} \
{/TESTBED/I_DUT/dw/addr_cnt_n\[16:0\]} \
{/TESTBED/I_DUT/dw/addr_temp\[18:0\]} \
{/TESTBED/I_DUT/dw/base_addr_n\[16:0\]} \
{/TESTBED/I_DUT/dw/offset_cnt\[8:0\]} \
{/TESTBED/I_DUT/dw/offset_cnt_reg\[8:0\]} \
{/TESTBED/I_DUT/dw/sram_rdata\[15:0\]} \
{/TESTBED/I_DUT/dw/in_data_reg\[0:8\]} \
{/TESTBED/I_DUT/dw/sub\[9:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvAddSignal -win $_nWave1 -group {"G6" \
{/TESTBED/I_DUT/dw/mul\[0:8\]} \
{/TESTBED/I_DUT/dw/mul\[0\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul\[1\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul\[2\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul\[3\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul\[4\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul\[5\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul\[6\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul\[7\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul\[8\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul_closed\[0:8\]} \
{/TESTBED/I_DUT/dw/mul_closed\[0\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul_closed\[1\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul_closed\[2\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul_closed\[3\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul_closed\[4\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul_closed\[5\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul_closed\[6\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul_closed\[7\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul_closed\[8\]\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G7" \
{/TESTBED/I_DUT/dw/bias_extended\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G8" \
}
wvSelectSignal -win $_nWave1 {( "G4" 8 9 )} 
wvSetPosition -win $_nWave1 {("G4" 9)}
wvSelectSignal -win $_nWave1 {( "G6" 1 )} 
wvSelectSignal -win $_nWave1 {( "G6" 19 )} 
wvSelectSignal -win $_nWave1 {( "G6" 1 )} 
wvSelectSignal -win $_nWave1 {( "G6" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 \
           18 19 20 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G4" 9)}
wvSelectSignal -win $_nWave1 {( "G4" 8 )} 
wvSetPosition -win $_nWave1 {("G4" 8)}
wvSetPosition -win $_nWave1 {("G4" 9)}
wvSetPosition -win $_nWave1 {("G5" 0)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G5" 1)}
wvSelectSignal -win $_nWave1 {( "G5" 1 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSelectGroup -win $_nWave1 {G5}
wvSelectSignal -win $_nWave1 {( "G5" 1 )} 
wvSetRadix -win $_nWave1 -2Com
wvExpandBus -win $_nWave1 {("G5" 1)}
wvSelectSignal -win $_nWave1 {( "G4" 8 )} 
wvSelectSignal -win $_nWave1 {( "G4" 8 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSetRadix -win $_nWave1 -2Com
wvSelectSignal -win $_nWave1 {( "G4" 1 )} 
wvGetSignalOpen -win $_nWave1
wvSetPosition -win $_nWave1 {("G5" 11)}
wvSetPosition -win $_nWave1 {("G5" 11)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/I_DUT/clk} \
{/TESTBED/I_DUT/rst_n} \
{/TESTBED/I_DUT/state\[1:0\]} \
{/TESTBED/I_DUT/in_valid} \
{/TESTBED/I_DUT/out_valid} \
{/TESTBED/I_DUT/sum\[20:0\]} \
{/TESTBED/I_DUT/in_data\[15:0\]} \
{/TESTBED/I_DUT/weight\[143:0\]} \
{/TESTBED/I_DUT/bias\[15:0\]} \
{/TESTBED/I_DUT/dw/bias_reg\[0:1\]} \
{/TESTBED/I_DUT/dw/bias_reg\[0\]\[15:0\]} \
{/TESTBED/I_DUT/dw/bias_reg\[1\]\[15:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/TESTBED/I_DUT/in_count\[8:0\]} \
{/TESTBED/I_DUT/conv_col\[7:0\]} \
{/TESTBED/I_DUT/conv_row\[6:0\]} \
{/TESTBED/I_DUT/in_col\[7:0\]} \
{/TESTBED/I_DUT/in_row\[6:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/TESTBED/I_DUT/dw/row_reg\[6:0\]} \
{/TESTBED/I_DUT/conv_flag} \
{/TESTBED/I_DUT/conv_col_n\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/TESTBED/I_DUT/dw/addr\[18:0\]} \
{/TESTBED/I_DUT/dw/addr_cnt_n\[16:0\]} \
{/TESTBED/I_DUT/dw/addr_temp\[18:0\]} \
{/TESTBED/I_DUT/dw/base_addr_n\[16:0\]} \
{/TESTBED/I_DUT/dw/offset_cnt\[8:0\]} \
{/TESTBED/I_DUT/dw/offset_cnt_reg\[8:0\]} \
{/TESTBED/I_DUT/dw/sram_rdata\[15:0\]} \
{/TESTBED/I_DUT/dw/sub\[9:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
{/TESTBED/I_DUT/dw/in_data_reg\[0:8\]} \
{/TESTBED/I_DUT/dw/in_data_reg\[0\]\[15:0\]} \
{/TESTBED/I_DUT/dw/in_data_reg\[1\]\[15:0\]} \
{/TESTBED/I_DUT/dw/in_data_reg\[2\]\[15:0\]} \
{/TESTBED/I_DUT/dw/in_data_reg\[3\]\[15:0\]} \
{/TESTBED/I_DUT/dw/in_data_reg\[4\]\[15:0\]} \
{/TESTBED/I_DUT/dw/in_data_reg\[5\]\[15:0\]} \
{/TESTBED/I_DUT/dw/in_data_reg\[6\]\[15:0\]} \
{/TESTBED/I_DUT/dw/in_data_reg\[7\]\[15:0\]} \
{/TESTBED/I_DUT/dw/in_data_reg\[8\]\[15:0\]} \
{/TESTBED/I_DUT/dw/addr_temp\[18:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvAddSignal -win $_nWave1 -group {"G7" \
{/TESTBED/I_DUT/dw/bias_extended\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G8" \
}
wvSelectSignal -win $_nWave1 {( "G5" 11 )} 
wvSetPosition -win $_nWave1 {("G5" 11)}
wvSetPosition -win $_nWave1 {("G5" 10)}
wvSetPosition -win $_nWave1 {("G5" 8)}
wvSetPosition -win $_nWave1 {("G5" 5)}
wvSetPosition -win $_nWave1 {("G4" 8)}
wvSetPosition -win $_nWave1 {("G4" 5)}
wvSetPosition -win $_nWave1 {("G4" 2)}
wvSetPosition -win $_nWave1 {("G4" 1)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G4" 1)}
wvSetPosition -win $_nWave1 {("G4" 2)}
wvSelectSignal -win $_nWave1 {( "G4" 7 )} 
wvSelectSignal -win $_nWave1 {( "G4" 6 )} 
wvSelectSignal -win $_nWave1 {( "G4" 5 )} 
wvSelectSignal -win $_nWave1 {( "G4" 6 )} 
wvSelectSignal -win $_nWave1 {( "G4" 6 )} 
wvSelectSignal -win $_nWave1 {( "G4" 6 )} 
wvGetSignalOpen -win $_nWave1
wvSetPosition -win $_nWave1 {("G4" 3)}
wvSetPosition -win $_nWave1 {("G4" 3)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/I_DUT/clk} \
{/TESTBED/I_DUT/rst_n} \
{/TESTBED/I_DUT/state\[1:0\]} \
{/TESTBED/I_DUT/in_valid} \
{/TESTBED/I_DUT/out_valid} \
{/TESTBED/I_DUT/sum\[20:0\]} \
{/TESTBED/I_DUT/in_data\[15:0\]} \
{/TESTBED/I_DUT/weight\[143:0\]} \
{/TESTBED/I_DUT/bias\[15:0\]} \
{/TESTBED/I_DUT/dw/bias_reg\[0:1\]} \
{/TESTBED/I_DUT/dw/bias_reg\[0\]\[15:0\]} \
{/TESTBED/I_DUT/dw/bias_reg\[1\]\[15:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/TESTBED/I_DUT/in_count\[8:0\]} \
{/TESTBED/I_DUT/conv_col\[7:0\]} \
{/TESTBED/I_DUT/conv_row\[6:0\]} \
{/TESTBED/I_DUT/in_col\[7:0\]} \
{/TESTBED/I_DUT/in_row\[6:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/TESTBED/I_DUT/dw/row_reg\[6:0\]} \
{/TESTBED/I_DUT/conv_flag} \
{/TESTBED/I_DUT/conv_col_n\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/TESTBED/I_DUT/dw/addr\[18:0\]} \
{/TESTBED/I_DUT/dw/addr_temp\[18:0\]} \
{/TESTBED/I_DUT/dw/r_count\[3:0\]} \
{/TESTBED/I_DUT/dw/addr_cnt_n\[16:0\]} \
{/TESTBED/I_DUT/dw/addr_temp\[18:0\]} \
{/TESTBED/I_DUT/dw/base_addr_n\[16:0\]} \
{/TESTBED/I_DUT/dw/offset_cnt\[8:0\]} \
{/TESTBED/I_DUT/dw/offset_cnt_reg\[8:0\]} \
{/TESTBED/I_DUT/dw/sram_rdata\[15:0\]} \
{/TESTBED/I_DUT/dw/sub\[9:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
{/TESTBED/I_DUT/dw/in_data_reg\[0:8\]} \
{/TESTBED/I_DUT/dw/in_data_reg\[0\]\[15:0\]} \
{/TESTBED/I_DUT/dw/in_data_reg\[1\]\[15:0\]} \
{/TESTBED/I_DUT/dw/in_data_reg\[2\]\[15:0\]} \
{/TESTBED/I_DUT/dw/in_data_reg\[3\]\[15:0\]} \
{/TESTBED/I_DUT/dw/in_data_reg\[4\]\[15:0\]} \
{/TESTBED/I_DUT/dw/in_data_reg\[5\]\[15:0\]} \
{/TESTBED/I_DUT/dw/in_data_reg\[6\]\[15:0\]} \
{/TESTBED/I_DUT/dw/in_data_reg\[7\]\[15:0\]} \
{/TESTBED/I_DUT/dw/in_data_reg\[8\]\[15:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvAddSignal -win $_nWave1 -group {"G7" \
{/TESTBED/I_DUT/dw/bias_extended\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G8" \
}
wvSelectSignal -win $_nWave1 {( "G4" 3 )} 
wvSetPosition -win $_nWave1 {("G4" 3)}
wvSetPosition -win $_nWave1 {("G4" 2)}
wvSetPosition -win $_nWave1 {("G4" 1)}
wvSetPosition -win $_nWave1 {("G4" 0)}
wvSetPosition -win $_nWave1 {("G3" 3)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 3)}
wvSetPosition -win $_nWave1 {("G3" 4)}
wvSelectSignal -win $_nWave1 {( "G3" 4 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSelectSignal -win $_nWave1 {( "G4" 4 )} 
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvSelectSignal -win $_nWave1 {( "G4" 4 )} 
wvSetRadix -win $_nWave1 -format Bin
wvSelectSignal -win $_nWave1 {( "G4" 4 )} 
wvSetRadix -win $_nWave1 -format UDec
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G4" 5 )} 
wvSelectSignal -win $_nWave1 {( "G4" 6 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 4)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/TESTBED/I_DUT/dw"
wvSetPosition -win $_nWave1 {("G3" 5)}
wvSetPosition -win $_nWave1 {("G3" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/I_DUT/clk} \
{/TESTBED/I_DUT/rst_n} \
{/TESTBED/I_DUT/state\[1:0\]} \
{/TESTBED/I_DUT/in_valid} \
{/TESTBED/I_DUT/out_valid} \
{/TESTBED/I_DUT/sum\[20:0\]} \
{/TESTBED/I_DUT/in_data\[15:0\]} \
{/TESTBED/I_DUT/weight\[143:0\]} \
{/TESTBED/I_DUT/bias\[15:0\]} \
{/TESTBED/I_DUT/dw/bias_reg\[0:1\]} \
{/TESTBED/I_DUT/dw/bias_reg\[0\]\[15:0\]} \
{/TESTBED/I_DUT/dw/bias_reg\[1\]\[15:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/TESTBED/I_DUT/in_count\[8:0\]} \
{/TESTBED/I_DUT/conv_col\[7:0\]} \
{/TESTBED/I_DUT/conv_row\[6:0\]} \
{/TESTBED/I_DUT/in_col\[7:0\]} \
{/TESTBED/I_DUT/in_row\[6:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/TESTBED/I_DUT/dw/row_reg\[6:0\]} \
{/TESTBED/I_DUT/conv_flag} \
{/TESTBED/I_DUT/conv_col_n\[7:0\]} \
{/TESTBED/I_DUT/dw/r_count\[3:0\]} \
{/TESTBED/I_DUT/dw/offset_cnt_n\[9:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/TESTBED/I_DUT/dw/addr\[18:0\]} \
{/TESTBED/I_DUT/dw/addr_temp\[18:0\]} \
{/TESTBED/I_DUT/dw/addr_cnt_n\[16:0\]} \
{/TESTBED/I_DUT/dw/addr_temp\[18:0\]} \
{/TESTBED/I_DUT/dw/base_addr_n\[16:0\]} \
{/TESTBED/I_DUT/dw/offset_cnt_reg\[8:0\]} \
{/TESTBED/I_DUT/dw/sram_rdata\[15:0\]} \
{/TESTBED/I_DUT/dw/sub\[9:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
{/TESTBED/I_DUT/dw/in_data_reg\[0:8\]} \
{/TESTBED/I_DUT/dw/in_data_reg\[0\]\[15:0\]} \
{/TESTBED/I_DUT/dw/in_data_reg\[1\]\[15:0\]} \
{/TESTBED/I_DUT/dw/in_data_reg\[2\]\[15:0\]} \
{/TESTBED/I_DUT/dw/in_data_reg\[3\]\[15:0\]} \
{/TESTBED/I_DUT/dw/in_data_reg\[4\]\[15:0\]} \
{/TESTBED/I_DUT/dw/in_data_reg\[5\]\[15:0\]} \
{/TESTBED/I_DUT/dw/in_data_reg\[6\]\[15:0\]} \
{/TESTBED/I_DUT/dw/in_data_reg\[7\]\[15:0\]} \
{/TESTBED/I_DUT/dw/in_data_reg\[8\]\[15:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvAddSignal -win $_nWave1 -group {"G7" \
{/TESTBED/I_DUT/dw/bias_extended\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G8" \
}
wvSelectSignal -win $_nWave1 {( "G3" 5 )} 
wvSetPosition -win $_nWave1 {("G3" 5)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G3" 5 )} 
wvSelectSignal -win $_nWave1 {( "G3" 5 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSetRadix -win $_nWave1 -2Com
wvSetPosition -win $_nWave1 {("G4" 0)}
wvSetPosition -win $_nWave1 {("G4" 1)}
wvSetPosition -win $_nWave1 {("G4" 2)}
wvSetPosition -win $_nWave1 {("G4" 3)}
wvSetPosition -win $_nWave1 {("G4" 4)}
wvSetPosition -win $_nWave1 {("G4" 5)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G4" 6)}
wvSelectSignal -win $_nWave1 {( "G4" 5 )} 
wvSetRadix -win $_nWave1 -Unsigned
wvSelectSignal -win $_nWave1 {( "G4" 6 )} 
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvSelectSignal -win $_nWave1 {( "G4" 1 )} 
wvSelectSignal -win $_nWave1 {( "G4" 2 )} 
wvSetRadix -win $_nWave1 -2Com
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvSetCursor -win $_nWave1 1362054598.572281 -snap {("G3" 4)}
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvSetCursor -win $_nWave1 1362125080.343114 -snap {("G5" 5)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/TESTBED/I_DUT/dw"
wvSetPosition -win $_nWave1 {("G4" 7)}
wvSetPosition -win $_nWave1 {("G4" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/I_DUT/clk} \
{/TESTBED/I_DUT/rst_n} \
{/TESTBED/I_DUT/state\[1:0\]} \
{/TESTBED/I_DUT/in_valid} \
{/TESTBED/I_DUT/out_valid} \
{/TESTBED/I_DUT/sum\[20:0\]} \
{/TESTBED/I_DUT/in_data\[15:0\]} \
{/TESTBED/I_DUT/weight\[143:0\]} \
{/TESTBED/I_DUT/bias\[15:0\]} \
{/TESTBED/I_DUT/dw/bias_reg\[0:1\]} \
{/TESTBED/I_DUT/dw/bias_reg\[0\]\[15:0\]} \
{/TESTBED/I_DUT/dw/bias_reg\[1\]\[15:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/TESTBED/I_DUT/in_count\[8:0\]} \
{/TESTBED/I_DUT/conv_col\[7:0\]} \
{/TESTBED/I_DUT/conv_row\[6:0\]} \
{/TESTBED/I_DUT/in_col\[7:0\]} \
{/TESTBED/I_DUT/in_row\[6:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/TESTBED/I_DUT/dw/row_reg\[6:0\]} \
{/TESTBED/I_DUT/conv_flag} \
{/TESTBED/I_DUT/conv_col_n\[7:0\]} \
{/TESTBED/I_DUT/dw/r_count\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/TESTBED/I_DUT/dw/addr\[18:0\]} \
{/TESTBED/I_DUT/dw/addr_temp\[18:0\]} \
{/TESTBED/I_DUT/dw/addr_cnt_n\[16:0\]} \
{/TESTBED/I_DUT/dw/addr_temp\[18:0\]} \
{/TESTBED/I_DUT/dw/base_addr_n\[16:0\]} \
{/TESTBED/I_DUT/dw/offset_cnt_n\[9:0\]} \
{/TESTBED/I_DUT/dw/col_reg\[0:1\]} \
{/TESTBED/I_DUT/dw/offset_cnt_reg\[8:0\]} \
{/TESTBED/I_DUT/dw/sram_rdata\[15:0\]} \
{/TESTBED/I_DUT/dw/sub\[9:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
{/TESTBED/I_DUT/dw/in_data_reg\[0:8\]} \
{/TESTBED/I_DUT/dw/in_data_reg\[0\]\[15:0\]} \
{/TESTBED/I_DUT/dw/in_data_reg\[1\]\[15:0\]} \
{/TESTBED/I_DUT/dw/in_data_reg\[2\]\[15:0\]} \
{/TESTBED/I_DUT/dw/in_data_reg\[3\]\[15:0\]} \
{/TESTBED/I_DUT/dw/in_data_reg\[4\]\[15:0\]} \
{/TESTBED/I_DUT/dw/in_data_reg\[5\]\[15:0\]} \
{/TESTBED/I_DUT/dw/in_data_reg\[6\]\[15:0\]} \
{/TESTBED/I_DUT/dw/in_data_reg\[7\]\[15:0\]} \
{/TESTBED/I_DUT/dw/in_data_reg\[8\]\[15:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvAddSignal -win $_nWave1 -group {"G7" \
{/TESTBED/I_DUT/dw/bias_extended\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G8" \
}
wvSelectSignal -win $_nWave1 {( "G4" 7 )} 
wvSetPosition -win $_nWave1 {("G4" 7)}
wvSetPosition -win $_nWave1 {("G4" 8)}
wvSetPosition -win $_nWave1 {("G4" 9)}
wvSetPosition -win $_nWave1 {("G4" 10)}
wvSetPosition -win $_nWave1 {("G5" 0)}
wvSetPosition -win $_nWave1 {("G4" 10)}
wvSetPosition -win $_nWave1 {("G4" 9)}
wvSetPosition -win $_nWave1 {("G4" 4)}
wvSetPosition -win $_nWave1 {("G4" 3)}
wvSetPosition -win $_nWave1 {("G4" 1)}
wvSetPosition -win $_nWave1 {("G3" 4)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 4)}
wvSetPosition -win $_nWave1 {("G3" 5)}
wvSelectSignal -win $_nWave1 {( "G3" 5 )} 
wvSetRadix -win $_nWave1 -format UDec
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvSetCursor -win $_nWave1 1362054598.572281 -snap {("G1" 5)}
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvGetSignalOpen -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 7)}
wvSetPosition -win $_nWave1 {("G3" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/I_DUT/clk} \
{/TESTBED/I_DUT/rst_n} \
{/TESTBED/I_DUT/state\[1:0\]} \
{/TESTBED/I_DUT/in_valid} \
{/TESTBED/I_DUT/out_valid} \
{/TESTBED/I_DUT/sum\[20:0\]} \
{/TESTBED/I_DUT/in_data\[15:0\]} \
{/TESTBED/I_DUT/weight\[143:0\]} \
{/TESTBED/I_DUT/bias\[15:0\]} \
{/TESTBED/I_DUT/dw/bias_reg\[0:1\]} \
{/TESTBED/I_DUT/dw/bias_reg\[0\]\[15:0\]} \
{/TESTBED/I_DUT/dw/bias_reg\[1\]\[15:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/TESTBED/I_DUT/in_count\[8:0\]} \
{/TESTBED/I_DUT/conv_col\[7:0\]} \
{/TESTBED/I_DUT/conv_row\[6:0\]} \
{/TESTBED/I_DUT/in_col\[7:0\]} \
{/TESTBED/I_DUT/in_row\[6:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/TESTBED/I_DUT/dw/row_reg\[6:0\]} \
{/TESTBED/I_DUT/conv_flag} \
{/TESTBED/I_DUT/conv_col_n\[7:0\]} \
{/TESTBED/I_DUT/dw/r_count\[3:0\]} \
{/TESTBED/I_DUT/dw/col_reg\[0:1\]} \
{/TESTBED/I_DUT/dw/bias_reg\[0:1\]} \
{/TESTBED/I_DUT/dw/weight_reg\[0:8\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/TESTBED/I_DUT/dw/addr\[18:0\]} \
{/TESTBED/I_DUT/dw/addr_temp\[18:0\]} \
{/TESTBED/I_DUT/dw/addr_cnt_n\[16:0\]} \
{/TESTBED/I_DUT/dw/addr_temp\[18:0\]} \
{/TESTBED/I_DUT/dw/base_addr_n\[16:0\]} \
{/TESTBED/I_DUT/dw/offset_cnt_n\[9:0\]} \
{/TESTBED/I_DUT/dw/offset_cnt_reg\[8:0\]} \
{/TESTBED/I_DUT/dw/sram_rdata\[15:0\]} \
{/TESTBED/I_DUT/dw/sub\[9:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
{/TESTBED/I_DUT/dw/in_data_reg\[0:8\]} \
{/TESTBED/I_DUT/dw/in_data_reg\[0\]\[15:0\]} \
{/TESTBED/I_DUT/dw/in_data_reg\[1\]\[15:0\]} \
{/TESTBED/I_DUT/dw/in_data_reg\[2\]\[15:0\]} \
{/TESTBED/I_DUT/dw/in_data_reg\[3\]\[15:0\]} \
{/TESTBED/I_DUT/dw/in_data_reg\[4\]\[15:0\]} \
{/TESTBED/I_DUT/dw/in_data_reg\[5\]\[15:0\]} \
{/TESTBED/I_DUT/dw/in_data_reg\[6\]\[15:0\]} \
{/TESTBED/I_DUT/dw/in_data_reg\[7\]\[15:0\]} \
{/TESTBED/I_DUT/dw/in_data_reg\[8\]\[15:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvAddSignal -win $_nWave1 -group {"G7" \
{/TESTBED/I_DUT/dw/bias_extended\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G8" \
}
wvSelectSignal -win $_nWave1 {( "G3" 6 7 )} 
wvSetPosition -win $_nWave1 {("G3" 7)}
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvSelectSignal -win $_nWave1 {( "G5" 10 )} 
wvSelectGroup -win $_nWave1 {G6}
wvGetSignalOpen -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 8)}
wvSetPosition -win $_nWave1 {("G3" 8)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/I_DUT/clk} \
{/TESTBED/I_DUT/rst_n} \
{/TESTBED/I_DUT/state\[1:0\]} \
{/TESTBED/I_DUT/in_valid} \
{/TESTBED/I_DUT/out_valid} \
{/TESTBED/I_DUT/sum\[20:0\]} \
{/TESTBED/I_DUT/in_data\[15:0\]} \
{/TESTBED/I_DUT/weight\[143:0\]} \
{/TESTBED/I_DUT/bias\[15:0\]} \
{/TESTBED/I_DUT/dw/bias_reg\[0:1\]} \
{/TESTBED/I_DUT/dw/bias_reg\[0\]\[15:0\]} \
{/TESTBED/I_DUT/dw/bias_reg\[1\]\[15:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/TESTBED/I_DUT/in_count\[8:0\]} \
{/TESTBED/I_DUT/conv_col\[7:0\]} \
{/TESTBED/I_DUT/conv_row\[6:0\]} \
{/TESTBED/I_DUT/in_col\[7:0\]} \
{/TESTBED/I_DUT/in_row\[6:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/TESTBED/I_DUT/dw/row_reg\[6:0\]} \
{/TESTBED/I_DUT/conv_flag} \
{/TESTBED/I_DUT/conv_col_n\[7:0\]} \
{/TESTBED/I_DUT/dw/r_count\[3:0\]} \
{/TESTBED/I_DUT/dw/col_reg\[0:1\]} \
{/TESTBED/I_DUT/dw/bias_reg\[0:1\]} \
{/TESTBED/I_DUT/dw/weight_reg\[0:8\]} \
{/TESTBED/I_DUT/dw/mul_closed\[0:8\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/TESTBED/I_DUT/dw/addr\[18:0\]} \
{/TESTBED/I_DUT/dw/addr_temp\[18:0\]} \
{/TESTBED/I_DUT/dw/addr_cnt_n\[16:0\]} \
{/TESTBED/I_DUT/dw/addr_temp\[18:0\]} \
{/TESTBED/I_DUT/dw/base_addr_n\[16:0\]} \
{/TESTBED/I_DUT/dw/offset_cnt_n\[9:0\]} \
{/TESTBED/I_DUT/dw/offset_cnt_reg\[8:0\]} \
{/TESTBED/I_DUT/dw/sram_rdata\[15:0\]} \
{/TESTBED/I_DUT/dw/sub\[9:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
{/TESTBED/I_DUT/dw/in_data_reg\[0:8\]} \
{/TESTBED/I_DUT/dw/in_data_reg\[0\]\[15:0\]} \
{/TESTBED/I_DUT/dw/in_data_reg\[1\]\[15:0\]} \
{/TESTBED/I_DUT/dw/in_data_reg\[2\]\[15:0\]} \
{/TESTBED/I_DUT/dw/in_data_reg\[3\]\[15:0\]} \
{/TESTBED/I_DUT/dw/in_data_reg\[4\]\[15:0\]} \
{/TESTBED/I_DUT/dw/in_data_reg\[5\]\[15:0\]} \
{/TESTBED/I_DUT/dw/in_data_reg\[6\]\[15:0\]} \
{/TESTBED/I_DUT/dw/in_data_reg\[7\]\[15:0\]} \
{/TESTBED/I_DUT/dw/in_data_reg\[8\]\[15:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvAddSignal -win $_nWave1 -group {"G7" \
{/TESTBED/I_DUT/dw/bias_extended\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G8" \
}
wvSelectSignal -win $_nWave1 {( "G3" 8 )} 
wvSetPosition -win $_nWave1 {("G3" 8)}
wvSelectSignal -win $_nWave1 {( "G3" 8 )} 
wvSetPosition -win $_nWave1 {("G4" 1)}
wvSetPosition -win $_nWave1 {("G4" 3)}
wvSetPosition -win $_nWave1 {("G5" 2)}
wvSetPosition -win $_nWave1 {("G5" 4)}
wvSetPosition -win $_nWave1 {("G5" 6)}
wvSetPosition -win $_nWave1 {("G5" 7)}
wvSetPosition -win $_nWave1 {("G5" 9)}
wvSetPosition -win $_nWave1 {("G5" 10)}
wvSetPosition -win $_nWave1 {("G7" 0)}
wvSetPosition -win $_nWave1 {("G6" 0)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G6" 1)}
wvSelectSignal -win $_nWave1 {( "G6" 1 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSetRadix -win $_nWave1 -2Com
wvExpandBus -win $_nWave1 {("G6" 1)}
wvSetCursor -win $_nWave1 1362133915.664814 -snap {("G6" 10)}
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 1362119829.350161 -snap {("G4" 1)}
wvSetCursor -win $_nWave1 1362129668.685690 -snap {("G4" 1)}
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/TESTBED/I_DUT/dw"
wvSetPosition -win $_nWave1 {("G7" 1)}
wvSetPosition -win $_nWave1 {("G7" 1)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/I_DUT/clk} \
{/TESTBED/I_DUT/rst_n} \
{/TESTBED/I_DUT/state\[1:0\]} \
{/TESTBED/I_DUT/in_valid} \
{/TESTBED/I_DUT/out_valid} \
{/TESTBED/I_DUT/sum\[20:0\]} \
{/TESTBED/I_DUT/in_data\[15:0\]} \
{/TESTBED/I_DUT/weight\[143:0\]} \
{/TESTBED/I_DUT/bias\[15:0\]} \
{/TESTBED/I_DUT/dw/bias_reg\[0:1\]} \
{/TESTBED/I_DUT/dw/bias_reg\[0\]\[15:0\]} \
{/TESTBED/I_DUT/dw/bias_reg\[1\]\[15:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/TESTBED/I_DUT/in_count\[8:0\]} \
{/TESTBED/I_DUT/conv_col\[7:0\]} \
{/TESTBED/I_DUT/conv_row\[6:0\]} \
{/TESTBED/I_DUT/in_col\[7:0\]} \
{/TESTBED/I_DUT/in_row\[6:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/TESTBED/I_DUT/dw/row_reg\[6:0\]} \
{/TESTBED/I_DUT/conv_flag} \
{/TESTBED/I_DUT/conv_col_n\[7:0\]} \
{/TESTBED/I_DUT/dw/r_count\[3:0\]} \
{/TESTBED/I_DUT/dw/col_reg\[0:1\]} \
{/TESTBED/I_DUT/dw/bias_reg\[0:1\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/TESTBED/I_DUT/dw/addr\[18:0\]} \
{/TESTBED/I_DUT/dw/addr_temp\[18:0\]} \
{/TESTBED/I_DUT/dw/addr_cnt_n\[16:0\]} \
{/TESTBED/I_DUT/dw/addr_temp\[18:0\]} \
{/TESTBED/I_DUT/dw/base_addr_n\[16:0\]} \
{/TESTBED/I_DUT/dw/offset_cnt_n\[9:0\]} \
{/TESTBED/I_DUT/dw/offset_cnt_reg\[8:0\]} \
{/TESTBED/I_DUT/dw/sram_rdata\[15:0\]} \
{/TESTBED/I_DUT/dw/sub\[9:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
{/TESTBED/I_DUT/dw/in_data_reg\[0:8\]} \
{/TESTBED/I_DUT/dw/in_data_reg\[0\]\[15:0\]} \
{/TESTBED/I_DUT/dw/in_data_reg\[1\]\[15:0\]} \
{/TESTBED/I_DUT/dw/in_data_reg\[2\]\[15:0\]} \
{/TESTBED/I_DUT/dw/in_data_reg\[3\]\[15:0\]} \
{/TESTBED/I_DUT/dw/in_data_reg\[4\]\[15:0\]} \
{/TESTBED/I_DUT/dw/in_data_reg\[5\]\[15:0\]} \
{/TESTBED/I_DUT/dw/in_data_reg\[6\]\[15:0\]} \
{/TESTBED/I_DUT/dw/in_data_reg\[7\]\[15:0\]} \
{/TESTBED/I_DUT/dw/in_data_reg\[8\]\[15:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
{/TESTBED/I_DUT/dw/mul_closed\[0:8\]} \
{/TESTBED/I_DUT/dw/mul_closed\[0\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul_closed\[1\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul_closed\[2\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul_closed\[3\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul_closed\[4\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul_closed\[5\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul_closed\[6\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul_closed\[7\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul_closed\[8\]\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G7" \
{/TESTBED/I_DUT/dw/base_addr\[16:0\]} \
{/TESTBED/I_DUT/dw/bias_extended\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G8" \
}
wvSelectSignal -win $_nWave1 {( "G7" 1 )} 
wvSetPosition -win $_nWave1 {("G7" 1)}
wvSetPosition -win $_nWave1 {("G7" 0)}
wvSetPosition -win $_nWave1 {("G6" 4)}
wvSetPosition -win $_nWave1 {("G6" 2)}
wvSetPosition -win $_nWave1 {("G6" 0)}
wvSetPosition -win $_nWave1 {("G5" 6)}
wvSetPosition -win $_nWave1 {("G5" 0)}
wvSetPosition -win $_nWave1 {("G4" 9)}
wvSetPosition -win $_nWave1 {("G4" 8)}
wvSetPosition -win $_nWave1 {("G4" 7)}
wvSetPosition -win $_nWave1 {("G4" 6)}
wvSetPosition -win $_nWave1 {("G4" 5)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G4" 5)}
wvSetPosition -win $_nWave1 {("G4" 6)}
wvSelectSignal -win $_nWave1 {( "G4" 6 )} 
wvSetRadix -win $_nWave1 -format UDec
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvSetCursor -win $_nWave1 1362124407.653224 -snap {("G4" 1)}
wvSetCursor -win $_nWave1 1362130230.933435 -snap {("G4" 1)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 1362125210.864287 -snap {("G1" 1)}
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
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvSetCursor -win $_nWave1 1362010322.711891 -snap {("G3" 2)}
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 1362125085.744781 -snap {("G1" 4)}
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 1362125286.378907 -snap {("G1" 1)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G3" 5 )} 
wvSetPosition -win $_nWave1 {("G3" 5)}
wvExpandBus -win $_nWave1 {("G3" 5)}
wvSetPosition -win $_nWave1 {("G4" 6)}
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvSetCursor -win $_nWave1 1362134987.065775 -snap {("G5" 10)}
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvSetCursor -win $_nWave1 1362124634.316763 -snap {("G2" 2)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvScrollDown -win $_nWave1 19
wvGetSignalOpen -win $_nWave1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvSelectSignal -win $_nWave1 {( "G5" 2 )} 
wvSelectSignal -win $_nWave1 {( "G5" 2 )} 
wvSetRadix -win $_nWave1 -format Hex
wvSetRadix -win $_nWave1 -Unsigned
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSetRadix -win $_nWave1 -format Hex
wvSetRadix -win $_nWave1 -Unsigned
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvScrollDown -win $_nWave1 9
wvScrollUp -win $_nWave1 13
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/TESTBED/I_DUT/dw"
wvSetPosition -win $_nWave1 {("G4" 7)}
wvSetPosition -win $_nWave1 {("G4" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/I_DUT/clk} \
{/TESTBED/I_DUT/rst_n} \
{/TESTBED/I_DUT/state\[1:0\]} \
{/TESTBED/I_DUT/in_valid} \
{/TESTBED/I_DUT/out_valid} \
{/TESTBED/I_DUT/sum\[20:0\]} \
{/TESTBED/I_DUT/in_data\[15:0\]} \
{/TESTBED/I_DUT/weight\[143:0\]} \
{/TESTBED/I_DUT/bias\[15:0\]} \
{/TESTBED/I_DUT/dw/bias_reg\[0:1\]} \
{/TESTBED/I_DUT/dw/bias_reg\[0\]\[15:0\]} \
{/TESTBED/I_DUT/dw/bias_reg\[1\]\[15:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/TESTBED/I_DUT/in_count\[8:0\]} \
{/TESTBED/I_DUT/conv_col\[7:0\]} \
{/TESTBED/I_DUT/conv_row\[6:0\]} \
{/TESTBED/I_DUT/in_col\[7:0\]} \
{/TESTBED/I_DUT/in_row\[6:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/TESTBED/I_DUT/dw/row_reg\[6:0\]} \
{/TESTBED/I_DUT/conv_flag} \
{/TESTBED/I_DUT/conv_col_n\[7:0\]} \
{/TESTBED/I_DUT/dw/r_count\[3:0\]} \
{/TESTBED/I_DUT/dw/col_reg\[0:1\]} \
{/TESTBED/I_DUT/dw/col_reg\[0\]\[7:0\]} \
{/TESTBED/I_DUT/dw/col_reg\[1\]\[7:0\]} \
{/TESTBED/I_DUT/dw/bias_reg\[0:1\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/TESTBED/I_DUT/dw/addr\[18:0\]} \
{/TESTBED/I_DUT/dw/addr_temp\[18:0\]} \
{/TESTBED/I_DUT/dw/addr_cnt_n\[16:0\]} \
{/TESTBED/I_DUT/dw/addr_temp\[18:0\]} \
{/TESTBED/I_DUT/dw/base_addr_n\[16:0\]} \
{/TESTBED/I_DUT/dw/base_addr\[16:0\]} \
{/TESTBED/I_DUT/dw/head_tail\[1:0\]} \
{/TESTBED/I_DUT/dw/offset_cnt_n\[9:0\]} \
{/TESTBED/I_DUT/dw/offset_cnt_reg\[8:0\]} \
{/TESTBED/I_DUT/dw/sram_rdata\[15:0\]} \
{/TESTBED/I_DUT/dw/sub\[9:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
{/TESTBED/I_DUT/dw/in_data_reg\[0:8\]} \
{/TESTBED/I_DUT/dw/in_data_reg\[0\]\[15:0\]} \
{/TESTBED/I_DUT/dw/in_data_reg\[1\]\[15:0\]} \
{/TESTBED/I_DUT/dw/in_data_reg\[2\]\[15:0\]} \
{/TESTBED/I_DUT/dw/in_data_reg\[3\]\[15:0\]} \
{/TESTBED/I_DUT/dw/in_data_reg\[4\]\[15:0\]} \
{/TESTBED/I_DUT/dw/in_data_reg\[5\]\[15:0\]} \
{/TESTBED/I_DUT/dw/in_data_reg\[6\]\[15:0\]} \
{/TESTBED/I_DUT/dw/in_data_reg\[7\]\[15:0\]} \
{/TESTBED/I_DUT/dw/in_data_reg\[8\]\[15:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
{/TESTBED/I_DUT/dw/mul_closed\[0:8\]} \
{/TESTBED/I_DUT/dw/mul_closed\[0\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul_closed\[1\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul_closed\[2\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul_closed\[3\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul_closed\[4\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul_closed\[5\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul_closed\[6\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul_closed\[7\]\[31:0\]} \
{/TESTBED/I_DUT/dw/mul_closed\[8\]\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G7" \
{/TESTBED/I_DUT/dw/bias_extended\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G8" \
}
wvSelectSignal -win $_nWave1 {( "G4" 7 )} 
wvSetPosition -win $_nWave1 {("G4" 7)}
wvSelectSignal -win $_nWave1 {( "G4" 7 )} 
wvSetRadix -win $_nWave1 -format Bin
wvScrollUp -win $_nWave1 31
wvScrollDown -win $_nWave1 7
wvResizeWindow -win $_nWave1 -1 27 1470 820
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 14
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvSetCursor -win $_nWave1 1362215686.671545 -snap {("G5" 9)}
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
