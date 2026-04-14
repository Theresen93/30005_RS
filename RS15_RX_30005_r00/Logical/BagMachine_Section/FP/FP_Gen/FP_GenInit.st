(********************************************************************
 * COPYRIGHT -- .
 ********************************************************************
 * Program: FP_Gen
 * File: FP_GenInit.st
 * Author: dominique
 * Created: October 19, 2011
 ********************************************************************
 * Implementation of program FP_Gen
 ********************************************************************)

PROGRAM _INIT

  // Flexo Press Off/On 
  HMI_FP_bFlexoPressOnOffPB := gRecipeActive.bSelFPProd ;

  // Printing Manual/Auto PB Colors 
  HGW_2StatePB_0.BackColor_State0 := gYellow;
  HGW_2StatePB_0.ForeColor_State0 := gBlack;
  HGW_2StatePB_0.BackColor_State1 := gGreen;
  HGW_2StatePB_0.ForeColor_State1 := gBlack;



END_PROGRAM

