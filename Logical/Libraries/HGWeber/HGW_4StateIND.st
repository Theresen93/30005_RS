(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Library: HGWeber
 * File: HGW_4StateIND.st
 * Author: pkiel
 * Created: September 03, 2009
 ********************************************************************
 * Implementation of library HGWeber
 ********************************************************************) 

(*Four State Indication*)
FUNCTION_BLOCK HGW_4StateIND

	IF(In_State0)THEN
		Text_Ind := 0;
	END_IF
	IF(In_State1)THEN
		Text_Ind := 1;
	END_IF
	IF(In_State2)THEN
		Text_Ind := 2;
	END_IF
	IF(In_State3)THEN
		Text_Ind := 3;
	END_IF

	CASE Text_Ind OF
		0:
			Color_Ind := BackColor_State0 + ForeColor_State0 * 256;
			State0 := 1;
			State1 := 0;
			State2 := 0;
			State3 := 0;
		1:
			Color_Ind := BackColor_State1 + ForeColor_State1 * 256;
			State0 := 0;
			State1 := 1;
			State2 := 0;
			State3 := 0;
		2:
			Color_Ind := BackColor_State2 + ForeColor_State2 * 256;
			State0 := 0;
			State1 := 0;
			State2 := 1;
			State3 := 0;
		3:
			Color_Ind := BackColor_State3 + ForeColor_State3 * 256;
			State0 := 0;
			State1 := 0;
			State2 := 0;
			State3 := 1;
		4:
			Text_Ind := 0;
	END_CASE

END_FUNCTION_BLOCK
