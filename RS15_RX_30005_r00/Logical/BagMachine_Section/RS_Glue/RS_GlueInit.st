(********************************************************************
 * COPYRIGHT -- Microsoft
 ********************************************************************
 * Program: RS_Glue
 * File: RS_GlueInit.st
 * Author: dominique
 * Created: October 26, 2011
 ********************************************************************
 * Implementation of program ColdGlue
 ********************************************************************)

PROGRAM _INIT

(* Glue Off/On PB Colors *)
	HGW_2StatePB_0.BackColor_State0 := gBlue;
	HGW_2StatePB_0.ForeColor_State0 := gWhite;
	HGW_2StatePB_0.BackColor_State1 := gGreen;
	HGW_2StatePB_0.ForeColor_State1 := gBlack;

(* Glue Manual/Auto PB Colors *)
	HGW_2StatePB_1.BackColor_State0 := gYellow;
	HGW_2StatePB_1.ForeColor_State0 := gBlack;
	HGW_2StatePB_1.BackColor_State1 := gGreen;
	HGW_2StatePB_1.ForeColor_State1 := gBlack;

  bTest1 := 0 ;
  bTest2 := 0 ;
  
END_PROGRAM

