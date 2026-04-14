(********************************************************************
 * COPYRIGHT -- Microsoft
 ********************************************************************
 * Program: A3_Basic
 * File: A3_BasicInit.st
 * Author: pkiel
 * Created: July 13, 2011
 ********************************************************************
 * Implementation of program A3_Basic
 ********************************************************************)

PROGRAM _INIT
	
	(* Axis Setpoint Variables *)
		gA[3].SP_MotorPPR := 24000;
		gA[3].SP_GearBoxInput:= 3;
		gA[3].SP_GearBoxOutput:= 2;
		gA[3].AxisPeriod := (gA[3].SP_MotorPPR*gA[3].SP_GearBoxInput/gA[3].SP_GearBoxOutput);
		gA[3].UnitsPerDeg := gA[3].AxisPeriod/360;
		gA[3].SP_Accel := 0.2*gA[3].AxisPeriod;
		gA[3].SP_Decel := 0.4*gA[3].AxisPeriod;
		gA[3].SP_EStopDecel := 1000.0*gA[3].AxisPeriod; // Stop axis from 1000 tr/min in 1s
		gA[3].HomeVelocity := 6*gA[3].AxisPeriod/60;
    gA[3].rSP_CorPosVel := 0.0 ;
    gA[3].rSP_OverrideV := 1.0 ;
    gA[3].rSP_OverrideA := 1.0 ;
    gA[3].Cmd_EStopDisable := 0 ;

	(* access master axis *)
		AxisErrorNcAccess := ncaccess(ncACP10MAN, ADR('Axis3'), ADR(gA[3].Ident));

	(* Trigger Initialization Of ModPosition *)
		InitModPosition:=1;
   
   
  // General parameter init
  gr_rHoldAxContactZone := 22.0 ;  
END_PROGRAM

