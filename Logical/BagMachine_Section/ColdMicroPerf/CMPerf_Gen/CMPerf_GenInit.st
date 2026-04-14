(********************************************************************
 * COPYRIGHT -- .
 ********************************************************************
 * Program: CMPerf_Gen
 * File: CMPerf_GenInit.st
 * Author: dominique
 * Created: November 05, 2011
 ********************************************************************
 * Implementation of program CMPerf_Gen
 ********************************************************************)

PROGRAM _INIT

  // Cold Micro Perf On/Off 
  HMI_CMPerf_bOnOffPB := gRecipeActive.bSelColdMicroPerfProd ;

  // Cold Micro Perf On/Off PB Colors 
  HGW_2StatePB_0.BackColor_State0 := gYellow;
  HGW_2StatePB_0.ForeColor_State0 := gBlack;
  HGW_2StatePB_0.BackColor_State1 := gGreen;
  HGW_2StatePB_0.ForeColor_State1 := gBlack;



END_PROGRAM

