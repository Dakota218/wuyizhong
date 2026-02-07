wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/RAID2/COURSE/2025_Fall/ea25vlsiintro/ea25vlsiintro056/wuyizhong/dwconv/waves.fsdb}
wvRestoreSignal -win $_nWave1 \
           "/RAID2/COURSE/2025_Fall/ea25vlsiintro/ea25vlsiintro056/wuyizhong/dwconv/signal.rc" \
           -overWriteAutoAlias on -appendSignals on
wvResizeWindow -win $_nWave1 -1 27 1920 977
wvSelectGroup -win $_nWave1 {G3}
wvGetSignalOpen -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 11)}
wvSetPosition -win $_nWave1 {("G2" 11)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/I_DUT/bias\[15:0\]} \
{/TESTBED/I_DUT/clk} \
{/TESTBED/I_DUT/in_data\[15:0\]} \
{/TESTBED/I_DUT/in_valid} \
{/TESTBED/I_DUT/out_valid} \
{/TESTBED/I_DUT/rst_n} \
{/TESTBED/I_DUT/state\[1:0\]} \
{/TESTBED/I_DUT/weight\[143:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/TESTBED/I_DUT/conv_col\[7:0\]} \
{/TESTBED/I_DUT/conv_flag} \
{/TESTBED/I_DUT/conv_row\[6:0\]} \
{/TESTBED/I_DUT/in_col\[7:0\]} \
{/TESTBED/I_DUT/in_count\[8:0\]} \
{/TESTBED/I_DUT/in_row\[6:0\]} \
{/TESTBED/I_DUT/dw/addr\[18:0\]} \
{/TESTBED/I_DUT/dw/addr_cnt\[16:0\]} \
{/TESTBED/I_DUT/dw/memory_ptr\[18:0\]} \
{/TESTBED/I_DUT/dw/r_count\[3:0\]} \
{/TESTBED/I_DUT/dw/state_n\[1:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 7 8 9 10 11 )} 
wvSetPosition -win $_nWave1 {("G2" 11)}
wvSetPosition -win $_nWave1 {("G3" 5)}
wvSetPosition -win $_nWave1 {("G3" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/I_DUT/bias\[15:0\]} \
{/TESTBED/I_DUT/clk} \
{/TESTBED/I_DUT/in_data\[15:0\]} \
{/TESTBED/I_DUT/in_valid} \
{/TESTBED/I_DUT/out_valid} \
{/TESTBED/I_DUT/rst_n} \
{/TESTBED/I_DUT/state\[1:0\]} \
{/TESTBED/I_DUT/weight\[143:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/TESTBED/I_DUT/conv_col\[7:0\]} \
{/TESTBED/I_DUT/conv_flag} \
{/TESTBED/I_DUT/conv_row\[6:0\]} \
{/TESTBED/I_DUT/in_col\[7:0\]} \
{/TESTBED/I_DUT/in_count\[8:0\]} \
{/TESTBED/I_DUT/in_row\[6:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/TESTBED/I_DUT/dw/addr\[18:0\]} \
{/TESTBED/I_DUT/dw/addr_cnt\[16:0\]} \
{/TESTBED/I_DUT/dw/memory_ptr\[18:0\]} \
{/TESTBED/I_DUT/dw/r_count\[3:0\]} \
{/TESTBED/I_DUT/dw/state_n\[1:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 1 2 3 4 5 )} 
wvSetPosition -win $_nWave1 {("G3" 5)}
wvSelectSignal -win $_nWave1 {( "G3" 1 )} 
wvSelectSignal -win $_nWave1 {( "G3" 1 2 3 4 5 )} 
wvSelectSignal -win $_nWave1 {( "G3" 1 2 3 4 5 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSelectGroup -win $_nWave1 {G4}
wvSelectSignal -win $_nWave1 {( "G3" 5 )} 
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSelectGroup -win $_nWave1 {G4}
wvSelectSignal -win $_nWave1 {( "G3" 5 )} 
wvSelectGroup -win $_nWave1 {G4}
wvSelectSignal -win $_nWave1 {( "G3" 5 )} 
wvSetCursor -win $_nWave1 908141332.745281 -snap {("G1" 7)}
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 1361234138.878654 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 1361245148.893163 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 1361235675.159748 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 1361245148.893163 -snap {("G1" 2)}
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
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 1361235519.230370 -snap {("G3" 1)}
wvZoomIn -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 6)}
wvSetPosition -win $_nWave1 {("G3" 6)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/I_DUT/bias\[15:0\]} \
{/TESTBED/I_DUT/clk} \
{/TESTBED/I_DUT/in_data\[15:0\]} \
{/TESTBED/I_DUT/in_valid} \
{/TESTBED/I_DUT/out_valid} \
{/TESTBED/I_DUT/rst_n} \
{/TESTBED/I_DUT/state\[1:0\]} \
{/TESTBED/I_DUT/weight\[143:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/TESTBED/I_DUT/conv_col\[7:0\]} \
{/TESTBED/I_DUT/conv_flag} \
{/TESTBED/I_DUT/conv_row\[6:0\]} \
{/TESTBED/I_DUT/in_col\[7:0\]} \
{/TESTBED/I_DUT/in_count\[8:0\]} \
{/TESTBED/I_DUT/in_row\[6:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/TESTBED/I_DUT/dw/addr\[18:0\]} \
{/TESTBED/I_DUT/dw/addr_cnt\[16:0\]} \
{/TESTBED/I_DUT/dw/memory_ptr\[18:0\]} \
{/TESTBED/I_DUT/dw/r_count\[3:0\]} \
{/TESTBED/I_DUT/dw/state_n\[1:0\]} \
{/TESTBED/I_DUT/dw/memory_ptr_n} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 6 )} 
wvSetPosition -win $_nWave1 {("G3" 6)}
wvSelectSignal -win $_nWave1 {( "G3" 6 )} 
wvSetCursor -win $_nWave1 1361174131.998358 -snap {("G4" 0)}
wvSelectSignal -win $_nWave1 {( "G3" 6 )} 
wvSelectGroup -win $_nWave1 {G4}
wvSelectSignal -win $_nWave1 {( "G3" 6 )} 
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G3" 5 )} 
wvSelectSignal -win $_nWave1 {( "G3" 5 )} 
wvSetRadix -win $_nWave1 -format UDec
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 910676467.242207 -snap {("G2" 4)}
wvGetSignalOpen -win $_nWave1
wvSetPosition -win $_nWave1 {("G4" 2)}
wvSetPosition -win $_nWave1 {("G4" 2)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/I_DUT/bias\[15:0\]} \
{/TESTBED/I_DUT/clk} \
{/TESTBED/I_DUT/in_data\[15:0\]} \
{/TESTBED/I_DUT/in_valid} \
{/TESTBED/I_DUT/out_valid} \
{/TESTBED/I_DUT/rst_n} \
{/TESTBED/I_DUT/state\[1:0\]} \
{/TESTBED/I_DUT/weight\[143:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/TESTBED/I_DUT/conv_col\[7:0\]} \
{/TESTBED/I_DUT/conv_flag} \
{/TESTBED/I_DUT/conv_row\[6:0\]} \
{/TESTBED/I_DUT/in_col\[7:0\]} \
{/TESTBED/I_DUT/in_count\[8:0\]} \
{/TESTBED/I_DUT/in_row\[6:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/TESTBED/I_DUT/dw/addr\[18:0\]} \
{/TESTBED/I_DUT/dw/addr_cnt\[16:0\]} \
{/TESTBED/I_DUT/dw/memory_ptr\[18:0\]} \
{/TESTBED/I_DUT/dw/r_count\[3:0\]} \
{/TESTBED/I_DUT/dw/memory_ptr_n\[18:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/TESTBED/I_DUT/dw/in_col\[7:0\]} \
{/TESTBED/I_DUT/dw/in_count\[8:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G4" 1 2 )} 
wvSetPosition -win $_nWave1 {("G4" 2)}
wvSelectSignal -win $_nWave1 {( "G4" 1 2 )} 
wvSetRadix -win $_nWave1 -format UDec
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvSetPosition -win $_nWave1 {("G4" 3)}
wvSetPosition -win $_nWave1 {("G4" 3)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/I_DUT/bias\[15:0\]} \
{/TESTBED/I_DUT/clk} \
{/TESTBED/I_DUT/in_data\[15:0\]} \
{/TESTBED/I_DUT/in_valid} \
{/TESTBED/I_DUT/out_valid} \
{/TESTBED/I_DUT/rst_n} \
{/TESTBED/I_DUT/state\[1:0\]} \
{/TESTBED/I_DUT/weight\[143:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/TESTBED/I_DUT/conv_col\[7:0\]} \
{/TESTBED/I_DUT/conv_flag} \
{/TESTBED/I_DUT/conv_row\[6:0\]} \
{/TESTBED/I_DUT/in_col\[7:0\]} \
{/TESTBED/I_DUT/in_count\[8:0\]} \
{/TESTBED/I_DUT/in_row\[6:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/TESTBED/I_DUT/dw/addr\[18:0\]} \
{/TESTBED/I_DUT/dw/addr_cnt\[16:0\]} \
{/TESTBED/I_DUT/dw/memory_ptr\[18:0\]} \
{/TESTBED/I_DUT/dw/r_count\[3:0\]} \
{/TESTBED/I_DUT/dw/memory_ptr_n\[18:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/TESTBED/I_DUT/dw/in_col\[7:0\]} \
{/TESTBED/I_DUT/dw/in_count\[8:0\]} \
{/TESTBED/I_DUT/dw/test\[18:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G4" 3 )} 
wvSetPosition -win $_nWave1 {("G4" 3)}
wvSelectSignal -win $_nWave1 {( "G4" 3 )} 
wvSetRadix -win $_nWave1 -format UDec
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
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
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 1358674661.740787 -snap {("G3" 1)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvSetCursor -win $_nWave1 1361235034.213628 -snap {("G3" 1)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvSetPosition -win $_nWave1 {("G5" 2)}
wvSetPosition -win $_nWave1 {("G5" 2)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/I_DUT/bias\[15:0\]} \
{/TESTBED/I_DUT/clk} \
{/TESTBED/I_DUT/in_data\[15:0\]} \
{/TESTBED/I_DUT/in_valid} \
{/TESTBED/I_DUT/out_valid} \
{/TESTBED/I_DUT/rst_n} \
{/TESTBED/I_DUT/state\[1:0\]} \
{/TESTBED/I_DUT/weight\[143:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/TESTBED/I_DUT/conv_col\[7:0\]} \
{/TESTBED/I_DUT/conv_flag} \
{/TESTBED/I_DUT/conv_row\[6:0\]} \
{/TESTBED/I_DUT/in_col\[7:0\]} \
{/TESTBED/I_DUT/in_count\[8:0\]} \
{/TESTBED/I_DUT/in_row\[6:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/TESTBED/I_DUT/dw/addr\[18:0\]} \
{/TESTBED/I_DUT/dw/addr_cnt\[16:0\]} \
{/TESTBED/I_DUT/dw/memory_ptr\[18:0\]} \
{/TESTBED/I_DUT/dw/r_count\[3:0\]} \
{/TESTBED/I_DUT/dw/memory_ptr_n\[18:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/TESTBED/I_DUT/dw/in_col\[7:0\]} \
{/TESTBED/I_DUT/dw/in_count\[8:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
{/TESTBED/I_DUT/dw/base_addr\[16:0\]} \
{/TESTBED/I_DUT/dw/offset_cnt\[8:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvSelectSignal -win $_nWave1 {( "G5" 1 2 )} 
wvSetPosition -win $_nWave1 {("G5" 2)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G5" 2 )} 
wvSelectSignal -win $_nWave1 {( "G5" 1 2 )} 
wvSelectSignal -win $_nWave1 {( "G5" 1 2 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSetCursor -win $_nWave1 1361129729.709826 -snap {("G3" 4)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
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
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
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
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 1769235367.700086 -snap {("G2" 5)}
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
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 1743725222.387419 -snap {("G3" 4)}
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
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 1386640029.644152 -snap {("G2" 2)}
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 1386840770.373904 -snap {("G5" 1)}
wvSetCursor -win $_nWave1 1386744496.758655 -snap {("G5" 1)}
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvSetPosition -win $_nWave1 {("G5" 3)}
wvSetPosition -win $_nWave1 {("G5" 3)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/I_DUT/bias\[15:0\]} \
{/TESTBED/I_DUT/clk} \
{/TESTBED/I_DUT/in_data\[15:0\]} \
{/TESTBED/I_DUT/in_valid} \
{/TESTBED/I_DUT/out_valid} \
{/TESTBED/I_DUT/rst_n} \
{/TESTBED/I_DUT/state\[1:0\]} \
{/TESTBED/I_DUT/weight\[143:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/TESTBED/I_DUT/conv_col\[7:0\]} \
{/TESTBED/I_DUT/conv_flag} \
{/TESTBED/I_DUT/conv_row\[6:0\]} \
{/TESTBED/I_DUT/in_col\[7:0\]} \
{/TESTBED/I_DUT/in_count\[8:0\]} \
{/TESTBED/I_DUT/in_row\[6:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/TESTBED/I_DUT/dw/addr\[18:0\]} \
{/TESTBED/I_DUT/dw/addr_cnt\[16:0\]} \
{/TESTBED/I_DUT/dw/memory_ptr\[18:0\]} \
{/TESTBED/I_DUT/dw/r_count\[3:0\]} \
{/TESTBED/I_DUT/dw/memory_ptr_n\[18:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/TESTBED/I_DUT/dw/in_col\[7:0\]} \
{/TESTBED/I_DUT/dw/in_count\[8:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
{/TESTBED/I_DUT/dw/base_addr\[16:0\]} \
{/TESTBED/I_DUT/dw/offset_cnt\[8:0\]} \
{/TESTBED/I_DUT/dw/offset_cnt_reg\[8:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvSelectSignal -win $_nWave1 {( "G5" 3 )} 
wvSetPosition -win $_nWave1 {("G5" 3)}
wvSelectSignal -win $_nWave1 {( "G5" 3 )} 
wvSetRadix -win $_nWave1 -format UDec
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
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
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
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
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
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 1361235248.148279 -snap {("G2" 5)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
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
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 1770843390.769556 -snap {("G5" 1)}
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 1591546347.622142 -snap {("G5" 1)}
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
wvSetCursor -win $_nWave1 1386725553.960704 -snap {("G2" 2)}
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
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
wvZoomIn -win $_nWave1
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
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvResizeWindow -win $_nWave1 -1 27 1468 820
wvResizeWindow -win $_nWave1 -1 27 1470 820
wvSetCursor -win $_nWave1 908114826.129579 -snap {("G1" 6)}
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvResizeWindow -win $_nWave1 -1 27 1468 820
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
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
wvResizeWindow -win $_nWave1 -1 27 1468 820
wvResizeWindow -win $_nWave1 -1 27 1468 820
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
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
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 1361244525.011832 -snap {("G5" 1)}
wvSetCursor -win $_nWave1 1361233850.462158 -snap {("G5" 1)}
wvSetCursor -win $_nWave1 1361226049.829703 -snap {("G5" 1)}
