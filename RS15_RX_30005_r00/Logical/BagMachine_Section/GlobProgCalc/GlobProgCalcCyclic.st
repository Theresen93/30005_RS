(********************************************************************
 * COPYRIGHT -- .
 ********************************************************************
 * Program: GlobProgCalc
 * File: GlobProgCalcCyclic.st
 * Author: dominique
 * Created: October 27, 2011
 ********************************************************************
 * Implementation of program GlobProgCalc
 ********************************************************************)

PROGRAM _CYCLIC
// --------------------------------------------------------------------------------------------------  
  // Tube Length Limit  
  
  CASE g_iMachType OF 
    C_iRS15 :
      g_rMaxBagSize_Inch := g_rMaxBagSize_RS15_mm / 25.4 ;
      g_rMinBagSize_Inch := g_rMinBagSize_RS15_mm / 25.4 ;
    C_iRS26 :
      IF gRecipeActive.bSelEnvBProd THEN   
        // Case Envelope Bag       
        g_rMaxBagSize_Inch := g_rMaxBagSize_EnvB_mm / 25.4 ;
        g_rMinBagSize_Inch := g_rMinBagSize_EnvB_mm / 25.4 ;
      ELSE
        g_rMaxBagSize_Inch := g_rMaxBagSize_RS26_mm / 25.4 ;
        g_rMinBagSize_Inch := g_rMinBagSize_RS26_mm / 25.4 ;     
      END_IF ;  
  END_CASE ;                 
  
                         
  // Limit operator setting in case of Flexo Type 
  gRecipeActive.iPrintUp := LIMIT(1,gRecipeActive.iPrintUp,4) ;
  gRecipeActive.Repeat := LIMIT(g_rMinBagSize_Inch,gRecipeActive.Repeat,g_rMaxBagSize_Inch) ;    
  
  // Repeat calculation in case of Flexo Press
  rPrintUp := INT_TO_REAL(gRecipeActive.iPrintUp) ; // Number of pictures per round of printing cylinder
  CASE g_iFlexoType OF 
    C_iM : ; // Case Metric
      iNmaxTooth := TRUNC(g_rMaxBagSize_Inch*25.4/10.0) ;   
      iNminTooth := TRUNC(g_rMinBagSize_Inch*25.4/10.0) ;
      IF gRecipeActive.bSelFPProd THEN 
        gRecipeActive.Repeat := TRUNC(gRecipeActive.iNumToothGearPrint*10.0)/25.4/rPrintUp ;
      ELSE
        // treatment imperfection calculation of number of tooth otherwise 600mm give 59 tooth instead of 60
        rRepeatMetric := gRecipeActive.Repeat * 25.4 ;
        rRepMet_DecPart := rRepeatMetric - TRUNC(rRepeatMetric) ;
        IF rRepMet_DecPart > 0.5 THEN 
          gRecipeActive.iNumToothGearPrint := TRUNC(rRepeatMetric/10.0) + 1 ;
        ELSE
          gRecipeActive.iNumToothGearPrint := TRUNC(rRepeatMetric/10.0) ;     
        END_IF ;  
      END_IF   
      gRecipeActive.iNumToothGearPrint := LIMIT(iNminTooth,gRecipeActive.iNumToothGearPrint,iNmaxTooth) ;  
    C_i8DP : ; // Case 8DP
      iNmaxTooth := TRUNC(g_rMaxBagSize_Inch/3.14*8.0) ;   
      iNminTooth := TRUNC(g_rMinBagSize_Inch/3.14*8.0) ;
      IF gRecipeActive.bSelFPProd THEN 
        gRecipeActive.Repeat := TRUNC(gRecipeActive.iNumToothGearPrint*PI/8.0*1000.0)/1000.0/rPrintUp ;
      ELSE
        gRecipeActive.iNumToothGearPrint := TRUNC(gRecipeActive.Repeat/3.14*8.0) ;
      END_IF   
      gRecipeActive.iNumToothGearPrint := LIMIT(iNminTooth,gRecipeActive.iNumToothGearPrint,iNmaxTooth) ;  
    C_i10DP : ; // Case 10DP
      iNmaxTooth := TRUNC(g_rMaxBagSize_Inch/3.14*10.0) ;   
      iNminTooth := TRUNC(g_rMinBagSize_Inch/3.14*10.0) ;
      IF gRecipeActive.bSelFPProd THEN 
        gRecipeActive.Repeat := TRUNC(gRecipeActive.iNumToothGearPrint*PI/10.0*1000.0)/1000.0/rPrintUp ;
      ELSE
        gRecipeActive.iNumToothGearPrint := TRUNC(gRecipeActive.Repeat/3.14*10.0) ;
      END_IF   
      gRecipeActive.iNumToothGearPrint := LIMIT(iNminTooth,gRecipeActive.iNumToothGearPrint,iNmaxTooth) ;   
    C_i1_4P : ; // Case 1/4"
      iNmaxTooth := TRUNC(g_rMaxBagSize_Inch*4.0) ;   
      iNminTooth := TRUNC(g_rMinBagSize_Inch*4.0)+1 ; // D.M. 16/11/2011 RS26 BrownPaper_14606 +1 otherwise minimum tube lentgth = 159mm insted of 160mm and it important for the synchro ratio of the Holding Axis lower than tube length 160mm the Holding Axis makes 1/4 round per bag => not correct for RS26 
      IF gRecipeActive.bSelFPProd THEN 
        gRecipeActive.Repeat := TRUNC(gRecipeActive.iNumToothGearPrint/4.0*1000.0)/1000.0/rPrintUp ;
      ELSE
        gRecipeActive.iNumToothGearPrint := TRUNC(gRecipeActive.Repeat*4.0) ;
      END_IF   
      gRecipeActive.iNumToothGearPrint := LIMIT(iNminTooth,gRecipeActive.iNumToothGearPrint,iNmaxTooth) ;
  END_CASE

  
  
  
  
  
  
  
  
// --------------------------------------------------------------------------------------------------  
  // Synchro axis OK
  g_bSynchroAxisOK := ( gA[1].Ind_bSynchroOK  AND 
                        gA[11].Ind_bSynchroOK OR
                        NOT(gPerf_On) )       AND  
                      ( gA[2].Ind_bSynchroOK  OR 
                        NOT(gA[2].bActive) )  AND  
                      gA[3].Ind_bSynchroOK    AND  
                      gA[4].Ind_bSynchroOK    AND  
                      gA[5].Ind_bSynchroOK    AND  
                      gA[6].Ind_bSynchroOK    AND
                      gA[7].Ind_bSynchroOK    AND
                      ( gA[8].Ind_bSynchroOK  OR 
                        NOT(gA[8].bActive) )  AND
                      ( gA[12].Ind_bSynchroOK OR 
                        NOT(gA[12].bInMach) ) AND
                      ( gA[13].Ind_bSynchroOK OR 
                        NOT(gA[13].bInMach) ) AND    
                      1                       ;
  // Synchro axis in progress
  g_bSynchroAxisInProgress := gA[9].Ind_InMotion    AND 
                              NOT(g_bSynchroAxisOK) ;     
  // 
  // Synchro Holding, Tearing and Drum axis 
  g_bIndSynchroHTD_OK := gA[3].Ind_bSynchroOK    AND 
                         gA[4].Ind_bSynchroOK    AND 
                         gA[7].Ind_bSynchroOK    AND 
                         ( gA[12].Ind_bSynchroOK OR 
                           NOT(gA[12].bInMach) ) AND 
                         ( gA[13].Ind_bSynchroOK OR 
                           NOT(gA[13].bInMach) ) ;
                         
                         
                         
                         
                         
                         
                         
 
// --------------------------------------------------------------------------------------------------  
  g_bCycManTimeSetOn := gstCycA[1].CycManTimSet.bSCyc  OR 
                        gstCycA[3].CycManTimSet.bSCyc  OR 
                        gstCycA[4].CycManTimSet.bSCyc  OR 
                        gstCycA[7].CycManTimSet.bSCyc  OR 
                        gstCycA[12].CycManTimSet.bSCyc AND 
                        gA[12].bInMach                 OR 
                        gstCycA[13].CycManTimSet.bSCyc AND 
                        gA[13].bInMach                 OR                        
                        0                              ;
END_PROGRAM
