(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Library: HGWeber
 * File: HGW_RegCorrectABS.st
 * Author: pkiel
 * Created: September 03, 2009
 ********************************************************************
 * Implementation of library HGWeber
 ********************************************************************) 

(*Calculates Registration Correction For Absolute Type Registration*)
FUNCTION_BLOCK HGW_RegCorrectABS

	OK := Enable;

	(*Zero Out Correction Value When First Enabled*)
	R_Trig0 (CLK:= Enable);
	IF (R_Trig0.Q) THEN
		Correction :=0;
	END_IF

	(*Calculate Correction*)
	R_Trig1 (CLK:= Execute);
	IF (R_Trig1.Q) THEN
		Correction := Expected-NewCapture;
		IF (Correction>(Period/2.0)) THEN
			Correction := Correction-Period;
		END_IF
		IF (Correction<(-Period/2.0)) THEN
			Correction := Correction+Period;
		END_IF
	Correction := -WeightingFactor*Correction;
	END_IF

	(*Evaluate Correction For Limits*)
	IF (Correction>MaxCorrection) THEN
		Correction := MaxCorrection;
		Max_Positive := 1;
	ELSE;
		Max_Positive := 0;
	END_IF

	IF (Correction<-MaxCorrection) THEN
		Correction := -MaxCorrection;
		Max_Negative := 1;
	ELSE;
		Max_Negative := 0;
	END_IF;

	IF (Max_Positive OR Max_Negative) THEN
		MaxCorrectionExceeded := 1;
	ELSE;
		MaxCorrectionExceeded := 0;
	END_IF;

END_FUNCTION_BLOCK
