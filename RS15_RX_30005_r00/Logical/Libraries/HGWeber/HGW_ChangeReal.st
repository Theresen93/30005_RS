(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Library: HGWeber
 * File: HGW_ChangeReal.st
 * Author: pkiel
 * Created: September 03, 2009
 ********************************************************************
 * Implementation of library HGWeber
 ********************************************************************) 

(*Detects A Change Of A Real Number For One Scan*)
FUNCTION_BLOCK HGW_ChangeReal

	OK := Enable;
	IF (Enable) THEN
		IF (Input <> Old) THEN
			Change := 1;
			Old := Input;
		ELSE
			Change := 0;
		END_IF
	ELSE;
		Change :=0;
	END_IF;

END_FUNCTION_BLOCK
