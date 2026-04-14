(********************************************************************
 * COPYRIGHT -- .
 ********************************************************************
 * Program: EB_Gen
 * File: EB_GenCyclic.st
 * Author: dominique
 * Created: November 21, 2011
 ********************************************************************
 * Implementation of program EB_Gen
 ********************************************************************)

PROGRAM _CYCLIC
  
  // ----------------------------------------------------------------------------------
  // On/Off Envelope Bag 
  // Case On
  bEnvBOnReq := HMI_EnvB_bOnOffPB AND NOT(gRecipeActive.bSelEnvBProd) ;
  IF bEnvBOnReq THEN 
    IF NOT(gA[9].Ind_InMotion) AND 
       1                       THEN
      gRecipeActive.bSelEnvBProd := 1 ;
      HMI_EnvB_bWasteSucOnOffPB  := 1 ;
    ELSE
      gRecipeActive.bSelEnvBProd := 0 ; 
      HMI_EnvB_bOnOffPB := 0 ;  
    END_IF ;
  END_IF ;
  
  // Case Off
  bEnvBOffReq := NOT(HMI_EnvB_bOnOffPB) AND gRecipeActive.bSelEnvBProd ;
  IF bEnvBOffReq THEN
    IF NOT(gA[9].Ind_InMotion) AND 
       1                       THEN
      gRecipeActive.bSelEnvBProd := 0 ;
      HMI_EnvB_bWasteSucOnOffPB  := 0 ;
    ELSE
      gRecipeActive.bSelEnvBProd := 1 ; 
      HMI_EnvB_bOnOffPB := 1 ;
    END_IF ;
  END_IF ;
    
  // Indicator Envelope Bag selection change 
  IF EDGE(gRecipeActive.bSelEnvBProd) THEN 
    g_bEnvBagSelectChang := 1 ;
  END_IF ;
   
   
   
  // ----------------------------------------------------------------------------------
  // On/Off Waste Suction 
  IF NOT(gRecipeActive.bSelEnvBProd) OR 
     g_EnvB_bWasteSucMPAlarm         OR 
     g_bIndEStop                     THEN  
    HMI_EnvB_bWasteSucOnOffPB := 0 ; 
  END_IF ;
  
  bWasteSucOn := HMI_EnvB_bWasteSucOnOffPB AND 
                 gA[9].Ind_InMotion        AND                
                 1                         ;                                      
                   
  stTOF_0(IN:=bWasteSucOn,PT:=T#60s) ;
  
  gQ_CR_EB_WasteSuction := stTOF_0.Q                 AND 
                           HMI_EnvB_bWasteSucOnOffPB ; 
   
   
   
  // ----------------------------------------------------------------------------------
  // Active indicator 
  gA[12].bActive := gA[12].bInMach ;
  gA[13].bActive := gA[13].bInMach ;
   
                           
                           
                           
  
END_PROGRAM
