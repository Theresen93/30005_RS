(********************************************************************
 * COPYRIGHT -- Microsoft
 ********************************************************************
 * Program: A3_Automat
 * File: A3_AutomatCyclic.st
 * Author: pkiel
 * Created: July 13, 2011
 ********************************************************************
 * Implementation of program A3_Automat
 ********************************************************************)

PROGRAM _CYCLIC
  
(**** STRAIGHT GEARED CAM AUTOMAT WITH ABSOLUTE PHASE SYNCHRONIZATION FOR HOLDING AXIS ***)

(* Set Up Master Position Parameter ID *)

  // Holding timing setting
  MC_BR_AutControl_0.Signal1 := 0 ;
  MC_BR_AutControl_0.Signal2 := 0 ;
  
  IF gstCycA[3].CycManTimSet.CmdSynchroOn       AND 
     (MC_BR_AutControl_0.ActualStateIndex <> 3) THEN 
    MC_BR_AutControl_0.Signal1 := 1 ;
  END_IF
  
  IF NOT(gstCycA[3].CycManTimSet.CmdSynchroOn) AND 
     (MC_BR_AutControl_0.ActualStateIndex = 3) THEN 
      MC_BR_AutControl_0.Signal2 := 1 ;
  END_IF
  
  // A3 Synchro OK indicator 
  gstCycA[3].CycManTimSet.bSynchroOkSlavA[3] := ( MC_BR_AutControl_0.ActualStateIndex = 3 )  AND 
                                                gA[3].Ind_SynchronizedMotion AND ParID_Ready ;                                               

  //Synch_Request := gA[3].Cmd_SynchronizedMotion ;
  Synch_Request := gA[3].Cmd_SynchronizedMotion AND NOT(MC_BR_AutControl_0.Stop) ;  // D.M. 26/01/2012 RS26 Pyrollpack_14661 added because it happened that Stop=1 and Synch_Request=1 => MC_BR_AutControl_0 makes fault 29256    
	IF (Synch_Request AND NOT ParID_Ready) THEN
		MC_BR_InitMasterParIDTransfer_0.Master:=gA[9].Ident;
    MC_BR_InitMasterParIDTransfer_0.Slave:=gA[3].Ident;
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

		(* Slave Axis Period Based On Number Of Tools On Maintaining Shaft *)
		(* Number of Tools On Holding (Maintaining) Shaft Based On Tube Length...Lengh>160m = 2 Tools, Length<=160mm = 4 Tools *)
			rRepeatMetric := gRecipeActive.Repeat*25.4;
      Slave_AxisPeriod := gA[3].AxisPeriod * gA[3].rRSynNum/gA[3].rRSynDen;
      PeriodDint := REAL_TO_DINT(Slave_AxisPeriod);
      PositionDint := REAL_TO_DINT(gA[3].PositionCount);
      Slave_AdjustedPosition := (DINT_TO_REAL(PeriodDint-(PositionDint MOD PeriodDint)))*gA[3].UnitsPerInch;
      
		(**** Calculate Slave Start Offset ****)
			PositionOffset:= REAL_TO_DINT((gA[9].PositionInch-(gA[3].PositionInch-gRecipeActive.Holding_Offset))*1000);
			PositionMOD:= REAL_TO_DINT(gRecipeActive.Repeat*1000);
			SlaveStartOffset:= (DINT_TO_REAL(PositionOffset MOD PositionMOD))/1000;
			IF (SlaveStartOffset >= (0.5*gRecipeActive.Repeat)) THEN
				SlaveStartOffset := SlaveStartOffset - gRecipeActive.Repeat;
			END_IF
			IF (SlaveStartOffset < (-0.5*gRecipeActive.Repeat)) THEN
				SlaveStartOffset := SlaveStartOffset + gRecipeActive.Repeat;
			END_IF
   
      rTemp_[1] := gA[3].PositionDeg ;
      rTemp_[2] := gA[9].PositionDeg ;
      
      rOffsetDeg := gRecipeActive.rHolding_PhasMasterDeg ;
      
      rSPMaPos := (gA[3].PositionDeg - rOffsetDeg)/(gA[3].rRSynNum/gA[3].rRSynDen) ;
      rTemp_[0] := rSPMaPos - gA[9].PositionDeg ;
      
      
      rMaCompDist := H_FC_Modulus (
                          //IN_rMod := (360 * gA[3].rRSynNum/gA[3].rRSynDen) ,
                          IN_rMod := 360 ,
                          IN_rVar := rTemp_[0]
                                  ) ; 

		(*general automat parameter*)
			//AutData.Master				  := gA[3].Ident;
			AutData.MasterParID			  := MasterParID;
			AutData.StartPosition		  := 0;
			AutData.StartInterval		  := gA[9].AxisPeriod;
			AutData.MaxMasterVelocity	:= gr_rMachMaxSpeed_BPM ;

		(*Automat STATE 0 Basis State*)
			AutData.State[0].Event[0].Type		  := ncST_END;
			AutData.State[0].Event[0].Attribute	:= ncAT_ONCE;
      IF (rMaCompDist >= 1/gA[3].UnitsPerDeg) AND
         gA[3].bSynchroReq                    THEN 
        AutData.State[0].Event[0].NextState := 1;
      ELSE
        rMaCompDist := 1/gA[3].UnitsPerDeg ;
        AutData.State[0].Event[0].NextState := 2;
      END_IF 

    //Automat STATE 0 Basis State
      AutData.State[0].Event[0].Type      := ncST_END;
      AutData.State[0].Event[0].Attribute := ncAT_ONCE;
      AutData.State[0].Event[0].NextState := 1;
      
    //Automat STATE 1 Master/Slave Absolute Phase Correction
      AutData.State[1].CamProfileIndex := 16#FFFF;
      AutData.State[1].MasterFactor    := REAL_TO_UDINT(rMaCompDist * gA[3].UnitsPerDeg) ; 
      AutData.State[1].SlaveFactor     := 0 ;  
      AutData.State[1].CompMode        := ncOFF;

      AutData.State[1].Event[0].Type      := ncST_END;
      AutData.State[1].Event[0].Attribute := ncST_END;
      AutData.State[1].Event[0].NextState := 2;

      AutData.State[1].Event[1].Type      := ncSIGNAL1 ;
      AutData.State[1].Event[1].Attribute := ncAT_ONCE ;
      AutData.State[1].Event[1].NextState := 3 ;
      
    //Automat STATE 2 Master/Slave run
      AutData.State[2].CamProfileIndex := 16#FFFF;
      AutData.State[2].MasterFactor    := REAL_TO_UDINT(gA[9].AxisPeriod) ; 
      AutData.State[2].SlaveFactor     := REAL_TO_UDINT(Slave_AxisPeriod) ;  
      AutData.State[2].CompMode        := ncOFF;

      AutData.State[2].Event[0].Type      := ncST_END ;
      AutData.State[2].Event[0].Attribute := ncST_END ;
      AutData.State[2].Event[0].NextState := 2 ;

      AutData.State[2].Event[1].Type      := ncST_END+ncNEGATIVE ;
      AutData.State[2].Event[1].Attribute := ncST_END ;
      AutData.State[2].Event[1].NextState := 2 ;

      AutData.State[2].Event[2].Type      := ncSIGNAL1 ;
      AutData.State[2].Event[2].Attribute := ncAT_ONCE ;
      AutData.State[2].Event[2].NextState := 3 ;
      
    //Automat STATE 3 Master/Slave Timing setting
      AutData.State[3].CamProfileIndex := 16#FFFF;
      AutData.State[3].MasterFactor    := REAL_TO_UDINT(gA[9].AxisPeriod) ; 
      AutData.State[3].SlaveFactor     := REAL_TO_UDINT(Slave_AxisPeriod) ;  
      AutData.State[3].CompMode        := ncOFF;

      AutData.State[3].Event[0].Type      := ncST_END ;
      AutData.State[3].Event[0].Attribute := ncST_END ;
      AutData.State[3].Event[0].NextState := 3 ;

      AutData.State[3].Event[1].Type      := ncST_END+ncNEGATIVE ;
      AutData.State[3].Event[1].Attribute := ncST_END ;
      AutData.State[3].Event[1].NextState := 3 ;

      AutData.State[3].Event[2].Type      := ncSIGNAL2 ;
      AutData.State[3].Event[2].Attribute := ncAT_ONCE ;
      AutData.State[3].Event[2].NextState := 2 ;


			MC_BR_AutControl_0.Enable 		  := 1;
			MC_BR_AutControl_0.AdrAutData 	:= ADR(AutData);
			MC_BR_AutControl_0.InitAutData 	:= 1;
	END_IF
			(* wait for initialization done or restart *)
			IF ((MC_BR_AutControl_0.AutDataInitialized=1) AND (Synch_Request)) THEN
				MC_BR_AutControl_0.InitAutData := 0;
				MC_BR_AutControl_0.Enable :=1 ;
        uiMC_BR_AutControl_0_MemoErrorID := 0 ;
				AutomatStart := 1;;
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

	gA[3].Ind_AutomatEnabled:=MC_BR_AutControl_0.Enable;
	gA[3].Ind_CurrentAutomatState:=MC_BR_AutControl_0.ActualStateIndex;
  gA[3].Ind_bSynchroOK := (MC_BR_AutControl_0.ActualStateIndex >= 2) AND gA[3].Ind_SynchronizedMotion ;
  
	(********************** MC_AUTCONTROL *************************)
	MC_BR_AutControl_0.Slave:= gA[3].Ident;
	MC_BR_AutControl_0();

END_PROGRAM
