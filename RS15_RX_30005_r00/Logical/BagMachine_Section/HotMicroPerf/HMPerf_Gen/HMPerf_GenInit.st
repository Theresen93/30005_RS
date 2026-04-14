(********************************************************************
 * COPYRIGHT -- .
 ********************************************************************
 * Program: HMPerf_Gen
 * File: HMPerf_GenInit.st
 * Author: dominique
 * Created: November 05, 2011
 ********************************************************************
 * Implementation of program HMPerf_Gen
 ********************************************************************)

PROGRAM _INIT

  // Printing Manual/Auto PB Colors 
  HGW_2StatePB_0.BackColor_State0 := gYellow;
  HGW_2StatePB_0.ForeColor_State0 := gBlack;
  HGW_2StatePB_0.BackColor_State1 := gGreen;
  HGW_2StatePB_0.ForeColor_State1 := gBlack;

  HMI_HMPerf_bModePB := gRecipeActive.bHMPerf_Mode ;

END_PROGRAM

