(********************************************************************
 * COPYRIGHT -- Microsoft
 ********************************************************************
 * Program: A12_Basic
 * File: A12_BasicInit.st
 * Author: dominique
 * Created: November 21, 2011
 ********************************************************************
 * Implementation of program A12_Basic
 ********************************************************************)

PROGRAM _INIT
	
	(* Axis Setpoint Variables *)
		gA[12].SP_MotorPPR := 36000 / 6 ; // One revolution on the shaft = 1/2 revolution of the Axis. When Axis perfoms 1 rev shaft performs 2 rev. One Axis rev = 2 shaft rev = 1 bag
		gA[12].SP_GearBoxInput:= 6;
		gA[12].SP_GearBoxOutput:= 1;    
		gA[12].AxisPeriod := gA[12].SP_MotorPPR*gA[12].SP_GearBoxInput/gA[12].SP_GearBoxOutput ;
		gA[12].UnitsPerDeg := gA[12].AxisPeriod/360;
		gA[12].SP_Accel := 0.2*gA[12].AxisPeriod;
		gA[12].SP_Decel := 0.4*gA[12].AxisPeriod;
		gA[12].SP_EStopDecel := 1000.0*gA[12].AxisPeriod; // Stop axis from 1000 tr/min in 1s
		gA[12].HomeVelocity := 6*gA[12].AxisPeriod/60;
    gA[12].rSP_CorPosVel := 0.0 ;
    gA[12].rSP_OverrideV := 1.0 ;
    gA[12].rSP_OverrideA := 1.0 ;
    gA[12].Cmd_EStopDisable := 0 ;

	(* access master axis *)
		AxisErrorNcAccess := ncaccess(ncACP10MAN, ADR('Axis12'), ADR(gA[12].Ident));

	(* Trigger Initialization Of ModPosition *)
		InitModPosition:=1;
     

END_PROGRAM

