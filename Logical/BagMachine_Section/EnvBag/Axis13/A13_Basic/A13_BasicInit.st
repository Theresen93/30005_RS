(********************************************************************
 * COPYRIGHT -- Microsoft
 ********************************************************************
 * Program: A13_Basic
 * File: A13_BasicInit.st
 * Author: dominique
 * Created: November 21, 2011
 ********************************************************************
 * Implementation of program A13_Basic
 ********************************************************************)

PROGRAM _INIT
	
	(* Axis Setpoint Variables *)
		gA[13].SP_MotorPPR := 36000 * 2 / 7 ;
		gA[13].SP_GearBoxInput:= 7;
		gA[13].SP_GearBoxOutput:= 2;    
		gA[13].AxisPeriod := 36000 ; // because of limited precsision  (gA[13].SP_MotorPPR*gA[13].SP_GearBoxInput/gA[13].SP_GearBoxOutput) = 35997.5 insted of 36000 and then the synchro is not correct 
		gA[13].UnitsPerDeg := gA[13].AxisPeriod/360;
		gA[13].SP_Accel := 0.2*gA[13].AxisPeriod;
		gA[13].SP_Decel := 0.4*gA[13].AxisPeriod;
		gA[13].SP_EStopDecel := 1000.0*gA[13].AxisPeriod; // Stop axis from 1000 tr/min in 1s
		gA[13].HomeVelocity := 6*gA[13].AxisPeriod/60;
    gA[13].rSP_CorPosVel := 0.0 ;
    gA[13].rSP_OverrideV := 1.0 ;
    gA[13].rSP_OverrideA := 1.0 ;
    gA[13].Cmd_EStopDisable := 0 ;
  
	(* access master axis *)
		AxisErrorNcAccess := ncaccess(ncACP10MAN, ADR('Axis13'), ADR(gA[13].Ident));
  
	(* Trigger Initialization Of ModPosition *)
		InitModPosition:=1;
    
    
END_PROGRAM

