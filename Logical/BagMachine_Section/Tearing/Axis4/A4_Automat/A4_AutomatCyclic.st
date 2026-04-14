(********************************************************************
 * COPYRIGHT -- Microsoft
 ********************************************************************
 * Program: A4_Automat
 * File: A4_AutomatCyclic.st
 * Author: pkiel
 * Created: July 13, 2011
 ********************************************************************
 * Implementation of program A4_Automat
 ********************************************************************)

PROGRAM _CYCLIC

      // Synchro ratio Master/Slave 
      iIndex := MC_BR_AutControl_0.ActualStateIndex ; 
      CASE iIndex OF 
        3 : // Master = Holding   
            //gA[4].rRSynNum := 2.0 ;        D.M. 03/02/2012 Pyrollpack_14661 Suppress cause is not correct for offset Virtual Masrter / Slave calculation in A4_Basic and not used in setting mode Automat states 3 and 4  
            //gA[4].rRSynDen := 1.0 ;
        4 : // Master = Holding   
            //gA[4].rRSynNum := 4.0 ;
            //gA[4].rRSynDen := 1.0 ;
      ELSE  // Master = Virtual
            IF (g_rNumbPliers <> 0.0) THEN 
              gA[4].rRSynNum := 4.0 / g_rNumbPliers ;
            ELSE
              gA[4].rRSynNum := 1.0 ;
            END_IF   
            gA[4].rRSynDen := 1.0 ;        
      END_CASE 
    
(**** STRAIGHT GEARED CAM AUTOMAT WITH ABSOLUTE PHASE SYNCHRONIZATION FOR TEARING AXIS ***)

(* Set Up Master Position Parameter ID *)
  
  // Maintaining+Tearing+Drum timing setting  
  IF gstCycA[3].CycManTimSet.CmdSynchroOn THEN  
    IF gA[3].rRSynDen < 4 THEN 
      MC_BR_AutControl_0.Signal1 := 1 ; 
    ELSIF gA[3].rRSynDen >= 4 THEN 
      MC_BR_AutControl_0.Signal2 := 1 ; 
    END_IF 
    MC_BR_AutControl_0.Signal3 := 0 ; 
  ELSE
    MC_BR_AutControl_0.Signal1 := 0 ; 
    MC_BR_AutControl_0.Signal2 := 0 ; 
    MC_BR_AutControl_0.Signal3 := 1 ; 
  END_IF
  
  // A4 Synchro OK indicator 
  gstCycA[3].CycManTimSet.bSynchroOkSlavA[4] := ( MC_BR_InitMasterParIDTransfer_1.Master = gA[3].Ident )                                AND 
                                                ( MC_BR_InitMasterParIDTransfer_1.MasterParID = gstCycA[3].CycManTimSet.uiMasterParID ) AND 
                                                ( MC_BR_AutControl_0.ActualStateIndex = 3 OR MC_BR_AutControl_0.ActualStateIndex = 4 )  AND 
                                                gA[4].Ind_SynchronizedMotion AND ParID_Ready ;                                                   
   
  // Tearing+Drum timing setting
  IF gstCycA[4].CycManTimSet.bCyc THEN 
    IF (gstCycA[4].CycManTimSet.CmdSynchroOn) THEN  
      MC_BR_AutControl_0.Signal1 := 0 ; 
      MC_BR_AutControl_0.Signal2 := 0 ; 
      MC_BR_AutControl_0.Signal3 := 1 ; 
    ELSE
      MC_BR_AutControl_0.Signal1 := 0 ; 
      MC_BR_AutControl_0.Signal2 := 0 ;
      MC_BR_AutControl_0.Signal3 := 0 ;
    END_IF
  END_IF
  
  IF gstCycA[3].CycManTimSet.bFCyc AND 
     gstCycA[4].CycManTimSet.bFCyc THEN 
    MC_BR_AutControl_0.Signal1 := 0 ; 
    MC_BR_AutControl_0.Signal2 := 0 ; 
    MC_BR_AutControl_0.Signal3 := 0 ; 
  END_IF
  
  // A4 Synchro OK indicator
  gstCycA[4].CycManTimSet.bSynchroOkSlavA[4] := ( MC_BR_AutControl_0.ActualStateIndex = 2 )  AND  
                                                gA[4].Ind_SynchronizedMotion AND ParID_Ready ;   
      
  
  //Synch_Request := gA[4].Cmd_SynchronizedMotion ;
  Synch_Request := gA[4].Cmd_SynchronizedMotion AND NOT(MC_BR_AutControl_0.Stop) ;  // D.M. 26/01/2012 RS26 Pyrollpack_14661 added because it happened that Stop=1 and Synch_Request=1 => MC_BR_AutControl_0 makes fault 29256    
	IF (Synch_Request AND NOT ParID_Ready) THEN
    MC_BR_InitMasterParIDTransfer_0.Master:= gA[9].Ident ;  
    MC_BR_InitMasterParIDTransfer_0.Slave:=gA[4].Ident;
    MC_BR_InitMasterParIDTransfer_0.MasterParID:= 412 ; // ParID 412 = VAX Position (in case virtual axis)
    MC_BR_InitMasterParIDTransfer_0.SlaveChannel:=0;
    MC_BR_InitMasterParIDTransfer_0.Execute:= 1 ;
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
    MC_BR_InitMasterParIDTransfer_1.Master       := gA[3].Ident ;  
    MC_BR_InitMasterParIDTransfer_1.Slave        := gA[4].Ident;
    MC_BR_InitMasterParIDTransfer_1.MasterParID  := gstCycA[3].CycManTimSet.uiMasterParID ;  
    MC_BR_InitMasterParIDTransfer_1.SlaveChannel := 2 ;
    MC_BR_InitMasterParIDTransfer_1.Execute      := 1 ;
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
			MasterOffset := gRecipeActive.Tearing_Offset+gRecipeActive.Holding_Offset;
			PositionOffset:= REAL_TO_DINT((gA[9].PositionInch-(gA[4].PositionInch-MasterOffset))*1000);
			PositionMOD:= REAL_TO_DINT(gRecipeActive.Repeat*1000);
			SlaveStartOffset:= (DINT_TO_REAL(PositionOffset MOD PositionMOD))/1000;
			IF (SlaveStartOffset >= (0.5*gRecipeActive.Repeat)) THEN
				SlaveStartOffset := SlaveStartOffset - gRecipeActive.Repeat;
			END_IF
			IF (SlaveStartOffset < (-0.5*gRecipeActive.Repeat)) THEN
				SlaveStartOffset := SlaveStartOffset + gRecipeActive.Repeat;
			END_IF
      
      rSlave_AxisPeriod := gA[4].AxisPeriod * gA[4].rRSynNum/gA[4].rRSynDen ;
      rOffsetDeg := gRecipeActive.rTearing_PhasMasterDeg ;
      
      rSPMaPos := (gA[4].PositionDeg - rOffsetDeg)/(gA[4].rRSynNum/gA[4].rRSynDen) ;
      rTemp_[0] := rSPMaPos - gA[9].PositionDeg ;
      rMaCompDist := H_FC_Modulus (
                          IN_rMod := (360 * gA[4].rRSynNum/gA[4].rRSynDen) ,
                          IN_rVar := rTemp_[0]
                                  ) ; 

		(*general automat parameter*)
			//AutData.Master				    := gA[3].Ident;
			AutData.MasterParID			  := MasterParID;
			AutData.StartPosition		  := 0;
			AutData.StartInterval		  := gA[9].AxisPeriod;
			AutData.MaxMasterVelocity	:= gr_rMachMaxSpeed_BPM ;

		//Automat STATE 0 Basis State
			AutData.State[0].Event[0].Type		  := ncST_END;
			AutData.State[0].Event[0].Attribute	:= ncAT_ONCE;
      IF gA[4].Ind_bInContactZone                  AND
         (g_iMachType = C_iRS15)                   AND   
         NOT(gstCycA[3].CycManTimSet.CmdSynchroOn) AND 
         NOT(gstCycA[4].CycManTimSet.CmdSynchroOn) THEN 
        // Start synchro with tearing in contact zone
        AutData.State[0].Event[0].NextState := 5;
      ELSIF (rMaCompDist >= 1/gA[9].UnitsPerDeg) AND // rMaCompDist must be >= 1 Units
            gA[4].bSynchroReq                    THEN 
		  	AutData.State[0].Event[0].NextState	:= 1;
      ELSE
        rMaCompDist := 1/gA[9].UnitsPerDeg ;
        AutData.State[0].Event[0].NextState := 2;
      END_IF 

         
    //Automat STATE 1 Master/Slave Absolute Phase Correction
      AutData.State[1].MasterParID        := MasterParID;
      AutData.State[1].CamProfileIndex    := 16#FFFF;
      AutData.State[1].MasterFactor       := REAL_TO_UDINT(rMaCompDist * gA[4].UnitsPerDeg) ; 
      AutData.State[1].SlaveFactor        := 0 ;  
      AutData.State[1].CompMode           := ncOFF;

      AutData.State[1].Event[0].Type      := ncST_END ;
      AutData.State[1].Event[0].Attribute := ncST_END ;
      AutData.State[1].Event[0].NextState := 2 ;

      AutData.State[1].Event[1].Type      := ncSIGNAL1 ;
      AutData.State[1].Event[1].Attribute := ncAT_ONCE ;
      AutData.State[1].Event[1].NextState := 3 ;

      AutData.State[1].Event[2].Type      := ncSIGNAL2;
      AutData.State[1].Event[2].Attribute := ncAT_ONCE;
      AutData.State[1].Event[2].NextState := 4;

      AutData.State[1].Event[3].Type      := ncSIGNAL3;
      AutData.State[1].Event[3].Attribute := ncAT_ONCE;
      AutData.State[1].Event[3].NextState := 2;           
       
    //Automat STATE 2 Master/Slave run
      AutData.State[2].MasterParID     := MasterParID;
      AutData.State[2].CamProfileIndex := 16#FFFF;
      AutData.State[2].MasterFactor    := REAL_TO_UDINT(gA[9].AxisPeriod); 
      AutData.State[2].SlaveFactor     := REAL_TO_UDINT(rSlave_AxisPeriod); 
      AutData.State[2].CompMode        := ncOFF;

      AutData.State[2].Event[0].Type      := ncST_END ;
      AutData.State[2].Event[0].Attribute := ncST_END;
      AutData.State[2].Event[0].NextState := 2;

      AutData.State[2].Event[1].Type      := ncST_END+ncNEGATIVE ;
      AutData.State[2].Event[1].Attribute := ncST_END;
      AutData.State[2].Event[1].NextState := 2;

      AutData.State[2].Event[2].Type      := ncSIGNAL1;
      AutData.State[2].Event[2].Attribute := ncAT_ONCE;
      AutData.State[2].Event[2].NextState := 3;

      AutData.State[2].Event[3].Type      := ncSIGNAL2;
      AutData.State[2].Event[3].Attribute := ncAT_ONCE;
      AutData.State[2].Event[3].NextState := 4;

    //Automat STATE 3 Master/Slave Timing setting case 1
      AutData.State[3].MasterParID     := uiMasterParID1;
      AutData.State[3].CamProfileIndex := 16#FFFF;
      AutData.State[3].MasterFactor    := REAL_TO_UDINT(gA[3].AxisPeriod);
      AutData.State[3].SlaveFactor     := REAL_TO_UDINT(gA[4].AxisPeriod*2);
      AutData.State[3].CompMode        := ncOFF;

      AutData.State[3].Event[0].Type       := ncST_END ;
      AutData.State[3].Event[0].Attribute  := ncST_END ;
      AutData.State[3].Event[0].NextState  := 3 ;

      AutData.State[3].Event[1].Type       := ncST_END+ncNEGATIVE ;
      AutData.State[3].Event[1].Attribute  := ncST_END ;
      AutData.State[3].Event[1].NextState  := 3 ;

      AutData.State[3].Event[2].Type       := ncSIGNAL3 ;
      AutData.State[3].Event[2].Attribute  := ncAT_ONCE ;
      AutData.State[3].Event[2].NextState  := 2 ;

    //Automat STATE 4 Master/Slave Timing setting case 2
      AutData.State[4].MasterParID     := uiMasterParID1;
      AutData.State[4].CamProfileIndex := 16#FFFF;
      AutData.State[4].MasterFactor    := REAL_TO_UDINT(gA[3].AxisPeriod);
      AutData.State[4].SlaveFactor     := REAL_TO_UDINT(gA[4].AxisPeriod*4);
      AutData.State[4].CompMode        := ncOFF;

      AutData.State[4].Event[0].Type       := ncST_END ;
      AutData.State[4].Event[0].Attribute  := ncST_END ;
      AutData.State[4].Event[0].NextState  := 4 ;

      AutData.State[4].Event[1].Type       := ncST_END+ncNEGATIVE ;
      AutData.State[4].Event[1].Attribute  := ncST_END ;
      AutData.State[4].Event[1].NextState  := 4 ;

      AutData.State[4].Event[2].Type       := ncSIGNAL3 ;
      AutData.State[4].Event[2].Attribute  := ncAT_ONCE ;
      AutData.State[4].Event[2].NextState  := 2 ;
      
			MC_BR_AutControl_0.Enable 		  := 1;
			MC_BR_AutControl_0.AdrAutData 	:= ADR(AutData);
			MC_BR_AutControl_0.InitAutData 	:= 1;
      
    //Automat STATE 5 Master/Slave 
      iiMasterFactor5 := REAL_TO_UDINT(rMaCompDist*gA[9].UnitsPerDeg) ;
      IF iiMasterFactor5 < 1 THEN 
        iiMasterFactor5 := REAL_TO_UDINT(gA[9].AxisPeriod) ;
        iiSlaveFactor5  := REAL_TO_UDINT(gA[4].AxisPeriod) ;
      ELSE
        iiSlaveFactor5 := 0 ;
      END_IF ;
      AutData.State[5].MasterParID     := MasterParID;
      AutData.State[5].CamProfileIndex := 16#FFFF;
      AutData.State[5].MasterFactor    := iiMasterFactor5 ;
      AutData.State[5].SlaveFactor     := iiSlaveFactor5 ;
      AutData.State[5].CompMode        := ncOFF;

      AutData.State[5].Event[0].Type       := ncST_END ;
      AutData.State[5].Event[0].Attribute  := ncST_END ;
      AutData.State[5].Event[0].NextState  := 2 ;          

      AutData.State[5].Event[2].Type      := ncSIGNAL1;
      AutData.State[5].Event[2].Attribute := ncAT_ONCE;
      AutData.State[5].Event[2].NextState := 3;

      AutData.State[5].Event[3].Type      := ncSIGNAL2;
      AutData.State[5].Event[3].Attribute := ncAT_ONCE;
      AutData.State[5].Event[3].NextState := 4;     

      AutData.State[5].Event[3].Type      := ncSIGNAL3;
      AutData.State[5].Event[3].Attribute := ncAT_ONCE;
      AutData.State[5].Event[3].NextState := 2;     
         


      MC_BR_AutControl_0.Enable      := 1;
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
        uiMC_BR_AutControl_0_MemoErrorID := MC_BR_AutControl_0.ErrorID ;
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

	gA[4].Ind_AutomatEnabled:=MC_BR_AutControl_0.Enable;
	gA[4].Ind_CurrentAutomatState:=MC_BR_AutControl_0.ActualStateIndex;
  gA[4].Ind_bSynchroOK := (MC_BR_AutControl_0.ActualStateIndex >= 2) AND gA[4].Ind_SynchronizedMotion ; ;

	(********************** MC_AUTCONTROL *************************)
	MC_BR_AutControl_0.Slave:= gA[4].Ident;
	MC_BR_AutControl_0();

END_PROGRAM
