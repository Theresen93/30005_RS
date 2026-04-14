(********************************************************************
 * COPYRIGHT -- Microsoft
 ********************************************************************
 * Program: A0_Basic
 * File: A0_BasicCyclic.st
 * Author: pkiel
 * Created: July 17, 2011
 ********************************************************************
 * Implementation of program A0_Basic
 ********************************************************************)

PROGRAM _CYCLIC

	IF(gA[0].Ident <> 0)THEN

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
		MC_BR_ReadDriveStatus_0.Axis := gA[0].Ident;
		MC_BR_ReadDriveStatus_0.AdrDriveStatus := ADR (DriveStatus);
		MC_BR_ReadDriveStatus_0();
		gA[0].Ind_Simulation		:=	DriveStatus.Simulation;
		gA[0].Ind_NetworkInit		:=	DriveStatus.NetworkInit;
		gA[0].Input_Home			:=	DriveStatus.HomeSwitch;
		gA[0].Input_PosHW			:=	DriveStatus.PosHWSwitch;
		gA[0].Input_NegHW			:=	DriveStatus.NegHWSwitch;
		gA[0].Input_Trigger1		:=	DriveStatus.Trigger1;
		gA[0].Input_Trigger2		:=	DriveStatus.Trigger2;
		gA[0].Input_DriveEnable		:=	DriveStatus.DriveEnable;
		gA[0].Ind_ControllerReady	:=	DriveStatus.ControllerReady;
		gA[0].Ind_ControllerStatus	:=	DriveStatus.ControllerStatus;
		gA[0].Error					:=	DriveStatus.AxisError;
		gA[0].Ind_LagWarning		:=	DriveStatus.LagWarning;

			(************************ READ AXIS ERROR **********************)
		MC_ReadAxisError_0.Enable := gA[0].Ind_NetworkInit;
		MC_ReadAxisError_0.Axis := gA[0].Ident;
		MC_ReadAxisError_0.DataAddress := ADR(gA[0].ErrorText);
		MC_ReadAxisError_0.DataLength := SIZEOF(gA[0].ErrorText);
		MC_ReadAxisError_0.DataObjectName := 'Error_Eng';
		MC_ReadAxisError_0();
		IF(MC_ReadAxisError_0.Valid) THEN
			gA[0].ErrorID := MC_ReadAxisError_0.AxisErrorID;
			gA[0].ErrorCount := MC_ReadAxisError_0.AxisErrorCount;
		END_IF
		(* Auto Acknowledge Errors *)
		IF (gA[0].Cmd_Reset AND (gA[0].ErrorCount<>0) AND NOT AutoAck) THEN
			AutoAck:=1;
		ELSE
			AutoAck:=0;
		END_IF
		(*Axis Error Acknowledge*)
		IF (EDGEPOS(AutoAck) OR EDGEPOS(gA[0].ErrorAck)) THEN
			MC_ReadAxisError_0.Acknowledge := 1;
		ELSE;
			MC_ReadAxisError_0.Acknowledge :=0;
		END_IF

		(************************ RESET AXIS ERROR **********************)
		IF (gA[0].Cmd_Reset AND (gA[0].ErrorCount=0) AND gA[0].ErrorStop) THEN
			MC_Reset_0.Execute:=1;
			gA[0].Cmd_Reset:=0;
		END_IF
		IF (MC_Reset_0.Done) THEN
			MC_Reset_0.Execute:=0;
		END_IF
		MC_Reset_0.Axis:=gA[0].Ident;
		MC_Reset_0();

		(************************ READ AXIS STATUS *************************)
		MC_ReadStatus_0.Enable := gA[0].Ind_NetworkInit;
		MC_ReadStatus_0.Axis := gA[0].Ident;
		MC_ReadStatus_0();
		IF(MC_ReadStatus_0.Valid = TRUE)THEN
			gA[0].Ind_Enabled 			:= NOT (MC_ReadStatus_0.Disabled);
			gA[0].Ind_StandStill		:= MC_ReadStatus_0.StandStill;
			gA[0].Ind_Stopping			:= MC_ReadStatus_0.Stopping;
			gA[0].Ind_DiscreteMotion	:= MC_ReadStatus_0.DiscreteMotion;
			gA[0].Ind_ContinuousMotion	:= MC_ReadStatus_0.ContinuousMotion;
			gA[0].Ind_SynchronizedMotion:= MC_ReadStatus_0.SynchronizedMotion;
			gA[0].ErrorStop				:= MC_ReadStatus_0.Errorstop;
		END_IF

		(************************ ENABLE POWER SUPPLY **********************)
		MC_Power_0.Axis:=gA[0].Ident;
		IF (MC_Power_0.Error=0 AND NOT gA[0].ErrorStop) THEN
      MC_Power_0.Enable:= gQ_CR_MainPowerOn ;
		ELSE;
			MC_Power_0.Enable:=0;
		END_IF;
		MC_Power_0();
		
		IF (gA[0].Ind_Enabled AND NOT gA[0].ErrorStop AND gPowerUp_Complete) THEN
			gDriveSupply_Ready := 1;
		ELSE
			gDriveSupply_Ready :=0;
		END_IF

		(* Cyclic Read: Power Supply Current *)
		MC_BR_PowerMeter_0.Axis := gA[0].Ident;
        MC_BR_PowerMeter_0.IntervalTime:=60000;
        MC_BR_PowerMeter_0.Mode:=mcONLY_PSM;

		MC_BR_PowerMeter_0();
		
	END_IF

END_PROGRAM
