(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Library: HGWeber
 * File: HGW_2StateIND.st
 * Author: pkiel
 * Created: September 03, 2009
 ********************************************************************
 * Implementation of library HGWeber
 ********************************************************************) 

(*Two State Indication*)
FUNCTION_BLOCK HGW_2StateIND
	
	IF(In_State)THEN
		Text_Ind := 1;
	ELSE
		Text_Ind := 0;
	END_IF

	CASE Text_Ind OF
		0:
			Color_Ind := BackColor_State0 + ForeColor_State0 * 256;
			State0 := 1;
			State1 := 0;
		1:
			Color_Ind := BackColor_State1 + ForeColor_State1 * 256;
			State0 := 0;
			State1 := 1;
		2:
			Text_Ind := 0;
	END_CASE


END_FUNCTION_BLOCK
