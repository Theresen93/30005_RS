(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Library: HGWeber
 * File: HGW_2StateIND1.st
 * Author: pkiel
 * Created: October 13, 2009
 ********************************************************************
 * Implementation of library HGWeber
 ********************************************************************) 

(*Two State Indication With "0" State Flash*)
FUNCTION_BLOCK HGW_2StateIND1

	IF(In_State)THEN
		Text_Ind := 1;
	ELSE
		Text_Ind := 0;
	END_IF
	
	TON_0(IN:=NOT(TON_1.Q),PT:=T#1s );
	TON_1(IN:=TON_0.Q,PT:=T#1s);
	Flash:=TON_0.Q;
	
	CASE Text_Ind OF
		0:
			IF (Flash) THEN
				Color_Ind := BackColorFlash_On + ForeColorFlash_On * 256;
			ELSE
				Color_Ind := BackColorFlash_Off + ForeColorFlash_Off * 256;
			END_IF
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
