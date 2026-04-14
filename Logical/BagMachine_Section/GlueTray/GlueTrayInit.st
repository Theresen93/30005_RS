(********************************************************************
 * COPYRIGHT -- Microsoft
 ********************************************************************
 * Program: GlueTray
 * File: GlueTrayInit.st
 * Author: pkiel
 * Created: July 19, 2011
 ********************************************************************
 * Implementation of program GlueTray
 ********************************************************************)

PROGRAM _INIT
	
(* Glue Tray Man/Auto PB Colors *)
	HGW_2StatePB_0.BackColor_State0 := gBlue;
	HGW_2StatePB_0.ForeColor_State0 := gWhite;
	HGW_2StatePB_0.BackColor_State1 := gGreen;
	HGW_2StatePB_0.ForeColor_State1 := gBlack;

(* Glue Tray Slow Rotation PB Colors *)
	HGW_2StatePB_1.BackColor_State0 := gBlue;
	HGW_2StatePB_1.ForeColor_State0 := gWhite;
	HGW_2StatePB_1.BackColor_State1 := gGreen;
	HGW_2StatePB_1.ForeColor_State1 := gBlack;

END_PROGRAM

