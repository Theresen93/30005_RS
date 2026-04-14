(********************************************************************
 * COPYRIGHT -- Microsoft
 ********************************************************************
 * Program: A5_Draw
 * File: A5_DrawCyclic.st
 * Author: pkiel
 * Created: July 13, 2011
 ********************************************************************
 * Implementation of program A5_Draw
 ********************************************************************)

PROGRAM _CYCLIC

(* Draw Setpoint Limits *)
	gRecipeActive.Entry_Draw := LIMIT(-100,gRecipeActive.Entry_Draw,100);

  // Lock Entry Web Draw in case Reg Enable
  IF EDGENEG(gReg[5].Enable) THEN 
    HMI_rEntry_Draw_Set := gRecipeActive.Entry_Draw ;
  END_IF 
  IF gReg[5].Enable THEN 
    iLockEntryWebDraw := 2 ; // Lock
    iBackColor := gGray1 + gBlack * 256 ;
    HMI_rEntry_Draw_Set := 0.0 ;
    rEntry_Draw_SP := 0.0 ;
  ELSE
    iLockEntryWebDraw := 0 ; // Free
    iBackColor := gWhite + gBlack * 256 ;
    gRecipeActive.Entry_Draw := HMI_rEntry_Draw_Set ;
    rEntry_Draw_SP := gRecipeActive.Entry_Draw ;
  END_IF
  

(* Manual Draw Calculations *)
  IF (((rEntry_Draw_SP <> Draw_Old) OR (NOT First) OR gRepeatChange) AND gA[5].Ind_SynchronizedMotion) THEN
    gA5_GearValue := gA[5].UnitsPerInch * gRecipeActive.Repeat * (1+(gr_rMaxRangeWebDraw * 0.01 * rEntry_Draw_SP * 0.01)); 
    Draw_Old := rEntry_Draw_SP ;
    First :=1;
    IF(gA[5].Ind_SynchronizedMotion) THEN
      gA[5].Cmd_SynchronizedMotionUpdate := NOT(gReg[5].Enable) ;
    END_IF
  END_IF
  



END_PROGRAM
