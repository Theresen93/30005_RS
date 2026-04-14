(********************************************************************
 * COPYRIGHT -- .
 ********************************************************************
 * Program: CMPerf_Gen
 * File: CMPerf_GenCyclic.st
 * Author: dominique
 * Created: November 05, 2011
 ********************************************************************
 * Implementation of program CMPerf_Gen
 ********************************************************************)

PROGRAM _CYCLIC
  
  // ----------------------------------------------------------------------------------
  // On/Off Cold Micro Perf 
  // Cas On
  bOnReq := HMI_CMPerf_bOnOffPB AND NOT(gRecipeActive.bSelColdMicroPerfProd) ;
  IF bOnReq THEN 
    IF NOT(gA[9].Ind_InMotion) AND 
       1                       THEN
      gRecipeActive.bSelColdMicroPerfProd := 1 ;
    ELSE
      gRecipeActive.bSelColdMicroPerfProd := 0 ; 
      HMI_CMPerf_bOnOffPB := 0 ;
    END_IF ;
  END_IF ;
  
  // Cas Off
  bOffReq := NOT(HMI_CMPerf_bOnOffPB) AND gRecipeActive.bSelColdMicroPerfProd ;
  IF bOffReq THEN
    IF NOT(gA[9].Ind_InMotion) AND 
       1                       THEN
      gRecipeActive.bSelColdMicroPerfProd := 0 ;
    ELSE
      gRecipeActive.bSelColdMicroPerfProd := 1 ; 
      HMI_CMPerf_bOnOffPB := 1 ;
    END_IF ;
  END_IF ;
  
  // ----------------------------------------------------------------------------------
  // Axis ativation 
  gA[8].bActive := gRecipeActive.bSelColdMicroPerfProd ;
  
  // ----------------------------------------------------------------------------------
  // Tool size change lock
  bToolSizeLock := NOT(gA[9].Ind_InMotion)                  OR 
                   NOT(gRecipeActive.bSelColdMicroPerfProd) ;
  
END_PROGRAM
