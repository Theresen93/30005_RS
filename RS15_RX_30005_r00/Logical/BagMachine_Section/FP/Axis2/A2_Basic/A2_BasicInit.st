(********************************************************************
 * COPYRIGHT -- Microsoft
 ********************************************************************
 * Program: A2_Basic
 * File: A2_BasicInit.st
 * Author: Dominique
 * Created: October 15, 2011
 ********************************************************************
 * Implementation of program A2_Basic
 ********************************************************************)

PROGRAM _INIT
	
	(* Axis Setpoint Variables *)
		gA[2].SP_MotorPPR := 36000 * 63 / 250 ; // = 9072  
		gA[2].SP_GearBoxInput:= 250;                                              
		gA[2].SP_GearBoxOutput:= 63;                                              
		gA[2].AxisPeriod := (gA[2].SP_MotorPPR*gA[2].SP_GearBoxInput/gA[2].SP_GearBoxOutput); // = 36000
		gA[2].UnitsPerDeg := gA[2].AxisPeriod/360;
		gA[2].SP_Accel := 0.2*gA[2].AxisPeriod;
		gA[2].SP_Decel := 0.4*gA[2].AxisPeriod;
		gA[2].SP_EStopDecel := 1000.0*gA[2].AxisPeriod; // Stop axis from 1000 tr/min in 1s
		gA[2].HomeVelocity := 6*gA[2].AxisPeriod/60;
    gA[2].rSP_CorPosVel := 0.0 ;
    gA[2].rSP_OverrideV := 1.0 ;
    gA[2].rSP_OverrideA := 1.0 ;
    gA[2].Cmd_EStopDisable := 0 ;

	(* access master axis *)
		AxisErrorNcAccess := ncaccess(ncACP10MAN, ADR('Axis2'), ADR(gA[2].Ident));

	(* Trigger Initialization Of ModPosition *)
		InitModPosition:=1;

  // Flexo type selection 
  g_iFlexoType := C_i10DP ;  
  CASE g_iFlexoType OF 
    C_iM : ; // Case Metric
      g_rZGearRepFP := g_rZGearRepFP_M ;
    C_i8DP : ; // Case 8DP
      g_rZGearRepFP := g_rZGearRepFP_8DP ;
    C_i10DP : ; // Case 10DP
      g_rZGearRepFP := g_rZGearRepFP_10DP ;
    C_i1_4P : ; // Case 1/4"
      g_rZGearRepFP := g_rZGearRepFP_1_4P ;
  END_CASE
  
END_PROGRAM

