(********************************************************************
 * COPYRIGHT -- Microsoft
 ********************************************************************
 * Program: A4_Basic
 * File: A4_BasicInit.st
 * Author: pkiel
 * Created: July 13, 2011
 ********************************************************************
 * Implementation of program A4_Basic
 ********************************************************************)

PROGRAM _INIT
	
	(* Axis Setpoint Variables *)
		gA[4].SP_MotorPPR := 18000 ;
		gA[4].SP_GearBoxInput:= 2;
    gA[4].SP_GearBoxOutput:= 1;    
    gA[4].AxisPeriod := (gA[4].SP_MotorPPR*gA[4].SP_GearBoxInput/gA[4].SP_GearBoxOutput);
		gA[4].UnitsPerDeg := gA[4].AxisPeriod/360;
		gA[4].SP_Accel := 0.2*gA[4].AxisPeriod;
		gA[4].SP_Decel := 0.4*gA[4].AxisPeriod;
		gA[4].SP_EStopDecel := 1000.0*gA[4].AxisPeriod; // Stop axis from 1000 tr/min in 1s
		gA[4].HomeVelocity := 6*gA[4].AxisPeriod/60;
    gA[4].rSP_CorPosVel := 0.0 ;
    gA[4].rSP_OverrideV := 1.0 ;
    gA[4].rSP_OverrideA := 1.0 ;
    gA[4].Cmd_EStopDisable := 0 ;

	(* access master axis *)
		AxisErrorNcAccess := ncaccess(ncACP10MAN, ADR('Axis4'), ADR(gA[4].Ident));

	(* Trigger Initialization Of ModPosition *)
		InitModPosition:=1;
    
    
  // General parameter init
  gr_rTearAxContactZone := 52.0 ;  

END_PROGRAM

