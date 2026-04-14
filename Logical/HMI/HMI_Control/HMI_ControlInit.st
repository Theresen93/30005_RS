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

END_PROGRAM

