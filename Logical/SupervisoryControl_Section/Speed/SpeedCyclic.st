(********************************************************************
 * COPYRIGHT -- Microsoft
 ********************************************************************
 * Program: SpeedLimit
 * File: SpeedCyclic.st
 * Author: pkiel
 * Created: July 21, 2011
 ********************************************************************
 * Implementation of program Speed
 ********************************************************************)

PROGRAM _CYCLIC

(* Detect Repeat (Length) Change Or Perf Tool Change To Recalculate Machine Speed Limit Array Index *)
  RepeatMetric := gRecipeActive.Repeat*25.4;
	IF (EDGEPOS(gRepeatChange) OR gSP_PerfCylSelect<>PerfCylSelect_Old) THEN
		Index1 := TRUNC(RepeatMetric/10.0);
		Remainder := (RepeatMetric/10.0)-Index1;
		IF (Remainder<0.5) THEN
			ArrayIndex := Index1*10;
		ELSE
			ArrayIndex := (Index1*10)+5;
		END_IF
  END_IF
                            
                            
// Calculate Max Speed Limit Perf according to the repeat
  IF gRecipeActive.bSelEnvBProd THEN // Enveloppe Bag Perf
    SpeedLimit := Ar_iMaxSpeedApPoPerf_520[ArrayIndex];
	ELSIF(gSP_PerfCylSelect=0) THEN    // Small Cylinder 
		SpeedLimit := Ar_iMaxSpeedSmallPerf[ArrayIndex];
	ELSE	                             // Large Cylinder 
		SpeedLimit := Ar_iMaxSpeedLargePerf[ArrayIndex];
  END_IF

// Max Speed case Setup Mode
  IF (gSetupMode_On) THEN
    SpeedLimit := TRUNC(g_rLinSpeedMin_mmin*3.2808*12.0/gRecipeActive.Repeat); (*Max Speed = 10 MPM = 32.808 FPM = 32.808x12 IPM*)
  END_IF
  
// Calculation correction in case Bag Size is just above g_rBagSize1to2SPerf_mm   
  IF NOT(gRecipeActive.bSelEnvBProd) THEN // Enveloppe Bag Perf  no double Perf
    IF gSP_PerfCylSelect THEN             // Large Perf 
      rBagSize1to2Perf_mm := g_rBagSize1to2LPerf_mm ;
    ELSE                                  // Small Perf 
      rBagSize1to2Perf_mm := g_rBagSize1to2SPerf_mm ;
    END_IF   
    IF (gSP_PerfKnifeCount=1)                   AND 
       (RepeatMetric < (rBagSize1to2Perf_mm+5)) THEN
      IF gSP_PerfCylSelect THEN  // Large Perf 
        SpeedLimit := Ar_iMaxSpeedLargePerf[REAL_TO_INT(rBagSize1to2Perf_mm+5)] - 8 ; 
      ELSE                       // Small Perf
        SpeedLimit := Ar_iMaxSpeedSmallPerf[REAL_TO_INT(rBagSize1to2Perf_mm+5)] - 25 ; 
      END_IF   
    END_IF
  END_IF
	gMachineMaxSpeedLimit := INT_TO_REAL(SpeedLimit);
  
     
// Calculate Max Speed Limit Bundler according to PackCount
  rBundSpeedLimit := gr_rMaxCyclPerMin * gRecipeActive.PackCount ;
  g_bBund_IndSpeedLimit := 0 ;
  IF g_bIndSelBundProd                         AND 
     (gMachineMaxSpeedLimit > rBundSpeedLimit) AND 
     (gRecipeActive.PackCount > 0)             THEN 
    gMachineMaxSpeedLimit := rBundSpeedLimit ;
    g_bBund_IndSpeedLimit := 1 ;
  END_IF
  
// Calculate Max Speed Limit Flexo Press 
  rFPSpeedLimit := gr_rMaxLSFlexoP_mmin / RepeatMetric * 1000 ;
  g_bFP_IndSpeedLimit := 0 ;
  IF gRecipeActive.bSelFPProd                AND 
     (gMachineMaxSpeedLimit > rFPSpeedLimit) AND 
     1                                       THEN 
    gMachineMaxSpeedLimit := rFPSpeedLimit ;
    g_bFP_IndSpeedLimit := 1 ;
  END_IF
     
  // Speed Limite after calculations
  gMachineMaxSpeedLimit := LIMIT(0.0,gMachineMaxSpeedLimit,gr_rMachMaxSpeed_BPM) ;
  
  // Calculate Min Speed Limit, in Bag/min 
  gMachineMinSpeedLimit := g_rLinSpeedMin_mmin / RepeatMetric * 1000 ;
  // Limit bag/min speed because for small bag speed is too large with g_rLinSpeedMin_mmin 
  IF gMachineMinSpeedLimit > g_rMaxSpeedMin_bpm THEN 
    gMachineMinSpeedLimit := g_rMaxSpeedMin_bpm ;  
    rLinSpeedSP_JogDec := g_rMaxJogDecel_bpmm ;  
  ELSE
    CASE g_iMachType OF 
      C_iRS15 :    
        rLinSpeedSP_JogDec := g_rLinSpeedSP_JogDecRS15 ; 
      C_iRS26 :     
        rLinSpeedSP_JogDec := g_rLinSpeedSP_JogDecRS26 ; 
    END_CASE ;           
  END_IF
  // Limit speed when synchronizing Axis 
  bIndSynchro_OK := g_bSynchroAxisOK ;
  IF EDGENEG(bLimSpeedSynchro) THEN
    bMemoSynchro_OK := 1 ;   
  END_IF  
  IF NOT(bIndSynchro_OK) THEN  
    bLimSpeedSynchro := 1 ;
    bMemoSynchro_OK  := 0 ;   
    uiiMemoNumRev := gA[9].uiiNumRev ;
  END_IF  
  uiiDiffNumRev := gA[9].uiiNumRev - uiiMemoNumRev ;
  IF ( (uiiDiffNumRev >= 0) OR    // <> 0 if nedeed to wait several bags befor sup speed limitation
       bMemoSynchro_OK )    AND 
     bIndSynchro_OK         THEN  
    bLimSpeedSynchro := 0 ;  
  END_IF     
  IF bLimSpeedSynchro THEN   
    gMachineMinSpeedLimit := g_rMaxSpeedSynchro_bpm ;    
    gMachineMaxSpeedLimit := g_rMaxSpeedSynchro_bpm ;
  END_IF  
  
          
  CASE g_iMachType OF 
    C_iRS15 :
      // Conversion bag/min/s --> Units/s²
      rConvAccDec := gA[9].AxisPeriod / 60 ;
      // Acceleration Set point, in Units/s² 
      gA[9].SP_Accel := g_rLinSpeedSP_AccRS15 * rConvAccDec ;
      // Deceleration Set Points, in Units/s² 
      gA[9].SP_EStopDecel      := g_rLinSpeedSP_EStopDecRS15 * rConvAccDec ; 
      gA[9].SP_GuardFaultDecel := g_rLinSpeedSP_GuardFaultDecRS15 * rConvAccDec ;
      gA[9].SP_WebBreakDecel   := g_rLinSpeedSP_WebBreakDecRS15 * rConvAccDec ;
      gA[9].SP_GenFaultDecel   := g_rLinSpeedSP_GenFaultDecRS15 * rConvAccDec ;
      gA[9].SP_FStopDecel      := g_rLinSpeedSP_FStopDecRS15 * rConvAccDec ; 
      gA[9].SP_JogDecel        := g_rLinSpeedSP_JogDecRS15 * rConvAccDec ; 
      gA[9].SP_Decel           := g_rLinSpeedSP_DecRS15 * rConvAccDec ;
    C_iRS26 :
      // Conversion m/min² --> Units/s²
      rConvAccDec := 1000 / RepeatMetric / 60 / 60 * gA[9].AxisPeriod ;
      // Acceleration Set point, in Units/s² 
      gA[9].SP_Accel := g_rLinSpeedSP_AccRS26 * rConvAccDec ;
      // Deceleration Set Points, in Units/s² 
      gA[9].SP_EStopDecel      := g_rLinSpeedSP_EStopDecRS26 * rConvAccDec ; 
      gA[9].SP_GuardFaultDecel := g_rLinSpeedSP_GuardFaultDecRS26 * rConvAccDec ;
      gA[9].SP_WebBreakDecel   := g_rLinSpeedSP_WebBreakDecRS26 * rConvAccDec ;
      gA[9].SP_GenFaultDecel   := g_rLinSpeedSP_GenFaultDecRS26 * rConvAccDec ;
      gA[9].SP_FStopDecel      := g_rLinSpeedSP_FStopDecRS26 * rConvAccDec ; 
      gA[9].SP_JogDecel        := g_rLinSpeedSP_JogDecRS26 * rConvAccDec ; 
      gA[9].SP_Decel           := g_rLinSpeedSP_DecRS26 * rConvAccDec ;
  END_CASE ;               

  
        
        END_PROGRAM
