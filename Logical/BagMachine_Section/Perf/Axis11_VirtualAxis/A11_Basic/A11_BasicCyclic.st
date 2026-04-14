(********************************************************************
 * COPYRIGHT -- Microsoft
 ********************************************************************
 * Program: A11_Basic
 * File: A11_BasicCyclic.st
 * Author: pkiel
 * Created: July 22, 2011
 ********************************************************************
 * Implementation of program A11_Basic
 ********************************************************************)

PROGRAM _CYCLIC

	gA[11].UnitsPerInch := gA[11].AxisPeriod/gRecipeActive.Repeat;
  gA[11].InchPerDeg := gRecipeActive.Repeat / 360 ;
  

	IF (gA[11].Ident<>0) THEN

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
		MC_BR_ReadDriveStatus_0.Axis := gA[11].Ident;
		MC_BR_ReadDriveStatus_0.AdrDriveStatus := ADR (DriveStatus);
		MC_BR_ReadDriveStatus_0();
		gA[11].Ind_Simulation		:=	DriveStatus.Simulation;
		gA[11].Ind_NetworkInit		:=	DriveStatus.NetworkInit;
		gA[11].Input_Home			:=	DriveStatus.HomeSwitch;
		gA[11].Input_PosHW			:=	DriveStatus.PosHWSwitch;
		gA[11].Input_NegHW			:=	DriveStatus.NegHWSwitch;
		gA[11].Input_Trigger1		:=	DriveStatus.Trigger1;
		gA[11].Input_Trigger2		:=	DriveStatus.Trigger2;
		gA[11].Input_DriveEnable		:=	DriveStatus.DriveEnable;
		gA[11].Ind_ControllerReady	:=	DriveStatus.ControllerReady;
		gA[11].Ind_ControllerStatus	:=	DriveStatus.ControllerStatus;
		gA[11].Error					:=	DriveStatus.AxisError;
		gA[11].Ind_LagWarning		:=	DriveStatus.LagWarning;

	(************************ READ AXIS ERROR **********************)
		MC_ReadAxisError_0.Enable := gA[11].Ind_NetworkInit;
		MC_ReadAxisError_0.Axis := gA[11].Ident;
		MC_ReadAxisError_0.DataAddress := ADR(gA[11].ErrorText);
		MC_ReadAxisError_0.DataLength := SIZEOF(gA[11].ErrorText);
		MC_ReadAxisError_0.DataObjectName := 'Error_Eng';
		MC_ReadAxisError_0();
		IF(MC_ReadAxisError_0.Valid) THEN
			gA[11].ErrorID := MC_ReadAxisError_0.AxisErrorID;
			gA[11].ErrorCount := MC_ReadAxisError_0.AxisErrorCount;
		END_IF
	(* Auto Acknowledge Errors *)
		IF (gA[11].Cmd_Reset AND (gA[11].ErrorCount<>0) AND NOT AutoAck) THEN
			AutoAck:=1;
		ELSE
			AutoAck:=0;
		END_IF
	(*Axis Error Acknowledge*)
		IF (EDGEPOS(AutoAck) OR EDGEPOS(gA[11].ErrorAck)) THEN
			MC_ReadAxisError_0.Acknowledge := 1;
		ELSE;
			MC_ReadAxisError_0.Acknowledge :=0;
		END_IF

	(************************ RESET AXIS ERROR **********************)
		IF (gA[11].Cmd_Reset AND (gA[11].ErrorCount=0) AND gA[11].ErrorStop) THEN
			MC_Reset_0.Execute:=1;
		END_IF
		IF (MC_Reset_0.Done) THEN
			MC_Reset_0.Execute:=0;
			gA[11].Cmd_Reset:=0;
			ResetError := 0;
		END_IF
		IF (MC_Reset_0.Error) THEN
			MC_Reset_0.Execute:=0;
			gA[11].Cmd_Reset:=0;
			ResetError := 1;
		END_IF
		MC_Reset_0.Axis:=gA[11].Ident;
		MC_Reset_0();

	(************************ READ AXIS STATUS *************************)
		MC_ReadStatus_0.Enable := gA[11].Ind_NetworkInit;
		MC_ReadStatus_0.Axis := gA[11].Ident;
		MC_ReadStatus_0();
		IF(MC_ReadStatus_0.Valid = TRUE)THEN
			gA[11].Ind_Enabled 			:= NOT (MC_ReadStatus_0.Disabled);
			gA[11].Ind_StandStill		:= MC_ReadStatus_0.StandStill;
			gA[11].Ind_Stopping			:= MC_ReadStatus_0.Stopping;
			gA[11].Ind_DiscreteMotion	:= MC_ReadStatus_0.DiscreteMotion;
			gA[11].Ind_ContinuousMotion	:= MC_ReadStatus_0.ContinuousMotion;
			gA[11].Ind_SynchronizedMotion:= MC_ReadStatus_0.SynchronizedMotion;
			gA[11].ErrorStop				:= MC_ReadStatus_0.Errorstop;
		END_IF

	(******************** INIT POSITION MODULUS  *********************)
		MC_BR_InitModPos_0.Execute:= InitModPosition;
		MC_BR_InitModPos_0.Axis:= gA[11].Ident;
		MC_BR_InitModPos_0.Period:= REAL_TO_UDINT(gA[11].AxisPeriod);
		MC_BR_InitModPos_0.Factor:=1;
		InitModPos_Done:=MC_BR_InitModPos_0.Done;
		MC_BR_InitModPos_0();
	
	(******************** INIT ENDLESS POSITION *********************)
		MC_BR_InitEndlessPosition_0.Execute:= InitModPos_Done;
		MC_BR_InitEndlessPosition_0.Axis:= gA[11].Ident;
		MC_BR_InitEndlessPosition_0.DataAddress:= ADR(gEndPosData[11]);
		IF (MC_BR_InitEndlessPosition_0.Done) THEN
			InitModPosition:=0;
			InitEndlessPosition:=0;
			HomeRestore:=1;
		END_IF
		MC_BR_InitEndlessPosition_0();

	(************************ HOME AXIS FIRST POWER UP **********************)
		IF (HomeRestore AND NOT gA11_FirstHomed) THEN
			MC_Home_0.Execute:=1;
		END_IF
		MC_Home_0.Axis:=gA[11].Ident;
		MC_Home_0.Position:=0;
		MC_Home_0.HomingMode:=mcHOME_DIRECT;
		IF (MC_Home_0.Done) THEN
			MC_Home_0.Execute:=0;
			gA11_FirstHomed:=1;
		END_IF
		MC_Home_0();

	(************************ HOME AXIS **********************)
		IF (gA11_FirstHomed)     AND 
       //NOT(gA[11].Ind_Homed) AND 
       //g_bPerfInMatchedSpeed AND 
       //gA[1].Ind_Homed       AND           
       1                     THEN
			MC_Home_1.Execute:=HomeRestore;
		END_IF
		MC_Home_1.Axis:=gA[11].Ident;
		MC_Home_1.Position:=0;
		MC_Home_1.HomingMode:=mcHOME_RESTORE_POS;
		IF (MC_Home_1.Done) THEN
			gA[11].Ind_Homed:=1;
			HomeRestore:=0;
		END_IF
		MC_Home_1();

	(******************** READ ACTUAL POSITION *********************)
		MC_ReadActualPosition_0.Enable:= gA[11].Ind_NetworkInit;
		MC_ReadActualPosition_0.Axis:= gA[11].Ident;
		MC_ReadActualPosition_0();
		IF(MC_ReadActualPosition_0.Valid = TRUE)THEN
			gA[11].PositionCount := MC_ReadActualPosition_0.Position;
			gA[11].PositionInch := gA[11].PositionCount/gA[11].UnitsPerInch;
			gA[11].PositionDeg := gA[11].PositionCount/gA[11].UnitsPerDeg;
		END_IF
    
  //******************** READ SET POINT POSITION ********************* 
    // Slave side  : ParID 412 S_SET_VAX1 : 412: VAX: Position 
    // Master side : ParID 412 S_SET_VAX1 : 412: VAX: Position 
    
    // Slave side 
    MC_BR_CyclicRead_0.Axis        := gA[11].Ident ;
    MC_BR_CyclicRead_0.Enable      := gA[11].Ind_NetworkInit;
    MC_BR_CyclicRead_0.ParID       := 412 ;
    MC_BR_CyclicRead_0.DataAddress := ADR(iiSP_SlPos_U);
    MC_BR_CyclicRead_0.DataType    := ncPAR_TYP_DINT ;
    // Master side 
    MC_BR_CyclicRead_1.Axis        := gA[9].Ident ;
    MC_BR_CyclicRead_1.Enable      := gA[11].Ind_NetworkInit;
    MC_BR_CyclicRead_1.ParID       := 412 ;
    MC_BR_CyclicRead_1.DataAddress := ADR(iiSP_MaPos_U);
    MC_BR_CyclicRead_1.DataType    := ncPAR_TYP_DINT ;
    
    IF MC_BR_CyclicRead_0.Valid THEN
      rSP_SlPos_Deg := iiSP_SlPos_U/gA[11].UnitsPerDeg ;
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
  IF gA[11].rRSynDen > 0.0 THEN 
    rTempActPhasDeg := rSP_SlPos_Deg - gA[11].rRSynNum / gA[11].rRSynDen * rSP_MaPos_Deg ;
    gA[11].rActPhasDeg := H_FC_Modulus ( 
                              IN_rMod := 360 * gA[11].rRSynNum / gA[11].rRSynDen ,
                              IN_rVar := rTempActPhasDeg 
                                      ) ;
  END_IF


	(******************** READ ACTUAL VELOCITY *********************)
		IF(MC_ReadActualVelocity_0.Error=TRUE) THEN
			MC_ReadActualVelocity_0.Enable:= 0;
		ELSE
			MC_ReadActualVelocity_0.Enable:= 1;
		END_IF
		MC_ReadActualVelocity_0.Axis:= gA[11].Ident;
		MC_ReadActualVelocity_0();
		IF(MC_ReadActualVelocity_0.Valid = TRUE)THEN
			gA[11].ActualVelocity := MC_ReadActualVelocity_0.Velocity*60/gA[11].SP_MotorPPR;
			IF (gA[11].ActualVelocity>1) THEN
				gA[11].Ind_InMotion:=1;
			ELSE
				gA[11].Ind_InMotion:=0;
			END_IF
		END_IF
		
	(************************ AXIS VELOCITY MOVE **********************)
		MC_MoveVelocity_0.Axis:=gA[11].Ident;
		MC_MoveVelocity_0.Velocity:=gA[11].SP_Velocity*gA[11].AxisPeriod/60;
		MC_MoveVelocity_0.Acceleration:=gA[11].SP_Accel;
		MC_MoveVelocity_0.Deceleration:=gA[11].SP_Decel;
		MC_MoveVelocity_0.Direction:=mcPOSITIVE_DIR;
		IF ((EDGEPOS(gA[11].Cmd_ContinuousMotion)) OR (EDGEPOS(gA[11].Cmd_ContinuousMotionUpdate))) THEN
			MC_MoveVelocity_0.Execute:=1;
		ELSE
			MC_MoveVelocity_0.Execute:=0;
		END_IF;
		MC_MoveVelocity_0();
    
  //************************ AXIS OVERRIDE **********************
    MC_SetOverride_0.Axis      := gA[11].Ident ;   
    MC_SetOverride_0.Enable    := gA[11].Cmd_Override ;
    MC_SetOverride_0.VelFactor := gA[11].rSP_OverrideV ;  
    MC_SetOverride_0.AccFactor := gA[11].rSP_OverrideA ;  
    IF (MC_SetOverride_0.Enabled) OR 
       (MC_SetOverride_0.Error)   THEN
      gA[11].Cmd_Override := 0 ;
    END_IF
    MC_SetOverride_0();  

	(************************ AXIS STOP **********************)
		MC_Stop_0.Axis:=gA[11].Ident;
		IF (gA[11].Ind_ContinuousMotion AND NOT gA[11].Cmd_ContinuousMotion) THEN
			MC_Stop_0.Deceleration:=gA[11].SP_Decel;
			MC_Stop_0.Execute:=1;
		END_IF
		IF (MC_Stop_0.Done OR MC_Stop_0.CommandAborted OR MC_Stop_0.Error) THEN
			MC_Stop_0.Execute:=0;
		END_IF
		MC_Stop_0();
    
    (************************ SHIFTING PERF CONTROL **********************)
    IF (g_iMachType = C_iRS26) THEN     
      g_iNumBagPerfTear := REAL_TO_INT(gr_rDistPerfTearRS26_mm/gRecipeActive.Repeat/25.4) ;
      IF gA[12].bInMach THEN // Case Enveloppe Bag
        IF gRecipeActive.bSelEnvBProd THEN // Case Enveloppe Bag On
          g_iNumBagPerfTear := REAL_TO_INT(gr_rDistPerfTearEnvBOn_mm/gRecipeActive.Repeat/25.4) ;
        ELSE
          IF (g_rNumbPliers=2) THEN  // Case Enveloppe Bag Off and bags size 2 grippers 
            g_iNumBagPerfTear := REAL_TO_INT(gr_rDistPerfTearEnvBOff2_mm/gRecipeActive.Repeat/25.4) ;
          ELSE                       // Case Enveloppe Bag Off and bags size 4 grippers 
            g_iNumBagPerfTear := REAL_TO_INT(gr_rDistPerfTearEnvBOff4_mm/gRecipeActive.Repeat/25.4) ;
          END_IF    
        END_IF    
      END_IF
    ELSIF (g_iMachType = C_iRS15) THEN   
      g_iNumBagPerfTear := REAL_TO_INT(gr_rDistPerfTearRS15_mm/gRecipeActive.Repeat/25.4) ; 
    END_IF
    // Limit to avoid value out of array range  
    g_iNumBagPerfTear := LIMIT(0,g_iNumBagPerfTear,C_iMaxBagPerfTear) ;
    
    IF gstCycA[1].CycManTimSet.CmdMov THEN 
      g_iArrayBagPerfTear := g_iArrayBagPerfTearNul ;
      gA[1].Cmd_PhaseOffset := 0 ;
      g_iCountPerfShift[1] := 0 ;
      g_iCountPerfShift[2] := 0 ;
    END_IF;
    
    IF (g_iCountPerfShift[1] > 0)     AND 
       EDGENEG(g_bPerfInMatchedSpeed) AND 
       g_bMachineRun                  AND 
       NOT(gRun_Stop)                 OR 
       bTest_[1]                      THEN
       bTest_[1] := 0 ; 
      FOR iIndex := g_iNumBagPerfTear-1 TO 1 BY -1 DO
        g_iArrayBagPerfTear[iIndex+1] := g_iArrayBagPerfTear[iIndex] ;
      END_FOR
      g_iArrayBagPerfTear[1] := 0 ;
    END_IF
    
    IF gA[1].Cmd_PhaseOffset THEN 
      g_iCountPerfShift[1] := g_iCountPerfShift[1] + 1 ;
      g_iCountPerfShift[2] := g_iCountPerfShift[1] ;
      IF g_bPerfShiftPos THEN
        g_iArrayBagPerfTear[1] := 1 ;
      ELSE  
        g_iArrayBagPerfTear[1] := -1 ;
      END_IF
      g_bPerfShiftPos := 0 ;
    END_IF
    
    (************************ AXIS PHASE CONTROL (Inches) **********************)
    MC_BR_Phasing_0.Slave:=gA[11].Ident;
    IF gA[1].Ind_SynchronizedMotion AND gA[11].Ind_SynchronizedMotion AND NOT(gstCycA[1].CycManTimSet.bSCyc) AND st_TON_0.Q THEN
      MC_BR_Phasing_0.Enable:=1;
    ELSE;
      MC_BR_Phasing_0.Enable:=0;
    END_IF;
    IF gA[1].Cmd_PhaseOffset  AND NOT(gstCycA[1].CycManTimSet.bSCyc) THEN
      MC_BR_Phasing_0.InitData:=1;
      gA[1].Cmd_PhaseOffset:=0;
      // Calculation new phase Drum/Master 
      rTemp_[4] := gA[1].SP_PhaseOffset/gA[11].InchPerDeg ;
      rTemp_[5] := gRecipeActive.rPerf_PhasMasterDeg + rTemp_[4] ;
      gRecipeActive.rPerf_PhasMasterDeg := H_FC_Modulus (IN_rMod := 360, IN_rVar := rTemp_[5]) ;
      rTest_[0] := rTest_[0] + 1 ;
    ELSE
      MC_BR_Phasing_0.InitData:=0;
    END_IF
    MC_BR_Phasing_0.ApplicationMode     := mcMASTER_DISTANCE_BASED;
    MC_BR_Phasing_0.Shift               := gA[1].SP_PhaseOffset*gA[9].UnitsPerInch;
    MC_BR_Phasing_0.Velocity            := 6*gA[11].AxisPeriod/60;
    MC_BR_Phasing_0.Acceleration        := gA[11].SP_Decel;
    //MC_BR_Phasing_0.ApplicationDistance := 0.8*gA[9].AxisPeriod;
    MC_BR_Phasing_0.ApplicationDistance := 0.5*gA[9].AxisPeriod;
    MC_BR_Phasing_0.ShiftMode           := mcRELATIVE;
    MC_BR_Phasing_0();  

    (************************ AXIS PHASE CONTROL (Inches) TIMING SETTING **********************)
    IF gstCycA[1].CycManTimSet.bSCyc THEN 
      IF gA[1].Cmd_ManuTimSetPlus THEN 
        rAxisTimSet_SP_Vel := gr_rAxisTimSet_SP_Vel*gA[9].AxisPeriod/60 / (gA[11].rRSynNum/gA[11].rRSynDen) ;
      ELSE
        rAxisTimSet_SP_Vel := - gr_rAxisTimSet_SP_Vel*gA[9].AxisPeriod/60 / (gA[11].rRSynNum/gA[11].rRSynDen) ;
      END_IF 
        rAxisTimSet_SP_Acc := gr_rAxisTimSet_SP_Acc*gA[9].AxisPeriod/60/60 ;
    END_IF 
    
    MC_BR_Phasing_1.Slave                  := gA[11].Ident;
    MC_BR_Phasing_1.Enable                 := gstCycA[1].CycManTimSet.bCyc ;
    MC_BR_Phasing_1.InitData               := gstCycA[1].CycManTimSet.bSCyc ;
    MC_BR_Phasing_1.PerformVelocityControl := gstCycA[1].CycManTimSet.CmdMov ;
    MC_BR_Phasing_1.Velocity               := rAxisTimSet_SP_Vel ;
    MC_BR_Phasing_1.Acceleration           := rAxisTimSet_SP_Acc ;
    MC_BR_Phasing_1.ApplicationMode        := mcVELOCITY_CONTROL ;
    MC_BR_Phasing_1();  
    st_TON_0(IN:=NOT(MC_BR_Phasing_1.Enable),PT:=T#100ms) ;
    
    IF NOT(gstCycA[1].CycManTimSet.CmdMov) AND 
       MC_BR_Phasing_1.ShiftAttained       OR 
       NOT(gstCycA[1].CycManTimSet.bCyc)   OR 
       MC_BR_Phasing_1.Error               AND         
       1                                   THEN            
      gstCycA[1].CycManTimSet.CmdStop := 0 ;
    END_IF 
  END_IF
END_PROGRAM
