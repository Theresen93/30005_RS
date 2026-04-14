(********************************************************************
 * COPYRIGHT -- Microsoft
 ********************************************************************
 * Program: A7_Basic
 * File: A7_BasicInit.st
 * Author: pkiel
 * Created: July 13, 2011
 ********************************************************************
 * Implementation of program A7_Basic
 ********************************************************************)

PROGRAM _INIT
	
	(* Axis Setpoint Variables *)
		gA[7].SP_MotorPPR := 12000;
		gA[7].SP_GearBoxInput:= 3;  (* Note: Actual gear ratio = 12:1...However there are 4 stations/rev which yields an effective ratio of 3:1 *)
		gA[7].SP_GearBoxOutput:= 1;
		gA[7].AxisPeriod := (gA[7].SP_MotorPPR*gA[7].SP_GearBoxInput/gA[7].SP_GearBoxOutput);
		gA[7].UnitsPerDeg := gA[7].AxisPeriod/360;
		gA[7].SP_Accel := 0.2*gA[7].AxisPeriod;
		gA[7].SP_Decel := 0.4*gA[7].AxisPeriod;
		gA[7].SP_EStopDecel := 1000.0*gA[7].AxisPeriod; // Stop axis from 1000 tr/min in 1s
    gA[7].HomeVelocity := 6*gA[7].AxisPeriod/60;
    gA[7].rSP_CorPosVel := 0.0 ;
    gA[7].rSP_OverrideV := 1.0 ;
    gA[7].rSP_OverrideA := 1.0 ;
    gA[7].Cmd_EStopDisable := 0 ;

	(* access master axis *)
		AxisErrorNcAccess := ncaccess(ncACP10MAN, ADR('Axis7'), ADR(gA[7].Ident));

	(* Trigger Initialization Of ModPosition *)
		InitModPosition:=1;
    
    g_bIndPhasDrumInact := 1 ;
    

END_PROGRAM

