(********************************************************************
 * COPYRIGHT -- Microsoft
 ********************************************************************
 * Program: A9_Basic
 * File: A9_BasicCyclic.st
 * Author: pkiel
 * Created: July 12, 2011
 ********************************************************************
 * Implementation of program A9_Basic
 ********************************************************************)

PROGRAM _CYCLIC
      
	gA[9].UnitsPerInch := gA[9].AxisPeriod/gRecipeActive.Repeat;

	IF (gA[9].Ident<>0) THEN

	(************************ READ DRIVE STATUS *************************)
	(* Access to the following bools:
	gA[x]_DriveStatus.Simulation			: If TRUE, simulation mode is active
	gA[x]_DriveStatus.NetworkInit			: If TRUE, the network is initialized
	gA[x]_DriveStatus.HomeSwitch			: If TRUE, the digital reference switch input is active
	gA[x]_DriveStatus.PosHWSwitch			: If TRUE, the positive hardware end switch is active
	gA[x]_DriveStatus.NegHWSwitch			: If TRUE, the negative hardware end switch is active
	gA[x]_DriveStatus.Trigger1				: If TRUE, the first trigger input is active
	gA[x]_DriveStatus.Trigger2				: If TRUE, the second trigger input is active
	gA[x]_DriveStatus.DriveEnable			: If TRUE, the enable input is active
	gA[x]_DriveStatus.ControllerReady		: If TRUE, the controller is ready to beturned on
	gA[x]_DriveStatus.ControllerStatus		: If TRUE, the controller is turned on (Same as MC_Power.Status)
	gA[x]_DriveStatus.AxisError				: If TRUE, at least one error has occurred (not acknowledged)
	gA[x]_DriveStatus.LagWarning			: If TRUE, the lag error has exceeded the limit value specified for a warning*)
		MC_BR_ReadDriveStatus_0.Enable := 1;
		MC_BR_ReadDriveStatus_0.Axis := gA[9].Ident;
		MC_BR_ReadDriveStatus_0.AdrDriveStatus := ADR (DriveStatus);
		MC_BR_ReadDriveStatus_0();
		gA[9].Ind_Simulation		:=	DriveStatus.Simulation;
		gA[9].Ind_NetworkInit		:=	DriveStatus.NetworkInit;
		gA[9].Input_Home			:=	DriveStatus.HomeSwitch;
		gA[9].Input_PosHW			:=	DriveStatus.PosHWSwitch;
		gA[9].Input_NegHW			:=	DriveStatus.NegHWSwitch;
		gA[9].Input_Trigger1		:=	DriveStatus.Trigger1;
		gA[9].Input_Trigger2		:=	DriveStatus.Trigger2;
		gA[9].Input_DriveEnable		:=	DriveStatus.DriveEnable;
		gA[9].Ind_ControllerReady	:=	DriveStatus.ControllerReady;
		gA[9].Ind_ControllerStatus	:=	DriveStatus.ControllerStatus;
		gA[9].Error					:=	DriveStatus.AxisError;
		gA[9].Ind_LagWarning		:=	DriveStatus.LagWarning;

	(************************ READ AXIS ERROR **********************)
		MC_ReadAxisError_0.Enable := gA[9].Ind_NetworkInit;
		MC_ReadAxisError_0.Axis := gA[9].Ident;
		MC_ReadAxisError_0.DataAddress := ADR(gA[9].ErrorText);
		MC_ReadAxisError_0.DataLength := SIZEOF(gA[9].ErrorText);
		MC_ReadAxisError_0.DataObjectName := 'Error_Eng';
		MC_ReadAxisError_0();
		IF(MC_ReadAxisError_0.Valid) THEN
			gA[9].ErrorID := MC_ReadAxisError_0.AxisErrorID;
			gA[9].ErrorCount := MC_ReadAxisError_0.AxisErrorCount;
		END_IF
	(* Auto Acknowledge Errors *)
		IF (gA[9].Cmd_Reset AND (gA[9].ErrorCount<>0) AND NOT AutoAck) THEN
			AutoAck:=1;
		ELSE
			AutoAck:=0;
		END_IF
	(*Axis Error Acknowledge*)
		IF (EDGEPOS(AutoAck) OR EDGEPOS(gA[9].ErrorAck)) THEN
			MC_ReadAxisError_0.Acknowledge := 1;
		ELSE;
			MC_ReadAxisError_0.Acknowledge :=0;
		END_IF

	(************************ RESET AXIS ERROR **********************)
		IF (gA[9].Cmd_Reset AND (gA[9].ErrorCount=0) AND gA[9].ErrorStop) THEN
			MC_Reset_0.Execute:=1;
		END_IF
		IF (MC_Reset_0.Done) THEN
			MC_Reset_0.Execute:=0;
			gA[9].Cmd_Reset:=0;
			ResetError := 0;
		END_IF
		IF (MC_Reset_0.Error) THEN
			MC_Reset_0.Execute:=0;
			gA[9].Cmd_Reset:=0;
			ResetError := 1;
		END_IF
		MC_Reset_0.Axis:=gA[9].Ident;
		MC_Reset_0();

	(************************ READ AXIS STATUS *************************)
		MC_ReadStatus_0.Enable := gA[9].Ind_NetworkInit;
		MC_ReadStatus_0.Axis := gA[9].Ident;
		MC_ReadStatus_0();
		IF(MC_ReadStatus_0.Valid = TRUE)THEN
			gA[9].Ind_Enabled 			:= NOT (MC_ReadStatus_0.Disabled);
			gA[9].Ind_StandStill		:= MC_ReadStatus_0.StandStill;
			gA[9].Ind_Stopping			:= MC_ReadStatus_0.Stopping;
			gA[9].Ind_DiscreteMotion	:= MC_ReadStatus_0.DiscreteMotion;
			gA[9].Ind_ContinuousMotion	:= MC_ReadStatus_0.ContinuousMotion;
			gA[9].Ind_SynchronizedMotion:= MC_ReadStatus_0.SynchronizedMotion;
			gA[9].ErrorStop				:= MC_ReadStatus_0.Errorstop;
		END_IF

	(******************** INIT POSITION MODULUS  *********************)
		MC_BR_InitModPos_0.Execute:= InitModPosition;
		MC_BR_InitModPos_0.Axis:= gA[9].Ident;
		MC_BR_InitModPos_0.Period:= REAL_TO_UDINT(gA[9].AxisPeriod);
		MC_BR_InitModPos_0.Factor:=1;
		InitModPos_Done:=MC_BR_InitModPos_0.Done;
		MC_BR_InitModPos_0();
	
	(******************** INIT ENDLESS POSITION *********************)
		MC_BR_InitEndlessPosition_0.Execute:= InitModPos_Done;
		MC_BR_InitEndlessPosition_0.Axis:= gA[9].Ident;
		MC_BR_InitEndlessPosition_0.DataAddress:= ADR(gEndPosData[9]);
		IF (MC_BR_InitEndlessPosition_0.Done) THEN
			InitModPosition:=0;
			InitEndlessPosition:=0;
			HomeRestore:=1;
		END_IF
		MC_BR_InitEndlessPosition_0();
    stTON_0(IN:=HomeRestore, PT:=T#5s) ;

	(************************ HOME AXIS FIRST POWER UP **********************)
		IF (HomeRestore AND NOT gA9_FirstHomed) AND
       stTON_0.Q                            AND  
       ( gA[9].Ind_StandStill               OR 
         NOT(gA[9].Ind_Enabled ) )          THEN
			MC_Home_0.Execute:= 1 ;
		END_IF
		MC_Home_0.Axis:=gA[9].Ident;
		MC_Home_0.Position:=0;
		MC_Home_0.HomingMode:=mcHOME_DIRECT;
		IF (MC_Home_0.Done) THEN
			MC_Home_0.Execute:=0;
			gA9_FirstHomed:=1;
		END_IF
		MC_Home_0();
    stTON_1(IN:=gA9_FirstHomed, PT:=T#5s) ;

	(************************ HOME AXIS **********************)
    IF (gA9_FirstHomed AND stTON_1.Q) AND
       ( gA[9].Ind_StandStill         OR 
         NOT(gA[9].Ind_Enabled ) )    THEN
      MC_Home_1.Execute:=HomeRestore ; 
		END_IF
		MC_Home_1.Axis:=gA[9].Ident;
		MC_Home_1.Position:=0;
		MC_Home_1.HomingMode:=mcHOME_RESTORE_POS;
		IF (MC_Home_1.Done) THEN
			gA[9].Ind_Homed:=1;
			HomeRestore:=0;
		END_IF
		MC_Home_1();

	(******************** READ ACTUAL POSITION *********************)
		MC_ReadActualPosition_0.Enable:= gA[9].Ind_NetworkInit;
		MC_ReadActualPosition_0.Axis:= gA[9].Ident;
		MC_ReadActualPosition_0();
		IF(MC_ReadActualPosition_0.Valid = TRUE)THEN
			gA[9].PositionCount := MC_ReadActualPosition_0.Position;
			gA[9].PositionInch := gA[9].PositionCount/gA[9].UnitsPerInch;
			gA[9].PositionDeg := gA[9].PositionCount/gA[9].UnitsPerDeg;
		END_IF

	(******************** READ ACTUAL VELOCITY *********************)
		IF(MC_ReadActualVelocity_0.Error=TRUE) THEN
			MC_ReadActualVelocity_0.Enable:= 0;
		ELSE
			MC_ReadActualVelocity_0.Enable:= 1;
		END_IF
		MC_ReadActualVelocity_0.Axis:= gA[9].Ident;
		MC_ReadActualVelocity_0();
		IF(MC_ReadActualVelocity_0.Valid = TRUE)THEN
			gA[9].ActualVelocity := MC_ReadActualVelocity_0.Velocity*60/gA[9].SP_MotorPPR;
			IF (gA[9].ActualVelocity>1) THEN
				gA[9].Ind_InMotion:=1;
			ELSE
				gA[9].Ind_InMotion:=0;
			END_IF
		END_IF
		
		gActualMachineSpeed_BPM := MC_ReadActualVelocity_0.Velocity*60/gA[9].AxisPeriod;
		gActualMachineSpeed_FPM := gActualMachineSpeed_BPM*gRecipeActive.Repeat/12.0;

	(************************ AXIS VELOCITY MOVE **********************)
    
		MC_MoveVelocity_0.Axis:=gA[9].Ident;
		MC_MoveVelocity_0.Velocity:=gA[9].SP_Velocity*gA[9].AxisPeriod/60;
		MC_MoveVelocity_0.Acceleration:=gA[9].SP_Accel;
		MC_MoveVelocity_0.Deceleration:=gA[9].SP_Decel;
		MC_MoveVelocity_0.Direction:=mcPOSITIVE_DIR;
		IF ((EDGEPOS(gA[9].Cmd_ContinuousMotion)) OR (EDGEPOS(gA[9].Cmd_ContinuousMotionUpdate))) THEN
      MC_MoveVelocity_0.Execute:=1;
    ELSE
      MC_MoveVelocity_0.Execute := 0 ;
    END_IF;
		MC_MoveVelocity_0();


  (************************ AXIS HALT **********************)
    bAxisStop := NOT(gI_SafetyRelay_EStopOK)       OR 
                 NOT(gGuardAlarmsOK)               OR 
                 NOT(gBagMachine_WebBreakOK)       OR 
                 gJog_Stop                         OR 
                 NOT(gGeneralFaults_OK)            OR 
                 NOT(gFastStop_OK)                 OR 
                 ((gA[9].Ind_InMotion              OR 
                   gA[9].Ind_ContinuousMotion)     AND
                  NOT(gA[9].Cmd_ContinuousMotion)  AND
                  NOT(gNormalStopReq))             ;     
                                                                                               
    MC_Halt_0.Axis:=gA[9].Ident;                                                               
    MC_Stop_0.Axis:=gA[9].Ident;        
    IF bAxisStop                    AND
       ( gA[9].Ind_ContinuousMotion OR
         gA[9].Ind_DiscreteMotion ) THEN
        IF (NOT gI_SafetyRelay_EStopOK) THEN 
          rDecelStop := gA[9].SP_EStopDecel ;
          MC_Stop_0.Deceleration := rDecelStop ; 
          MC_Stop_0.Execute := 1 ; 
          g_bIndStopFault := 1 ;
        ELSIF (NOT gGuardAlarmsOK) THEN
          rDecelStop:=gA[9].SP_GuardFaultDecel;
          g_bIndStopFault := 1 ;
        ELSIF (NOT gBagMachine_WebBreakOK) THEN
          rDecelStop:=gA[9].SP_WebBreakDecel;
          g_bIndStopFault := 1 ;
        ELSIF (NOT gGeneralFaults_OK) THEN
          rDecelStop:=gA[9].SP_GenFaultDecel;
          g_bIndStopFault := 1 ;
        ELSIF gJog_ToZeroSpeed THEN
          rDecelStop:=gA[9].SP_JogDecel;
        ELSIF (NOT gFastStop_OK) THEN
          rDecelStop:=gA[9].SP_FStopDecel;
        ELSE
          rDecelStop:=gA[9].SP_Decel;
        END_IF
      IF ( rDecelStop > rMemoDecelStop ) OR 
         NOT(MC_Halt_0.Busy)             THEN  
        IF MC_Halt_0.Busy THEN 
          MC_Halt_0.Execute := 0 ; 
          MC_Halt_0(); 
        END_IF  
        MC_Halt_0.Execute := 1 ; 
        MC_Halt_0.Deceleration := rDecelStop ;
        rMemoDecelStop := rDecelStop ;  
      END_IF
    END_IF     
               
    IF (MC_Halt_0.Done OR MC_Halt_0.CommandAborted OR MC_Halt_0.Error) THEN
      MC_Halt_0.Execute:=0; 
      IF MC_Halt_0.Error THEN 
        uiHalt_0_ErrorID := MC_Halt_0.ErrorID ;
        iHalt_0_ErrorCout := iHalt_0_ErrorCout + 1 ;
      END_IF
    END_IF   
               
    IF (MC_Stop_0.Done OR MC_Stop_0.CommandAborted OR MC_Stop_0.Error) THEN
      MC_Stop_0.Execute:=0; 
      IF MC_Stop_0.Error THEN 
        uiStop_0_ErrorID := MC_Stop_0.ErrorID ;
        iStop_0_ErrorCout := iStop_0_ErrorCout + 1 ;
      END_IF
    END_IF
    MC_Stop_0();
    MC_Halt_0();
    
    IF NOT(MC_Stop_0.Busy) AND 
       NOT(MC_Halt_0.Busy) AND 
       1                   THEN         
      g_bIndStopFault := 0 ;     
    END_IF
            
    
	//************************ AXIS STOP ON POSITION **********************	
  bAxisStopPos := NOT(MC_Halt_0.Busy)        AND
                  NOT(MC_Stop_0.Busy)        AND
                  gA[9].Ind_ContinuousMotion AND  
                  gNormalStopReq             ;  
                  
    // Stop position calculation 
    // Stop position = Perf in park position and tearing not in contact zone
    IF bAxisStopPos THEN  
      IF NOT(MC_MoveAbsolute_0.Execute)THEN 
        // Position on Master in Deg when Perf is in park position
        rTempCalc_[0] := g_rPosParkMasterCam - gRecipeActive.Perf_Offset/gRecipeActive.Repeat * 360.0 ; 
        rPosMaPerfPark := H_FC_Modulus ( 
                               IN_rMod := 360,
                               IN_rVar := rTempCalc_[0]
                                       ) ; 
                                       
        // Zone Master when Tearing Axis is in contact zone   
        // Pos beginning ( Pos of the beginning of the contact zone on tearing axis = 0° )                            
        rPosMaTearInContactZ_Beg := 360 - gA[4].rActPhasDeg ;
        // Pos end  ( Pos of the end of the contact zone on tearing axis = gr_rTearAxContactZone° )  
        rPosMaTearInContactZ_End := gr_rTearAxContactZone + rPosMaTearInContactZ_Beg ; 
        
        // Correction if master stop whith Tearing in contact zone in case of RS15 
        IF g_iMachType = C_iRS15 THEN 
          IF ( rPosMaTearInContactZ_Beg < rPosMaTearInContactZ_End ) THEN 
            IF ( rPosMaPerfPark > rPosMaTearInContactZ_Beg ) AND   
               ( rPosMaPerfPark < rPosMaTearInContactZ_End ) THEN 
              rPosMaPerfPark := rPosMaTearInContactZ_End ;
            END_IF 
          ELSE
            IF ( rPosMaPerfPark > rPosMaTearInContactZ_Beg ) OR    
               ( rPosMaPerfPark < rPosMaTearInContactZ_End ) THEN 
              rPosMaPerfPark := rPosMaTearInContactZ_End ;
            END_IF 
          END_IF 
        END_IF 
      END_IF 
      gStopPosition := H_FC_Modulus ( 
                            IN_rMod := 360,
                            IN_rVar := rPosMaPerfPark
                                    ) ; 
			MC_MoveAbsolute_0.Velocity := gActualMachineSpeed_BPM * gA[9].AxisPeriod/60;
			MC_MoveAbsolute_0.Execute:=1;
		END_IF
		MC_MoveAbsolute_0.Deceleration:=gA[9].SP_Decel;
		MC_MoveAbsolute_0.Acceleration:=gA[9].SP_Accel;
		MC_MoveAbsolute_0.Direction := mcPOSITIVE_DIR;
		MC_MoveAbsolute_0.Axis := gA[9].Ident;
		MC_MoveAbsolute_0.Position := gStopPosition*gA[9].UnitsPerDeg;
		IF (MC_MoveAbsolute_0.Done OR MC_MoveAbsolute_0.CommandAborted OR MC_MoveAbsolute_0.Error) THEN
			ErrorID := MC_MoveAbsolute_0.ErrorID;
			MC_MoveAbsolute_0.Execute:=0;
		END_IF
    MC_MoveAbsolute_0();
	END_IF

END_PROGRAM
