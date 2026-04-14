(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Library: HGWeber
 * File: HGW_RelativeChangeReal.st
 * Author: pkiel
 * Created: September 03, 2009
 ********************************************************************
 * Implementation of library HGWeber
 ********************************************************************) 

(*Detects A Change Of A Real Variable & Outputs the Relative Change*)
FUNCTION_BLOCK HGW_RelativeChangeReal

	OK := Enable;
	IF (Enable) THEN
		IF (Input <> Old) THEN
			Change := 1;
			Diff := Input-Old;
			Old := Input;
		ELSE
			Change := 0;
		END_IF
	ELSE
		Change :=0;
	END_IF

END_FUNCTION_BLOCK
