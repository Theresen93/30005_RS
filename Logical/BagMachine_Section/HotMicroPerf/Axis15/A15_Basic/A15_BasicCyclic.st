(********************************************************************
 * COPYRIGHT -- Microsoft
 ********************************************************************
 * Program: A15_Basic
 * File: A15_BasicCyclic.st
 * Author: dominique
 * Created: November 03, 2011
 ********************************************************************
 * Implementation of program A15_Basic
 ********************************************************************)

PROGRAM _CYCLIC

	gA[15].UnitsPerInch := gA[15].AxisPeriod/gRecipeActive.Repeat;
  gA[15].InchPerDeg := gA[15].UnitsPerDeg / gA[15].UnitsPerInch ;
  gA[15].rRSynNum := 1 ;
  gA[15].rRSynDen := gRecipeActive.iHMPerf_Up ;

	IF (gA[15].Ident<>0) THEN

	//*********************** READ DRIVE STATUS ************************
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
		MC_BR_ReadDriveStatus_0.Axis := gA[15].Ident;
		MC_BR_ReadDriveStatus_0.AdrDriveStatus := ADR (DriveStatus);
		MC_BR_ReadDriveStatus_0();
		gA[15].Ind_Simulation		:=	DriveStatus.Simulation;
		gA[15].Ind_NetworkInit		:=	DriveStatus.NetworkInit;
		gA[15].Input_Home			:=	DriveStatus.HomeSwitch;
		gA[15].Input_PosHW			:=	DriveStatus.PosHWSwitch;
		gA[15].Input_NegHW			:=	DriveStatus.NegHWSwitch;
		gA[15].Input_Trigger1		:=	DriveStatus.Trigger1;
		gA[15].Input_Trigger2		:=	DriveStatus.Trigger2;
		gA[15].Input_DriveEnable		:=	DriveStatus.DriveEnable;
		gA[15].Ind_ControllerReady	:=	DriveStatus.ControllerReady;
		gA[15].Ind_ControllerStatus	:=	DriveStatus.ControllerStatus;
		gA[15].Error					:=	DriveStatus.AxisError;
		gA[15].Ind_LagWarning		:=	DriveStatus.LagWarning;

	//*********************** READ AXIS ERROR *********************
		MC_ReadAxisError_0.Enable := gA[15].Ind_NetworkInit;
		MC_ReadAxisError_0.Axis := gA[15].Ident;
		MC_ReadAxisError_0.DataAddress := ADR(gA[15].ErrorText);
		MC_ReadAxisError_0.DataLength := SIZEOF(gA[15].ErrorText);
		MC_ReadAxisError_0.DataObjectName := 'Error_Eng';
		MC_ReadAxisError_0();
		IF(MC_ReadAxisError_0.Valid) THEN
			gA[15].ErrorID := MC_ReadAxisError_0.AxisErrorID;
			gA[15].ErrorCount := MC_ReadAxisError_0.AxisErrorCount;
		END_IF
	// Auto Acknowledge Errors 
		IF (gA[15].Cmd_Reset AND (gA[15].ErrorCount<>0) AND NOT AutoAck) THEN
			AutoAck:=1;
		ELSE
			AutoAck:=0;
		END_IF
	//Axis Error Acknowledge
		IF (EDGEPOS(AutoAck) OR EDGEPOS(gA[15].ErrorAck)) THEN
			MC_ReadAxisError_0.Acknowledge := 1;
		ELSE;
			MC_ReadAxisError_0.Acknowledge :=0;
		END_IF

	//*********************** RESET AXIS ERROR *********************
		IF (gA[15].Cmd_Reset AND (gA[15].ErrorCount=0) AND gA[15].ErrorStop) THEN
			MC_Reset_0.Execute:=1;
		END_IF
		IF (MC_Reset_0.Done) THEN
			MC_Reset_0.Execute:=0;
			gA[15].Cmd_Reset:=0;
			ResetError := 0;
		END_IF
		IF (MC_Reset_0.Error) THEN
			MC_Reset_0.Execute:=0;
			gA[15].Cmd_Reset:=0;
			ResetError := 1;
		END_IF
		MC_Reset_0.Axis:=gA[15].Ident;
		MC_Reset_0();

	//*********************** READ AXIS STATUS ************************
		MC_ReadStatus_0.Enable := gA[15].Ind_NetworkInit;
		MC_ReadStatus_0.Axis := gA[15].Ident;
		MC_ReadStatus_0();
		IF(MC_ReadStatus_0.Valid = TRUE)THEN
			gA[15].Ind_Enabled 			:= NOT (MC_ReadStatus_0.Disabled);
			gA[15].Ind_StandStill		:= MC_ReadStatus_0.StandStill;
			gA[15].Ind_Stopping			:= MC_ReadStatus_0.Stopping;
			gA[15].Ind_DiscreteMotion	:= MC_ReadStatus_0.DiscreteMotion;
			gA[15].Ind_ContinuousMotion	:= MC_ReadStatus_0.ContinuousMotion;
			gA[15].Ind_SynchronizedMotion:= MC_ReadStatus_0.SynchronizedMotion;
			gA[15].ErrorStop				:= MC_ReadStatus_0.Errorstop;
		END_IF

	//******************* INIT POSITION MODULUS  ********************
    IF (g_rNumbPliers <> 0.0) THEN   
      IF ( gA[15].Ind_StandStill     OR 
           NOT(gA[15].Ind_Enabled) ) AND
         g_bChangeModDrumReq        THEN         
        bChangeModReq := 1 ;
        uiInitModPos0_ErrorID := 0 ;
      END_IF           
      MC_BR_InitModPos_0.Execute:= (InitModPosition OR bChangeModReq) ;
  		MC_BR_InitModPos_0.Axis:= gA[15].Ident;
  		MC_BR_InitModPos_0.Period:= REAL_TO_UDINT(gA[15].AxisPeriod * 4.0/g_rNumbPliers);
  		MC_BR_InitModPos_0.Factor:=1;
  		InitModPos_Done:=MC_BR_InitModPos_0.Done;
    END_IF
    IF MC_BR_InitModPos_0.Done THEN  
      g_bChangeModDrumReq := 0 ;
      bChangeModReq       := 0 ;
    ELSIF MC_BR_InitModPos_0.Error THEN 
      bChangeModReq := 0 ;
      uiInitModPos0_ErrorID := MC_BR_InitModPos_0.ErrorID ;
    END_IF  
		MC_BR_InitModPos_0();
	
	//******************* INIT ENDLESS POSITION ********************
		MC_BR_InitEndlessPosition_0.Execute:= InitModPos_Done;
		MC_BR_InitEndlessPosition_0.Axis:= gA[15].Ident;
		MC_BR_InitEndlessPosition_0.DataAddress:= ADR(gEndPosData[15]);
		IF (MC_BR_InitEndlessPosition_0.Done) THEN
			InitModPosition:=0;
			InitEndlessPosition:=0;
			HomeRestore:=1;
		END_IF
		MC_BR_InitEndlessPosition_0();

	//*********************** HOME AXIS FIRST POWER UP *********************
		IF (HomeRestore AND NOT gA15_FirstHomed) THEN
			MC_Home_0.Execute:=1;
		END_IF
		MC_Home_0.Axis:=gA[15].Ident;
		MC_Home_0.Position:=0;
		MC_Home_0.HomingMode:=mcHOME_DIRECT;
		IF (MC_Home_0.Done) THEN
			MC_Home_0.Execute:=0;
			gA15_FirstHomed:=1;
		END_IF
		MC_Home_0();

	//*********************** HOME AXIS *********************
		IF (gA15_FirstHomed) THEN
			MC_Home_1.Execute:=HomeRestore;
		END_IF
		MC_Home_1.Axis:=gA[15].Ident;
		MC_Home_1.Position:=0;
		MC_Home_1.HomingMode:=mcHOME_RESTORE_POS;
		IF (MC_Home_1.Done) THEN
			gA[15].Ind_Homed:=1;
			HomeRestore:=0;
		END_IF
		MC_Home_1();

	//******************* READ ACTUAL POSITION ********************
		MC_ReadActualPosition_0.Enable:= gA[15].Ind_NetworkInit;
		MC_ReadActualPosition_0.Axis:= gA[15].Ident;
		MC_ReadActualPosition_0();
		IF(MC_ReadActualPosition_0.Valid = TRUE)THEN
			gA[15].PositionCount := MC_ReadActualPosition_0.Position;
			gA[15].PositionInch := gA[15].PositionCount/gA[15].UnitsPerInch;
			gA[15].PositionDeg := gA[15].PositionCount/gA[15].UnitsPerDeg;
		END_IF
    
  //******************** READ SET POINT POSITION ********************* 
    // Slave side  : ParID 428 SGEN_S_SET : CTRL Position controller: Input set position 
    // Master side : ParID 412 S_SET_VAX1 : 412: VAX: Position 
    
    // Slave side 
    MC_BR_CyclicRead_0.Axis        := gA[15].Ident ;
    MC_BR_CyclicRead_0.Enable      := gA[15].Ind_NetworkInit;
    MC_BR_CyclicRead_0.ParID       := 428 ;
    MC_BR_CyclicRead_0.DataAddress := ADR(iiSP_SlPos_U);
    MC_BR_CyclicRead_0.DataType    := ncPAR_TYP_DINT ;
    // Master side 
    MC_BR_CyclicRead_1.Axis        := gA[9].Ident ;
    MC_BR_CyclicRead_1.Enable      := gA[15].Ind_NetworkInit;
    MC_BR_CyclicRead_1.ParID       := 412 ;
    MC_BR_CyclicRead_1.DataAddress := ADR(iiSP_MaPos_U);
    MC_BR_CyclicRead_1.DataType    := ncPAR_TYP_DINT ;
    
    IF MC_BR_CyclicRead_0.Valid THEN
      rSP_SlPos_Deg := iiSP_SlPos_U/gA[15].UnitsPerDeg ;
      g_rTest_[1] := rSP_SlPos_Deg - TRUNC(rSP_SlPos_Deg/360.0)*360.0 ;
      g_rTest_[2] := g_rTest_[1] - gA[15].PositionDeg ;
    ELSIF MC_BR_CyclicRead_0.Error THEN
      MC_BR_CyclicRead_0.Enable := 0 ;
    END_IF
    IF MC_BR_CyclicRead_1.Valid THEN
      rSP_MaPos_Deg := iiSP_MaPos_U/gA[9].UnitsPerDeg ;
      g_rTest_[3] := rSP_MaPos_Deg - TRUNC(rSP_MaPos_Deg/360.0)*360.0 ;
      g_rTest_[4] := g_rTest_[3] - gA[9].PositionDeg ;
    ELSIF MC_BR_CyclicRead_1.Error THEN
      MC_BR_CyclicRead_1.Enable := 0 ;
    END_IF
    MC_BR_CyclicRead_0();
    MC_BR_CyclicRead_1();

  //******************** READ ACTUAL OFFSET *********************
  IF gA[15].rRSynDen > 0.0 THEN
    rTempActPhasDeg := rSP_SlPos_Deg - gA[15].rRSynNum / gA[15].rRSynDen * rSP_MaPos_Deg ;
    gA[15].rActPhasDeg := H_FC_Modulus ( 
                              IN_rMod := 360 * gA[15].rRSynNum / gA[15].rRSynDen ,
                              IN_rVar := rTempActPhasDeg 
                                      ) ;
  END_IF
  
	//******************* READ ACTUAL VELOCITY ********************
		IF(MC_ReadActualVelocity_0.Error=TRUE) THEN
			MC_ReadActualVelocity_0.Enable:= 0;
		ELSE
			MC_ReadActualVelocity_0.Enable:= 1;
		END_IF
		MC_ReadActualVelocity_0.Axis:= gA[15].Ident;
		MC_ReadActualVelocity_0();
		IF(MC_ReadActualVelocity_0.Valid = TRUE)THEN
			//gA[15].ActualVelocity := MC_ReadActualVelocity_0.Velocity*60/gA[15].SP_MotorPPR;
      gA[15].ActualVelocity := MC_ReadActualVelocity_0.Velocity*60/gA[15].AxisPeriod ; // D.M. 03/08/2011 BrownPaper_14542  Need speed of the axis and not of the shaft of the motor 
      IF ABS(gA[15].ActualVelocity>1) THEN // D.M. 03/08/2011 BrownPaper_14542 Add ABS because in case negative velocity Ind_InMotion = 0 instead of 1
				gA[15].Ind_InMotion:=1;
			ELSE
				gA[15].Ind_InMotion:=0;
			END_IF
		END_IF

	//******************* READ ACTUAL TORQUE ********************
		IF(MC_ReadActualTorque_0.Error=TRUE) THEN
			MC_ReadActualTorque_0.Enable:= 0;
		ELSE
			MC_ReadActualTorque_0.Enable:= 1;
		END_IF
		MC_ReadActualTorque_0.Axis:= gA[15].Ident;
		MC_ReadActualTorque_0();
		IF(MC_ReadActualTorque_0.Valid = TRUE)THEN
			gA[15].ActualTorque := MC_ReadActualTorque_0.Torque;
		END_IF

	//*********************** ENABLE AXIS *********************
		MC_Power_0.Axis:=gA[15].Ident;
		IF (MC_Power_0.Error=0) THEN
      MC_Power_0.Enable:=gA[15].Cmd_Enable OR bTest_[0];
		ELSE;
			MC_Power_0.Enable:=0;
		END_IF;
		MC_Power_0();

	//*********************** AXIS VELOCITY MOVE *********************
		MC_MoveVelocity_0.Axis         := gA[15].Ident;
		MC_MoveVelocity_0.Velocity     := g_stHMPerfCyc.rSP_Vel * gA[15].AxisPeriod/60;
		MC_MoveVelocity_0.Acceleration := g_stHMPerfCyc.rSP_Acc * gA[15].AxisPeriod/60/60;
		MC_MoveVelocity_0.Deceleration := g_stHMPerfCyc.rSP_Dec * gA[15].AxisPeriod/60/60;
		MC_MoveVelocity_0.Direction    := mcPOSITIVE_DIR;
	  MC_MoveVelocity_0.Execute      := g_stHMPerfCyc.Cmd_SlowRot;
    
    IF (MC_MoveVelocity_0.InVelocity)  OR 
       (MC_MoveVelocity_0.Error)       OR 
       g_stHMPerfCyc.Cmd_Stop          THEN
      g_stHMPerfCyc.Cmd_SlowRot := 0 OR bTest_[1] ; 
    END_IF
		MC_MoveVelocity_0();
   
  //************************ AXIS HALT **********************
    MC_Halt_0.Axis := gA[15].Ident ;  
    MC_Halt_0.Deceleration := g_stHMPerfCyc.rSP_Dec * gA[15].AxisPeriod/60/60;
    IF g_stHMPerfCyc.Cmd_Stop THEN  
      MC_Halt_0.Execute := 1 ;
    END_IF
    IF (MC_Halt_0.Done)  OR 
       (MC_Halt_0.Error) THEN
      MC_Halt_0.Execute := 0 ;
      g_stHMPerfCyc.Cmd_Stop := 0 ; 
    END_IF
    MC_Halt_0();  

  //************************ AXIS OVERRIDE **********************
    MC_SetOverride_0.Axis      := gA[15].Ident ;   
    MC_SetOverride_0.Enable    := gA[15].Cmd_Override ;
    MC_SetOverride_0.VelFactor := gA[15].rSP_OverrideV ;  
    MC_SetOverride_0.AccFactor := gA[15].rSP_OverrideA ;  
    IF (MC_SetOverride_0.Enabled) OR 
       (MC_SetOverride_0.Error)   THEN
      gA[15].Cmd_Override := 0 ;
    END_IF
    MC_SetOverride_0();  

	//*********************** AXIS STOP *********************
		MC_Stop_0.Axis:=gA[15].Ident;
    //IF (gA[15].Ind_ContinuousMotion AND (NOT gA[15].Cmd_ContinuousMotion) AND gAlarmsOK) THEN
    IF FALSE THEN
			MC_Stop_0.Deceleration:=gA[15].SP_Decel;
			MC_Stop_0.Execute:=1;
		END_IF;
		IF (MC_Stop_0.Done OR MC_Stop_0.CommandAborted OR MC_Stop_0.Error) THEN
			MC_Stop_0.Execute:=0;
		END_IF;
		MC_Stop_0();
    
  //***********************  ESTOP *********************
    MC_Stop_1.Axis:=gA[15].Ident;
    IF EDGEPOS(g_bIndEStopStandstill) THEN
      MC_Stop_1.Deceleration:=gA[15].SP_EStopDecel;
      MC_Stop_1.Execute:=1;
    END_IF;
    IF (MC_Stop_1.Done OR MC_Stop_1.CommandAborted OR MC_Stop_1.Error) THEN
      MC_Stop_1.Execute:=0;
      gA[15].Cmd_EStopDisable := 1 ;
    END_IF;
    IF NOT(g_bIndEStopStandstill) THEN 
      gA[15].Cmd_EStopDisable := 0 ;
    END_IF;
    MC_Stop_1();
    
		
		//*********************** AXIS PHASE CONTROL (Inches) *********************
    IF gA[15].Cmd_PhaseOffset OR 
       g_bHMP_CmdPhasing      THEN 
      rSP_PhaseOffset := gA[15].SP_PhaseOffset ; 
      IF g_bHMP_CmdPhasing THEN 
        g_bHMP_CmdPhasing    := 0 ;
        g_bHMP_PhasInProgres := 1 ;
        rSP_PhaseOffset := g_rHMP_SP_Phasing/360.0 * gRecipeActive.Repeat ;  
      END_IF
      bCmd_PhaseOffset := 1 ;
    END_IF
    
		MC_BR_Phasing_0.Slave:=gA[15].Ident;
		IF gA[15].Ind_SynchronizedMotion AND NOT(gstCycA[7].CycManTimSet.bSCyc) AND st_TON_0.Q THEN
			MC_BR_Phasing_0.Enable:=1;
		ELSE;
			MC_BR_Phasing_0.Enable:=0;
		END_IF;
    IF bCmd_PhaseOffset AND NOT(gstCycA[7].CycManTimSet.bSCyc) THEN
			MC_BR_Phasing_0.InitData:=1;
      bCmd_PhaseOffset := 0 ;
      // Calculation new phase Drum/Master 
      rTemp_[4] := rSP_PhaseOffset/gA[15].InchPerDeg ;
      rTemp_[5] := gRecipeActive.rHMPerf_PhasMasterDeg + rTemp_[4]*gA[15].rRSynNum/gA[15].rRSynDen ;
      gRecipeActive.rHMPerf_PhasMasterDeg := H_FC_Modulus (IN_rMod := 360, IN_rVar := rTemp_[5]) ;
      iTest_[2] := iTest_[2] + 1 ;
		ELSE
			MC_BR_Phasing_0.InitData:=0;
		END_IF
		MC_BR_Phasing_0.Shift               := rSP_PhaseOffset*gA[9].UnitsPerInch; 
		MC_BR_Phasing_0.Velocity            := 6*gA[15].AxisPeriod/60;
		MC_BR_Phasing_0.Acceleration        := gA[15].SP_Decel;
		MC_BR_Phasing_0.ApplicationDistance := 0.8*gA[9].AxisPeriod * gA[15].rRSynNum/gA[15].rRSynDen ;
    MC_BR_Phasing_0.ApplicationMode     := mcTIME_BASED ; //mcMASTER_DISTANCE_BASED;
		MC_BR_Phasing_0.ShiftMode           := mcRELATIVE;
		MC_BR_Phasing_0();	
    
    IF MC_BR_Phasing_0.ShiftAttained THEN 
      g_bHMP_PhasInProgres   := 0 ;
      gA[15].Cmd_PhaseOffset := 0 ;
    END_IF
    

    //*********************** AXIS PHASE CONTROL (Inches) TIMING SETTING *********************
    IF gstCycA[7].CycManTimSet.bSCyc THEN 
      IF gA[15].Cmd_ManuTimSetPlus THEN 
        rAxisTimSet_SP_Vel := gr_rAxisTimSet_SP_Vel*gA[9].AxisPeriod/60 / (gA[15].rRSynNum/gA[15].rRSynDen) ;
      ELSE
        rAxisTimSet_SP_Vel := - gr_rAxisTimSet_SP_Vel*gA[9].AxisPeriod/60 / (gA[15].rRSynNum/gA[15].rRSynDen) ;
      END_IF 
        rAxisTimSet_SP_Acc := gr_rAxisTimSet_SP_Acc*gA[9].AxisPeriod/60/60 ;
    END_IF 
    
    MC_BR_Phasing_1.Slave                  := gA[15].Ident;
    MC_BR_Phasing_1.Enable                 := gstCycA[7].CycManTimSet.bCyc ;
    MC_BR_Phasing_1.InitData               := gstCycA[7].CycManTimSet.bSCyc ;
    MC_BR_Phasing_1.PerformVelocityControl := gstCycA[7].CycManTimSet.CmdMov ;
    MC_BR_Phasing_1.Velocity               := rAxisTimSet_SP_Vel ;
    MC_BR_Phasing_1.Acceleration           := rAxisTimSet_SP_Acc ;
    MC_BR_Phasing_1.ApplicationMode        := mcVELOCITY_CONTROL ;
    MC_BR_Phasing_1();  
    st_TON_0(IN:=NOT(MC_BR_Phasing_1.Enable),PT:=T#100ms) ;
    
    IF NOT(gstCycA[7].CycManTimSet.CmdMov) AND 
       MC_BR_Phasing_1.ShiftAttained       OR 
       NOT(gstCycA[7].CycManTimSet.bCyc)   OR 
       MC_BR_Phasing_1.Error               AND         
       1                                   THEN            
      gstCycA[7].CycManTimSet.CmdStop := 0 ;
    END_IF 
       
	END_IF

END_PROGRAM
