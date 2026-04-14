(********************************************************************
 * COPYRIGHT -- Microsoft
 ********************************************************************
 * Program: A6_Draw
 * File: A6_DrawCyclic.st
 * Author: pkiel
 * Created: July 13, 2011
 ********************************************************************
 * Implementation of program A6_Draw
 ********************************************************************)

PROGRAM _CYCLIC

  // Draw Setpoint Limits *)
	gRecipeActive.Exit_Draw := LIMIT(-100,gRecipeActive.Exit_Draw,100);

(* Manual Draw Calculations *)
	IF (((gRecipeActive.Exit_Draw <> Draw_Old) OR (NOT First) OR gRepeatChange) AND gA[6].Ind_SynchronizedMotion) THEN
   // gA6_GearValue := gA[6].UnitsPerInch * gRecipeActive.Repeat * (1.0+(gr_rMaxRangeWebDraw * 0.01 * gRecipeActive.Exit_Draw * 0.01));
    gA6_GearValue := gA[6].AxisPeriod * g_rSizeEntryPullRol_mm/g_rSizeExitPullRol_mm * (1.0+(gr_rMaxRangeWebDraw * 0.01 * gRecipeActive.Exit_Draw * 0.01));
    Draw_Old := gRecipeActive.Exit_Draw;
		First :=1;
		IF(gA[6].Ind_SynchronizedMotion) THEN
			gA[6].Cmd_SynchronizedMotionUpdate := 1;
		END_IF
	END_IF

END_PROGRAM
