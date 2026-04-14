(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: HMI_Control
 * File: HMI_ControlCyclic.st
 * Author: pkiel
 * Created: September 17, 2009
 ********************************************************************
 * Implementation of program HMI_Control
 ********************************************************************)

PROGRAM _CYCLIC
//		IF gPowerUp_Complete AND (Count<5) THEN
//			gA[0].ErrorAck := 1;
//			Count := Count + 1;
//		END_IF
		
(* Screen GoTo Control on Main HMI For Main, Setup, & Status Screens *)
	IF (gHMI_GoToMain_PB) THEN
		gScreenControl:=HMI_MainScreenGroup;
		gHMI_GoToMain_PB:=0;
		HMI_ScreenGroup_Ind:=0;
		gHMI_PasswordLevel:=0;
	END_IF;
	IF (gHMI_GoToSetup_PB) THEN
		gScreenControl:=HMI_SetupScreenGroup;
		gHMI_GoToSetup_PB:=0;
		HMI_ScreenGroup_Ind:=1;
		gHMI_PasswordLevel:=0;
	END_IF;
	IF (gHMI_GoToStatus_PB) THEN
		gScreenControl:=20;
		gHMI_GoToStatus_PB:=0;
		HMI_ScreenGroup_Ind:=2;
		gHMI_PasswordLevel:=0;
	END_IF;
	IF (gHMI_GoToAlarm_PB) THEN
		gScreenControl:=30;
		gHMI_GoToAlarm_PB:=0;
		HMI_ScreenGroup_Ind:=4;
		gHMI_PasswordLevel:=0;
	END_IF;
  IF (gHMI_GoToMaint_PB) THEN
    gScreenControl:=HMI_MaintenanceScreenGroup;
    gMaintDropdown := gScreenControl;
    gHMI_GoToMaint_PB:=0;
    HMI_ScreenGroup_Ind:=3;
  END_IF;
  IF (gHMI_GoToHoldTearDrum_PB) THEN
    gScreenControl:=12;
    gHMI_GoToHoldTearDrum_PB:=0;
  END_IF;
	CASE (HMI_ScreenGroup_Ind) OF
		0:
			HMI_MainScreenGroup:=gCurrentScreen;
			HMI_MainScreenGroup:=LIMIT(1,HMI_MainScreenGroup,6);
		1:
			HMI_SetupScreenGroup:=gCurrentScreen;
			HMI_SetupScreenGroup:=LIMIT(10,HMI_SetupScreenGroup,12);
			
		2:
			HMI_StatusScreenGroup:=gCurrentScreen;
			HMI_StatusScreenGroup:=LIMIT(20,HMI_StatusScreenGroup,20);
		3:
			IF (gMaintScreenChange) THEN
				gScreenControl := gMaintDropdown;
				gMaintScreenChange :=0;
			END_IF
			HMI_MaintenanceScreenGroup:=gCurrentScreen;
			HMI_MaintenanceScreenGroup:=LIMIT(40,HMI_MaintenanceScreenGroup,57);
	END_CASE;

(* Transfers for Servo Status Screens *)
	HMI_Status_Ind:=LIMIT(0,HMI_Status_Ind,15);
	IF (gCurrentScreen=20) THEN
			gA[HMI_Status_Ind].ErrorAck			:=	HMI_ErrorAck;
			HMI_ErrorCount				:=	gA[HMI_Status_Ind].ErrorCount;
			HMI_ErrorText				:=	gA[HMI_Status_Ind].ErrorText;
			HMI_Ind_Enabled				:=	gA[HMI_Status_Ind].Ind_Enabled;
			HMI_Ind_InMotion			:=	gA[HMI_Status_Ind].Ind_InMotion;
			HMI_Error					:=	gA[HMI_Status_Ind].Error;
			HMI_ErrorStop				:=	gA[HMI_Status_Ind].ErrorStop;
			HMI_ErrorID					:=	gA[HMI_Status_Ind].ErrorID;
			HMI_Ind_DiscreteMotion		:=	gA[HMI_Status_Ind].Ind_DiscreteMotion;
			HMI_Ind_ContinuousMotion	:=	gA[HMI_Status_Ind].Ind_ContinuousMotion;
			HMI_Ind_SynchronizedMotion	:=	gA[HMI_Status_Ind].Ind_SynchronizedMotion;
			HMI_Ind_NetworkInit			:=	gA[HMI_Status_Ind].Ind_NetworkInit;
			HMI_Ind_ControllerStatus	:=	gA[HMI_Status_Ind].Ind_ControllerStatus;
			HMI_Ind_Homed				:=	gA[HMI_Status_Ind].Ind_Homed;
			HMI_Input_Home				:=	gA[HMI_Status_Ind].Input_Home;
			HMI_Input_DriveEnable		:=	gA[HMI_Status_Ind].Input_DriveEnable;
			HMI_Input_Trigger1			:=	gA[HMI_Status_Ind].Input_Trigger1;
			HMI_Input_Trigger2			:=	gA[HMI_Status_Ind].Input_Trigger2;
			HMI_PositionInch			:=	gA[HMI_Status_Ind].PositionInch;
			HMI_PositionDeg				:=	gA[HMI_Status_Ind].PositionDeg;
			HMI_ActualVelocity			:=	gA[HMI_Status_Ind].ActualVelocity;
	END_IF
	
(*Data Entry Lockout*)
	IF (gA[9].Ind_InMotion) THEN
		DataLock_Motion := 2;
  ELSE 
    DataLock_Motion := 0;
	END_IF
	
// Display curve max speed Perf
  IF HMI_bMaxSpeedPerf_PB THEN 
    HMI_iSelCurvMaxSpeedPerf := gInchMetric_Ind ;
    HMI_uiCurvVisibl := 0 ; // Curve visible 
  ELSE
    HMI_iSelCurvMaxSpeedPerf := 0 ;
    HMI_uiCurvVisibl := 1 ; // Curve unvisible   
  END_IF
  IF (gCurrentScreen <> 11) THEN 
    HMI_bMaxSpeedPerf_PB := 0 ;  
  END_IF
   
   
// Hide Holding Tearing Envelope Bag Offset 
  IF (gCurrentScreen <> 1) THEN 
    HMI_iHTEnvBOffsetVisibl := 1 ;  
  END_IF
   
   
   
// ----------------------------------------------------------------------------------------   
// Picture animation 
 
    // Sychro axis animation 
    IF g_bSynchroAxisInProgress THEN 
      iCountCycl := iCountCycl + 1 ;
      IF (iCountCycl >= 3) THEN      // HMI_Control Task time = 0,1s. Animation => 25 pictures/s => Cycle count >= 2.5 (=>3)
        iCountCycl := 0 ;
        iAnimStep  := iAnimStep + 1 ;
        HMI_iAnimSynchroAxis := iAnimStep ;
        IF (iAnimStep >= 4) THEN 
          iAnimStep := 0 ;
        END_IF
      END_IF
      HMI_iAnimSynchroAxisVisibl := 0 ;    // Visible 
    ELSE
      iCountCycl := 0 ;
      iAnimStep  := 0 ; 
      HMI_iAnimSynchroAxis := 0 ;
      HMI_iAnimSynchroAxisVisibl := 1 ;    // Not visible 
    END_IF
              
    
    // Help view axis config
    IF NOT(HMI_bPBShowEnvBConf) THEN   
      IF HMI_iAnimPictHoldTearEnvB > 2 THEN 
        HMI_iAnimPictHoldTearEnvB := 1 ;
      END_IF
      IF HMI_iAnimPictHoldTearEnvB < 1 THEN 
        HMI_iAnimPictHoldTearEnvB := 2 ;
      END_IF
      HMI_iAnimTubLVisibl := 0 ; // Visible 
      
      CASE HMI_iAnimPictHoldTearEnvB OF
        1 :  
          HMI_iAnimHoldTearEnvB_1 := 1 ;
          HMI_iAnimHoldTearEnvB_2 := 2 ;
          HMI_rTubLInf_1 := g_rMinBagSize_RS26_mm/25.4 ;
          HMI_rTubLSup_1 := gr_rBagSize4_2Pliers_mm/25.4 ;
          HMI_rTubLInf_2 := gr_rBagSize4_2Pliers_mm/25.4 ;
          HMI_rTubLSup_2 := gr_rEnvBSizeTear2_1_mm/25.4 ;
          HMI_iNumbPliers_1 := 4 ;
          HMI_iNumbPliers_2 := 2 ;
          HMI_iAnimPict2Visibl := 0 ; 
        2 :
          HMI_iAnimHoldTearEnvB_1 := 3 ;
          HMI_iAnimHoldTearEnvB_2 := 0 ;
          HMI_rTubLInf_1 := gr_rEnvBSizeTear2_1_mm/25.4 ;
          HMI_rTubLSup_1 := g_rMaxBagSize_RS26_mm/25.4 ;
          HMI_rTubLInf_2 := 0.0 ;
          HMI_rTubLSup_2 := 0.0 ;
          HMI_iNumbPliers_1 := 2 ;
          HMI_iNumbPliers_2 := 0 ;
          HMI_iAnimPict2Visibl := 1 ; // Hide
      END_CASE  
      rPosHoldEnvB := gr_rPosEnvBHoldBag + 45.0 ;
      HMI_rPosHoldEnvB := H_FC_Modulus (
                               IN_rMod := 360.0 ,
                               IN_rVar := rPosHoldEnvB
                                       ) ;   
    ELSE  
      HMI_iAnimTubLVisibl     := 1 ; // Hide
      HMI_iAnimHoldTearEnvB_1 := 4 ;
      HMI_iAnimHoldTearEnvB_2 := 5 ;
      HMI_rTubLInf_1 := g_rMinBagSize_EnvB_mm/25.4 ;
      HMI_rTubLSup_1 := gr_rBagSize1_2Hold_mm/25.4 ;
      HMI_rTubLInf_2 := gr_rBagSize1_2Hold_mm/25.4 ;
      HMI_rTubLSup_2 := g_rMaxBagSize_EnvB_mm/25.4 ;
      HMI_iNumbPliers_1 := 2 ;
      HMI_iNumbPliers_2 := 2 ;
      HMI_iAnimPict2Visibl := 0 ;    
      HMI_rPosHoldEnvB := gr_rPosEnvBHoldBag ;   
    END_IF












   
END_PROGRAM
