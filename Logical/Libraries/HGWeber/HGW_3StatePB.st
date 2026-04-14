(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Library: HGWeber
 * File: HGW_3StatePB.st
 * Author: pkiel
 * Created: September 03, 2009
 ********************************************************************
 * Implementation of library HGWeber
 ********************************************************************) 

(*Three State Pushbutton Control/Indication*)
FUNCTION_BLOCK HGW_3StatePB
	
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
			State2 := 0;
		1:
			Color_Ind := BackColor_State1 + ForeColor_State1 * 256;
			State0 := 0;
			State1 := 1;
			State2 := 0;
		2:
			Color_Ind := BackColor_State2 + ForeColor_State2 * 256;
			State0 := 0;
			State1 := 0;
			State2 := 1;
		3:
			Text_Ind := 0;
	END_CASE	

END_FUNCTION_BLOCK
