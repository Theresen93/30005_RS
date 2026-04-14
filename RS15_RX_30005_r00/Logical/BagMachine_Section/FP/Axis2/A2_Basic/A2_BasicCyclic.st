(********************************************************************
 * COPYRIGHT -- Microsoft
 ********************************************************************
 * Program: A2_Basic
 * File: A2_BasicCyclic.st
 * Author: Dominique
 * Created: October 15, 2011
 ********************************************************************
 * Implementation of program A2_Basic
 ********************************************************************)

PROGRAM _CYCLIC

	gA[2].UnitsPerInch := gA[2].AxisPeriod/gRecipeActive.Repeat;
  gA[2].InchPerDeg := gA[2].UnitsPerDeg / gA[2].UnitsPerInch ;

	IF (gA[2].Ident<>0) THEN

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
		MC_BR_ReadDriveStatus_0.Axis := gA[2].Ident;
		MC_BR_ReadDriveStatus_0.AdrDriveStatus := ADR (DriveStatus);
		MC_BR_ReadDriveStatus_0();
		gA[2].Ind_Simulation		:=	DriveStatus.Simulation;
		gA[2].Ind_NetworkInit		:=	DriveStatus.NetworkInit;
		gA[2].Input_Home			:=	DriveStatus.HomeSwitch;
		gA[2].Input_PosHW			:=	DriveStatus.PosHWSwitch;
		gA[2].Input_NegHW			:=	DriveStatus.NegHWSwitch;
		gA[2].Input_Trigger1		:=	DriveStatus.Trigger1;
		gA[2].Input_Trigger2		:=	DriveStatus.Trigger2;
		gA[2].Input_DriveEnable		:=	DriveStatus.DriveEnable;
		gA[2].Ind_ControllerReady	:=	DriveStatus.ControllerReady;
		gA[2].Ind_ControllerStatus	:=	DriveStatus.ControllerStatus;
		gA[2].Error					:=	DriveStatus.AxisError;
		gA[2].Ind_LagWarning		:=	DriveStatus.LagWarning;

	(************************ READ AXIS ERROR **********************)
		MC_ReadAxisError_0.Enable := gA[2].Ind_NetworkInit;
		MC_ReadAxisError_0.Axis := gA[2].Ident;
		MC_ReadAxisError_0.DataAddress := ADR(gA[2].ErrorText);
		MC_ReadAxisError_0.DataLength := SIZEOF(gA[2].ErrorText);
		MC_ReadAxisError_0.DataObjectName := 'Error_Eng';
		MC_ReadAxisError_0();
		IF(MC_ReadAxisError_0.Valid) THEN
			gA[2].ErrorID := MC_ReadAxisError_0.AxisErrorID;
			gA[2].ErrorCount := MC_ReadAxisError_0.AxisErrorCount;
		END_IF
	(* Auto Acknowledge Errors *)
		IF (gA[2].Cmd_Reset AND (gA[2].ErrorCount<>0) AND NOT AutoAck) THEN
			AutoAck:=1;
		ELSE
			AutoAck:=0;
		END_IF
	(*Axis Error Acknowledge*)
		IF (EDGEPOS(AutoAck) OR EDGEPOS(gA[2].ErrorAck)) THEN
			MC_ReadAxisError_0.Acknowledge := 1;
		ELSE;
			MC_ReadAxisError_0.Acknowledge :=0;
		END_IF

	(************************ RESET AXIS ERROR **********************)
		IF (gA[2].Cmd_Reset AND (gA[2].ErrorCount=0) AND gA[2].ErrorStop) THEN
			MC_Reset_0.Execute:=1;
		END_IF
		IF (MC_Reset_0.Done) THEN
			MC_Reset_0.Execute:=0;
			gA[2].Cmd_Reset:=0;
			ResetError := 0;
		END_IF
		IF (MC_Reset_0.Error) THEN
			MC_Reset_0.Execute:=0;
			gA[2].Cmd_Reset:=0;
			ResetError := 1;
		END_IF
		MC_Reset_0.Axis:=gA[2].Ident;
		MC_Reset_0();

	(************************ READ AXIS STATUS *************************)
		MC_ReadStatus_0.Enable := gA[2].Ind_NetworkInit;
		MC_ReadStatus_0.Axis := gA[2].Ident;
		MC_ReadStatus_0();
		IF(MC_ReadStatus_0.Valid = TRUE)THEN
			gA[2].Ind_Enabled 			:= NOT (MC_ReadStatus_0.Disabled);
			gA[2].Ind_StandStill		:= MC_ReadStatus_0.StandStill;
			gA[2].Ind_Stopping			:= MC_ReadStatus_0.Stopping;
			gA[2].Ind_DiscreteMotion	:= MC_ReadStatus_0.DiscreteMotion;
			gA[2].Ind_ContinuousMotion	:= MC_ReadStatus_0.ContinuousMotion;
			gA[2].Ind_SynchronizedMotion:= MC_ReadStatus_0.SynchronizedMotion;
			gA[2].ErrorStop				:= MC_ReadStatus_0.Errorstop;
		END_IF

	(******************** INIT POSITION MODULUS  *********************)
		MC_BR_InitModPos_0.Execute:= InitModPosition;
		MC_BR_InitModPos_0.Axis:= gA[2].Ident;
		MC_BR_InitModPos_0.Period:= REAL_TO_UDINT(gA[2].AxisPeriod);
		MC_BR_InitModPos_0.Factor:=1;
		InitModPos_Done:=MC_BR_InitModPos_0.Done;
		MC_BR_InitModPos_0();
	
	(******************** INIT ENDLESS POSITION *********************)
		MC_BR_InitEndlessPosition_0.Execute:= InitModPos_Done;
		MC_BR_InitEndlessPosition_0.Axis:= gA[2].Ident;
		MC_BR_InitEndlessPosition_0.DataAddress:= ADR(gEndPosData[2]);
		IF (MC_BR_InitEndlessPosition_0.Done) THEN
			InitModPosition:=0;
			InitEndlessPosition:=0;
			HomeRestore:=1;
		END_IF
		MC_BR_InitEndlessPosition_0();

	(************************ HOME AXIS FIRST POWER UP **********************)
		IF (HomeRestore AND NOT gA2_FirstHomed) THEN
			MC_Home_0.Execute:=1;
		END_IF
		MC_Home_0.Axis:=gA[2].Ident;
		MC_Home_0.Position:=0;
		MC_Home_0.HomingMode:=mcHOME_DIRECT;
		IF (MC_Home_0.Done) THEN
			MC_Home_0.Execute:=0;
			gA2_FirstHomed:=1;
		END_IF
		MC_Home_0();

	(************************ HOME AXIS **********************)
		IF (gA2_FirstHomed) THEN
			MC_Home_1.Execute:=HomeRestore;
		END_IF
		MC_Home_1.Axis:=gA[2].Ident;
		MC_Home_1.Position:=0;
		MC_Home_1.HomingMode:=mcHOME_RESTORE_POS;
		IF (MC_Home_1.Done) THEN
			gA[2].Ind_Homed:=1;
			HomeRestore:=0;
		END_IF
		MC_Home_1();

	(******************** READ ACTUAL POSITION *********************)
		MC_ReadActualPosition_0.Enable:= gA[2].Ind_NetworkInit;
		MC_ReadActualPosition_0.Axis:= gA[2].Ident;
		MC_ReadActualPosition_0();
		IF(MC_ReadActualPosition_0.Valid = TRUE)THEN
			gA[2].PositionCount := MC_ReadActualPosition_0.Position;
			gA[2].PositionInch := gA[2].PositionCount/gA[2].UnitsPerInch;
			gA[2].PositionDeg := gA[2].PositionCount/gA[2].UnitsPerDeg;
		END_IF
    
  //******************** READ SET POINT POSITION ********************* 
    // Slave side  : ParID 428 SGEN_S_SET : CTRL Position controller: Input set position 
    // Master side : ParID 412 S_SET_VAX1 : 412: VAX: Position 
    
    // Slave side 
    MC_BR_CyclicRead_0.Axis        := gA[2].Ident ;
    MC_BR_CyclicRead_0.Enable      := gA[2].Ind_NetworkInit;
    MC_BR_CyclicRead_0.ParID       := 428 ;
    MC_BR_CyclicRead_0.DataAddress := ADR(iiSP_SlPos_U);
    MC_BR_CyclicRead_0.DataType    := ncPAR_TYP_DINT ;
    // Master side 
    MC_BR_CyclicRead_1.Axis        := gA[9].Ident ;
    MC_BR_CyclicRead_1.Enable      := gA[2].Ind_NetworkInit;
    MC_BR_CyclicRead_1.ParID       := 412 ;
    MC_BR_CyclicRead_1.DataAddress := ADR(iiSP_MaPos_U);
    MC_BR_CyclicRead_1.DataType    := ncPAR_TYP_DINT ;
    
    IF MC_BR_CyclicRead_0.Valid THEN
      rSP_SlPos_Deg := iiSP_SlPos_U/gA[2].UnitsPerDeg ;
    ELSIF MC_BR_CyclicRead_0.Error THEN
      MC_BR_CyclicRead_0.Enable := 0 ;
    END_IF
    IF MC_BR_CyclicRead_1.Valid THEN
      rSP_MaPos_Deg := iiSP_MaPos_U/gA[9].UnitsPerDeg ;
    ELSIF MC_BR_CyclicRead_1.Error THEN
      MC_BR_CyclicRead_1.Enable := 0 ;
    END_IF
    MC_BR_CyclicRead_0();
    MC_BR_CyclicRead_1();

  //******************** READ ACTUAL OFFSET *********************
  IF gA[2].rRSynDen > 0.0 THEN
    rTempActPhasDeg := rSP_SlPos_Deg - gA[2].rRSynNum / gA[2].rRSynDen * rSP_MaPos_Deg ;
    gA[2].rActPhasDeg := H_FC_Modulus ( 
                              IN_rMod := 360 * gA[2].rRSynNum / gA[2].rRSynDen ,
                              IN_rVar := rTempActPhasDeg 
                                      ) ;
  END_IF

  //******************** ACTUAL PRINTING CYLINDER CALCULATED POSITION *********************
  IF gA[2].rRSynNum > 0.0 THEN
    rDiffPosFP := rSP_SlPos_Deg - rMemoPosFP ;
    rMemoPosFP := rSP_SlPos_Deg ;
    IF rDiffPosFP > 0 THEN 
      rTempCalcPos_deg := rTempCalcPos_deg + rDiffPosFP * gA[2].rRSynDen / gA[2].rRSynNum ;
      g_rPrintRolCalcPos_deg := H_FC_Modulus ( 
                                     IN_rMod := 360 ,
                                     IN_rVar := rTempCalcPos_deg 
                                             ) ;             
    END_IF
  END_IF
  // Position in inch
  g_rPrintRolCalcPos_in := g_rPrintRolCalcPos_deg/360.0 * gRecipeActive.Repeat ;
                    
	(******************** READ ACTUAL VELOCITY *********************)
		IF(MC_ReadActualVelocity_0.Error=TRUE) THEN
			MC_ReadActualVelocity_0.Enable:= 0;
		ELSE
			MC_ReadActualVelocity_0.Enable:= 1;
		END_IF
		MC_ReadActualVelocity_0.Axis:= gA[2].Ident;
		MC_ReadActualVelocity_0();
		IF(MC_ReadActualVelocity_0.Valid = TRUE)THEN
			//gA[2].ActualVelocity := MC_ReadActualVelocity_0.Velocity*60/gA[2].SP_MotorPPR;
      gA[2].ActualVelocity := MC_ReadActualVelocity_0.Velocity*60/gA[2].AxisPeriod ; // D.M. 03/08/2011 BrownPaper_14542  Need speed of the axis and not of the shaft of the motor 
      IF ABS(gA[2].ActualVelocity>1) THEN // D.M. 03/08/2011 BrownPaper_14542 Add ABS because in case negative velocity Ind_InMotion = 0 instead of 1
				gA[2].Ind_InMotion:=1;
			ELSE
				gA[2].Ind_InMotion:=0;
			END_IF
		END_IF

	(******************** READ ACTUAL TORQUE *********************)
		IF(MC_ReadActualTorque_0.Error=TRUE) THEN
			MC_ReadActualTorque_0.Enable:= 0;
		ELSE
			MC_ReadActualTorque_0.Enable:= 1;
		END_IF
		MC_ReadActualTorque_0.Axis:= gA[2].Ident;
		MC_ReadActualTorque_0();
		IF(MC_ReadActualTorque_0.Valid = TRUE)THEN
			gA[2].ActualTorque := MC_ReadActualTorque_0.Torque;
		END_IF

	(************************ ENABLE AXIS **********************)
		MC_Power_0.Axis:=gA[2].Ident;
		IF (MC_Power_0.Error=0) THEN
			MC_Power_0.Enable:=gA[2].Cmd_Enable;
		ELSE;
			MC_Power_0.Enable:=0;
		END_IF;
		MC_Power_0();

	(************************ AXIS VELOCITY MOVE **********************)
		MC_MoveVelocity_0.Axis:=gA[2].Ident;
		MC_MoveVelocity_0.Velocity:=gA[2].SP_Velocity*gA[2].AxisPeriod/60;
		MC_MoveVelocity_0.Acceleration:=gA[2].SP_Accel;
		MC_MoveVelocity_0.Deceleration:=gA[2].SP_Decel;
		MC_MoveVelocity_0.Direction:=mcPOSITIVE_DIR;
		IF ((EDGEPOS(gA[2].Cmd_ContinuousMotion)) OR (EDGEPOS(gA[2].Cmd_ContinuousMotionUpdate))) THEN
			MC_MoveVelocity_0.Execute:=1;
		ELSE
			MC_MoveVelocity_0.Execute:=0;
		END_IF;
		MC_MoveVelocity_0();
    
  //************************ AXIS OVERRIDE **********************
    MC_SetOverride_0.Axis      := gA[2].Ident ;   
    MC_SetOverride_0.Enable    := gA[2].Cmd_Override ;
    MC_SetOverride_0.VelFactor := gA[2].rSP_OverrideV ;  
    MC_SetOverride_0.AccFactor := gA[2].rSP_OverrideA ;  
    IF (MC_SetOverride_0.Enabled) OR 
       (MC_SetOverride_0.Error)   THEN
      gA[2].Cmd_Override := 0 ;
    END_IF
    MC_SetOverride_0();  

  (************************ AXIS STOP **********************)
    MC_Stop_0.Axis:=gA[2].Ident;
    IF (gA[2].Ind_ContinuousMotion AND (NOT gA[2].Cmd_ContinuousMotion) AND gAlarmsOK) THEN
      MC_Stop_0.Deceleration:=gA[2].SP_Decel;
      MC_Stop_0.Execute:=1;
    END_IF;
    IF (MC_Stop_0.Done OR MC_Stop_0.CommandAborted OR MC_Stop_0.Error) THEN
      MC_Stop_0.Execute:=0;
    END_IF;
    MC_Stop_0();

  (************************  ESTOP **********************)
    MC_Stop_1.Axis:=gA[2].Ident;
    IF EDGEPOS(g_bIndEStopStandstill) THEN
      MC_Stop_1.Deceleration:=gA[2].SP_EStopDecel;
      MC_Stop_1.Execute:=1;
    END_IF;
    IF (MC_Stop_1.Done OR MC_Stop_1.CommandAborted OR MC_Stop_1.Error) THEN
      MC_Stop_1.Execute:=0;
      gA[2].Cmd_EStopDisable := 1 ;
    END_IF;
    IF NOT(g_bIndEStopStandstill) THEN 
      gA[2].Cmd_EStopDisable := 0 ;
    END_IF;
    MC_Stop_1();

  (************************ AXIS HALT **********************)
    MC_Halt_0.Axis := gA[2].Ident ;
    IF EDGEPOS(gstCycA[2].CycManTimSet.CmdExeStop) AND 
       1                                           THEN
      MC_Halt_0.Deceleration := gA[2].SP_Decel ;
      MC_Halt_0.Execute      := 1 ;
    END_IF;
    IF MC_Halt_0.Done THEN
      MC_Halt_0.Execute := 0 ;
    ELSIF MC_Halt_0.Error THEN
      uiHalt_0_ErrorID := MC_Halt_0.ErrorID ;
      MC_Halt_0.Execute := 0 ;
    END_IF
    MC_Halt_0();
		
		(************************ AXIS PHASE CONTROL (Inches) **********************)
		MC_BR_Phasing_0.Slave:=gA[2].Ident;
		IF gA[2].Ind_SynchronizedMotion AND NOT(gstCycA[2].CycManTimSet.bSCyc) AND st_TON_0.Q THEN
			MC_BR_Phasing_0.Enable:=0;//1;
		ELSE;
			MC_BR_Phasing_0.Enable:=0;
		END_IF;
		IF gA[2].Cmd_PhaseOffset  AND NOT(gstCycA[2].CycManTimSet.bSCyc) THEN
			MC_BR_Phasing_0.InitData:=1;
			gA[2].Cmd_PhaseOffset:=0;
      // Calculation new phase Holdind/Master 
      rTemp_[4] := gA[2].SP_PhaseOffset/gA[2].InchPerDeg ;
      //rTemp_[5] := gRecipeActive.rDrum_PhasMasterDeg + rTemp_[4] ;
      //gRecipeActive.rDrum_PhasMasterDeg := H_FC_Modulus (IN_rMod := 360, IN_rVar := rTemp_[5]) ;
      rTest_[0] := rTest_[0] + 1 ;
		ELSE
			MC_BR_Phasing_0.InitData:=0;
		END_IF
		MC_BR_Phasing_0.ApplicationMode:=mcMASTER_DISTANCE_BASED;
		MC_BR_Phasing_0.Shift:=gA[2].SP_PhaseOffset*gA[9].UnitsPerInch;
		MC_BR_Phasing_0.Velocity:=6*gA[2].AxisPeriod/60;
		MC_BR_Phasing_0.Acceleration:=gA[2].SP_Decel;
		MC_BR_Phasing_0.ApplicationDistance:=0.8*gA[9].AxisPeriod;
		MC_BR_Phasing_0.ShiftMode:=mcRELATIVE;
		MC_BR_Phasing_0();	

    (************************ AXIS PHASE CONTROL (Inches) TIMING SETTING **********************)
    IF gstCycA[2].CycManTimSet.bSCyc THEN 
      IF gA[2].Cmd_ManuTimSetPlus            OR 
         MC_BR_Phasing_1.Enable              AND 
         (MC_BR_Phasing_1.ApplicationMode=4) THEN 
        rAxisTimSet_SP_Vel := 0.6*gr_rAxisTimSet_SP_Vel*gA[9].AxisPeriod/60 / (gA[2].rRSynNum/gA[2].rRSynDen) ;
        MC_BR_Phasing_1.ApplicationMode := mcVELOCITY_CONTROL ;
      ELSE
        rAxisTimSet_SP_Vel := 0.6*gr_rAxisTimSet_SP_Vel*gA[9].AxisPeriod/60 / (gA[2].rRSynNum/gA[2].rRSynDen) ;  // D.M. Le 26/10/2011 B&H_14541 Only positive direction for Flexo Press
        //rAxisTimSet_SP_Vel := - gr_rAxisTimSet_SP_Vel*gA[9].AxisPeriod/60 / (gA[2].rRSynNum/gA[2].rRSynDen) ;
        MC_BR_Phasing_1.ApplicationMode := mcTIME_BASED ;
      END_IF 
        rAxisTimSet_SP_Acc := gr_rAxisTimSet_SP_Acc*gA[9].AxisPeriod/60/60 ;
    END_IF
      
    MC_BR_Phasing_1.Slave                  := gA[2].Ident;
    MC_BR_Phasing_1.Enable                 := gstCycA[2].CycManTimSet.bCyc  ;
    MC_BR_Phasing_1.InitData               := (gstCycA[2].CycManTimSet.CmdMov OR gstCycA[2].CycManTimSet.CmdExeMov) ;
    MC_BR_Phasing_1.PerformVelocityControl := gstCycA[2].CycManTimSet.CmdMov ;
    MC_BR_Phasing_1.Velocity               := rAxisTimSet_SP_Vel ;
    MC_BR_Phasing_1.Acceleration           := rAxisTimSet_SP_Acc ;
    MC_BR_Phasing_1.Shift                  := gstCycA[2].CycManTimSet.rSP_Distance*gA[9].UnitsPerInch;
    MC_BR_Phasing_1.ShiftMode              := mcRELATIVE ;
    MC_BR_Phasing_1();  
    st_TON_0(IN:=NOT(MC_BR_Phasing_1.Enable),PT:=T#100ms) ;
    
    IF NOT(gstCycA[2].CycManTimSet.CmdMov) AND 
       MC_BR_Phasing_1.ShiftAttained       OR 
       NOT(gstCycA[2].CycManTimSet.bCyc)   OR 
       MC_BR_Phasing_1.Error               AND         
       1                                   THEN            
      gstCycA[2].CycManTimSet.CmdStop := 0 ;
    END_IF 

    IF MC_BR_Phasing_1.ShiftAttained AND 
       MC_BR_Phasing_1.InitData      THEN
      gstCycA[2].CycManTimSet.enMoveStat := FINISHED ;
    ELSIF MC_BR_Phasing_1.Error THEN
      uiMC_BR_Phasing_1_ErrorID := MC_BR_Phasing_1.ErrorID ;
      gstCycA[2].CycManTimSet.enMoveStat := FAULT ;
    ELSIF NOT(MC_BR_Phasing_1.InitData) THEN 
      gstCycA[2].CycManTimSet.enMoveStat := INACTIVE ;
    END_IF 
    
    (*//************************ AXIS PHASE CONTROL (Inches) TIMING SETTING **********************
    IF gstCycA[2].CycManTimSet.bSCyc THEN 
      IF gA[2].Cmd_ManuTimSetPlus THEN 
        rAxisTimSet_SP_Vel := 0.6*gr_rAxisTimSet_SP_Vel*gA[9].AxisPeriod/60 / (gA[2].rRSynNum/gA[2].rRSynDen) ;
      ELSE
        rAxisTimSet_SP_Vel := 0.6*gr_rAxisTimSet_SP_Vel*gA[9].AxisPeriod/60 / (gA[2].rRSynNum/gA[2].rRSynDen) ;  // D.M. Le 26/10/2011 B&H_14541 Only positive direction for Flexo Press
        //rAxisTimSet_SP_Vel := - gr_rAxisTimSet_SP_Vel*gA[9].AxisPeriod/60 / (gA[2].rRSynNum/gA[2].rRSynDen) ;
      END_IF 
        rAxisTimSet_SP_Acc := gr_rAxisTimSet_SP_Acc*gA[9].AxisPeriod/60/60 ;
    END_IF 
   
    MC_BR_Phasing_2.Slave                  := gA[2].Ident;
    MC_BR_Phasing_2.Shift                  := gstCycA[2].CycManTimSet.rSP_Distance*gA[9].UnitsPerInch;
    MC_BR_Phasing_2.Enable                 := gstCycA[2].CycManTimSet.bSCyc AND 0 ;
    MC_BR_Phasing_2.InitData               := gstCycA[2].CycManTimSet.CmdExeMov AND 0;
    MC_BR_Phasing_2.Velocity               := rAxisTimSet_SP_Vel ;
    MC_BR_Phasing_2.Acceleration           := rAxisTimSet_SP_Acc ;
    MC_BR_Phasing_2.ShiftMode              := mcRELATIVE ;
    MC_BR_Phasing_2.ApplicationMode        := mcTIME_BASED ;
    MC_BR_Phasing_2(); 
       
    IF MC_BR_Phasing_2.ShiftAttained AND 
       1                             THEN
      gstCycA[2].CycManTimSet.enMoveStat := FINISHED ;
    ELSIF MC_BR_Phasing_2.Error THEN
      uiMC_BR_Phasing_2_ErrorID := MC_BR_Phasing_2.ErrorID ;
      gstCycA[2].CycManTimSet.enMoveStat := FAULT ;
    ELSIF NOT(MC_BR_Phasing_2.Busy) THEN 
      gstCycA[2].CycManTimSet.enMoveStat := INACTIVE ;
    END_IF 
    *)
    
    (*//************************ AXIS MOVE ADDITIVE IN OFFSET SETTING **********************
    IF EDGEPOS(gstCycA[2].CycManTimSet.CmdExeMov) THEN  
      MC_MoveAdditive_0.Axis         := gA[2].Ident ;     
      MC_MoveAdditive_0.Distance     := gstCycA[2].CycManTimSet.rSP_Distance*gA[9].UnitsPerInch ;
      MC_MoveAdditive_0.Velocity     := gr_rAxisTimSet_SP_Vel*gA[9].AxisPeriod/60 ;
      MC_MoveAdditive_0.Acceleration := gr_rAxisTimSet_SP_Acc*gA[9].AxisPeriod/60/60 ;
      MC_MoveAdditive_0.Deceleration := gr_rAxisTimSet_SP_Acc*gA[9].AxisPeriod/60/60 ;
      uiMoveAdditive_0_ErrorID       := 0 ;
    END_IF 
    MC_MoveAdditive_0.Execute := gstCycA[2].CycManTimSet.CmdExeMov ;
    
    IF (MC_MoveAdditive_0.Done) THEN
      gstCycA[2].CycManTimSet.enMoveStat := FINISHED ;
    ELSIF (MC_MoveAdditive_0.Error) THEN
      uiMoveAdditive_0_ErrorID := MC_MoveAdditive_0.ErrorID ;
      gstCycA[2].CycManTimSet.enMoveStat := FAULT ;
    END_IF
    MC_MoveAdditive_0() ;  
    
    IF MC_MoveAdditive_0.Busy       AND 
       NOT(MC_MoveAdditive_0.Error) THEN 
      gstCycA[2].CycManTimSet.enMoveStat := ACTIVE ;
    END_IF 
    IF NOT(MC_MoveAdditive_0.Execute) THEN 
      gstCycA[2].CycManTimSet.enMoveStat := INACTIVE ;
    END_IF 
    *)   
      
	END_IF

END_PROGRAM
