(********************************************************************
 * COPYRIGHT -- Microsoft
 ********************************************************************
 * Program: A2_Automat
 * File: A2_AutomatCyclic.st
 * Author: Dominique
 * Created: October 15, 2011
 ********************************************************************
 * Implementation of program A2_Automat
 ********************************************************************)

PROGRAM _CYCLIC
  
  IF (gRecipeActive.iPrintUp <= 0.0)         OR 
     (gRecipeActive.iNumToothGearPrint <= 0) OR 
     (g_rZGearRepFP <= 0.0)                  THEN   
    RETURN ;  
  END_IF
     
  // Synchro ratio Master/Slave 
  rPrintUp := INT_TO_REAL(gRecipeActive.iPrintUp) ; // Number of pictures per round of printing cylinder
     // Master = Virtuel or Tearing   
     gA[2].rRSynNum := gRecipeActive.iNumToothGearPrint ;
     gA[2].rRSynDen := g_rZGearRepFP * rPrintUp ; 
     
  // Signal synchro Holding axis
  MC_BR_AutControl_0.Signal1 := gA[3].Ind_bSynchroOK               AND 
                                NOT(gstCycA[2].CycManTimSet.bSCyc) ;
        
  // FP timing setting
  IF EDGEPOS(gstCycA[2].CycManTimSet.CmdSynchroOn) THEN 
    MC_BR_AutControl_0.Signal2 := 1 ;
    MC_BR_AutControl_0.Signal3 := 0 ;
    MC_BR_AutControl_0.Signal4 := 0 ;
  END_IF
  IF EDGENEG(gstCycA[2].CycManTimSet.CmdSynchroOn) THEN 
    MC_BR_AutControl_0.Signal2 := 0 ;
    IF gA[3].Ind_bSynchroOK THEN 
      MC_BR_AutControl_0.Signal3 := 1 ;
      MC_BR_AutControl_0.Signal4 := 0 ;
    ELSE
      MC_BR_AutControl_0.Signal4 := 1 ;
      MC_BR_AutControl_0.Signal3 := 0 ;
    END_IF
  END_IF
  
  // A2 Synchro OK indicator 
  gstCycA[2].CycManTimSet.bSynchroOkSlavA[2] := ( MC_BR_AutControl_0.ActualStateIndex = 4 )  AND 
                                                gA[2].Ind_SynchronizedMotion AND ParID_Ready ;                                               


(**** STRAIGHT GEARED CAM AUTOMAT WITH ABSOLUTE PHASE SYNCHRONIZATION FOR DRUM ***)   
  Synch_Request := gA[2].Cmd_SynchronizedMotion;
  IF (Synch_Request AND NOT ParID_Ready) THEN
    MC_BR_InitMasterParIDTransfer_0.Master:= gA[9].Ident ; 
    MC_BR_InitMasterParIDTransfer_0.Slave:= gA[2].Ident ;
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
      MasterOffset := gRecipeActive.Drum_Offset + gRecipeActive.Holding_Offset + gRecipeActive.Tearing_Offset;
      PositionOffset:= REAL_TO_DINT((gA[9].PositionInch-(gA[2].PositionInch-MasterOffset))*1000);
      PositionMOD:= REAL_TO_DINT(gRecipeActive.Repeat*1000);
      SlaveStartOffset:= (DINT_TO_REAL(PositionOffset MOD PositionMOD))/1000;
      IF (SlaveStartOffset >= (0.5*gRecipeActive.Repeat)) THEN
        SlaveStartOffset := SlaveStartOffset - gRecipeActive.Repeat;
      END_IF
      IF (SlaveStartOffset < (-0.5*gRecipeActive.Repeat)) THEN
        SlaveStartOffset := SlaveStartOffset + gRecipeActive.Repeat;
      END_IF
      

    (*general automat parameter*)
      (*AutData.Master          := gA1.Ident;*)
      AutData.MasterParID        := MasterParID;
      AutData.StartPosition      := 0;
      AutData.StartInterval      := gA[9].AxisPeriod;
      AutData.MaxMasterVelocity  := gr_rMachMaxSpeed_BPM ;

    (*Automat STATE 0 Basis State*)
      AutData.State[0].Event[0].Type      := ncSIGNAL1;
      AutData.State[0].Event[0].Attribute  := ncAT_ONCE;
      AutData.State[0].Event[0].NextState := 3 ;
      
      AutData.State[0].Event[1].Type      := ncSIGNAL2;
      AutData.State[0].Event[1].Attribute  := ncAT_ONCE;
      AutData.State[0].Event[1].NextState := 4 ;


    (*//Automat STATE 1 Master/Slave Absolute Phase Correction
      AutData.State[1].MasterParID     := MasterParID ;
      AutData.State[1].CamProfileIndex := 16#FFFF;
      AutData.State[1].MasterFactor     := REAL_TO_UDINT(gA[9].AxisPeriod*2);
      AutData.State[1].SlaveFactor     := REAL_TO_UDINT((gA[2].AxisPeriod*2)+(rSlCompDist*gA[2].UnitsPerDeg));
      AutData.State[1].CompMode         := ncOFF;

      AutData.State[1].Event[0].Type      := ncST_END;
      AutData.State[1].Event[0].Attribute := ncST_END;
      AutData.State[1].Event[0].NextState := 3;
      

    //Automat STATE 2 Master/Slave Transition
      AutData.State[2].MasterParID        := MasterParID ;
      AutData.State[2].CamProfileIndex    := 16#FFFF;
      AutData.State[2].MasterFactor        := REAL_TO_UDINT(gA[9].AxisPeriod/2);
      AutData.State[2].SlaveFactor        := REAL_TO_UDINT(gA[2].AxisPeriod/2);
      AutData.State[2].CompMode            := ncONLYCOMP;
      AutData.State[2].MasterCompDistance := gA[9].AxisPeriod-AutData.State[2].MasterFactor;
      AutData.State[2].SlaveCompDistance  := gA[3].AxisPeriod-AutData.State[2].SlaveFactor;
      AutData.State[2].ExtendedCompLimits := ncOFF;

      AutData.State[2].Event[0].Type      := ncST_END;
      AutData.State[2].Event[0].Attribute  := ncST_END;
      AutData.State[2].Event[0].NextState  := 3;*)

    //Automat STATE 3 Master/Slave Run
      AutData.State[3].MasterParID     := MasterParID ;
      AutData.State[3].CamProfileIndex := 16#FFFF;
      AutData.State[3].MasterFactor     := REAL_TO_UDINT(gA[2].rRSynDen*gA[9].AxisPeriod);
      AutData.State[3].SlaveFactor     := REAL_TO_UDINT(gA[2].rRSynNum*gA[2].AxisPeriod);
      AutData.State[3].CompMode         := ncOFF;

      AutData.State[3].Event[0].Type      := ncST_END;
      AutData.State[3].Event[0].Attribute := ncST_END;
      AutData.State[3].Event[0].NextState := 3;

      AutData.State[3].Event[1].Type      := ncSIGNAL2 ;
      AutData.State[3].Event[1].Attribute := ncAT_ONCE ;
      AutData.State[3].Event[1].NextState := 4 ;
      
    //Automat STATE 4 Master/Slave Timing setting
      AutData.State[4].CamProfileIndex := 16#FFFF;
      AutData.State[4].MasterFactor    := REAL_TO_UDINT(gA[9].AxisPeriod) ; 
      AutData.State[4].SlaveFactor     := REAL_TO_UDINT(gA[2].AxisPeriod) ;  
      AutData.State[4].CompMode        := ncOFF;

      AutData.State[4].Event[0].Type      := ncST_END ;
      AutData.State[4].Event[0].Attribute := ncST_END ;
      AutData.State[4].Event[0].NextState := 4 ;

      AutData.State[4].Event[1].Type      := ncST_END+ncNEGATIVE ;
      AutData.State[4].Event[1].Attribute := ncST_END ;
      AutData.State[4].Event[1].NextState := 4 ;

      AutData.State[4].Event[2].Type      := ncSIGNAL3 ;
      AutData.State[4].Event[2].Attribute := ncAT_ONCE ;
      AutData.State[4].Event[2].NextState := 3 ;
      
      AutData.State[4].Event[3].Type      := ncSIGNAL4 ;
      AutData.State[4].Event[3].Attribute := ncAT_ONCE ;
      AutData.State[4].Event[3].NextState := 0 ;

      

      
      
      MC_BR_AutControl_0.Enable      := 1;
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

  gA[2].Ind_AutomatEnabled:=MC_BR_AutControl_0.Enable;
  gA[2].Ind_CurrentAutomatState:=MC_BR_AutControl_0.ActualStateIndex;
  gA[2].Ind_bSynchroOK := (MC_BR_AutControl_0.ActualStateIndex >= 3) AND gA[2].Ind_SynchronizedMotion ; ;

  (********************** MC_AUTCONTROL *************************)
  MC_BR_AutControl_0.Slave:= gA[2].Ident;
  MC_BR_AutControl_0();

END_PROGRAM
