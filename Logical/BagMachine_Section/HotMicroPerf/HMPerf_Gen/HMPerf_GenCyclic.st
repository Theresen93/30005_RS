(********************************************************************
 * COPYRIGHT -- .
 ********************************************************************
 * Program: HMPerf_Gen
 * File: HMPerf_GenCyclic.st
 * Author: dominique
 * Created: November 05, 2011
 ********************************************************************
 * Implementation of program HMPerf_Gen
 ********************************************************************)

PROGRAM _CYCLIC
  // ----------------------------------------------------------------------------------
  // Status 
  bReadyInd := gA[15].Ind_Ready ;
  
  // Hot Micro Perf Light On
  gQ_HMP_LightOn := g_stHMPerfCyc.bCyc ;
  
  // ----------------------------------------------------------------------------------
  // Operation mode Hot Micro Perf 
  // Cas On
  bOnReq := gI_HMP_On_PB AND gI_HMP_Off_PB AND NOT(g_stHMPerfCyc.bSelProd) ;
  IF bOnReq THEN 
    IF NOT(gA[9].Ind_InMotion) AND 
       gA[15].Ind_Ready        AND
       NOT(g_bIndEStop)        AND  
       1                       THEN
      g_stHMPerfCyc.bSelProd := 1 ;
    ELSE
      g_stHMPerfCyc.bSelProd := 0 ; 
      gI_HMP_On_PB := 0 ;
    END_IF ;
  END_IF ;
  
  // Cas Off
  bOffReq := NOT(gI_HMP_Off_PB) AND g_stHMPerfCyc.bSelProd ;
  IF bOffReq THEN
    IF 1                       AND  
       //NOT(gA[9].Ind_InMotion) AND 
       1                       THEN
      g_stHMPerfCyc.bStopReq := 1 ;
    ELSE
      g_stHMPerfCyc.bStopReq := 0 ;      
      gI_HMP_On_PB := 1 ; 
    END_IF ;
  END_IF ;
  
  // ----------------------------------------------------------------------------------
  // Operation mode Hot Micro Perf 
  // Cas Interrupt
  bInterruptReq := HMI_HMPerf_bModePB AND NOT(gRecipeActive.bHMPerf_Mode) ;
  IF bInterruptReq THEN 
    IF NOT(gA[9].Ind_InMotion) AND 
       1                       THEN
      gRecipeActive.bHMPerf_Mode:= 1 ;
    ELSE
      gRecipeActive.bHMPerf_Mode := 0 ; 
    END_IF ;
  END_IF ;
  
  // Cas Continu
  bContinuReq := NOT(HMI_HMPerf_bModePB) AND gRecipeActive.bHMPerf_Mode ;
  IF bContinuReq THEN
    IF 1                       AND  
       NOT(gA[9].Ind_InMotion) AND
       1                       THEN
      gRecipeActive.bHMPerf_Mode := 0 ;
    ELSE
      gRecipeActive.bHMPerf_Mode := 1 ; 
    END_IF 
  END_IF 

  // ----------------------------------------------------------------------------------
  // Axis ativation 
  gA[15].bActive := g_stHMPerfCyc.bSelProd ;

  // ----------------------------------------------------------------------------------
  // Operator tool size set point Limit   
  gRecipeActive.rHotMicroPerfSize_in := LIMIT(g_rMinBagSize_Inch,gRecipeActive.rHotMicroPerfSize_in,g_rMaxBagSize_Inch) ;
  
  // ----------------------------------------------------------------------------------
  // Tool size change lock
  bToolSizeLock := gRecipeActive.bHMPerf_Mode OR 
                   g_bMachineRun              ;
                   
  // Up Visible and Lock
  IF gRecipeActive.bHMPerf_Mode THEN  
    iToolUpVisibl := 0 ;
   ELSE
    iToolUpVisibl := 1 ;
  END_IF   
  bToolUpLock := g_bMachineRun ; 
                                      
  gRecipeActive.iHMPerf_Up := LIMIT(1,gRecipeActive.iHMPerf_Up,4) ;                         
  IF gRecipeActive.bHMPerf_Mode THEN 
    gRecipeActive.rHotMicroPerfSize_in := gRecipeActive.Repeat * gRecipeActive.iHMPerf_Up ; 
  END_IF ;
  
  // Offset Lock
  bOffsetLock := 0 ; //NOT(g_stHMPerfCyc.bSynchro_OK) ;
  
  // ----------------------------------------------------------------------------------
  // Operation State 
  IF g_stHMPerfCyc.bSlowRot_OK THEN  // Slow Rotation 
    iOperState := 1 ;
    uiOperStateCol_Ind := gViolet_5 + + gWhite * 256 ;
  END_IF ;
  
  IF g_stHMPerfCyc.bSynchro_OK THEN  // Sychronized 
    iOperState := 2 ;
    uiOperStateCol_Ind := gGreen + gBlack * 256 ;
  END_IF ;
  
  IF g_stHMPerfCyc.bFaultCond THEN  // Fault 
    iOperState := 3 ;
    uiOperStateCol_Ind := gRed + gBlack * 256 ;
  END_IF ;
  
  IF NOT(g_stHMPerfCyc.bCyc) THEN  // Off
    iOperState := 0 ;
    uiOperStateCol_Ind := gBlue + gWhite * 256 ;
  END_IF ;
    
  // ----------------------------------------------------------------------------------
  // Heater State 
  IF gQ_HMP_Heater THEN  // On
    iHeatState := 1 ;
    uiHeatStateCol_Ind := gGreen + gBlack * 256 ;
  END_IF ;
  
  IF NOT(gQ_HMP_Heater) THEN  // Off 
    iHeatState := 0 ;
    uiHeatStateCol_Ind := gBlue + gWhite * 256 ;
  END_IF ;
  
  

END_PROGRAM