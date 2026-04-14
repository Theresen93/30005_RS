(********************************************************************
 * COPYRIGHT -- Microsoft
 ********************************************************************
 * Program: A11_Basic
 * File: A11_BasicInit.st
 * Author: pkiel
 * Created: July 22, 2011
 ********************************************************************
 * Implementation of program A11_Basic
 ********************************************************************)

PROGRAM _INIT
	
	(* Axis Setpoint Variables *)
		gA[11].SP_MotorPPR := 36000;
		gA[11].SP_GearBoxInput:= 1;
		gA[11].SP_GearBoxOutput:= 1;
		gA[11].AxisPeriod := (gA[11].SP_MotorPPR*gA[11].SP_GearBoxInput/gA[11].SP_GearBoxOutput);
		gA[11].UnitsPerDeg := gA[11].AxisPeriod/360;
		gA[11].SP_Accel := 0.2*gA[11].AxisPeriod;
		gA[11].SP_Decel := 0.4*gA[11].AxisPeriod;
		gA[11].SP_EStopDecel := 3.0*gA[11].AxisPeriod;
		gA[11].SP_FStopDecel := 1.5*gA[11].AxisPeriod;
		gA[11].HomeVelocity:=12*gA[11].AxisPeriod/60.0;
    gA[11].rSP_CorPosVel := 0.0 ;
    gA[11].rSP_CorPosVel := 0.0 ;
    gA[11].rSP_OverrideV := 1.0 ;
    gA[11].rSP_OverrideA := 1.0 ;
    
    FOR iIndex := 0 TO C_iMaxBagPerfTear DO 
      g_iArrayBagPerfTearNul[iIndex] := 0 ;
    END_FOR ;  
    
    
	(* access master axis *)
		AxisErrorNcAccess := ncaccess(ncACP10MAN, ADR('Axis11'), ADR(gA[11].Ident));

	(* Trigger Initialization Of ModPosition *)
		InitModPosition:=1;

END_PROGRAM

