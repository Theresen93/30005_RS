(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: HMI_Control
 * File: HMI_ControlInit.st
 * Author: pkiel
 * Created: September 17, 2009
 ********************************************************************
 * Implementation of program HMI_Control
 ********************************************************************)

PROGRAM _INIT

	HMI_MainScreenGroup:=1;
	HMI_SetupScreenGroup:=10;
	HMI_StatusScreenGroup:=20;
	HMI_MaintenanceScreenGroup:=40;
	HMI_AlarmInputStatus:=HMI_AlarmInputStatus;
  HMI_uiCurvVisibl := 1 ;    
  HMI_uiNeverVisibl := 1 ;
  
  // Unwinder
  HMI_strMP_UNW_HydroPump    := '21Q1' ;
  // Flexo Press
  HMI_strMP_FP_MotorFan      := '73Q2' ;
  HMI_strMP_FP_SlowRot1      := '27Q1' ;
  HMI_strMP_FP_SlowRot2      := '27Q2' ;
  HMI_strMP_FP_SlowRot3      := '27Q3' ;
  HMI_strMP_FP_SlowRot4      := '27Q4' ;
  HMI_strMP_FP_SlowRot5      := '28Q1' ;
  HMI_strMP_FP_SlowRot6      := '28Q2' ;
  // Bag Machine 
  HMI_strMP_GlueSlowRotation := '19Q1' ;
  HMI_strMP_PerfFan          := '73Q4' ;
  HMI_strMP_Vacuum           := '14Q1' ; 
  // 3-Web unit
  HMI_strMP_3W_MotorFan      := '36Q1' ;
  // Dryer 
  HMI_strMP_DRY_Blower       := '31Q1 OR 31Q2' ;
  HMI_strMP_DRY_Heater       := '3Q5' ;
  HMI_strSS_DRY_Thermostat   := '79F1' ;
  // Cold Micro Perf Waste suction  
  HMI_strMP_CMP_WasteSuc     := '15Q2' ;
  // Envelope Bag Waste Suction 
  HMI_strMP_EB_WasteSuc      := '36Q1' ;
  
  HMI_iAnimSynchroAxisVisibl := 1 ;
  g_bSplashDone := 0 ;
  
  HMI_iHTEnvBOffsetVisibl := 1 ;
  
	// Initialize Default Gateway...RS26 Pyrollpack_14661 IP Config IP Adresse  : 10.0.1.67 
  //                                                               Gateway    : 10.0.1.1
  //                                                               SubNetMask : 255.255.255.0
	CfgSetDefaultGateway_0(enable := 1 , pDevice := ADR('IF5'), pGateway := ADR('10.0.1.1'), Option := 1);
	
	// Make Sure Values Are Initialized
	g_rBagSize1to2SPerf_mm		:= 190.0;
	g_rBagSize1to2LPerf_mm		:= 260.0;
	g_rLinSpeedMin_mmin			:= 10.0;
	g_rMaxSpeedMin_bpm			:= 35.0;
	g_rMaxSpeedSynchro_bpm		:= 8.0;
	g_rMaxJogDecel_bpmm			:= 1200.0;
	g_rLinSpeedSP_AccRS26		:= 600.0;
	g_rLinSpeedSP_DecRS26		:= 600.0;
	g_rLinSpeedSP_JogDecRS26	:= 2500.0;
	g_rLinSpeedSP_EStopDecRS26	:= 6000.0;
	g_rLinSpeedSP_GuardFaultDecRS26 := 4500.0;
	g_rLinSpeedSP_WebBreakDecRS26 := 5200.0;
	g_rLinSpeedSP_GenFaultDecRS26 := 3000.0;
	g_rLinSpeedSP_FStopDecRS26	:= 1800.0;
	g_rLinSpeedSP_AccRS15		:= 33.3;
	g_rLinSpeedSP_DecRS15		:= 33.3;
	g_rLinSpeedSP_JogDecRS15	:= 140.0;
	g_rLinSpeedSP_EStopDecRS15	:= 333.0;
	g_rLinSpeedSP_GuardFaultDecRS15 := 250.0;
	g_rLinSpeedSP_WebBreakDecRS15 := 250.0;
	g_rLinSpeedSP_GenFaultDecRS15 := 167.0;
	g_rLinSpeedSP_FStopDecRS15	:= 100.0;
	g_rSizeEntryPullRol_mm		:= 400.0;
	g_rSizeExitPullRol_mm		:= 320.0;
	g_rSizeLPerf_mm				:= 400.0;
	g_rSizeSPerf_mm				:= 270.0;
	g_rSizeDrum_mm				:= 1680.0;
	g_rZGearRepFP_M				:= 40.0;
	g_rZGearRepFP_8DP			:= 40.0;
	g_rZGearRepFP_10DP			:= 50.0;
	g_rZGearRepFP_1_4P			:= 65.0;
	g_rZGearCMPerf_M			:= 50.0;
	g_rZGearCMPerf_8DP			:= 50.0;
	g_rZGearCMPerf_10DP			:= 63.0;
	g_rZGearCMPerf_1_4P			:= 81.0;
	g_rMaxBagSize_RS15_mm		:= 400.0;
	g_rMinBagSize_RS15_mm		:= 105.0;
	g_rMaxBagSize_RS26_mm		:= 760.0;
	g_rMinBagSize_RS26_mm		:= 160.0;
	g_rMaxBagSize_EnvB_mm		:= 760.0;
	g_rMinBagSize_EnvB_mm		:= 240.0;
	g_rSizeEnvBPerf_mm			:= 520.0;
	gr_rMachMaxSpeed_BPM		:= 1000.0;
	gr_rHoldAxContactZone		:= 22.0;
	gr_rTearAxContactZone		:= 52.0;
	gr_rDrumAxContactZone		:= 50.0;
	gr_rEnvBAxContactZone		:= 26.0;
	gr_rTearEBAxContactZone		:= 52.0;
	gr_rPosHoldBag				:= 11.0;
	gr_rPosTearBag				:= 26.0;
	gr_rPosGripBag				:= 25.0;
	gr_rPosEnvBHoldBag			:= 355.0;
	gr_rPosTearEBTearBag		:= 18.0;
	gr_rAxisTimSet_SP_Vel		:= 12.0;
	gr_rAxisTimSet_SP_Acc		:= 1200.0;
	gr_rAxisTimSet_SP_Dec		:= 3000.0;
	gr_rMaxRangeWebDraw			:= 1.0;
	gr_rLimOffsetRunVal			:= 0.1;
	gr_rIncrOffsetAxeRun		:= 1.0;
	gr_tJogHornDur				:= T#1s;
	gr_tRunHornDur				:= T#1500ms;
	gr_rMaxLSFlexoP_mmin		:= 300.0;
	gr_rDistPerfTearEnvBOn_mm	:= 4560.0;
	gr_rDistPerfTearEnvBOff4_mm := 4260.0;
	gr_rDistPerfTearEnvBOff2_mm	:= 4560.0;
	gr_rSizeEnvBLowRol_mm		:= 440.0;
	gr_rTearCarStep_mm			:= 413.0;
	gr_rDistPerfTearRS26_mm		:= 3800.0;
	gr_rDistPerfTearRS15_mm		:= 3700.0;
	gr_rIncrShiftPerf_mm		:= 1.0;
	gr_rBagSize2_4Hold_mm		:= 160.0;
	gr_rBagSize1_2Hold_mm		:= 320.0;
	gr_rBagSize4_2Pliers_mm		:= 400.0;
	gr_rEnvBSizeTear2_1_mm		:= 500.0;
	gr_rHMPerfSlowRot_rpm		:= 2.0;
	gr_rHMPerfAcc_rpm2			:= 120.0;
	gr_rHMPerfDec_rpm2			:= 5000.0;
	gr_rHMPerfSlowRot_rpm		:= 2.0;
	gr_rHMPerfAcc_rpm2			:= 120.0;
	gr_rHMPerfDec_rpm2 			:= 5000.0;
	gr_rHMPerfSLActTool_mmin	:= 20;

	

END_PROGRAM

