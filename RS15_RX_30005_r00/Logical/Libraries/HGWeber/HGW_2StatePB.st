(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Library: HGWeber
 * File: HGW_2StatePB.st
 * Author: pkiel
 * Created: September 03, 2009
 ********************************************************************
 * Implementation of library HGWeber
 ********************************************************************) 

(*Two State Pushbutton Control/Indication*)
FUNCTION_BLOCK HGW_2StatePB

	R_Trig1(CLK:=PB);
	IF(R_Trig1.Q)THEN
		Text_Ind := 1 + Text_Ind;
	END_IF
	IF (Reset) THEN
		Text_Ind :=0;
	END_IF

	(* For Each Button Press, the internal state is changed...changing the text, color, and state indications *)

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
