(********************************************************************
 * COPYRIGHT -- Microsoft
 ********************************************************************
 * Program: A1_Basic
 * File: A1_BasicInit.st
 * Author: pkiel
 * Created: July 11, 2011
 ********************************************************************
 * Implementation of program A1_Basic
 ********************************************************************)

PROGRAM _INIT
	
	(* Axis Setpoint Variables *)
		gA[1].SP_MotorPPR := 18000;
		gA[1].SP_GearBoxInput:= 2;
		gA[1].SP_GearBoxOutput:= 1;
		gA[1].AxisPeriod := (gA[1].SP_MotorPPR*gA[1].SP_GearBoxInput/gA[1].SP_GearBoxOutput);
		gA[1].UnitsPerDeg := gA[1].AxisPeriod/360;
		gA[1].SP_Accel := 0.2*gA[1].AxisPeriod;
		gA[1].SP_Decel := 0.4*gA[1].AxisPeriod;
		gA[1].SP_EStopDecel := 1000.0*gA[1].AxisPeriod; // Stop axis from 1000 tr/min in 1s
    gA[1].rSP_CorPosVel := 0.0 ;
    gA[1].rSP_CorPosVel := 0.0 ;
    gA[1].rSP_OverrideV := 1.0 ;
    gA[1].rSP_OverrideA := 1.0 ;
    gA[1].Cmd_EStopDisable := 0 ;

	(* access master axis *)
		AxisErrorNcAccess := ncaccess(ncACP10MAN, ADR('Axis1'), ADR(gA[1].Ident));

	(* Trigger Initialization Of ModPosition *)
		InitModPosition:=1;
	
END_PROGRAM

