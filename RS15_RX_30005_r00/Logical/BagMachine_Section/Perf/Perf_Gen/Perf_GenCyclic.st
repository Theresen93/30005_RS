(********************************************************************
 * COPYRIGHT -- Microsoft
 ********************************************************************
 * Program: Perf_Gen
 * File: Perf_GenCyclic.st
 * Author: pkiel
 * Created: July 19, 2011
 ********************************************************************
 * Implementation of program Perf_Gen
 ********************************************************************)

PROGRAM _CYCLIC

(* Perf Off/On From HMI *)
	HGW_2StatePB_0.PB := EDGEPOS(Perf_PB AND NOT gA[9].Ind_InMotion);
	PerfText_Ind := HGW_2StatePB_0.Text_Ind;
	PerfColor_Ind := HGW_2StatePB_0.Color_Ind;
	gPerf_On := HGW_2StatePB_0.State1;
	HGW_2StatePB_0();
  
  IF gPerf_ParkRequired THEN 
    H_FB_Flash_0(IN_bEnable:=1, IN_rNumFlashPerSec:=1.0) ;
    IF H_FB_Flash_0.OUT_bFlash THEN 
      PerfColor_Ind := gBlue + gWhite * 256 ;
    ELSE
      PerfColor_Ind := gGreen + gBlack * 256 ;
    END_IF
  ELSE     
    H_FB_Flash_0(IN_bEnable:=0, IN_rNumFlashPerSec:=1.0) ;
  END_IF
  
(* Is Perf Park Required *)
	IF (EDGENEG(gPerf_On) AND NOT InParkPosition) THEN
		gPerf_ParkRequired :=1;
	END_IF
	IF (EDGEPOS(gPerf_On)) THEN
		gPerf_ParkRequired :=0;
	END_IF

(* Perf In Park Position *)
  rTempPosA1_Deg := H_FC_Modulus(IN_rMod:=360/gSP_PerfKnifeCount, IN_rVar:=gA[1].PositionDeg) ;
	IF (rTempPosA1_Deg>(gSP_A[1].ParkPosition-2.0)) AND (rTempPosA1_Deg<(gSP_A[1].ParkPosition+2.0)) THEN
		InParkPosition := 1;
	ELSE
		InParkPosition := 0;
	END_IF
	TON_0(IN := InParkPosition, PT := T#2s);
	IF(InParkPosition AND TON_0.Q AND NOT gPerf_On) THEN
		gPerf_ParkRequired := 0;
  END_IF
  
  // Limit IHM Perf Set Up values
  // Envelope Bag Perf
  g_rSizeEnvBPerf_mm        := LIMIT(g_rMaxBagSize_EnvB_mm/25.4,gRecipeActive.rEnvB_PerfSize_in,g_rMinBagSize_EnvB_mm/25.4) ;
  gSP_EnvBPerf.HomeOffset   := LIMIT(0.0,gSP_EnvBPerf.HomeOffset,360.0) ;
  gSP_EnvBPerf.MatchedSpeed := LIMIT(0.0,gSP_EnvBPerf.MatchedSpeed,360.0) ;
  gSP_EnvBPerf.ParkPosition := LIMIT(0.0,gSP_EnvBPerf.ParkPosition,360.0) ;
  // Standard Perf 
  gSP_StandPerf.HomeOffset   := LIMIT(0.0,gSP_StandPerf.HomeOffset,360.0) ;
  gSP_StandPerf.MatchedSpeed := LIMIT(0.0,gSP_StandPerf.MatchedSpeed,360.0) ;
  gSP_StandPerf.ParkPosition := LIMIT(0.0,gSP_StandPerf.ParkPosition,360.0) ;

(* Theoretical Perimeter...Large Cylinder = 400mm (15.748") , Small Cylinder = 270mm (10.630") *)
	RepeatMetric := REAL_TO_INT(gRecipeActive.Repeat*25.4);
  IF g_rSizeSPerf_mm > 0.0 AND 
     g_rSizeLPerf_mm > 0.0 THEN  
     
    IF NOT(gRecipeActive.bSelEnvBProd) THEN  
    	IF (gSP_PerfCylSelect=0) THEN  (* Small Cylinder *)
        g_rActualSizePerf_in := g_rSizeSPerf_mm/25.4 ;
        g_iPerfType := 0 ;
    		IF (RepeatMetric<=g_rBagSize1to2SPerf_mm) THEN
    			gSP_PerfKnifeCount     := 2;
    			SecondKnife_Visibility := 0;
    		ELSE
    			gSP_PerfKnifeCount     := 1;
    			SecondKnife_Visibility := 1;
    		END_IF
    	ELSE  (* Large Cylinder *)
        g_rActualSizePerf_in := g_rSizeLPerf_mm/25.4 ;
        g_iPerfType := 1 ;
    		IF (RepeatMetric<=g_rBagSize1to2LPerf_mm) THEN
    			gSP_PerfKnifeCount := 2;
    			SecondKnife_Visibility := 0;
    		ELSE
    			gSP_PerfKnifeCount     := 1;
    			SecondKnife_Visibility := 1;
    		END_IF
      END_IF    
      
      // Perf Set Up
      gSP_StandPerf.HomeOffset   := 90.0 + gSP_StandPerf.rZoneBefPerf_in/g_rActualSizePerf_in * 360.0 ; // D.M. Le 10/01/2012 Pyrollpack_14661   Because operator is able to change the size of the Perf => Easier for operator to set automatically these values 
      gSP_StandPerf.ParkPosition := gSP_StandPerf.HomeOffset ;
      gSP_A[1].HomeOffset        := gSP_StandPerf.HomeOffset ;    
      gSP_A[1].ParkPosition      := gSP_StandPerf.ParkPosition ;    
      gSP_A[1].MatchedSpeed      := (gSP_StandPerf.rZoneBefPerf_in+gSP_StandPerf.rZoneAftPerf_in)/g_rActualSizePerf_in * 360.0 ;
    ELSE   // Case Envelope Bag
      g_rActualSizePerf_in := gRecipeActive.rEnvB_PerfSize_in ;
      gSP_PerfKnifeCount     := 1;  // Always 1 knife only
      SecondKnife_Visibility := 1;    
      g_iPerfType := 2 ;
    
      // Perf Set Up
      gSP_EnvBPerf.HomeOffset   := 90.0 + gSP_EnvBPerf.rZoneBefPerf_in/g_rActualSizePerf_in * 360.0 ; // D.M. Le 10/01/2012 Pyrollpack_14661   Because operator is able to change the size of the Perf => Easier for operator to set automatically these values 
      gSP_EnvBPerf.ParkPosition := gSP_EnvBPerf.HomeOffset ;
      gSP_A[1].HomeOffset       := gSP_EnvBPerf.HomeOffset ;
      gSP_A[1].ParkPosition     := gSP_EnvBPerf.ParkPosition ;
      gSP_A[1].MatchedSpeed     := (gSP_EnvBPerf.rZoneBefPerf_in+gSP_EnvBPerf.rZoneAftPerf_in)/g_rActualSizePerf_in * 360.0 ;
    END_IF   
  END_IF
    
  gA[1].UnitsPerInch := gA[1].AxisPeriod/g_rActualSizePerf_in ; 
  gA[1].InchPerDeg   := g_rActualSizePerf_in / 360 ;
       
      
  // Perf Set Up visibility 
  IF (g_iPerfType <= 1) THEN 
    HMI_iEnvBPerfSetUpVisible := 1 ;  // Envelope Bag unvisible 
    HMI_iPerfSetUpVisible     := 0 ;  // Standard Bag visible 
  ELSE  
    HMI_iEnvBPerfSetUpVisible := 0 ;  // Envelope Bag visible 
    HMI_iPerfSetUpVisible     := 1 ;  // Standard Bag unvisible 
  END_IF
  
  
END_PROGRAM
