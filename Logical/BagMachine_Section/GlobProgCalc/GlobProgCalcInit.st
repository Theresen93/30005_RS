(********************************************************************
 * COPYRIGHT -- .
 ********************************************************************
 * Program: GlobProgCalc
 * File: GlobProgCalcInit.st
 * Author: dominique
 * Created: October 27, 2011
 ********************************************************************
 * Implementation of program GlobProgCalc
 ********************************************************************)

PROGRAM _INIT

    // Init g_rNumbPliers because used in division 
    rRepeatMetric := gRecipeActive.Repeat*25.4;
    IF (rRepeatMetric > gr_rBagSize4_2Pliers_mm) THEN  
      g_rNumbPliers := 2.0 ;
    ELSE 
      g_rNumbPliers := 4.0 ;
    END_IF ;
  
  // Bag size limite
  g_rMaxBagSize_RS15_mm := 400.0 ; 
  g_rMinBagSize_RS15_mm := 105.0 ; 
  g_rMaxBagSize_RS26_mm := 760.0 ; 
  g_rMinBagSize_RS26_mm := 160.0 ;
  g_rMaxBagSize_EnvB_mm := 760.0 ;
  g_rMinBagSize_EnvB_mm := 240.0 ; 
  
// -----------------------------------------------------------------------------
    // Machine devices activation  RS15_RX_30005
    
    // Machie Type
    g_iMachType := C_iRS15 ;
    
    // Glue RS
    gRecipeActive.bSelTypeRSGlue := 0 ; // D.M. 22/08/2012 Only Cold Glue for this machine RS15_RX_30005
  
    // Unwinder
    g_bUnwindInMach := 1 ;
    g_bUnwindEndRelPapInMach := 1 ;
    g_bUnwindEndRelPolyInMach := 0 ;
    
    // 3Web unit
    g_b3WebUnitInMach := 0 ;  
    
    // FP_Dryer unit  
    g_bDryerInMach   := 1 ;
    g_bHeatDryInMach := 1 ;

    // Flexo Press in machine 
    gA[2].bInMach := 1 ;

    // Cold Micro Perf in machine 
    gA[8].bInMach := 0 ;

    // Envelope Bag in machine 
    gA[12].bInMach := 0 ;
    gA[13].bInMach := 0 ;
   
    // Hot Micro Perf in machine 
    gA[15].bInMach := 0 ;
   
   
   
   
   
   
   
   

END_PROGRAM

