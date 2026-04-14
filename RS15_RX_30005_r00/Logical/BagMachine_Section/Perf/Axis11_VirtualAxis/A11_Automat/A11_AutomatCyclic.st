(********************************************************************
 * COPYRIGHT -- Microsoft
 ********************************************************************
 * Program: A11_Automat
 * File: A11_AutomatCyclic.st
 * Author: pkiel
 * Created: July 22, 2011
 ********************************************************************
 * Implementation of program A11_Automat
 ********************************************************************)

PROGRAM _CYCLIC
  
  // Synchro ratio Master/Slave 
     // Master = Virtuel   
     gA[11].rRSynNum := 1 ;
     gA[11].rRSynDen := 1 ;
     
  // Signal synchro Holding axis
  MC_BR_AutControl_0.Signal1 := gA[3].Ind_bSynchroOK ;   
  
  // Perf  manu moving
  MC_BR_AutControl_0.Signal2 := 0 ;
  
  IF gstCycA[1].CycManTimSet.CmdSynchroOn THEN 
    MC_BR_AutControl_0.Signal2 := 1 ;
  END_IF
  
  
  // A11 Synchro OK indicator 
  gstCycA[1].CycManTimSet.bSynchroOkSlavA[11] := ( MC_BR_AutControl_0.ActualStateIndex = 3 )   AND 
                                                 gA[11].Ind_SynchronizedMotion AND ParID_Ready ;                                               


(**** STRAIGHT GEARED CAM AUTOMAT WITH ABSOLUTE PHASE SYNCHRONIZATION FOR TEARING AXIS ***)

(* Set Up Master Position Parameter ID *)
  Synch_Request := gA[11].Cmd_SynchronizedMotion;
  IF (Synch_Request AND NOT ParID_Ready) THEN
    MC_BR_InitMasterParIDTransfer_0.Master:=gA[9].Ident;
      MC_BR_InitMasterParIDTransfer_0.Slave:=gA[11].Ident;
      MC_BR_InitMasterParIDTransfer_0.MasterParID:=412;   // 412: VAX: Position, S_SET_VAX1, DINT
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
  IF (EDGEPOS(ParID_Ready AND g_bCameProf_OK))THEN

    (**** Calculate Slave Start Offset ****)
      PositionOffset:= REAL_TO_DINT((gA[9].PositionInch-(gA[11].PositionInch-gRecipeActive.Perf_Offset))*1000);
      PositionMOD:= REAL_TO_DINT(gRecipeActive.Repeat*1000);
      SlaveStartOffset:= (DINT_TO_REAL(PositionOffset MOD PositionMOD))/1000;
      IF (SlaveStartOffset >= (0.5*gRecipeActive.Repeat)) THEN
        SlaveStartOffset := SlaveStartOffset - gRecipeActive.Repeat;
      END_IF
      IF (SlaveStartOffset < (-0.5*gRecipeActive.Repeat)) THEN  
        SlaveStartOffset := SlaveStartOffset + gRecipeActive.Repeat;
      END_IF
      
      MasterOffset := gRecipeActive.Perf_Offset ;
      MatchedSpeed_Inch := gSP_A[1].MatchedSpeed * gA[1].InchPerDeg ; 

    (*general automat parameter*)
      AutData.MasterParID        := MasterParID;
      AutData.StartPosition      := 0;
      AutData.StartInterval      := gA[9].AxisPeriod;
      AutData.MaxMasterVelocity  := gr_rMachMaxSpeed_BPM ;

    (*Automat STATE 0 Basis State*)
      AutData.State[0].Event[0].Type    := ncST_END;
      AutData.State[0].Event[0].Attribute  := ncAT_ONCE;
      //AutData.State[0].Event[0].NextState  := 1;
      AutData.State[0].Event[0].NextState  := 10;
    
    
    //Waiting synchro Holding axis 
      AutData.State[10].CamProfileIndex := 16#FFFF;
      AutData.State[10].MasterFactor    := REAL_TO_UDINT(gA[9].AxisPeriod);
      AutData.State[10].SlaveFactor     := 0;
      AutData.State[10].CompMode        := ncOFF;
      
      AutData.State[10].Event[1].Type      := ncSIGNAL2 ;
      AutData.State[10].Event[1].Attribute := ncAT_ONCE ;
      AutData.State[10].Event[1].NextState := 3 ;
        

    //**** Slave Starting In Matched Speed Zone ***
      IF g_bPerfInMatchedSpeed THEN      
        InMatched := 1;

      //Automat STATE 0 Basis State
        AutData.State[10].Event[0].Type      := ncSIGNAL1;
        AutData.State[10].Event[0].Attribute := ncAT_ONCE;
        AutData.State[10].Event[0].NextState := 1;

        rTempPosA1_Inch := H_FC_Modulus(IN_rMod:=360*gA[1].InchPerDeg/gSP_PerfKnifeCount, IN_rVar:=gA[1].PositionInch) ;

      //Initial Matched Speed Zone
        AutData.State[1].CamProfileIndex := 16#FFFF;
        AutData.State[1].MasterFactor    := REAL_TO_UDINT((MatchedSpeed_Inch-rTempPosA1_Inch)*gA[9].UnitsPerInch);
        AutData.State[1].SlaveFactor     := REAL_TO_UDINT((MatchedSpeed_Inch-rTempPosA1_Inch)*gA[11].UnitsPerInch);
        AutData.State[1].CompMode        := ncOFF;

        AutData.State[1].Event[0].Type      := ncST_END ;
        AutData.State[1].Event[0].Attribute := ncST_END;
        AutData.State[1].Event[0].NextState := 2;
      
        AutData.State[1].Event[1].Type      := ncSIGNAL2 ;
        AutData.State[1].Event[1].Attribute := ncAT_ONCE ;
        AutData.State[1].Event[1].NextState := 3 ;

      //Initial Comp With Matched Speed Zone
        AutData.State[2].CamProfileIndex    := 16#FFFF;
        AutData.State[2].MasterFactor       := REAL_TO_UDINT(MatchedSpeed_Inch*gA[9].UnitsPerInch);
        AutData.State[2].SlaveFactor        := REAL_TO_UDINT(MatchedSpeed_Inch*gA[11].UnitsPerInch);
        AutData.State[2].CompMode           := ncONLYCOMP;
        AutData.State[2].MasterCompDistance := (gA[9].AxisPeriod)-((gA[9].PositionInch+MasterOffset)*gA[9].UnitsPerInch)-AutData.State[1].MasterFactor;
        AutData.State[2].SlaveCompDistance  := (gA[11].AxisPeriod)-gA[11].PositionCount-AutData.State[1].SlaveFactor;

        IF (AutData.State[2].SlaveCompDistance<=0) THEN
          AutData.State[2].SlaveCompDistance := AutData.State[2].SlaveCompDistance+gA[11].AxisPeriod;
        END_IF
        IF (AutData.State[2].MasterCompDistance<0) THEN
          Value1 := REAL_TO_DINT(AutData.State[2].MasterCompDistance);
          Value2 := REAL_TO_DINT(gA[9].AxisPeriod);
          AutData.State[2].MasterCompDistance := DINT_TO_REAL(Value1 MOD Value2);
          IF (AutData.State[2].MasterCompDistance<0) THEN
            AutData.State[2].MasterCompDistance := AutData.State[2].MasterCompDistance+gA[9].AxisPeriod;
          END_IF
        END_IF
              
        IF ((AutData.State[2].MasterCompDistance<(0.5*gA[9].AxisPeriod)) AND (AutData.State[2].SlaveCompDistance>(0.5*gA[11].AxisPeriod))) THEN
          AutData.State[2].MasterCompDistance := AutData.State[2].MasterCompDistance+(gA[9].AxisPeriod);
        END_IF

        AutData.State[2].Event[0].Type      := ncST_END ;
        AutData.State[2].Event[0].Attribute := ncST_END;
        AutData.State[2].Event[0].NextState := 3;
      
        AutData.State[2].Event[1].Type      := ncSIGNAL2 ;
        AutData.State[2].Event[1].Attribute := ncAT_ONCE ;
        AutData.State[2].Event[1].NextState := 3 ;

      ELSE
        InMatched := 0;

      //Automat STATE 0 Basis State
        AutData.State[10].Event[0].Type       := ncSIGNAL1;
        AutData.State[10].Event[0].Attribute  := ncAT_ONCE;
        AutData.State[10].Event[0].NextState  := 5 ;

      //Initial Comp With Matched Speed Zone
        AutData.State[5].CamProfileIndex    := 16#FFFF;
        AutData.State[5].MasterFactor       := REAL_TO_UDINT(MatchedSpeed_Inch*gA[9].UnitsPerInch);
        AutData.State[5].SlaveFactor        := REAL_TO_UDINT(MatchedSpeed_Inch*gA[11].UnitsPerInch);
        AutData.State[5].CompMode           := ncONLYCOMP;
        AutData.State[5].MasterCompDistance := gA[9].AxisPeriod-((gA[9].PositionInch+MasterOffset)*gA[9].UnitsPerInch);
        AutData.State[5].SlaveCompDistance  := gA[11].AxisPeriod-gA[11].PositionCount;

        IF (AutData.State[5].SlaveCompDistance<=0) THEN
          AutData.State[5].SlaveCompDistance := AutData.State[5].SlaveCompDistance+gA[11].AxisPeriod;
        END_IF
        IF (AutData.State[5].MasterCompDistance<0) THEN
          Value1 := REAL_TO_DINT(AutData.State[5].MasterCompDistance);
          Value2 := REAL_TO_DINT(gA[9].AxisPeriod);
          AutData.State[5].MasterCompDistance := DINT_TO_REAL(Value1 MOD Value2);
          IF (AutData.State[5].MasterCompDistance<0) THEN
            AutData.State[5].MasterCompDistance := AutData.State[5].MasterCompDistance+gA[9].AxisPeriod;
          END_IF
        END_IF

        IF ((AutData.State[5].MasterCompDistance<(0.5*gA[9].AxisPeriod)) AND (AutData.State[5].SlaveCompDistance>(0.5*gA[11].AxisPeriod))) THEN
          AutData.State[5].MasterCompDistance := AutData.State[5].MasterCompDistance+(gA[9].AxisPeriod);
        END_IF

        AutData.State[5].Event[0].Type      := ncST_END ;
        AutData.State[5].Event[0].Attribute := ncST_END;
        AutData.State[5].Event[0].NextState := 3;
      
        AutData.State[5].Event[1].Type      := ncSIGNAL2 ;
        AutData.State[5].Event[1].Attribute := ncAT_ONCE ;
        AutData.State[5].Event[1].NextState := 3 ;
        
      END_IF

    (*Automat STATE 3 Master/Slave Run*)
      AutData.State[3].CamProfileIndex   := 16#FFFF;
      AutData.State[3].MasterFactor      := REAL_TO_UDINT(gA[9].AxisPeriod);
      AutData.State[3].SlaveFactor       := REAL_TO_UDINT(gA[11].AxisPeriod);
      AutData.State[3].CompMode          := ncOFF;

      AutData.State[3].Event[0].Type       := ncST_END;
      AutData.State[3].Event[0].Attribute  := ncST_END;
      AutData.State[3].Event[0].NextState  := 3;


      MC_BR_AutControl_0.Enable       := 1;
      MC_BR_AutControl_0.AdrAutData   := ADR(AutData);
      MC_BR_AutControl_0.InitAutData  := 1;
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

  gA[11].Ind_AutomatEnabled:=MC_BR_AutControl_0.Enable;
  gA[11].Ind_CurrentAutomatState:=MC_BR_AutControl_0.ActualStateIndex;
  gA[11].Ind_bSynchroOK := (MC_BR_AutControl_0.ActualStateIndex = 3) AND gA[11].Ind_SynchronizedMotion ;

  (********************** MC_AUTCONTROL *************************)
  MC_BR_AutControl_0.Slave:= gA[11].Ident;
  MC_BR_AutControl_0();

END_PROGRAM
