(********************************************************************
 * COPYRIGHT -- Microsoft
 ********************************************************************
 * Program: A8_Basic
 * File: A8_BasicInit.st
 * Author: dominique
 * Created: November 03, 2011
 ********************************************************************
 * Implementation of program A8_Basic
 ********************************************************************)

PROGRAM _INIT
	
  g_iCMPerfType := C_i10DP ; // D.M. 07/11/2011     Brown_Paper_14606  Cold Micro Perf in 10Dp
  // Drive roll size calculation
  CASE g_iCMPerfType OF 
    C_iM : ; // Case Metric
      g_rSizeCMPerfRol_mm := g_rZGearCMPerf_M * 10.0 ;
    C_i8DP : ; // Case 8DP
      g_rSizeCMPerfRol_mm := TRUNC(g_rZGearCMPerf_8DP*PI/8.0*25.4*1000.0)/1000.0 ;
    C_i10DP : ; // Case 10DP
      g_rSizeCMPerfRol_mm := TRUNC(g_rZGearCMPerf_10DP*PI/10.0*25.4*1000.0)/1000.0 ;
    C_i1_4P : ; // Case 1/4"
      g_rSizeCMPerfRol_mm := TRUNC(g_rZGearCMPerf_1_4P/4.0*25.4) ;
  END_CASE

	(* Axis Setpoint Variables *)
		gA[8].SP_MotorPPR := 12000;
		gA[8].SP_GearBoxInput:= 3;
		gA[8].SP_GearBoxOutput:= 1;
		gA[8].AxisPeriod := (gA[8].SP_MotorPPR*gA[8].SP_GearBoxInput/gA[8].SP_GearBoxOutput);
		gA[8].UnitsPerDeg := gA[8].AxisPeriod/360;
		gA[8].SP_Accel := 0.2*gA[8].AxisPeriod;
		gA[8].SP_Decel := 0.4*gA[8].AxisPeriod;
		gA[8].SP_EStopDecel := 1000.0*gA[8].AxisPeriod; // Stop axis from 1000 tr/min in 1s
		(* Theoretical Perimeter = 320mm *)
		gA[8].UnitsPerInch := (gA[8].AxisPeriod*25.4) / g_rSizeCMPerfRol_mm ;
    gA[8].rSP_CorPosVel := 0.0 ;
    gA[8].rSP_OverrideV := 1.0 ;
    gA[8].rSP_OverrideA := 1.0 ;
    gA[8].Cmd_EStopDisable := 0 ;

	(* access master axis *)
		AxisErrorNcAccess := ncaccess(ncACP10MAN, ADR('Axis8'), ADR(gA[8].Ident));

	(* Trigger Initialization Of ModPosition *)
		InitModPosition:=1;

END_PROGRAM

