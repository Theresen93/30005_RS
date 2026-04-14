(********************************************************************
 * COPYRIGHT -- Microsoft
 ********************************************************************
 * Program: A1_Basic
 * File: A1_BasicCyclic.st
 * Author: pkiel
 * Created: July 11, 2011
 ********************************************************************
 * Implementation of program A1_Basic
 ********************************************************************)

PROGRAM _CYCLIC
  
	IF (gA[1].Ident<>0) THEN

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
		MC_BR_ReadDriveStatus_0.Axis := gA[1].Ident;
		MC_BR_ReadDriveStatus_0.AdrDriveStatus := ADR (DriveStatus);
		MC_BR_ReadDriveStatus_0();
		gA[1].Ind_Simulation		:=	DriveStatus.Simulation;
		gA[1].Ind_NetworkInit		:=	DriveStatus.NetworkInit;
		gA[1].Input_Home			:=	DriveStatus.HomeSwitch;
		gA[1].Input_PosHW			:=	DriveStatus.PosHWSwitch;
		gA[1].Input_NegHW			:=	DriveStatus.NegHWSwitch;
		gA[1].Input_Trigger1		:=	DriveStatus.Trigger1;
		gA[1].Input_Trigger2		:=	DriveStatus.Trigger2;
		gA[1].Input_DriveEnable		:=	DriveStatus.DriveEnable;
		gA[1].Ind_ControllerReady	:=	DriveStatus.ControllerReady;
		gA[1].Ind_ControllerStatus	:=	DriveStatus.ControllerStatus;
		gA[1].Error					:=	DriveStatus.AxisError;
		gA[1].Ind_LagWarning		:=	DriveStatus.LagWarning;

	(************************ READ AXIS ERROR **********************)
		MC_ReadAxisError_0.Enable := gA[1].Ind_NetworkInit;
		MC_ReadAxisError_0.Axis := gA[1].Ident;
		MC_ReadAxisError_0.DataAddress := ADR(gA[1].ErrorText);
		MC_ReadAxisError_0.DataLength := SIZEOF(gA[1].ErrorText);
		MC_ReadAxisError_0.DataObjectName := 'Error_Eng';
		MC_ReadAxisError_0();
		IF(MC_ReadAxisError_0.Valid) THEN
			gA[1].ErrorID := MC_ReadAxisError_0.AxisErrorID;
			gA[1].ErrorCount := MC_ReadAxisError_0.AxisErrorCount;
		END_IF
	(* Auto Acknowledge Errors *)
		IF (gA[1].Cmd_Reset AND (gA[1].ErrorCount<>0) AND NOT AutoAck) THEN
			AutoAck:=1;
		ELSE
			AutoAck:=0;
		END_IF
	(*Axis Error Acknowledge*)
		IF (EDGEPOS(AutoAck) OR EDGEPOS(gA[1].ErrorAck)) THEN
			MC_ReadAxisError_0.Acknowledge := 1;
		ELSE;
			MC_ReadAxisError_0.Acknowledge :=0;
		END_IF

	(************************ RESET AXIS ERROR **********************)
		IF (gA[1].Cmd_Reset AND (gA[1].ErrorCount=0) AND gA[1].ErrorStop) THEN
			MC_Reset_0.Execute:=1;
		END_IF
		IF (MC_Reset_0.Done) THEN
			MC_Reset_0.Execute:=0;
			gA[1].Cmd_Reset:=0;
			ResetError := 0;
		END_IF
		IF (MC_Reset_0.Error) THEN
			MC_Reset_0.Execute:=0;
			gA[1].Cmd_Reset:=0;
			ResetError := 1;
		END_IF
		MC_Reset_0.Axis:=gA[1].Ident;
		MC_Reset_0();

	(************************ READ AXIS STATUS *************************)
		MC_ReadStatus_0.Enable := gA[1].Ind_NetworkInit;
		MC_ReadStatus_0.Axis := gA[1].Ident;
		MC_ReadStatus_0();
		IF(MC_ReadStatus_0.Valid = TRUE)THEN
			gA[1].Ind_Enabled 			:= NOT (MC_ReadStatus_0.Disabled);
			gA[1].Ind_StandStill		:= MC_ReadStatus_0.StandStill;
			gA[1].Ind_Stopping			:= MC_ReadStatus_0.Stopping;
			gA[1].Ind_DiscreteMotion	:= MC_ReadStatus_0.DiscreteMotion;
			gA[1].Ind_ContinuousMotion	:= MC_ReadStatus_0.ContinuousMotion;
			gA[1].Ind_SynchronizedMotion:= MC_ReadStatus_0.SynchronizedMotion;
			gA[1].ErrorStop				:= MC_ReadStatus_0.Errorstop;
    END_IF
    IF NOT(gA[1].Ind_Enabled) THEN 
      gA[1].bSynchroReq := 1 ;
    END_IF
    IF EDGEPOS(gA[1].Ind_bSynchroOK) THEN 
      gA[1].bSynchroReq := 0 ;
    END_IF

	(******************** INIT POSITION MODULUS  *********************)
		MC_BR_InitModPos_0.Execute:= InitModPosition;
		MC_BR_InitModPos_0.Axis:= gA[1].Ident;
		MC_BR_InitModPos_0.Period:= REAL_TO_UDINT(gA[1].AxisPeriod);
		MC_BR_InitModPos_0.Factor:=1;
		InitModPos_Done:=MC_BR_InitModPos_0.Done;
		MC_BR_InitModPos_0();
	
	(******************** INIT ENDLESS POSITION *********************)
		MC_BR_InitEndlessPosition_0.Execute:= InitModPos_Done;
		MC_BR_InitEndlessPosition_0.Axis:= gA[1].Ident;
		MC_BR_InitEndlessPosition_0.DataAddress:= ADR(gEndPosData[1]);
		IF (MC_BR_InitEndlessPosition_0.Done) THEN
			InitModPosition:=0;
			InitEndlessPosition:=0;
			HomeRestore:=1;
		END_IF
		MC_BR_InitEndlessPosition_0();

	(************************ HOME AXIS FIRST POWER UP **********************)
		IF (HomeRestore AND NOT gA1_FirstHomed) THEN
			MC_Home_0.Execute:=1;
		END_IF
		MC_Home_0.Axis:=gA[1].Ident;
		MC_Home_0.Position:=0;
		MC_Home_0.HomingMode:=mcHOME_DIRECT;
		IF (MC_Home_0.Done) THEN
			MC_Home_0.Execute:=0;
			gA1_FirstHomed:=1;
		END_IF
		MC_Home_0();

	(************************ HOME AXIS **********************)
		IF (gA1_FirstHomed) THEN
			MC_Home_1.Execute:=HomeRestore;
		END_IF
		MC_Home_1.Axis:=gA[1].Ident;
		MC_Home_1.Position:=0;
		MC_Home_1.HomingMode:=mcHOME_RESTORE_POS;
		IF (MC_Home_1.Done) THEN
			gA[1].Ind_Homed:=1;
			HomeRestore:=0;
		END_IF
		MC_Home_1();

  (******************** READ ACTUAL POSITION *********************)
    MC_ReadActualPosition_0.Enable:= gA[1].Ind_NetworkInit;
    MC_ReadActualPosition_0.Axis:= gA[1].Ident;
    MC_ReadActualPosition_0();
    IF(MC_ReadActualPosition_0.Valid = TRUE)THEN
      gA[1].PositionCount := MC_ReadActualPosition_0.Position;
      gA[1].PositionInch := gA[1].PositionCount/gA[1].UnitsPerInch;
      gA[1].PositionDeg := gA[1].PositionCount/gA[1].UnitsPerDeg;
    END_IF
    
  //******************** REVOLUTION COUNT ********************* 
    IF EDGEPOS(gA[1].PositionDeg > 60.0) THEN 
      IF gA[1].uiiNumRev = 4294967295 THEN 
        gA[1].uiiNumRev := 1 ;
      ELSE  
        gA[1].uiiNumRev := gA[1].uiiNumRev + 1 ;
      END_IF
    END_IF
    
  //******************** READ SET POINT POSITION ********************* 
    // Slave side  : ParID 428 SGEN_S_SET : CTRL Position controller: Input set position 
    // Master side : ParID 412 S_SET_VAX1 : 412: VAX: Position 
    
    // Slave side 
    MC_BR_CyclicRead_0.Axis        := gA[11].Ident ; //gA[1].Ident ;
    MC_BR_CyclicRead_0.Enable      := gA[1].Ind_NetworkInit;
    MC_BR_CyclicRead_0.ParID       := 412 ; //428 ;
    MC_BR_CyclicRead_0.DataAddress := ADR(iiSP_SlPos_U);
    MC_BR_CyclicRead_0.DataType    := ncPAR_TYP_DINT ;
    // Master side 
    MC_BR_CyclicRead_1.Axis        := gA[9].Ident ;
    MC_BR_CyclicRead_1.Enable      := gA[1].Ind_NetworkInit;
    MC_BR_CyclicRead_1.ParID       := 412 ;
    MC_BR_CyclicRead_1.DataAddress := ADR(iiSP_MaPos_U);
    MC_BR_CyclicRead_1.DataType    := ncPAR_TYP_DINT ;
    
    IF MC_BR_CyclicRead_0.Valid THEN
      //rSP_SlPos_Deg := REAL_TO_UDINT((iiSP_SlPos_U/gA[1].UnitsPerDeg)) MOD 360/gSP_PerfKnifeCount ;
      rSP_SlPos_Deg := iiSP_SlPos_U/gA[1].UnitsPerDeg ;
    ELSIF MC_BR_CyclicRead_0.Error THEN
      MC_BR_CyclicRead_0.Enable := 0 ;
    END_IF
    IF MC_BR_CyclicRead_1.Valid THEN
      //rSP_MaPos_Deg := REAL_TO_UDINT((iiSP_MaPos_U/gA[9].UnitsPerDeg)) MOD 360 ;
      rSP_MaPos_Deg := iiSP_MaPos_U/gA[9].UnitsPerDeg ;
    ELSIF MC_BR_CyclicRead_1.Error THEN
      MC_BR_CyclicRead_1.Enable := 0 ;
    END_IF
    MC_BR_CyclicRead_0();
    MC_BR_CyclicRead_1();

  //******************** READ ACTUAL OFFSET *********************
  rTempPosA1_Deg := H_FC_Modulus(IN_rMod:=360/gSP_PerfKnifeCount, IN_rVar:=gA[1].PositionDeg) ;
  g_bPerfInMatchedSpeed := ( rTempPosA1_Deg < gSP_A[1].MatchedSpeed ) ; 
  IF //g_bPerfInMatchedSpeed      AND 
     g_rActualSizePerf_in > 0.0 THEN 
    //rTempActPhasDeg := rSP_SlPos_Deg - gRecipeActive.Repeat/g_rActualSizePerf_in * rSP_MaPos_Deg ;
    rTempActPhasDeg := rSP_SlPos_Deg - rSP_MaPos_Deg ;
    gA[1].rActPhasDeg := H_FC_Modulus ( 
                              IN_rMod := 360,
                              IN_rVar := rTempActPhasDeg   
                                      ) ;
  END_IF


	(******************** READ ACTUAL VELOCITY *********************)
		IF(MC_ReadActualVelocity_0.Error=TRUE) THEN
			MC_ReadActualVelocity_0.Enable:= 0;
		ELSE
			MC_ReadActualVelocity_0.Enable:= 1;
		END_IF
		MC_ReadActualVelocity_0.Axis:= gA[1].Ident;
		MC_ReadActualVelocity_0();
		IF(MC_ReadActualVelocity_0.Valid = TRUE)THEN
			//gA[1].ActualVelocity := MC_ReadActualVelocity_0.Velocity*60/gA[1].SP_MotorPPR;
      gA[1].ActualVelocity := MC_ReadActualVelocity_0.Velocity*60/gA[1].AxisPeriod ; // D.M. 03/08/2011 BrownPaper_14542  Need speed of the axis and not of the shaft of the motor 
      IF (ABS(gA[1].ActualVelocity)>1) THEN // D.M. 03/08/2011 BrownPaper_14542 Add ABS because in case negative velocity Ind_InMotion = 0 instead of 1
				gA[1].Ind_InMotion:=1;
			ELSE
				gA[1].Ind_InMotion:=0;
			END_IF
		END_IF

	(******************** READ ACTUAL TORQUE *********************)
		IF(MC_ReadActualTorque_0.Error=TRUE) THEN
			MC_ReadActualTorque_0.Enable:= 0;
		ELSE
			MC_ReadActualTorque_0.Enable:= 1;
		END_IF
		MC_ReadActualTorque_0.Axis:= gA[1].Ident;
		MC_ReadActualTorque_0();
		IF(MC_ReadActualTorque_0.Valid = TRUE)THEN
			gA[1].ActualTorque := MC_ReadActualTorque_0.Torque;
		END_IF

	(************************ ENABLE AXIS **********************)
		MC_Power_0.Axis:=gA[1].Ident;
		IF (MC_Power_0.Error=0) THEN
			MC_Power_0.Enable:=gA[1].Cmd_Enable;
		ELSE;
			MC_Power_0.Enable:=0;
		END_IF;
		MC_Power_0();

	(************************ AXIS VELOCITY MOVE **********************)
    IF (((EDGEPOS(gA[1].Cmd_ContinuousMotion)) OR (EDGEPOS(gA[1].Cmd_ContinuousMotionUpdate)))) THEN
			MC_MoveVelocity_0.Execute:=1;
      rAxisTimSet_SP_Vel  := gA[1].SP_Velocity*gA[1].AxisPeriod/60;
      rAxisTimSet_SP_Acc  := gA[1].SP_Accel;
      rAxisTimSet_SP_Dec  := gA[1].SP_Decel;
      uiAxisTimSet_SP_Dir := mcPOSITIVE_DIR;
    ELSIF gstCycA[1].CycManTimSet.CmdMov AND 0 THEN 
      MC_MoveVelocity_0.Execute := 1 ;
      rAxisTimSet_SP_Vel := gr_rAxisTimSet_SP_Vel*gA[1].AxisPeriod/60 ;
      rAxisTimSet_SP_Acc := gr_rAxisTimSet_SP_Acc*gA[1].AxisPeriod/60/60 ;
      rAxisTimSet_SP_Dec := gr_rAxisTimSet_SP_Dec*gA[1].AxisPeriod/60/60 ;
      IF gA[1].Cmd_ManuTimSetPlus THEN 
        uiAxisTimSet_SP_Dir := mcPOSITIVE_DIR;
      ELSE
        uiAxisTimSet_SP_Dir := mcNEGATIVE_DIR;
      END_IF;
		ELSE
			MC_MoveVelocity_0.Execute:=0;
		END_IF;
    MC_MoveVelocity_0.Axis         := gA[1].Ident ;
    MC_MoveVelocity_0.Velocity     := rAxisTimSet_SP_Vel ;
    MC_MoveVelocity_0.Acceleration := rAxisTimSet_SP_Acc ; 
    MC_MoveVelocity_0.Deceleration := rAxisTimSet_SP_Dec ; 
    MC_MoveVelocity_0.Direction    := uiAxisTimSet_SP_Dir ;
	MC_MoveVelocity_0();
    
  //************************ AXIS OVERRIDE **********************
    MC_SetOverride_0.Axis      := gA[1].Ident ;   
    MC_SetOverride_0.Enable    := gA[1].Cmd_Override ;
    MC_SetOverride_0.VelFactor := gA[1].rSP_OverrideV ;  
    MC_SetOverride_0.AccFactor := gA[1].rSP_OverrideA ;  
    IF (MC_SetOverride_0.Enabled) OR 
       (MC_SetOverride_0.Error)   THEN
      gA[1].Cmd_Override := 0 ;
    END_IF
    MC_SetOverride_0();   
    
	(************************ AXIS STOP **********************)
		MC_Stop_0.Axis:=gA[1].Ident;
    IF (gA[1].Ind_ContinuousMotion AND (NOT gA[1].Cmd_ContinuousMotion) AND gAlarmsOK) THEN 
			MC_Stop_0.Deceleration:=gA[1].SP_Decel; 
			MC_Stop_0.Execute:=1;
		END_IF;
		IF (MC_Stop_0.Done OR MC_Stop_0.CommandAborted OR MC_Stop_0.Error) THEN
			MC_Stop_0.Execute:=0;
		END_IF;
		MC_Stop_0();

  (************************  ESTOP **********************)
    MC_Stop_1.Axis:=gA[1].Ident;
    IF EDGEPOS(g_bIndEStopStandstill) THEN
      MC_Stop_1.Deceleration:=gA[1].SP_EStopDecel;
      MC_Stop_1.Execute:=1;
    END_IF;
    IF (MC_Stop_1.Done OR MC_Stop_1.CommandAborted OR MC_Stop_1.Error) THEN
      MC_Stop_1.Execute:=0;
      gA[1].Cmd_EStopDisable := 1 ;
    END_IF;
    IF NOT(g_bIndEStopStandstill) THEN 
      gA[1].Cmd_EStopDisable := 0 ;
    END_IF;
    MC_Stop_1();
		
		(************************ AXIS PHASE CONTROL (Inches) **********************)
		(*MC_BR_Phasing_0.Slave:=gA[1].Ident;
    IF (gA[1].Ind_SynchronizedMotion) THEN
			MC_BR_Phasing_0.Enable:=1;
		ELSE
			MC_BR_Phasing_0.Enable:=0;
		END_IF;
    IF (gA[1].Cmd_PhaseOffset) THEN
			MC_BR_Phasing_0.InitData:=1;
			gA[1].Cmd_PhaseOffset:=0;
    ELSE
			MC_BR_Phasing_0.InitData:=0;
		END_IF ;
      
		(*IF(gA[9].Ind_InMotion) THEN
			MC_BR_Phasing_0.ApplicationMode:=mcMASTER_DISTANCE_BASED;
		ELSE*)
		(*END_IF*)
		MC_BR_Phasing_0.Shift:=gA[1].SP_PhaseOffset*gA[9].UnitsPerInch ;
		MC_BR_Phasing_0.Velocity            := rAxisTimSet_SP_Vel;
		MC_BR_Phasing_0.Acceleration        := rAxisTimSet_SP_Acc;
		MC_BR_Phasing_0.ApplicationDistance := 2*gA[9].AxisPeriod;
		MC_BR_Phasing_0.ShiftMode           := mcRELATIVE;
    MC_BR_Phasing_0.ApplicationMode     := uiAxisTimSet_SP_ShiftAppMode;
    MC_BR_Phasing_0.PerformVelocityControl := gstCycA[1].CycManTimSet.CmdMov AND 0 ;
		MC_BR_Phasing_0();	

	END_IF

END_PROGRAM
