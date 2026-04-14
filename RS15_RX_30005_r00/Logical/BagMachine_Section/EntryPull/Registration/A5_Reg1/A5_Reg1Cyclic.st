(********************************************************************
 * COPYRIGHT -- Microsoft
 ********************************************************************
 * Program: A5_Reg1
 * File: A5_Reg1Cyclic.st
 * Author: pkiel
 * Created: July 19, 2011
 ********************************************************************
 * Implementation of program A5_Reg1
 ********************************************************************)

PROGRAM _CYCLIC

(*** REGISTRATION PROGRAM FOR MARK TO MACHINE REGISTRATION USED ON A DRAWROLL ***)
(*** Note: Since both the exit pull roll is slaved to the entry pull roll, the registration correction
	only needs to be sent into the entry pull roll axis.  ***)

(************************ REGISTRATION CAPTURE SECTION **********************)

(* Registration TouchProbe Capture 0...Used To Capture Master For Calculating Registration Correction *)
	MC_BR_TouchProbe_0.Axis:=gA[9].Ident;
	MC_BR_TouchProbe_0.TriggerInput:=TriggerRef_0;
	MC_BR_TouchProbe_0.Enable:=gReg[5].Enable;
	MC_BR_TouchProbe_0.Period:=gRecipeActive.Repeat*gA[9].UnitsPerInch*gReg[5].SP_Format;
	MC_BR_TouchProbe_0.WindowNegative:=gRecipeActive.Repeat*gA[9].UnitsPerInch*0.5*gReg[5].SP_Format;
	MC_BR_TouchProbe_0.WindowPositive:=MC_BR_TouchProbe_0.WindowNegative;
	MC_BR_TouchProbe_0.Mode:=68;
	MC_BR_TouchProbe_0();
rRecordedPeriodicValue[0] := MC_BR_TouchProbe_0.RecordedPeriodicValue; 

(* Registration TouchProbe Capture 1...Used To Capture Slave For Qualifying Registration Marks & Calculating Length *)
	MC_BR_TouchProbe_1.Axis:=gA[5].Ident;
	MC_BR_TouchProbe_1.TriggerInput:=TriggerRef_1;
	MC_BR_TouchProbe_1.Enable:=gReg[5].Enable;
	MC_BR_TouchProbe_1.Period:=gRecipeActive.Repeat*gA[5].UnitsPerInch*gReg[5].SP_Format;
	MC_BR_TouchProbe_1.PeriodChange:=(gReg[5].LengthAverage*gA[5].UnitsPerInch*gReg[5].SP_Format)-MC_BR_TouchProbe_1.Period;
	MC_BR_TouchProbe_1.WindowNegative:=gReg[5].SP_Tolerance*gA[5].UnitsPerInch;
	MC_BR_TouchProbe_1.WindowPositive:=MC_BR_TouchProbe_1.WindowNegative;
	MC_BR_TouchProbe_1.Mode:=mcSHIFT_FROM_RESULT+mcUSE_FIRST_TRIGGER_POS;
	MC_BR_TouchProbe_1();

(* Detect First Mark *)
	IF ((MC_BR_TouchProbe_1.ProbeCounter = 1)AND(NOT gReg[5].MarkFirst)) THEN
		gReg[5].MarkFirst:=1;
		FirstCapture:=MC_BR_TouchProbe_0.RecordedPeriodicValue;
	END_IF;

(* Detect Probe Counter 0 Change *)
	IF (MC_BR_TouchProbe_0.ProbeCounter <> ProbeCounter0_Old) THEN
		ProbeCounter0_Change:=1;
		ProbeCounter0_Old:=MC_BR_TouchProbe_1.ProbeCounter;
	END_IF

(* Detect Probe Counter 1 Change *)
	IF (MC_BR_TouchProbe_1.ProbeCounter <> ProbeCounter1_Old) THEN
		ProbeCounter1_Change:=1;
		ProbeCounter1_Old:=MC_BR_TouchProbe_1.ProbeCounter;
	END_IF

(* Detect Change In Both Probe Counters *)
	IF (ProbeCounter0_Change AND ProbeCounter1_Change) THEN
		ProbeCounter_Change:=1;
		ProbeCounter0_Change:=0;
		ProbeCounter1_Change:=0;
	ELSE
		ProbeCounter_Change:=0;
	END_IF;

(* Detect Good Mark *)
	IF (gReg[5].MarkFirst AND ProbeCounter_Change AND gReg[5].Enable) THEN
		gReg[5].MarkGood:=1;
		gReg[5].MarkGoodNew:=1;
		gReg[5].MarkMissed:=0;
		gReg[5].Ind_General:=2;
		gReg[5].MarkGoodCount:=gReg[5].MarkGoodCount+1;
		gReg[5].LengthActual:=gRecipeActive.Repeat-((MC_BR_TouchProbe_1.DeltaExpectedValue/gA[5].UnitsPerInch)/gReg[5].SP_Format);
	ELSE
		gReg[5].MarkGood:=0;
	END_IF;

(* Detect Missed Trigger Change *)
	IF (MC_BR_TouchProbe_1.MissedTriggers <> MissedTriggers_Old) THEN
		MissedTrigger_Change:=1;
		MissedTriggers_Old:=MC_BR_TouchProbe_1.MissedTriggers;
	ELSE
		MissedTrigger_Change:=0;
	END_IF;

	(* Detect Missed Mark *)
	IF (MissedTrigger_Change AND gReg[5].Enable) THEN
		gReg[5].MarkMissed:=1;
		gReg[5].MarkMissedNew:=1;
		gReg[5].MarkMissedCount:=gReg[5].MarkMissedCount+1;
		gReg[5].Ind_General:=1;
	END_IF;

(**** REGISTRATION CORRECTION CALCULATION SECTION ****)

(* Calculate Expected Capture Value *)
	Period:=gRecipeActive.Repeat*gA[9].UnitsPerInch;
	ExpectedCapture:=FirstCapture-(gReg[5].SP_Offset*gA[9].UnitsPerInch);
	IF (ExpectedCapture>Period) THEN
		ExpectedCapture:=ExpectedCapture-Period;
	END_IF;
	IF (ExpectedCapture<0) THEN
		ExpectedCapture:=ExpectedCapture+Period;
	END_IF;

rRecordedPeriodicValue[1] := MC_BR_TouchProbe_0.RecordedPeriodicValue; 

(* Calculate Correction *)
	HGW_RegCorrectABS_0.Enable:=gReg[5].Enable;
	HGW_RegCorrectABS_0.NewCapture:=MC_BR_TouchProbe_0.RecordedPeriodicValue;
	HGW_RegCorrectABS_0.Expected:=ExpectedCapture;
	HGW_RegCorrectABS_0.Period:=Period;
	HGW_RegCorrectABS_0.WeightingFactor:=gReg[5].SP_WeightingFactor;
	HGW_RegCorrectABS_0.MaxCorrection:=gReg[5].SP_MaximumCorrection*gA[9].UnitsPerInch*gReg[5].SP_Format;
	HGW_RegCorrectABS_0.Execute:=gReg[5].MarkGood;
	HGW_RegCorrectABS_0();

	IF (gReg[5].MarkGood) THEN
		gReg[5].LengthCorrection:=HGW_RegCorrectABS_0.Correction/gA[9].UnitsPerInch;
		gReg[5].CorrectionMax:=HGW_RegCorrectABS_0.MaxCorrectionExceeded;
	END_IF;

(************************ REGISTRATION CORRECTION/PHASE **********************)

(* Only Enable Phasing When In Synch Mode *)
	IF (gA[5].Ind_SynchronizedMotion) THEN
    MC_BR_Phasing_1.Enable:=1 AND NOT(bTest) ;
	ELSE;
		MC_BR_Phasing_1.Enable:=0;
	END_IF;
	MC_BR_Phasing_1.Shift:=HGW_RegCorrectABS_0.Correction;
	MC_BR_Phasing_1.Velocity:=1000000;
	MC_BR_Phasing_1.Acceleration:=1000000;
	MC_BR_Phasing_1.ApplicationDistance:= 0.75*gRecipeActive.Repeat*gA[9].UnitsPerInch*gReg[5].SP_Format;
	MC_BR_Phasing_1.Slave:=gA[5].Ident;
	MC_BR_Phasing_1.ApplicationMode:=mcMASTER_DISTANCE_BASED;
	MC_BR_Phasing_1.ShiftMode:=mcRELATIVE;
	MC_BR_Phasing_1.InitData:=gReg[5].MarkGood;
	MC_BR_Phasing_1();

END_PROGRAM
