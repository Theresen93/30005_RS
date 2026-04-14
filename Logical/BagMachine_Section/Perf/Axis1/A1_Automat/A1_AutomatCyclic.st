(********************************************************************
 * COPYRIGHT -- Microsoft
 ********************************************************************
 * Program: A1_Automat
 * File: A1_AutomatCyclic.st
 * Author: pkiel
 * Created: July 12, 2011
 ********************************************************************
 * Implementation of program A1_Automat
 ********************************************************************)

PROGRAM _CYCLIC

  // Synchro ratio Master/Slave 
     // Master = Virtuel Perf   
     gA[1].rRSynNum := 1 ;
     gA[1].rRSynDen := 1 ;

(**** PROFILED CAM AUTOMAT WITH ABSOLUTE PHASE SYNCHRONIZATION FOR PERF AXIS ***)

(* Set Up Master Position Parameter ID *)
	Synch_Request := gA[1].Cmd_SynchronizedMotion;
	IF (Synch_Request AND NOT ParID_Ready) THEN
		  MC_BR_InitMasterParIDTransfer_0.Master:=gA[11].Ident;
	    MC_BR_InitMasterParIDTransfer_0.Slave:=gA[1].Ident;
	    MC_BR_InitMasterParIDTransfer_0.MasterParID:=412;   // 412: VAX: Position, S_SET_VAX1, DINT
	    MC_BR_InitMasterParIDTransfer_0.SlaveChannel:=1;
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
  bInitCamAuto := ParID_Ready    AND 
                  g_bCameProf_OK AND  
                  1              ;
  
	IF (EDGEPOS(bInitCamAuto))THEN

		//general automat parameter
			//AutData.Master		    := gA[1].Ident;
			AutData.MasterParID		  := MasterParID;
			AutData.StartPosition		:= 0;
			AutData.StartInterval		:= gA[11].AxisPeriod;
			AutData.MaxMasterVelocity	:= gr_rMachMaxSpeed_BPM ;

		//**** Calculations ***
      IF gRecipeActive.bSelEnvBProd THEN  
        //MatchedSpeed_Inch := gSP_A[1].MatchedSpeed/360.0*g_rActualSizePerf_in ;  // D.M. Le 10/01/2012 Pyrollpack_14661   Replaced by the line below because operator is able to change the size of the Perf => the length of matched speed is constant
        MatchedSpeed_Inch := gSP_EnvBPerf.rZoneBefPerf_in + gSP_EnvBPerf.rZoneAftPerf_in ;
      ELSE  
        //MatchedSpeed_Inch := gSP_A[1].MatchedSpeed/360.0*g_rActualSizePerf_in ;  // D.M. Le 10/01/2012 Pyrollpack_14661   Replaced by the line below because operator is able to change the size of the Perf => the length of matched speed is constant
        MatchedSpeed_Inch := gSP_StandPerf.rZoneBefPerf_in + gSP_StandPerf.rZoneAftPerf_in ;
      END_IF 
			MasterOffset      := 0 ;
			Slave_AxisPeriod  := gA[1].AxisPeriod/gSP_PerfKnifeCount ;

        
        
		//**** Slave Starting In Matched Speed Zone ***
      IF g_bPerfInMatchedSpeed THEN      
        InMatched := 1;

			//Automat STATE 0 Basis State
        AutData.State[0].Event[0].Type      := ncST_END;
        AutData.State[0].Event[0].Attribute := ncAT_ONCE;
        AutData.State[0].Event[0].NextState := 1;

        rTempPosA1_Inch := H_FC_Modulus(IN_rMod:=360*gA[1].InchPerDeg/gSP_PerfKnifeCount, IN_rVar:=gA[1].PositionInch) ;

			//Initial Matched Speed Zone
				AutData.State[1].CamProfileIndex := 16#FFFF;
				AutData.State[1].MasterFactor		 := REAL_TO_UDINT((MatchedSpeed_Inch-rTempPosA1_Inch)*gA[11].UnitsPerInch);
				AutData.State[1].SlaveFactor		 := REAL_TO_UDINT((MatchedSpeed_Inch-rTempPosA1_Inch)*gA[1].UnitsPerInch);
				AutData.State[1].CompMode			   := ncOFF;

				AutData.State[1].Event[0].Type		  := ncST_END ;
				AutData.State[1].Event[0].Attribute	:= ncST_END;
				AutData.State[1].Event[0].NextState	:= 2;

			//Initial Comp With Matched Speed Zone
				AutData.State[2].CamProfileIndex  	:= 16#FFFF;
				AutData.State[2].MasterFactor		    := REAL_TO_UDINT(MatchedSpeed_Inch*gA[11].UnitsPerInch);
				AutData.State[2].SlaveFactor		    := REAL_TO_UDINT(MatchedSpeed_Inch*gA[1].UnitsPerInch);
				AutData.State[2].CompMode		    	  := ncONLYCOMP;
				AutData.State[2].MasterCompDistance	:= (gA[11].AxisPeriod)-((gA[11].PositionInch+MasterOffset)*gA[11].UnitsPerInch)-AutData.State[1].MasterFactor;
				AutData.State[2].SlaveCompDistance	:= (Slave_AxisPeriod)-gA[1].PositionCount-AutData.State[1].SlaveFactor;

				IF (AutData.State[2].SlaveCompDistance<=0) THEN
					AutData.State[2].SlaveCompDistance := AutData.State[2].SlaveCompDistance+Slave_AxisPeriod;
				END_IF
				IF (AutData.State[2].MasterCompDistance<0) THEN
					Value1 := REAL_TO_DINT(AutData.State[2].MasterCompDistance);
					Value2 := REAL_TO_DINT(gA[11].AxisPeriod);
					AutData.State[2].MasterCompDistance := DINT_TO_REAL(Value1 MOD Value2);
					IF (AutData.State[2].MasterCompDistance<0) THEN
						AutData.State[2].MasterCompDistance := AutData.State[2].MasterCompDistance+gA[11].AxisPeriod;
					END_IF
				END_IF
              
				IF ((AutData.State[2].MasterCompDistance<(0.5*gA[11].AxisPeriod)) AND (AutData.State[2].SlaveCompDistance>(0.5*Slave_AxisPeriod))) THEN
					AutData.State[2].MasterCompDistance := AutData.State[2].MasterCompDistance+(gA[11].AxisPeriod);
				END_IF

				AutData.State[2].Event[0].Type		:= ncST_END ;
				AutData.State[2].Event[0].Attribute	:= ncST_END;
				AutData.State[2].Event[0].NextState	:= 3;

			ELSE
				InMatched := 0;

			//Automat STATE 0 Basis State
				AutData.State[0].Event[0].Type		  := ncST_END;
				AutData.State[0].Event[0].Attribute	:= ncAT_ONCE;
				AutData.State[0].Event[0].NextState	:= 5;

			//Initial Comp With Matched Speed Zone
				AutData.State[5].CamProfileIndex := 16#FFFF;
				AutData.State[5].MasterFactor		 := REAL_TO_UDINT(MatchedSpeed_Inch*gA[11].UnitsPerInch);
				AutData.State[5].SlaveFactor		 := REAL_TO_UDINT(MatchedSpeed_Inch*gA[1].UnitsPerInch);
				AutData.State[5].CompMode			   := ncONLYCOMP;
				AutData.State[5].MasterCompDistance	:= gA[11].AxisPeriod-((gA[11].PositionInch+MasterOffset)*gA[11].UnitsPerInch);
				AutData.State[5].SlaveCompDistance	:= Slave_AxisPeriod-gA[1].PositionCount;

				IF (AutData.State[5].SlaveCompDistance<=0) THEN
					AutData.State[5].SlaveCompDistance := AutData.State[5].SlaveCompDistance+Slave_AxisPeriod;
				END_IF
				IF (AutData.State[5].MasterCompDistance<0) THEN
					Value1 := REAL_TO_DINT(AutData.State[5].MasterCompDistance);
					Value2 := REAL_TO_DINT(gA[11].AxisPeriod);
					AutData.State[5].MasterCompDistance := DINT_TO_REAL(Value1 MOD Value2);
					IF (AutData.State[5].MasterCompDistance<0) THEN
						AutData.State[5].MasterCompDistance := AutData.State[5].MasterCompDistance+gA[11].AxisPeriod;
					END_IF
				END_IF

				IF ((AutData.State[5].MasterCompDistance<(0.5*gA[11].AxisPeriod)) AND (AutData.State[5].SlaveCompDistance>(0.5*Slave_AxisPeriod))) THEN
					AutData.State[5].MasterCompDistance := AutData.State[5].MasterCompDistance+(gA[11].AxisPeriod);
				END_IF

				AutData.State[5].Event[0].Type		  := ncST_END ;
				AutData.State[5].Event[0].Attribute	:= ncST_END;
				AutData.State[5].Event[0].NextState	:= 3;
        
			END_IF
      
    //Running Comp With Matched Speed Zone 
      AutData.State[3].CamProfileIndex    := 16#FFFF;
      AutData.State[3].MasterFactor       := REAL_TO_UDINT(MatchedSpeed_Inch*gA[11].UnitsPerInch);
      AutData.State[3].SlaveFactor        := REAL_TO_UDINT(MatchedSpeed_Inch*gA[1].UnitsPerInch);
      AutData.State[3].CompMode           := ncONLYCOMP;
      AutData.State[3].MasterCompDistance := gA[11].AxisPeriod-AutData.State[3].MasterFactor;
      AutData.State[3].SlaveCompDistance  := Slave_AxisPeriod-AutData.State[3].SlaveFactor;

      AutData.State[3].Event[0].Type      := ncST_END ;
      AutData.State[3].Event[0].Attribute := ncST_END;
      AutData.State[3].Event[0].NextState := 3;
      
      
		//Initialize & Enable the Automat Control 
			MC_BR_AutControl_0.Enable 		:= 1;
			MC_BR_AutControl_0.AdrAutData 	:= ADR(AutData);
			MC_BR_AutControl_0.InitAutData 	:= 1;
	END_IF
		// wait for initialization done
			IF ((MC_BR_AutControl_0.AutDataInitialized = 1) AND (Synch_Request)) THEN
				MC_BR_AutControl_0.InitAutData 	:= 0;
				AutomatStart := 1;
			END_IF
			// check if error occured 
			IF (MC_BR_AutControl_0.ErrorID <> 0) THEN
				MC_BR_AutControl_0.Enable := 0;
				uiErrorID := MC_BR_AutControl_0.ErrorID ;
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

	IF (NOT gPerf_ParkRequired) THEN
		gA[1].Ind_AutomatEnabled:=MC_BR_AutControl_0.Enable;
		gA[1].Ind_CurrentAutomatState:=MC_BR_AutControl_0.ActualStateIndex;
	END_IF
  gA[1].Ind_bSynchroOK := (MC_BR_AutControl_0.ActualStateIndex >= 2) AND gA[1].Ind_SynchronizedMotion ;
	(********************** MC_AUTCONTROL *************************)
	MC_BR_AutControl_0.Slave:= gA[1].Ident;
	MC_BR_AutControl_0();

	(******************** UPDATE CAM-AUTOMAT STATE 3 **********************)
	MC_BR_InitAutState_0.Master := gA[11].Ident;
	MC_BR_InitAutState_0.Slave := gA[1].Ident;
	MC_BR_InitAutState_0.StateIndex := 3;
	MC_BR_InitAutState_0.CamProfileIndex := 16#FFFF;
	MC_BR_InitAutState_0.MasterFactor := REAL_TO_UDINT(MatchedSpeed_Inch*gA[11].UnitsPerInch);
	MC_BR_InitAutState_0.SlaveFactor := REAL_TO_UDINT(MatchedSpeed_Inch*gA[1].UnitsPerInch);
	MC_BR_InitAutState_0.MasterCompDistance := gA[11].AxisPeriod-MC_BR_InitAutState_0.MasterFactor;
	MC_BR_InitAutState_0.SlaveCompDistance	:= Slave_AxisPeriod-MC_BR_InitAutState_0.SlaveFactor;
	MC_BR_InitAutState_0.Execute := gA[1].Cmd_SynchronizedMotionUpdate;
	MC_BR_InitAutState_0();

  IF (MC_BR_InitAutState_0.Done OR MC_BR_InitAutState_0.Error) THEN
		gA[1].Cmd_SynchronizedMotionUpdate:=0;
	END_IF

END_PROGRAM
