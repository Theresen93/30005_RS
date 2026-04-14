(********************************************************************
 * COPYRIGHT -- .
 ********************************************************************
 * Program: FP_Gen
 * File: FP_GenCyclic.st
 * Author: dominique
 * Created: October 19, 2011
 ********************************************************************
 * Implementation of program FP_Gen
 ********************************************************************)

PROGRAM _CYCLIC
  
  // ----------------------------------------------------------------------------------
  // Nip Roll
  IF EDGEPOS(gI_SS_FP_NipRol) THEN 
    bQ_CR_FP_NipRol := 1 ;
  END_IF ;
  IF NOT(gRecipeActive.bSelFPProd) OR 
     NOT(g_bMainPower_On)          OR  
     g_bIndEStop                   OR 
     NOT(gI_SS_FP_NipRol)          THEN      
    bQ_CR_FP_NipRol := 0 ;
  END_IF ;
               
  gQ_CR_FP_NipRol := bQ_CR_FP_NipRol          AND 
                     NOT(g_bFP_NipRolAutoOff) ;                 
                     
                     
                     
  
  // ----------------------------------------------------------------------------------
  // On/Off Flexo Press 
  // Case On
  bFPOnReq := HMI_FP_bFlexoPressOnOffPB AND NOT(gRecipeActive.bSelFPProd) ;
  IF bFPOnReq THEN 
    IF NOT(gA[9].Ind_InMotion) AND 
       1                       THEN
      gRecipeActive.bSelFPProd := 1 ;
    ELSE
      gRecipeActive.bSelFPProd := 0 ; 
      HMI_FP_bFlexoPressOnOffPB := 0 ;
    END_IF ;
  END_IF ;
  
  // Case Off
  bFPOffReq := NOT(HMI_FP_bFlexoPressOnOffPB) AND gRecipeActive.bSelFPProd ;
  IF bFPOffReq THEN
    IF NOT(gA[9].Ind_InMotion) AND 
       1                       THEN
      gRecipeActive.bSelFPProd := 0 ;
    ELSE
      gRecipeActive.bSelFPProd := 1 ; 
      HMI_FP_bFlexoPressOnOffPB := 1 ;
    END_IF ;
  END_IF ;
  // Visibility tooth on gear print
  IF gRecipeActive.bSelFPProd THEN 
    HMI_FP_iToothSetVisibl := 0 ; // Visible
  ELSE
    HMI_FP_iToothSetVisibl := 1 ; // Unvisible
  END_IF 
    
  
  
  
  
  
   
  // ----------------------------------------------------------------------------------
  // Printing Manual/Auto From HMI 
  HGW_2StatePB_0.PB    := EDGEPOS(HMI_FP_bPrintAutoPB) ;
  uiPrintAutoText_Ind  := HGW_2StatePB_0.Text_Ind;
  uiPrintAutoColor_Ind := HGW_2StatePB_0.Color_Ind;
  bPrint_Auto          := HGW_2StatePB_0.State1;
  HGW_2StatePB_0();
  
  // Limite operator setpoint
  rMaxLSFlexoP_ftm := gr_rMaxLSFlexoP_mmin * 3.2808 ;
  HMI_FP_rSPSpeedPrintOn  := LIMIT(0,HMI_FP_rSPSpeedPrintOn,rMaxLSFlexoP_ftm) ;
  HMI_FP_rSPSpeedPrintOff := LIMIT(0,HMI_FP_rSPSpeedPrintOff,rMaxLSFlexoP_ftm) ;
  
  bEdgeSpeedOn  := EDGEPOS(gActualMachineSpeed_FPM > HMI_FP_rSPSpeedPrintOn) ;
  bEdgeSpeedOff := EDGEPOS((gActualMachineSpeed_FPM <= HMI_FP_rSPSpeedPrintOff) AND gRun_Stop) ;
  bEdgeSpeedNul := EDGENEG(gA[9].Ind_InMotion) ;
  
  bPrintOn_PB  := gI_FP_PrintOn_PB OR gI_PrintOn_PB ;
  bPrintOff_PB := gI_FP_PrintOff_PB AND gI_PrintOff_PB ;
  
  // Printing On
  IF bPrint_Auto              AND 
     bEdgeSpeedOn             AND 
     gRecipeActive.bSelFPProd OR 
     EDGEPOS(bPrintOn_PB)     AND 
     1                        THEN      
    bQ_CR_FP_Print := 1 ;
  END_IF   
  
  // Printing Off
  IF bPrint_Auto                   AND 
     bEdgeSpeedOff                 OR  
     EDGEPOS(bPrintOff_PB)         OR 
     bEdgeSpeedNul                 OR 
     NOT(gRecipeActive.bSelFPProd) AND          
     1                             THEN           
    bQ_CR_FP_Print := 0 ;
  END_IF   
  
  gQ_CR_FP_Print := bQ_CR_FP_Print   AND 
                    NOT(g_bIndEStop) ;
END_PROGRAM
