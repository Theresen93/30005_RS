(********************************************************************
 * COPYRIGHT -- Microsoft
 ********************************************************************
 * Program: A9_Basic
 * File: A9_BasicInit.st
 * Author: pkiel
 * Created: July 12, 2011
 ********************************************************************
 * Implementation of program A9_Basic
 ********************************************************************)

PROGRAM _INIT
	
	(* Axis Setpoint Variables *)
		gA[9].SP_MotorPPR := 36000;
		gA[9].SP_GearBoxInput:= 1;
		gA[9].SP_GearBoxOutput:= 1;
		gA[9].AxisPeriod := (gA[9].SP_MotorPPR*gA[9].SP_GearBoxInput/gA[9].SP_GearBoxOutput);
		gA[9].UnitsPerDeg := gA[9].AxisPeriod/360;
		gA[9].SP_Decel := 0.4*gA[9].AxisPeriod;
		gA[9].SP_EStopDecel := 3.0*gA[9].AxisPeriod;
		gA[9].SP_FStopDecel := 1.5*gA[9].AxisPeriod;
		gA[9].SP_GenFaultDecel := 1.5*gA[9].AxisPeriod;
		gA[9].SP_GuardFaultDecel := 1.5*gA[9].AxisPeriod;
		gA[9].SP_WebBreakDecel := 1.5*gA[9].AxisPeriod;
		gA[9].HomeVelocity:=12*gA[9].AxisPeriod/60.0;
		
	(* access master axis *)
		AxisErrorNcAccess := ncaccess(ncACP10MAN, ADR('Axis9'), ADR(gA[9].Ident));

	(* Trigger Initialization Of ModPosition *)
		InitModPosition:=1;
    
END_PROGRAM

