 (********************************************************************
 * COPYRIGHT -- Microsoft
 ********************************************************************
 * Program: A5_Automat
 * File: A5_AutomatCyclic.st
 * Author: pkiel
 * Created: July 13, 2011
 ********************************************************************
 * Implementation of program A5_Automat
 ********************************************************************)

PROGRAM _CYCLIC

  // Synchro ratio Master/Slave 
     // Master = Virtuel   
     gA[5].rRSynNum := gRecipeActive.Repeat ;
     gA[5].rRSynDen := g_rSizeEntryPullRol_mm / 25.4 ;
     
  // Signal synchro Holding axis
  MC_BR_AutControl_0.Signal2 := gA[3].Ind_bSynchroOK                       AND 
                                (MC_BR_AutControl_0.ActualStateIndex = 10) ;   
  MC_BR_AutControl_0.Signal3 := NOT(gA[3].Ind_bSynchroOK) ;                                 
        
  // Gear ratio assignement
  IF gReg[5].Enable THEN 
    rGearValue := gReg[5].SP_Repeat * gA[5].UnitsPerInch ; 
  ELSE
    rGearValue := gA5_GearValue ; 
  END_IF                                
        
        
(**** STRAIGHT GEARED CAM AUTOMAT WITH GEARING UPDATE AND NO ABSOLUTE PHASE SYNCHRONIZATION ***)

(* Set Up Master Position Parameter ID *)
  //Synch_Request := gA[5].Cmd_SynchronizedMotion ;
  Synch_Request := gA[5].Cmd_SynchronizedMotion AND NOT(MC_BR_AutControl_0.Stop) ;  // D.M. 26/01/2012 RS26 Pyrollpack_14661 added because after guard fault it happened that Stop=1 and Synch_Request=1 => MC_BR_AutControl_0 makes fault 29256    
	IF (Synch_Request AND NOT ParID_Ready) THEN
		MC_BR_InitMasterParIDTransfer_0.Master:=gA[9].Ident;
	    MC_BR_InitMasterParIDTransfer_0.Slave:=gA[5].Ident;
	    MC_BR_InitMasterParIDTransfer_0.MasterParID:=412;
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
			AutData.StartInterval		:= gA[9].AxisPeriod;
			AutData.MaxMasterVelocity	:= gr_rMachMaxSpeed_BPM ;

		(*Automat STATE 0 Basis State*)
			AutData.State[0].Event[0].Type		  := ncST_END;
			AutData.State[0].Event[0].Attribute	:= ncAT_ONCE;
			//AutData.State[0].Event[0].NextState	:= 1;
      AutData.State[0].Event[0].NextState  := 10;
    
    
    //Waiting synchro Holding axis 
      AutData.State[10].CamProfileIndex := 16#FFFF;
      AutData.State[10].MasterFactor    := REAL_TO_UDINT(gA[9].AxisPeriod);
      AutData.State[10].SlaveFactor     := 0;
      AutData.State[10].CompMode        := ncOFF;

      AutData.State[10].Event[0].Type      := ncSIGNAL3 ;
      AutData.State[10].Event[0].Attribute := ncAT_ONCE ;
      AutData.State[10].Event[0].NextState := 0;

      AutData.State[10].Event[0].Type      := ncSIGNAL2 ;
      AutData.State[10].Event[0].Attribute := ncAT_ONCE ;
      AutData.State[10].Event[0].NextState := 1;


		(*Automat STATE 1 Master/Slave Run*)
			AutData.State[1].CamProfileIndex := 16#FFFF;
			AutData.State[1].MasterFactor		 := REAL_TO_UDINT(gA[9].AxisPeriod);
			AutData.State[1].SlaveFactor		 := REAL_TO_UDINT(rGearValue);
			AutData.State[1].CompMode			   := ncOFF;

			AutData.State[1].Event[0].Type		:= ncST_END;
			AutData.State[1].Event[0].Attribute	:= ncST_END;
			AutData.State[1].Event[0].NextState	:= 1;

			AutData.State[1].Event[1].Type		:= ncST_END+ncNEGATIVE;
			AutData.State[1].Event[1].Attribute	:= ncST_END;
			AutData.State[1].Event[1].NextState	:= 1;

      AutData.State[1].Event[2].Type    := ncSIGNAL1;
      AutData.State[1].Event[2].Attribute  := ncAT_ONCE;
      AutData.State[1].Event[2].NextState  := 1;

      AutData.State[1].Event[3].Type    := ncSIGNAL3;
      AutData.State[1].Event[3].Attribute  := ncAT_ONCE;
      AutData.State[1].Event[3].NextState  := 0;

			MC_BR_AutControl_0.Enable 		:= 1;
			MC_BR_AutControl_0.AdrAutData 	:= ADR(AutData);
			MC_BR_AutControl_0.InitAutData 	:= 1;
	END_IF

		(* wait for initialization done *)
			IF ((MC_BR_AutControl_0.AutDataInitialized = 1)AND(Synch_Request)) THEN
				MC_BR_AutControl_0.InitAutData 	:= 0;
        uiMC_BR_AutControl_0_MemoErrorID := 0 ;
				AutomatStart := 1;
			END_IF
		(* check if error occured *)
			IF (MC_BR_AutControl_0.ErrorID <> 0) THEN
				MC_BR_AutControl_0.Enable := 0;
        uiMC_BR_AutControl_0_MemoErrorID := MC_BR_AutControl_0.ErrorID ;
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
      IF (MC_BR_AutControl_0.Running=0) AND 
         MC_BR_AutControl_0.Stop        THEN
        MC_BR_AutControl_0.Enable := 0;
        MC_BR_AutControl_0.Stop := 0;
      END_IF
   //*************************************************
   // D.M. 26/01/2012 RS26 Pyrollpack_14661 added because after guard fault it happened that Stop=1 and MC_BR_AutControl_0.Enable => not possible to finish MC_BR_AutControl_0 => program locked   
      IF MC_BR_AutControl_0.Stop        AND 
         NOT(MC_BR_AutControl_0.Enable) THEN
        MC_BR_AutControl_0.Enable := 1 ;
      END_IF
   //*************************************************      
	END_IF
	gA[5].Ind_AutomatEnabled:=MC_BR_AutControl_0.Enable;
	gA[5].Ind_CurrentAutomatState:=MC_BR_AutControl_0.ActualStateIndex;
  gA[5].Ind_bSynchroOK := (MC_BR_AutControl_0.ActualStateIndex = 1) AND gA[5].Ind_SynchronizedMotion ;


(********************** MC_AUTCONTROL *************************)
	MC_BR_AutControl_0.Slave:= gA[5].Ident;
	MC_BR_AutControl_0();

(******************** UPDATE CAM-AUTOMAT STATE 1 **********************)
	MC_BR_InitAutState_0.MasterParID := MasterParID;
	MC_BR_InitAutState_0.Slave := gA[5].Ident;
	MC_BR_InitAutState_0.StateIndex := 1;
	MC_BR_InitAutState_0.CamProfileIndex := 16#FFFF;
	MC_BR_InitAutState_0.MasterFactor := REAL_TO_UDINT(gA[9].AxisPeriod);
	MC_BR_InitAutState_0.SlaveFactor := REAL_TO_DINT(rGearValue);
	MC_BR_InitAutState_0.CompMode := ncOFF;
	MC_BR_InitAutState_0.Execute := gA[5].Cmd_SynchronizedMotionUpdate;
	MC_BR_InitAutState_0();

  IF gA[5].Cmd_SynchronizedMotionUpdate THEN
    iTest_[2] := iTest_[2] + 1 ; 
  END_IF

	IF (MC_BR_InitAutState_0.Done) THEN
		gA[5].Cmd_SynchronizedMotionUpdate:=0;
		MC_BR_AutControl_0.Signal1:=1;
    iTest_[0] := iTest_[0] + 1 ; 
	ELSE
		MC_BR_AutControl_0.Signal1:=0;
	END_IF
  
  IF (MC_BR_InitAutState_0.Error) THEN
    gA[5].Cmd_SynchronizedMotionUpdate:=0;
    MC_BR_InitAutState_0.Execute := 0;
    iTest_[1] := iTest_[1] + 1 ; 
  END_IF

END_PROGRAM
