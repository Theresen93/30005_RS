(********************************************************************
 * COPYRIGHT -- Microsoft
 ********************************************************************
 * Program: A1_Automat2
 * File: A1_Automat2Cyclic.st
 * Author: pkiel
 * Created: July 19, 2011
 ********************************************************************
 * Implementation of program A1_Automat2
 ********************************************************************)

PROGRAM _CYCLIC

(**** CAM AUTOMAT FOR PARKING AXIS ****)
(**** Initialize Automat Parameters Upon Automat Start Request ****)
	Synch_Request := gPerf_ParkRequest;
	IF (Synch_Request AND NOT ParID_Ready) THEN
		MC_BR_InitMasterParIDTransfer_0.Master:=gA[11].Ident;
	    MC_BR_InitMasterParIDTransfer_0.Slave:=gA[1].Ident;
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
  bInitCamAuto := ParID_Ready    AND 
                  g_bCameProf_OK AND  
                  1              ;
	
	IF (EDGEPOS(bInitCamAuto))THEN

		(*general automat parameter*)
			AutData.MasterParID		    := MasterParID;
			AutData.StartPosition		:= 0;
			AutData.StartInterval		:= gA[11].AxisPeriod;
			AutData.MaxMasterVelocity	:= gr_rMachMaxSpeed_BPM ;

		(**** Calculations ****)
			gA[1].InchPerDeg := gA[1].UnitsPerDeg/gA[1].UnitsPerInch;
			Travel_Deg := gSP_A[1].ParkPosition-gSP_A[1].MatchedSpeed;
			IF (Travel_Deg<0) THEN
				Travel_Deg := Travel_Deg+360.0;
			END_IF
			Travel_Inch := Travel_Deg*gA[1].InchPerDeg;
			MatchedSpeed_Inch := gSP_A[1].MatchedSpeed*gA[1].InchPerDeg;
			MasterOffset := 0(*gRecipeActive.Perf_Offset*);
			Slave_AxisPeriod := gA[1].AxisPeriod/gSP_PerfKnifeCount;
      rSlave_AxisPeriod_Inch := Slave_AxisPeriod / gA[1].UnitsPerInch ;
      rPosOutMatchedSpeed2_Inch := MatchedSpeed_Inch + rSlave_AxisPeriod_Inch ;

		(**** Slave Starting In Matched Speed Zone ****)
      IF g_bPerfInMatchedSpeed THEN      
        InMatched := 1;

			(*Automat STATE 0 Basis State*)
				AutData.State[0].Event[0].Type		:= ncST_END;
				AutData.State[0].Event[0].Attribute	:= ncAT_ONCE;
        AutData.State[0].Event[0].NextState  := 1;      
      
      rTempPosA1_Inch := H_FC_Modulus(IN_rMod:=360*gA[1].InchPerDeg/gSP_PerfKnifeCount, IN_rVar:=gA[1].PositionInch) ;

			(*Initial Matched Speed Zone*)
				AutData.State[1].CamProfileIndex	:= 16#FFFF;
				AutData.State[1].MasterFactor		:= REAL_TO_UDINT((MatchedSpeed_Inch-rTempPosA1_Inch)*gA[11].UnitsPerInch);
				AutData.State[1].SlaveFactor		:= REAL_TO_DINT((MatchedSpeed_Inch-rTempPosA1_Inch)*gA[1].UnitsPerInch);
				AutData.State[1].CompMode			:= ncOFF;

				AutData.State[1].Event[0].Type		:= ncST_END;
				AutData.State[1].Event[0].Attribute	:= ncST_END;
				AutData.State[1].Event[0].NextState	:= 2;

			(*Initial Comp With Matched Speed Zone*)
				AutData.State[2].CamProfileIndex	:= 16#FFFF;
				AutData.State[2].MasterFactor		:= REAL_TO_UDINT(MatchedSpeed_Inch*gA[11].UnitsPerInch);
				AutData.State[2].SlaveFactor		:= REAL_TO_DINT(MatchedSpeed_Inch*gA[1].UnitsPerInch);
				AutData.State[2].CompMode			:= ncONLYCOMP;
				AutData.State[2].MasterCompDistance	:= (gA[11].AxisPeriod)-((gA[11].PositionInch+MasterOffset)*gA[11].UnitsPerInch)-AutData.State[1].MasterFactor;
				AutData.State[2].SlaveCompDistance	:= (Slave_AxisPeriod)-gA[1].PositionCount-AutData.State[1].SlaveFactor;

				IF (AutData.State[2].SlaveCompDistance<=0) THEN
					AutData.State[2].SlaveCompDistance := AutData.State[2].SlaveCompDistance+Slave_AxisPeriod;
				END_IF
				IF (AutData.State[2].MasterCompDistance<0) THEN
					Value1 := REAL_TO_DINT(AutData.State[2].MasterCompDistance*1000.0);
					Value2 := REAL_TO_DINT(gA[11].AxisPeriod*1000.0);
					AutData.State[2].MasterCompDistance := (DINT_TO_REAL(Value1 MOD Value2))/1000.0;
					IF (AutData.State[2].MasterCompDistance<0) THEN
						AutData.State[2].MasterCompDistance := AutData.State[2].MasterCompDistance+gA[11].AxisPeriod;
					END_IF
				END_IF
				IF ((AutData.State[2].MasterCompDistance<(0.5*gA[11].AxisPeriod)) AND (AutData.State[2].SlaveCompDistance>(0.5*Slave_AxisPeriod))) THEN
					AutData.State[2].MasterCompDistance := AutData.State[2].MasterCompDistance+(gA[11].AxisPeriod);
				END_IF
				IF (AutData.State[2].MasterCompDistance<(0.1*gA[11].AxisPeriod)) THEN
					AutData.State[2].MasterCompDistance := AutData.State[2].MasterCompDistance+(gA[11].AxisPeriod);
				END_IF

				AutData.State[2].Event[0].Type		:= ncST_END;
				AutData.State[2].Event[0].Attribute	:= ncST_END;
				AutData.State[2].Event[0].NextState	:= 3;

			ELSE
				InMatched := 0;

			(*Automat STATE 0 Basis State*)
				AutData.State[0].Event[0].Type		:= ncST_END;
				AutData.State[0].Event[0].Attribute	:= ncAT_ONCE;
				AutData.State[0].Event[0].NextState	:= 2;

			(*Initial Matched Speed Zone...NOT USED*)
				AutData.State[1].CamProfileIndex	:= 16#FFFE;
				AutData.State[1].MasterFactor		:= 1;
				AutData.State[1].SlaveFactor		:= 1;
				AutData.State[1].CompMode			:= ncOFF;

				AutData.State[1].Event[0].Type		:= ncST_END;
				AutData.State[1].Event[0].Attribute	:= ncST_END;
				AutData.State[1].Event[0].NextState	:= 3;

			(*Initial Comp With Matched Speed Zone*)
				AutData.State[2].CamProfileIndex	:= 16#FFFF;
				AutData.State[2].MasterFactor		:= REAL_TO_UDINT(MatchedSpeed_Inch*gA[11].UnitsPerInch);
				AutData.State[2].SlaveFactor		:= REAL_TO_DINT(MatchedSpeed_Inch*gA[1].UnitsPerInch);
				AutData.State[2].CompMode			:= ncONLYCOMP;
				AutData.State[2].MasterCompDistance	:= gA[11].AxisPeriod-((gA[11].PositionInch+MasterOffset)*gA[11].UnitsPerInch);
				AutData.State[2].SlaveCompDistance	:= Slave_AxisPeriod-gA[1].PositionCount;

				IF (AutData.State[2].SlaveCompDistance<=0) THEN
					AutData.State[2].SlaveCompDistance := AutData.State[2].SlaveCompDistance+Slave_AxisPeriod;
				END_IF
				IF (AutData.State[2].MasterCompDistance<0) THEN
					Value1 := REAL_TO_DINT(AutData.State[2].MasterCompDistance*1000.0);
					Value2 := REAL_TO_DINT(gA[11].AxisPeriod*1000.0);
					AutData.State[2].MasterCompDistance := (DINT_TO_REAL(Value1 MOD Value2))/1000.0;
					IF (AutData.State[2].MasterCompDistance<0) THEN
						AutData.State[2].MasterCompDistance := AutData.State[2].MasterCompDistance+gA[11].AxisPeriod;
					END_IF
				END_IF
				IF ((AutData.State[2].MasterCompDistance<(0.5*gA[11].AxisPeriod)) AND (AutData.State[2].SlaveCompDistance>(0.5*Slave_AxisPeriod))) THEN
					AutData.State[2].MasterCompDistance := AutData.State[2].MasterCompDistance+(gA[11].AxisPeriod);
				END_IF
				IF (AutData.State[2].MasterCompDistance<(0.1*gA[11].AxisPeriod)) THEN
					AutData.State[2].MasterCompDistance := AutData.State[2].MasterCompDistance+(gA[11].AxisPeriod);
				END_IF

				AutData.State[2].Event[0].Type		:= ncST_END;
				AutData.State[2].Event[0].Attribute	:= ncST_END;
				AutData.State[2].Event[0].NextState	:= 3;

			END_IF
			
		(*Running Comp With Matched Speed Zone *)
			AutData.State[3].CamProfileIndex	:= 16#FFFE;
			AutData.State[3].MasterFactor		:= 1;
			AutData.State[3].SlaveFactor		:= 0;
			AutData.State[3].CompMode			:= ncONLYCOMP;
			AutData.State[3].MasterCompDistance	:= Travel_Inch*gA[11].UnitsPerInch;
			AutData.State[3].SlaveCompDistance	:= Travel_Inch*gA[1].UnitsPerInch;

			AutData.State[3].Event[0].Type		:= ncST_END;
			AutData.State[3].Event[0].Attribute	:= ncST_END;
			AutData.State[3].Event[0].NextState	:= 4;
				
		(*Running Comp With Matched Speed Zone *)
			AutData.State[4].CamProfileIndex	:= 16#FFFF;
			AutData.State[4].MasterFactor		:= REAL_TO_UDINT(Slave_AxisPeriod);
			AutData.State[4].SlaveFactor		:= 0;
			AutData.State[4].CompMode			:= ncOFF;
			
			AutData.State[4].Event[0].Type		:= ncST_END;
			AutData.State[4].Event[0].Attribute	:= ncST_END;
			AutData.State[4].Event[0].NextState	:= 4;

		(*Initialize & Enable the Automat Control *)
			MC_BR_AutControl_0.Enable 		:= 1;
			MC_BR_AutControl_0.AdrAutData 	:= ADR(AutData);
			MC_BR_AutControl_0.InitAutData 	:= 1;
	END_IF
		(* wait for initialization done*)
			IF ((MC_BR_AutControl_0.AutDataInitialized = 1) AND (Synch_Request)) THEN
				MC_BR_AutControl_0.InitAutData 	:= 0;
				AutomatStart := 1;
			END_IF
			(* check if error occured *)
			IF (MC_BR_AutControl_0.ErrorID <> 0) THEN
				Error := MC_BR_AutControl_0.ErrorID;
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

	IF (gPerf_ParkRequired) THEN
		gA[1].Ind_AutomatEnabled:=MC_BR_AutControl_0.Enable;
		gA[1].Ind_CurrentAutomatState:=MC_BR_AutControl_0.ActualStateIndex;
	END_IF

	(********************** MC_AUTCONTROL *************************)
	MC_BR_AutControl_0.Slave:= gA[1].Ident;
	MC_BR_AutControl_0();

END_PROGRAM
