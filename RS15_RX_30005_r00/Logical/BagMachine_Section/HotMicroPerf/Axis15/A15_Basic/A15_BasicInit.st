(********************************************************************
 * COPYRIGHT -- Microsoft
 ********************************************************************
 * Program: A15_Basic
 * File: A15_BasicInit.st
 * Author: dominique
 * Created: November 03, 2011
 ********************************************************************
 * Implementation of program A15_Basic
 ********************************************************************)

PROGRAM _INIT
	// Mecanical drive 
  // Gear ratio = 48/20 x 48/25 x 48/48 = 24/5 x 48/25 = 576/125 = 4.608
	// Axis Setpoint Variables 
		gA[15].SP_MotorPPR := 15625 / 2 ; // 36000 x 125 / 576  = 125 x 125 / 2 = 15625 / 2
		gA[15].SP_GearBoxInput:= 576;  
		gA[15].SP_GearBoxOutput:= 125;
    gA[15].AxisPeriod := 36000 ; // D.M. 19/10/2011 B&H_14541  because of limited precsision  (gA[15].SP_MotorPPR*gA[15].SP_GearBoxInput/gA[15].SP_GearBoxOutput) = 35997.7 insted of 36000 and then the synchro is not correct 
		gA[15].UnitsPerDeg := gA[15].AxisPeriod/360;
		gA[15].SP_Accel := 0.2*gA[15].AxisPeriod;
		gA[15].SP_Decel := 0.4*gA[15].AxisPeriod;
		gA[15].SP_EStopDecel := 1000.0*gA[15].AxisPeriod; // Stop axis from 1000 tr/min in 1s
    gA[15].HomeVelocity := 6*gA[15].AxisPeriod/60;
    gA[15].rSP_CorPosVel := 0.0 ;
    gA[15].rSP_OverrideV := 1.0 ;
    gA[15].rSP_OverrideA := 1.0 ;
    gA[15].Cmd_EStopDisable := 0 ;

	// access master axis 
		AxisErrorNcAccess := ncaccess(ncACP10MAN, ADR('Axis15'), ADR(gA[15].Ident));

	// Trigger Initialization Of ModPosition 
		InitModPosition:=1;

    
    

END_PROGRAM

