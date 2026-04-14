(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Library: HGWeber
 * File: HGW_ScaleReal.st
 * Author: pkiel
 * Created: September 03, 2009
 ********************************************************************
 * Implementation of library HGWeber
 ********************************************************************) 

(*Scales A Real Value A Scaled Range*)
FUNCTION_BLOCK HGW_ScaleReal

	IF (Enable) THEN
		InputDiff:=InputMax-InputMin;
		ScaledDiff:=ScaledMax-ScaledMin;
		IF (InputDiff>0) THEN
			Slope:=ScaledDiff/InputDiff;
			Offset:=ScaledMin-(InputMin*Slope);
			ScaledOut:=(InputRaw*Slope)+Offset;
			OK:=1;
			Error:=0;
		ELSE
			OK:=0;
			Error:=1;
		END_IF
	ELSE
		OK:=0;
		Error:=0;
		ScaledOut:=0;
	END_IF

END_FUNCTION_BLOCK
