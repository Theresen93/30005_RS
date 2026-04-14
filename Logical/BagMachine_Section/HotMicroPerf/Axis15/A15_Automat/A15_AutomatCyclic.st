(********************************************************************
 * COPYRIGHT -- Microsoft
 ********************************************************************
 * Program: A15_Automat
 * File: A15_AutomatCyclic.st
 * Author: dominique
 * Created: November 03, 2011
 ********************************************************************
 * Implementation of program A15_Automat
 ********************************************************************)

PROGRAM _CYCLIC

        

(**** STRAIGHT GEARED CAM AUTOMAT WITH ABSOLUTE PHASE SYNCHRONIZATION FOR DRUM ***)


  MC_BR_AutControl_0.Signal1 := (MC_BR_AutControl_0.ActualStateIndex=0) ;

  MC_BR_AutControl_0.Signal3 := g_stHMPerfCyc.Cmd_SynchroOff ;
  IF g_stHMPerfCyc.Cmd_SynchroOff            AND 
     (MC_BR_AutControl_0.ActualStateIndex=4) THEN   
    g_stHMPerfCyc.Cmd_SynchroOn  := 0 ; 
    g_stHMPerfCyc.Cmd_SynchroOff := 0 ; 
  END_IF 
  
  // Synchro OK indicator 
  gstCycA[15].CycManTimSet.bSynchroOkSlavA[15] := ( MC_BR_InitMasterParIDTransfer_0.MasterParID = gstCycA[15].CycManTimSet.uiMasterParID ) AND 
                                                  ( MC_BR_AutControl_0.ActualStateIndex = 4 )                                              AND  
                                                  gA[15].Ind_SynchronizedMotion AND ParID_Ready ;        
  gstCycA[15].CycManTimSet.bSynchroOkSlavA[15] := gstCycA[15].CycManTimSet.bSynchroOkSlavA[15] ;                                                                                          
  
     
   
	Synch_Request := gA[15].Cmd_SynchronizedMotion;
	IF (Synch_Request AND NOT ParID_Ready) THEN
	  MC_BR_InitMasterParIDTransfer_0.Master:= gA[9].Ident ; 
    MC_BR_InitMasterParIDTransfer_0.Slave:= gA[15].Ident ;
    MC_BR_InitMasterParIDTransfer_0.MasterParID:= 412 ; // ParID 412 = 412: VAX: Position (in case virtual axis)
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

		(**** Calculate Slave Start Offset ****)
      MasterOffset := gRecipeActive.rHMPerf_OffsetIn ;
			PositionOffset:= REAL_TO_DINT((gA[9].PositionInch-(gA[15].PositionInch-MasterOffset))*1000);
			PositionMOD:= REAL_TO_DINT(gRecipeActive.Repeat*1000);
			SlaveStartOffset:= (DINT_TO_REAL(PositionOffset MOD PositionMOD))/1000;
			IF (SlaveStartOffset >= (0.5*gRecipeActive.Repeat)) THEN
				SlaveStartOffset := SlaveStartOffset - gRecipeActive.Repeat;
			END_IF
			IF (SlaveStartOffset < (-0.5*gRecipeActive.Repeat)) THEN
				SlaveStartOffset := SlaveStartOffset + gRecipeActive.Repeat;
      END_IF
    
    // Master Slave periode
    IF gRecipeActive.bHMPerf_Mode THEN 
      // Case Interrupt
      rMaster_AxisPeriod := gA[9].AxisPeriod * gRecipeActive.iHMPerf_Up ;
      rSlave_AxisPeriod  := gA[15].AxisPeriod ;
    ELSE
      // Case Continu
      rMaster_AxisPeriod := gA[9].AxisPeriod * gA[15].rRSynDen ;
      rSlave_AxisPeriod  := gA[15].AxisPeriod * gA[15].rRSynNum ;
    END_IF
      
		(*general automat parameter*)
			(*AutData.Master			  	:= gA1.Ident;*)
			AutData.MasterParID	  		:= MasterParID;
			AutData.StartPosition  		:= 0;
			AutData.StartInterval	  	:= gA[9].AxisPeriod;
			AutData.MaxMasterVelocity	:= gr_rMachMaxSpeed_BPM ;

		(*Automat STATE 0 Basis State*)
			AutData.State[0].Event[0].Type		  := ncSIGNAL1;
			AutData.State[0].Event[0].Attribute	:= ncAT_ONCE;
      AutData.State[0].Event[0].NextState := 1;


      rTemp_[0] := gA[15].PositionDeg ;
      rTemp_[1] := gA[9].PositionDeg ;
          
    // Master/Slave synchro calculation   
      rOffsetDeg := gRecipeActive.rHMPerf_OffsetIn/gRecipeActive.Repeat * 360.0 ;
      // Pos Master in Slave range
      rTemp_[2] := gA[15].rRSynNum/gA[15].rRSynDen * gA[9].PositionDeg ;
      // Slave distance to be synchronized
      rTemp_[3] := rTemp_[2] - gA[15].PositionDeg + rOffsetDeg ;
      rSlCompDist := rTemp_[3] ;
      IF rSlCompDist > 360 THEN 
        rSlCompDist := rSlCompDist - 360.0 ; 
      END_IF ;  
      IF rSlCompDist < 0 THEN 
        rSlCompDist := rSlCompDist + 360.0 ; 
      END_IF ;  

		//Automat STATE 1 Master/Slave Absolute Phase Correction
      AutData.State[1].MasterParID     := MasterParID ;
			AutData.State[1].CamProfileIndex := 16#FFFF;
			AutData.State[1].MasterFactor		 := REAL_TO_UDINT(rMaster_AxisPeriod*5);
      AutData.State[1].SlaveFactor     := REAL_TO_UDINT((rSlave_AxisPeriod*5)+(rSlCompDist*gA[15].UnitsPerDeg));
			AutData.State[1].CompMode			   := ncOFF;

      AutData.State[1].Event[0].Type      := ncST_END;
      AutData.State[1].Event[0].Attribute := ncST_END;
      AutData.State[1].Event[0].NextState := 3;
      
      AutData.State[1].Event[1].Type      := ncSIGNAL3;
      AutData.State[1].Event[1].Attribute := ncAT_ONCE;
      AutData.State[1].Event[1].NextState := 0;
      

    //Automat STATE 2 Master/Slave Transition
      (*AutData.State[2].CamProfileIndex    := 16#FFFF;
      AutData.State[2].MasterFactor       := REAL_TO_UDINT(rMaster_AxisPeriod);
      AutData.State[2].SlaveFactor        := REAL_TO_UDINT(rSlave_AxisPeriod);
      AutData.State[2].CompMode           := ncSL_ABS;
      AutData.State[2].MasterCompDistance := gA[9].AxisPeriod * 4 ;
      AutData.State[2].SlaveCompDistance  := gA[11].AxisPeriod ;
      AutData.State[2].ExtendedCompLimits := ncOFF;

      AutData.State[2].Event[0].Type      := ncST_END;
      AutData.State[2].Event[0].Attribute  := ncST_END;
      AutData.State[2].Event[0].NextState  := 3;*)
      
    //Automat STATE 3 Master/Slave Run
      AutData.State[3].MasterParID     := MasterParID ;
      AutData.State[3].CamProfileIndex := 16#FFFF;
      AutData.State[3].MasterFactor     := REAL_TO_UDINT(rMaster_AxisPeriod);
      AutData.State[3].SlaveFactor     := REAL_TO_UDINT(rSlave_AxisPeriod);
      AutData.State[3].CompMode         := ncOFF;

      AutData.State[3].Event[0].Type      := ncST_END;
      AutData.State[3].Event[0].Attribute  := ncST_END;
      AutData.State[3].Event[0].NextState  := 3;

      AutData.State[3].Event[1].Type      := ncST_END+ncNEGATIVE;
      AutData.State[3].Event[1].Attribute := ncST_END;
      AutData.State[3].Event[1].NextState := 3;

      AutData.State[3].Event[2].Type      := ncSIGNAL3;
      AutData.State[3].Event[2].Attribute := ncAT_ONCE;
      AutData.State[3].Event[2].NextState := 4;
      
    //Automat STATE 4 Stop
      AutData.State[4].MasterParID     := MasterParID ;
      AutData.State[4].CamProfileIndex := 16#FFFF;
      AutData.State[4].MasterFactor    := REAL_TO_UDINT(rMaster_AxisPeriod);
      AutData.State[4].SlaveFactor     := REAL_TO_UDINT(0.0);
      AutData.State[4].CompMode        := ncOFF;

      AutData.State[4].Event[0].Type       := ncAT_ONCE;
      AutData.State[4].Event[0].Attribute  := ncAT_ONCE;
      AutData.State[4].Event[0].NextState  := 0;
      
      
			MC_BR_AutControl_0.Enable 		 := 1;
			MC_BR_AutControl_0.AdrAutData  := ADR(AutData);
			MC_BR_AutControl_0.InitAutData := 1;
	END_IF
			(* wait for initialization done or restart *)
			IF ((MC_BR_AutControl_0.AutDataInitialized=1) AND (Synch_Request)) THEN
				MC_BR_AutControl_0.InitAutData := 0;
				MC_BR_AutControl_0.Enable :=1;
				AutomatStart := 1;;
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

	gA[15].Ind_AutomatEnabled:=MC_BR_AutControl_0.Enable;
	gA[15].Ind_CurrentAutomatState:=MC_BR_AutControl_0.ActualStateIndex;
  gA[15].Ind_bSynchroOK := (MC_BR_AutControl_0.ActualStateIndex = 3) AND gA[15].Ind_SynchronizedMotion ; ;

	(********************** MC_AUTCONTROL *************************)
	MC_BR_AutControl_0.Slave:= gA[15].Ident;
	MC_BR_AutControl_0();

END_PROGRAM
