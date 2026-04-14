(********************************************************************
 * COPYRIGHT -- Microsoft
 ********************************************************************
 * Program: A7_Automat
 * File: A7_AutomatCyclic.st
 * Author: pkiel
 * Created: July 13, 2011
 ********************************************************************
 * Implementation of program A7_Automat
 ********************************************************************)

PROGRAM _CYCLIC

        

(**** STRAIGHT GEARED CAM AUTOMAT WITH ABSOLUTE PHASE SYNCHRONIZATION FOR DRUM ***)

  // Set Up Master Position Parameter ID 
  IF gstCycA[3].CycManTimSet.CmdSynchroOn  OR 
     gstCycA[4].CycManTimSet.CmdSynchroOn  OR 
     gstCycA[12].CycManTimSet.CmdSynchroOn OR 
     gstCycA[13].CycManTimSet.CmdSynchroOn THEN 
    MC_BR_AutControl_0.Signal1 := 1 ;
    MC_BR_AutControl_0.Signal2 := 0 ;
  ELSE
    MC_BR_AutControl_0.Signal1 := 0 ;
    MC_BR_AutControl_0.Signal2 := 1 ;
  END_IF 


  
  // Select Master 
  IF gA[12].bInMach             AND 
     NOT(gA[13].bInMach)        AND 
     gRecipeActive.bSelEnvBProd THEN
    uiiMaster := gA[12].Ident ;  // Case Envelope Bag One Axis
  END_IF
  IF gA[13].bInMach THEN
    uiiMaster := gA[13].Ident ;  // Case Envelope Bag Two Axis
  END_IF
  IF NOT(gA[12].bInMach) THEN
    uiiMaster := gA[4].Ident ;   // Case without Envelope Bag
  END_IF ;
    
  // Synchro OK indicator 
  gstCycA[3].CycManTimSet.bSynchroOkSlavA[7] := ( MC_BR_InitMasterParIDTransfer_1.Master = uiiMaster )                                  AND 
                                                ( MC_BR_InitMasterParIDTransfer_1.MasterParID = gstCycA[3].CycManTimSet.uiMasterParID ) AND 
                                                ( MC_BR_AutControl_0.ActualStateIndex = 4 )                                             AND  
                                                gA[7].Ind_SynchronizedMotion AND ParID_Ready ; 
                                                
  gstCycA[4].CycManTimSet.bSynchroOkSlavA[7] := gstCycA[3].CycManTimSet.bSynchroOkSlavA[7] ;      
                                                
  gstCycA[12].CycManTimSet.bSynchroOkSlavA[7] := ( MC_BR_InitMasterParIDTransfer_1.Master = uiiMaster )                                  AND 
                                                ( MC_BR_InitMasterParIDTransfer_1.MasterParID = gstCycA[12].CycManTimSet.uiMasterParID ) AND 
                                                ( MC_BR_AutControl_0.ActualStateIndex = 4 )                                              AND  
                                                gA[7].Ind_SynchronizedMotion AND ParID_Ready ; 
                                                       
  gstCycA[13].CycManTimSet.bSynchroOkSlavA[7] := ( MC_BR_InitMasterParIDTransfer_1.Master = uiiMaster )                                  AND 
                                                ( MC_BR_InitMasterParIDTransfer_1.MasterParID = gstCycA[13].CycManTimSet.uiMasterParID ) AND 
                                                ( MC_BR_AutControl_0.ActualStateIndex = 4 )                                              AND  
                                                gA[7].Ind_SynchronizedMotion AND ParID_Ready ;                                                                                     
  
  // Drum timing setting
  IF gstCycA[7].CycManTimSet.bCyc THEN 
    IF gstCycA[7].CycManTimSet.CmdSynchroOn THEN 
      MC_BR_AutControl_0.Signal1 := 1 ;
      MC_BR_AutControl_0.Signal2 := 0 ; 
    ELSE
      MC_BR_AutControl_0.Signal1 := 0 ;
      MC_BR_AutControl_0.Signal2 := 1 ;
    END_IF 
  END_IF 
  
  IF gstCycA[3].CycManTimSet.bFCyc  AND
     gstCycA[4].CycManTimSet.bFCyc  AND 
     gstCycA[7].CycManTimSet.bFCyc  AND 
     gstCycA[12].CycManTimSet.bFCyc AND 
     gstCycA[13].CycManTimSet.bFCyc THEN 
    MC_BR_AutControl_0.Signal1 := 0 ; 
    MC_BR_AutControl_0.Signal2 := 0 ; 
  END_IF

  gstCycA[7].CycManTimSet.bSynchroOkSlavA[7] := ( MC_BR_AutControl_0.ActualStateIndex = 4 )  AND  
                                                gA[7].Ind_SynchronizedMotion AND ParID_Ready ;   
     
   
  //Synch_Request := gA[7].Cmd_SynchronizedMotion ;
  Synch_Request := gA[7].Cmd_SynchronizedMotion AND NOT(MC_BR_AutControl_0.Stop) ;  // D.M. 26/01/2012 RS26 Pyrollpack_14661 added because it happened that Stop=1 and Synch_Request=1 => MC_BR_AutControl_0 makes fault 29256    
	IF (Synch_Request AND NOT ParID_Ready) THEN
	  MC_BR_InitMasterParIDTransfer_0.Master:= gA[9].Ident ; 
    MC_BR_InitMasterParIDTransfer_0.Slave:= gA[7].Ident ;
    MC_BR_InitMasterParIDTransfer_0.MasterParID:= 412 ; // ParID 412 = 412: VAX: Position (in case virtual axis)
    MC_BR_InitMasterParIDTransfer_0.SlaveChannel:=0;
    MC_BR_InitMasterParIDTransfer_0.Execute:=TRUE;
    IF (MC_BR_InitMasterParIDTransfer_0.Done) THEN
      MasterParID:=MC_BR_InitMasterParIDTransfer_0.ReceiveParID;
      MC_BR_InitMasterParIDTransfer_0.Execute:=FALSE;
      ParID_Ready1:=1;
    ELSIF (MC_BR_InitMasterParIDTransfer_0.Error) THEN
    (*Store ErrorID in a variable,
      ErrorID is reset on falling edge of 'Execute'*)
      ErrorID:=MC_BR_InitMasterParIDTransfer_0.ErrorID;
      ParID_Ready1:=0;
      MC_BR_InitMasterParIDTransfer_0.Execute:=FALSE;
    END_IF
    MC_BR_InitMasterParIDTransfer_1.Master       := uiiMaster ;
    MC_BR_InitMasterParIDTransfer_1.Slave        := gA[7].Ident ;
    MC_BR_InitMasterParIDTransfer_1.MasterParID  := gstCycA[7].CycManTimSet.uiMasterParID ; 
    MC_BR_InitMasterParIDTransfer_1.SlaveChannel := 5 ;
    MC_BR_InitMasterParIDTransfer_1.Execute      := TRUE ;
    IF (MC_BR_InitMasterParIDTransfer_1.Done) AND ParID_Ready1 THEN
      uiMasterParID1:=MC_BR_InitMasterParIDTransfer_1.ReceiveParID;
      MC_BR_InitMasterParIDTransfer_1.Execute:=FALSE;
      ParID_Ready:=1;
    ELSIF (MC_BR_InitMasterParIDTransfer_1.Error) THEN
    (*Store ErrorID in a variable,
      ErrorID is reset on falling edge of 'Execute'*)
      ErrorID:=MC_BR_InitMasterParIDTransfer_1.ErrorID;
      ParID_Ready:=0;
      MC_BR_InitMasterParIDTransfer_1.Execute:=FALSE;
    END_IF
	END_IF
  MC_BR_InitMasterParIDTransfer_0();
  MC_BR_InitMasterParIDTransfer_1();

(**** Initialize Automat Parameters Upon Automat Start Request ****)
	IF (EDGEPOS(ParID_Ready))THEN

		(**** Calculate Slave Start Offset ****)
      MasterOffset := gRecipeActive.Drum_Offset + gRecipeActive.Holding_Offset + gRecipeActive.Tearing_Offset;
			PositionOffset:= REAL_TO_DINT((gA[9].PositionInch-(gA[7].PositionInch-MasterOffset))*1000);
			PositionMOD:= REAL_TO_DINT(gRecipeActive.Repeat*1000);
			SlaveStartOffset:= (DINT_TO_REAL(PositionOffset MOD PositionMOD))/1000;
			IF (SlaveStartOffset >= (0.5*gRecipeActive.Repeat)) THEN
				SlaveStartOffset := SlaveStartOffset - gRecipeActive.Repeat;
			END_IF
			IF (SlaveStartOffset < (-0.5*gRecipeActive.Repeat)) THEN
				SlaveStartOffset := SlaveStartOffset + gRecipeActive.Repeat;
      END_IF
      
		(*general automat parameter*)
			(*AutData.Master			  	:= gA1.Ident;*)
			AutData.MasterParID	  		:= MasterParID;
			AutData.StartPosition  		:= 0;
			AutData.StartInterval	  	:= gA[9].AxisPeriod;
			AutData.MaxMasterVelocity	:= gr_rMachMaxSpeed_BPM ;

		(*Automat STATE 0 Basis State*)
			AutData.State[0].Event[0].Type		  := ncST_END;
			AutData.State[0].Event[0].Attribute	:= ncAT_ONCE;
      IF gA[4].Ind_bInContactZone                  AND
         (g_iMachType = C_iRS15)                   AND   
         NOT(gstCycA[3].CycManTimSet.CmdSynchroOn) AND 
         NOT(gstCycA[4].CycManTimSet.CmdSynchroOn) AND 
         1                                         THEN 
        // Start synchro with tearing and Drum in contact
        AutData.State[0].Event[0].NextState := 5;
      ELSE
        IF gA[7].bSynchroReq THEN                   
          AutData.State[0].Event[0].NextState := 1;
        ELSE
          AutData.State[0].Event[0].NextState := 3;
        END_IF 
      END_IF 


      rTemp_[0] := gA[7].PositionDeg ;
      rTemp_[1] := gA[9].PositionDeg ;
    
      rSlave_AxisPeriod := gA[7].AxisPeriod * gA[7].rRSynNum/gA[7].rRSynDen;
      
    // Master/Slave synchro calculation   
      rOffsetDeg := gRecipeActive.rDrum_PhasMasterDeg ;
      // Pos Master in Slave range
      rTemp_[2] := gA[7].rRSynNum/gA[7].rRSynDen * gA[9].PositionDeg ;
      // Slave distance to be synchronized
      rTemp_[3] := rTemp_[2] - gA[7].PositionDeg + rOffsetDeg ;
      rSlCompDist := rTemp_[3] ;
      IF rSlCompDist > 180*gA[7].rRSynNum/gA[7].rRSynDen THEN 
        rSlCompDist := rSlCompDist - 360*gA[7].rRSynNum/gA[7].rRSynDen ; 
      END_IF ;  
      IF rSlCompDist < -180*gA[7].rRSynNum/gA[7].rRSynDen THEN 
        rSlCompDist := rSlCompDist + 360*gA[7].rRSynNum/gA[7].rRSynDen ; 
      END_IF ;  

		//Automat STATE 1 Master/Slave Absolute Phase Correction
      AutData.State[1].MasterParID     := MasterParID ;
			AutData.State[1].CamProfileIndex := 16#FFFF;
			AutData.State[1].MasterFactor		 := REAL_TO_UDINT(gA[9].AxisPeriod*2);
			AutData.State[1].SlaveFactor		 := REAL_TO_UDINT((rSlave_AxisPeriod*2)+(rSlCompDist*gA[7].UnitsPerDeg));
			AutData.State[1].CompMode			   := ncOFF;

      AutData.State[1].Event[0].Type      := ncST_END;
      AutData.State[1].Event[0].Attribute := ncST_END;
      AutData.State[1].Event[0].NextState := 3;
      
      AutData.State[1].Event[1].Type      := ncSIGNAL1;
      AutData.State[1].Event[1].Attribute := ncAT_ONCE;
      AutData.State[1].Event[1].NextState := 4;


		(*//Automat STATE 2 Master/Slave Transition
      AutData.State[2].MasterParID        := MasterParID ;
			AutData.State[2].CamProfileIndex	  := 16#FFFF;
			AutData.State[2].MasterFactor		    := REAL_TO_UDINT(gA[9].AxisPeriod/2);
			AutData.State[2].SlaveFactor	    	:= REAL_TO_UDINT(gA[7].AxisPeriod/2);
			AutData.State[2].CompMode			      := ncONLYCOMP;
			AutData.State[2].MasterCompDistance := gA[9].AxisPeriod-AutData.State[2].MasterFactor;
			AutData.State[2].SlaveCompDistance	:= gA[3].AxisPeriod-AutData.State[2].SlaveFactor;
			AutData.State[2].ExtendedCompLimits := ncOFF;*)

			AutData.State[2].Event[0].Type		  := ncST_END;
			AutData.State[2].Event[0].Attribute	:= ncST_END;
			AutData.State[2].Event[0].NextState	:= 3;

		//Automat STATE 3 Master/Slave Run
      AutData.State[3].MasterParID     := MasterParID ;
			AutData.State[3].CamProfileIndex := 16#FFFF;
			AutData.State[3].MasterFactor		 := REAL_TO_UDINT(gA[9].AxisPeriod);
			AutData.State[3].SlaveFactor		 := REAL_TO_UDINT(rSlave_AxisPeriod);
			AutData.State[3].CompMode			   := ncOFF;

			AutData.State[3].Event[0].Type		  := ncST_END;
			AutData.State[3].Event[0].Attribute	:= ncST_END;
			AutData.State[3].Event[0].NextState	:= 3;
      
      AutData.State[3].Event[1].Type      := ncSIGNAL1;
      AutData.State[3].Event[1].Attribute := ncAT_ONCE;
      AutData.State[3].Event[1].NextState := 4;

    //Automat STATE 4 Master/Slave Timing setting 
      AutData.State[4].MasterParID     := uiMasterParID1 ;
      AutData.State[4].CamProfileIndex := 16#FFFF;
      AutData.State[4].MasterFactor    := REAL_TO_UDINT(gA[4].AxisPeriod); 
      AutData.State[4].SlaveFactor     := REAL_TO_UDINT(gA[7].AxisPeriod); 
      AutData.State[4].CompMode        := ncOFF;

      AutData.State[4].Event[0].Type      := ncST_END+ncNEGATIVE;
      AutData.State[4].Event[0].Attribute := ncST_END;
      AutData.State[4].Event[0].NextState := 4;

      AutData.State[4].Event[2].Type      := ncSIGNAL2 ;
      AutData.State[4].Event[2].Attribute := ncAT_ONCE ;
      AutData.State[4].Event[2].NextState := 3 ;
     
    //Automat STATE 1 Master/Slave Absolute Phase Correction in case Holding in contact with Drum
      rSPMaPos := (gA[7].PositionDeg - rOffsetDeg)/(gA[7].rRSynNum/gA[7].rRSynDen) ;
      rTemp_[6] := rSPMaPos - gA[9].PositionDeg ;
      rMaCompDist := H_FC_Modulus (
                          IN_rMod := (360 * gA[7].rRSynNum/gA[7].rRSynDen) ,
                          IN_rVar := rTemp_[6]
                                  ) ; 
      iiMasterFactor5 := REAL_TO_UDINT(rMaCompDist*gA[4].UnitsPerDeg);
      IF iiMasterFactor5 < 1 THEN 
        iiMasterFactor5 := REAL_TO_UDINT(gA[4].AxisPeriod) ;
        iiSlaveFactor5  := REAL_TO_UDINT(gA[7].AxisPeriod) ;
      ELSE
        iiSlaveFactor5  := 0 ;
      END_IF 
      AutData.State[5].MasterParID     := MasterParID ;
      AutData.State[5].CamProfileIndex := 16#FFFF;
      AutData.State[5].MasterFactor    := iiMasterFactor5; 
      AutData.State[5].SlaveFactor     := iiSlaveFactor5; 
      AutData.State[5].CompMode        := ncOFF;

      AutData.State[5].Event[0].Type      := ncST_END;
      AutData.State[5].Event[0].Attribute := ncST_END;
      AutData.State[5].Event[0].NextState := 3;
      
      AutData.State[5].Event[1].Type      := ncSIGNAL1;
      AutData.State[5].Event[1].Attribute := ncAT_ONCE;
      AutData.State[5].Event[1].NextState := 4;
      
      
			MC_BR_AutControl_0.Enable 		 := 1;
			MC_BR_AutControl_0.AdrAutData  := ADR(AutData);
			MC_BR_AutControl_0.InitAutData := 1;
	END_IF
			(* wait for initialization done or restart *)
			IF ((MC_BR_AutControl_0.AutDataInitialized=1) AND (Synch_Request)) THEN
				MC_BR_AutControl_0.InitAutData := 0;
				MC_BR_AutControl_0.Enable :=1;
				AutomatStart := 1;
        uiMC_BR_AutControl_0_MemoErrorID := 0 ;
			END_IF
			(* check if error occured *)
			IF (MC_BR_AutControl_0.ErrorID <> 0) THEN
				MC_BR_AutControl_0.Enable := 0 ;
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
      ParID_Ready1 := 0;
			IF (MC_BR_AutControl_0.Running=0) THEN
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

	gA[7].Ind_AutomatEnabled:=MC_BR_AutControl_0.Enable;
	gA[7].Ind_CurrentAutomatState:=MC_BR_AutControl_0.ActualStateIndex;
  gA[7].Ind_bSynchroOK := (MC_BR_AutControl_0.ActualStateIndex >= 3) AND gA[7].Ind_SynchronizedMotion ; ;

	(********************** MC_AUTCONTROL *************************)
	MC_BR_AutControl_0.Slave:= gA[7].Ident;
	MC_BR_AutControl_0();

END_PROGRAM
