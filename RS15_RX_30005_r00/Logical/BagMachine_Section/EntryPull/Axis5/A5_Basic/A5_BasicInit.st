(********************************************************************
 * COPYRIGHT -- Microsoft
 ********************************************************************
 * Program: A5_Basic
 * File: A5_BasicInit.st
 * Author: pkiel
 * Created: July 13, 2011
 ********************************************************************
 * Implementation of program A5_Basic
 ********************************************************************)

PROGRAM _INIT
	
	(* Axis Setpoint Variables *)
		gA[5].SP_MotorPPR := 14400;
		gA[5].SP_GearBoxInput:= 5;
		gA[5].SP_GearBoxOutput:= 2;
		gA[5].AxisPeriod := (gA[5].SP_MotorPPR*gA[5].SP_GearBoxInput/gA[5].SP_GearBoxOutput);
		gA[5].UnitsPerDeg := gA[5].AxisPeriod/360;
		gA[5].SP_Accel := 0.2*gA[5].AxisPeriod;
		gA[5].SP_Decel := 0.4*gA[5].AxisPeriod;
		gA[5].SP_EStopDecel := 1000.0*gA[5].AxisPeriod; // Stop axis from 1000 tr/min in 1s
		(* Theoretical Perimeter = 400mm *)
		gA[5].UnitsPerInch := gA[5].AxisPeriod*25.4/g_rSizeEntryPullRol_mm ;
    gA[5].rSP_CorPosVel := 0.0 ;
    gA[5].rSP_OverrideV := 1.0 ;
    gA[5].rSP_OverrideA := 1.0 ;
    gA[5].Cmd_EStopDisable := 0 ;

	(* access master axis *)
		AxisErrorNcAccess := ncaccess(ncACP10MAN, ADR('Axis5'), ADR(gA[5].Ident));

	(* Trigger Initialization Of ModPosition *)
		InitModPosition:=1;
END_PROGRAM

