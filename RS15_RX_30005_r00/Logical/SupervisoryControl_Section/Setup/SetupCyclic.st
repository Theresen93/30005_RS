(********************************************************************
 * COPYRIGHT -- Microsoft
 ********************************************************************
 * Program: Setup
 * File: SetupCyclic.st
 * Author: pkiel
 * Created: July 20, 2011
 ********************************************************************
 * Implementation of program Setup
 ********************************************************************)

PROGRAM _CYCLIC

(* Setup Mode Off/On From HMI *)
	HGW_2StatePB_0.PB := EDGEPOS(SetupMode_PB AND gSetupPermissive);
	SetupModeText_Ind := HGW_2StatePB_0.Text_Ind;
	SetupModeColor_Ind := HGW_2StatePB_0.Color_Ind;
	gSetupMode_On := HGW_2StatePB_0.State1;
	HGW_2StatePB_0();

(* Setup Mode Permissive...Line Speed Must Be <= 10mpm (32.808 fpm) *)
	IF (gActualMachineSpeed_FPM<=32.808) THEN
		gSetupPermissive := 1;
	ELSE
		gSetupPermissive := 0;
	END_IF

(* Setup Mode Guard Bypass Control *)
	IF (gSetupMode_On) THEN
		gQ_CR_GuardBypass := 1;
	ELSE
		gQ_CR_GuardBypass := 0;
	END_IF

// General constants assignment
  // ----------------------------------------
  g_rSizeLPerf_mm         := 400.0 ; // Perimeter of the large Perf, in mm
  g_rSizeSPerf_mm         := 270.0 ; // Perimeter of the small Perf, in mm
  g_rSizeEntryPullRol_mm  := 400.0 ; // Perimeter of the entry pull roll, in mm
  g_rSizeExitPullRol_mm   := 320.0;  // Perimeter of the exit pull roll, in mm
  g_rSizeDrum_mm          := 1680.0; // Perimeter of the Drum, in mm
  g_rZGearRepFP_M         := 40.0 ;  // Tooth number of the gear on the Flexo Press in case Metric
  g_rZGearRepFP_8DP       := 40.0 ;  // Tooth number of the gear on the Flexo Press in case 8DP
  g_rZGearRepFP_10DP      := 50.0 ;  // Tooth number of the gear on the Flexo Press in case 10DP
  g_rZGearRepFP_1_4P      := 65.0 ;  // Tooth number OF the gear on the Flexo Press in CASE 1/4"
  g_rZGearCMPerf_M        := 50.0 ;  // Tooth number of the gear on the shaft which drive the Cold Micro Perf Tool in case Metric
  g_rZGearCMPerf_8DP      := 50.0 ;  // Tooth number of the gear on the shaft which drive the Cold Micro Perf Tool in case 8DP
  g_rZGearCMPerf_10DP     := 63.0 ;  // Tooth number of the gear on the shaft which drive the Cold Micro Perf Tool in case 10DP
  g_rZGearCMPerf_1_4P     := 81.0 ;  // Tooth number of the gear on the shaft which drive the Cold Micro Perf Tool in case 1/4"
    
  // General parameter init
  gr_rMachMaxSpeed_BPM := 1000.0 ;  
  
  gr_rPosHoldBag := gr_rPosHoldBag ; 
  gr_rPosTearBag := gr_rPosTearBag ;     
  gr_rPosGripBag := gr_rPosGripBag ;
  
  gr_rPosEnvBHoldBag   := gr_rPosEnvBHoldBag ;
  gr_rPosTearEBTearBag := gr_rPosTearEBTearBag ;
    
  // ----------------------------------------
  // Cycles
  // Manual timing setting 
  g_rCycManTimSetOverrideAcc := 0.5 ;
  
END_PROGRAM
