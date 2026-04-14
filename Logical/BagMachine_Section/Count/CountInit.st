(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: Count
 * File: CountInit.st
 * Author: pkiel
 * Created: October 21, 2009
 ********************************************************************
 * Implementation of program Count
 ********************************************************************)

PROGRAM _INIT

	HMI_CountSelect_Ind:=LIMIT(1,HMI_CountSelect_Ind,5);
	HMI_ProductCountVisibility:=1;
	
(* Count Off/On PB Colors *)
	HGW_2StatePB_0.BackColor_State0 := gBlue;
	HGW_2StatePB_0.ForeColor_State0 := gWhite;
	HGW_2StatePB_0.BackColor_State1 := gGreen;
	HGW_2StatePB_0.ForeColor_State1 := gBlack;

END_PROGRAM

