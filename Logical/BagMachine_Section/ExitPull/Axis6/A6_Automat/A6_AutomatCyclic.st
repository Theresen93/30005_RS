(********************************************************************
 * COPYRIGHT -- Microsoft
 ********************************************************************
 * Program: A6_Automat
 * File: A6_AutomatCyclic.st
 * Author: pkiel
 * Created: July 13, 2011
 ********************************************************************
 * Implementation of program A6_Automat
 ********************************************************************)

PROGRAM _CYCLIC
  
  // Synchro ratio Master/Slave 
     // Master = EntryPull   
     gA[6].rRSynNum := g_rSizeEntryPullRol_mm ;
     gA[6].rRSynDen := g_rSizeExitPullRol_mm ;

(**** STRAIGHT GEARED CAM AUTOMAT WITH GEARING UPDATE AND NO ABSOLUTE PHASE SYNCHRONIZATION ***)

(* Set Up Master Position Parameter ID *)
	Synch_Request := gA[6].Cmd_SynchronizedMotion;
  IF (Synch_Request AND NOT ParID_Ready) THEN
    MC_BR_InitMasterParIDTransfer_0.Master:=gA[5].Ident;
    MC_BR_InitMasterParIDTransfer_0.Slave:=gA[6].Ident;
    MC_BR_InitMasterParIDTransfer_0.MasterParID:=428;
    MC_BR_InitMasterParIDTransfer_0.SlaveChannel:=0;
	    MC_BR_InitMasterParIDTransfer_0.Execute:=TRUE;
	    IF (MC_BR_InitMasterParIDTransfer_0.Done) THEN
	      MasterParID:=MC_BR_InitMasterParIDTransfer_0.ReceiveParID;
	      MC_BR_InitMasterParIDTransfer_0.Execute:=FALSE;
	      ParID_Ready:=1;
	    ELSIF (MC_BR_InitMasterParIDTransfer_0.Error) THEN
	    (*Store ErrorID in a variable,
	      ErrorID is reset on falling edge of 'Execute'*)
	      ErrorID:=MC_BR_InitMasterParIDTransfer_0.ErrorID;
	      ParID_Ready:=0;
	      MC_BR_InitMasterParIDTransfer_0.Execute:=FALSE;
	    END_IF
	END_IF
	MC_BR_InitMasterParIDTransfer_0();
	
(**** Initialize Automat Parameters Upon Automat Start Request ****)
	
	IF (EDGEPOS(ParID_Ready))THEN
		(*general automat parameter*)
			(*AutData.Master				:= gA[1].Ident;*)
			AutData.MasterParID			:= MasterParID;
			AutData.StartPosition		:= 0;
			AutData.StartInterval		:= gA[5].AxisPeriod;
			AutData.MaxMasterVelocity	:= gr_rMachMaxSpeed_BPM ;

		(*Automat STATE 0 Basis State*)
			AutData.State[0].Event[0].Type		:= ncST_END;
			AutData.State[0].Event[0].Attribute	:= ncAT_ONCE;
			AutData.State[0].Event[0].NextState	:= 1;

		(*Automat STATE 1 Master/Slave Run*)
			AutData.State[1].CamProfileIndex	:= 16#FFFF;
      //AutData.State[1].MasterFactor    := REAL_TO_UDINT(gA[5].UnitsPerInch*rSizeEntryPullRol_In);
      AutData.State[1].MasterFactor    := REAL_TO_UDINT(gA[5].AxisPeriod);
			AutData.State[1].SlaveFactor		:= REAL_TO_UDINT(gA6_GearValue);
			AutData.State[1].CompMode			:= ncOFF;

			AutData.State[1].Event[0].Type		:= ncST_END;
			AutData.State[1].Event[0].Attribute	:= ncST_END;
			AutData.State[1].Event[0].NextState	:= 1;

			AutData.State[1].Event[1].Type		:= ncST_END+ncNEGATIVE;
			AutData.State[1].Event[1].Attribute	:= ncST_END;
			AutData.State[1].Event[1].NextState	:= 1;

			AutData.State[1].Event[2].Type		:= ncSIGNAL1;
			AutData.State[1].Event[2].Attribute	:= ncAT_ONCE;
			AutData.State[1].Event[2].NextState	:= 1;

			MC_BR_AutControl_0.Enable 		:= 1;
			MC_BR_AutControl_0.AdrAutData 	:= ADR(AutData);
			MC_BR_AutControl_0.InitAutData 	:= 1;
	END_IF

		(* wait for initialization done *)
			IF ((MC_BR_AutControl_0.AutDataInitialized = 1)AND(Synch_Request)) THEN
				MC_BR_AutControl_0.InitAutData 	:= 0;
				AutomatStart := 1;
			END_IF
		(* check if error occured *)
			IF (MC_BR_AutControl_0.ErrorID <> 0) THEN
				MC_BR_AutControl_0.Enable := 0;
			END_IF

(******************** ENABLE CAM-AUTOMAT **********************)
	IF (AutomatStart) THEN
			MC_BR_AutControl_0.Start := 1;
			AutomatStart := 0;
	END_IF

	IF (NOT Synch_Request) THEN
			MC_BR_AutControl_0.Stop := 1;
			MC_BR_AutControl_0.Start := 0;
			ParID_Ready := 0;
			IF (MC_BR_AutControl_0.Running=0) THEN
				MC_BR_AutControl_0.Enable := 0;
				MC_BR_AutControl_0.Stop := 0;
			END_IF
	END_IF
	gA[6].Ind_AutomatEnabled:=MC_BR_AutControl_0.Enable;
	gA[6].Ind_CurrentAutomatState:=MC_BR_AutControl_0.ActualStateIndex;
  gA[6].Ind_bSynchroOK := (MC_BR_AutControl_0.ActualStateIndex = 1) AND gA[6].Ind_SynchronizedMotion ;

(********************** MC_AUTCONTROL *************************)
	MC_BR_AutControl_0.Slave:= gA[6].Ident;
	MC_BR_AutControl_0();

(******************** UPDATE CAM-AUTOMAT STATE 1 **********************)
	MC_BR_InitAutState_0.MasterParID := MasterParID;
	MC_BR_InitAutState_0.Slave := gA[6].Ident;
	MC_BR_InitAutState_0.StateIndex := 1;
	MC_BR_InitAutState_0.CamProfileIndex := 16#FFFF;
  //MC_BR_InitAutState_0.MasterFactor := REAL_TO_UDINT(gA[5].UnitsPerInch*gRecipeActive.Repeat);
  MC_BR_InitAutState_0.MasterFactor := REAL_TO_UDINT(gA[5].AxisPeriod);
	MC_BR_InitAutState_0.SlaveFactor := REAL_TO_DINT(gA6_GearValue);
	MC_BR_InitAutState_0.CompMode := ncOFF;
	MC_BR_InitAutState_0.Execute := gA[6].Cmd_SynchronizedMotionUpdate;
	MC_BR_InitAutState_0();

	IF (MC_BR_InitAutState_0.Done) THEN
		gA[6].Cmd_SynchronizedMotionUpdate:=0;
		MC_BR_AutControl_0.Signal1:=1;
	ELSE
		MC_BR_AutControl_0.Signal1:=0;
	END_IF
	
	IF (MC_BR_InitAutState_0.Error) THEN
		gA[6].Cmd_SynchronizedMotionUpdate:=0;
		MC_BR_InitAutState_0.Execute := 0;
	END_IF

END_PROGRAM
