(********************************************************************
 * COPYRIGHT -- Microsoft
 ********************************************************************
 * Program: A8_Draw
 * File: A8_DrawCyclic.st
 * Author: dominique
 * Created: November 03, 2011
 ********************************************************************
 * Implementation of program A8_Draw
 ********************************************************************)

PROGRAM _CYCLIC

  // Draw Setpoint Limits 
	gRecipeActive.rCMPerf_Draw := LIMIT(-100,gRecipeActive.rCMPerf_Draw,100);

(* Manual Draw Calculations *)
  IF ( ( (gRecipeActive.rCMPerf_Draw <> Draw_Old) OR 
         (g_rSizeCMPerfRol_mm <> rSizeTool_Old)   OR 
         (NOT First) )                            AND
         gA[8].Ind_SynchronizedMotion )           THEN
		gA8_GearValue := gA[8].AxisPeriod * g_rSizeEntryPullRol_mm/g_rSizeCMPerfRol_mm * (1.0+(gr_rMaxRangeWebDraw * 0.01 * gRecipeActive.rCMPerf_Draw * 0.01));
		Draw_Old := gRecipeActive.rCMPerf_Draw;
    rSizeTool_Old := g_rSizeCMPerfRol_mm ;
		First :=1;
		IF(gA[8].Ind_SynchronizedMotion) THEN
			gA[8].Cmd_SynchronizedMotionUpdate := 1;
		END_IF
	END_IF

END_PROGRAM
