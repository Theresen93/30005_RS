(********************************************************************
 * COPYRIGHT -- Microsoft
 ********************************************************************
 * Program: A5_Reg2
 * File: A5_Reg2Cyclic.st
 * Author: pkiel
 * Created: July 19, 2011
 ********************************************************************
 * Implementation of program A5_Reg2
 ********************************************************************)

PROGRAM _CYCLIC

(**** DRAWROLL GENERAL REGISTRATION STATUS & CONTROL SECTION ****)

(*** Registration Limits ***)
	gReg[5].SP_Tolerance:=LIMIT(0.375,gReg[5].SP_Tolerance,(0.5*gRecipeActive.Repeat));
	gReg[5].SP_Offset:=LIMIT(-gRecipeActive.Repeat,gReg[5].SP_Offset,gRecipeActive.Repeat);
	gReg[5].SP_Format:=LIMIT(1,gReg[5].SP_Format,4);
	gReg[5].SP_WeightingFactor:=LIMIT(0.3,gReg[5].SP_WeightingFactor,1);

(* Turn Off Registration On A Web Break *)
	IF (EDGENEG(gBagMachine_WebBreakOK)) THEN
		gReg[5].Enable := 0;
	END_IF

(*Registration OFF *)
	IF (NOT gReg[5].Enable) THEN
		gReg[5].MarkFirst:=0;
		gReg[5].MarkMissed:=0;
		gReg[5].Ind_General:=0;
		FirstAverage:=0;
		gReg[5].LengthAverage:=gRecipeActive.Repeat;
	END_IF

(* Registration Initialization *)
	IF(gReg[5].Enable AND (NOT gReg[5].MarkFirst)) THEN
		gReg[5].Ind_General:=1;
		gReg[5].LengthCorrection:=0;
		gReg[5].LengthActual:=gRecipeActive.Repeat;
		gReg[5].SP_Offset:=0;
	END_IF

(*Reset Counts When Registration Is Turned On *)
	IF (EDGEPOS(gReg[5].Enable)) THEN
		gReg[5].MarkMissedCount:=0;
		gReg[5].MarkGoodCount:=0;
	END_IF

	(* Registration HMI Button Display *)
	CASE gReg[5].Ind_General OF
		0:
			gReg[5].Ind_Text:=0;
			Background:=gBlue;
			Foreground:=gWhite;
		1:
			gReg[5].Ind_Text:=1;
			Background:=gYellow;
			Foreground:=gBlack;
		2:
			gReg[5].Ind_Text:=2;
			Background:=gGreen;
			Foreground:=gBlack;
	ELSE
		gReg[5].Ind_General:=0;
	END_CASE;
	gReg[5].Ind_Color:=Background+Foreground*256;

(**** REGISTRATION AVERAGING SECTION ****)

(* Registration Averaging Calculations *)
	IF (gReg[5].MarkGoodNew AND FirstAverage) THEN
		HGW_Average_0.ActualLength:=gReg[5].LengthActual;
		HGW_Average_0.Execute:=1;
	ELSE
		HGW_Average_0.Execute:=0;
	END_IF;
	IF (gReg[5].MarkGoodNew) THEN
		FirstAverage:=1;
	END_IF;

(* Registration Averaging Function Block *)
	HGW_Average_0.Enable:=gReg[5].Enable;
	HGW_Average_0.ProgramLength:=gRecipeActive.Repeat;
	HGW_Average_0();
	IF (gReg[5].Enable) THEN
		gReg[5].LengthAverage:=HGW_Average_0.AverageLength;
	END_IF

(* Update Drawroll Gearing Based On Average Length *)
	IF (HGW_Average_0.Update) THEN
		gA[5].Cmd_SynchronizedMotionUpdate:=1;
		gReg[5].SP_Repeat:=HGW_Average_0.AverageLength;
	END_IF

(* Detect Change In Repeat Setpoint *)
	IF (gRecipeActive.Repeat<>Repeat_Old) THEN
		Repeat_Old:=gRecipeActive.Repeat;
		gA[5].Cmd_SynchronizedMotionUpdate:=1;
		gReg[5].SP_Repeat:=gRecipeActive.Repeat;
		gReg[5].LengthAverage:=gRecipeActive.Repeat;
		gReg[5].LengthActual:=gRecipeActive.Repeat;
		gReg[5].Enable:=0;
	END_IF
(* Detect Change In Drawroll Diameter Setpoint *)
	IF (gSP_A[5].Diameter<>Diameter_Old) THEN
		Diameter_Old:=gSP_A[5].Diameter;
		gA[5].Cmd_SynchronizedMotionUpdate:=1;
		gReg[5].Enable:=0;
	END_IF
(* Detect Change In Drawroll Format Setpoint *)
	IF (gReg[5].SP_Format<>Format_Old) THEN
		Format_Old:=gReg[5].SP_Format;
		gA[5].Cmd_SynchronizedMotionUpdate:=1;
		gReg[5].Enable:=0;
	END_IF
	IF (NOT gA[5].Ind_SynchronizedMotion) THEN
		gA[5].Cmd_SynchronizedMotionUpdate:=0;
	END_IF

(**** MISSED MARK SHUTDOWN SECTION ****)

(* Missed Mark Shutdown Count *)
	IF (gReg[5].SP_MarkMissedCount>0) THEN
		IF (gReg[5].MarkMissedNew) THEN
			MissedMark_Count:=MissedMark_Count+1;
			FirstAverage:=0;
		END_IF
	END_IF
  IF (gReg[5].MarkGoodNew OR NOT(gReg[5].Enable) OR gHMI_Reset_PB OR EDGEPOS(gQ_CR_EstopReset)) THEN
		MissedMark_Count:=0;
	END_IF

(* Missed Mark Shutdown Evaluation *)
	IF(MissedMark_Count>gReg[5].SP_MarkMissedCount) THEN
		gReg[5].ShutdownMissedMark:=1;
	ELSE
		gReg[5].ShutdownMissedMark:=0;
	END_IF

(**** REGISTRATION USER OFFSET WATCH ****)

(* Detect Change In User Offset *)
	IF (gReg[5].SP_Offset<>Offset_Old) THEN
		Offset_Old:=gReg[5].SP_Offset;
		IF (gReg[5].MarkFirst) THEN
			gReg[5].OffsetActive:=1;
		END_IF
	END_IF
(* Watch for 2 consecutive corrections < maximum...this will indicate the user offset is run in *)
	IF (gReg[5].OffsetActive=1) THEN
		IF ((gReg[5].MarkGoodNew)AND(NOT gReg[5].CorrectionMax)) THEN
			Count:=Count+1;
		END_IF
		IF ((Count>2)OR(NOT gReg[5].Enable)) THEN
			Count:=0;
			gReg[5].OffsetActive:=0;
		END_IF
	END_IF

(**** REGISTRATION OUT OF TOLERANCE SHUTDOWN SECTION ****)

(* Out Of Tolerance Shutdown Count *)
	IF (gReg[5].SP_OutOfToleranceCount>0) THEN
		IF (gReg[5].MarkGoodNew) THEN
			IF ((gReg[5].CorrectionMax)AND(NOT gReg[5].OffsetActive)) THEN
				OutOfTolerance_Count:=OutOfTolerance_Count+1;
			ELSE
			OutOfTolerance_Count:=0;
			END_IF
		END_IF
	END_IF
	IF ((NOT gReg[5].Enable) OR gHMI_Reset_PB) THEN
		OutOfTolerance_Count:=0;
	END_IF

(* Out Of Tolerance Shutdown Evaluation *)
	IF (OutOfTolerance_Count>gReg[5].SP_OutOfToleranceCount) THEN
		gReg[5].ShutdownOutOfTolerance:=1;
	ELSE
		gReg[5].ShutdownOutOfTolerance:=0;
	END_IF

	(* General Reset Of Notification Bools *)
	gReg[5].MarkMissedNew:=0;
	gReg[5].MarkGoodNew:=0;
	gReg[5].CorrectionMax:=0;
	
END_PROGRAM
