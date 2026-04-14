(********************************************************************
 * COPYRIGHT -- Microsoft
 ********************************************************************
 * Program: A6_Basic
 * File: A6_BasicInit.st
 * Author: pkiel
 * Created: July 13, 2011
 ********************************************************************
 * Implementation of program A6_Basic
 ********************************************************************)

PROGRAM _INIT
	
	(* Axis Setpoint Variables *)
		gA[6].SP_MotorPPR := 18000;
		gA[6].SP_GearBoxInput:= 2;
		gA[6].SP_GearBoxOutput:= 1;
		gA[6].AxisPeriod := (gA[6].SP_MotorPPR*gA[6].SP_GearBoxInput/gA[6].SP_GearBoxOutput);
		gA[6].UnitsPerDeg := gA[6].AxisPeriod/360;
		gA[6].SP_Accel := 0.2*gA[6].AxisPeriod;
		gA[6].SP_Decel := 0.4*gA[6].AxisPeriod;
		gA[6].SP_EStopDecel := 1000.0*gA[6].AxisPeriod; // Stop axis from 1000 tr/min in 1s
		(* Theoretical Perimeter = 320mm *)
		gA[6].UnitsPerInch := (gA[6].AxisPeriod*25.4) / g_rSizeExitPullRol_mm ;
    gA[6].rSP_CorPosVel := 0.0 ;
    gA[6].rSP_OverrideV := 1.0 ;
    gA[6].rSP_OverrideA := 1.0 ;
    gA[6].Cmd_EStopDisable := 0 ;

	(* access master axis *)
		AxisErrorNcAccess := ncaccess(ncACP10MAN, ADR('Axis6'), ADR(gA[6].Ident));

	(* Trigger Initialization Of ModPosition *)
		InitModPosition:=1;

END_PROGRAM

