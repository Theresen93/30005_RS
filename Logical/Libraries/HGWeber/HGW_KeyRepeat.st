(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Library: HGWeber
 * File: HGW_KeyRepeat.st
 * Author: pkiel
 * Created: September 03, 2009
 ********************************************************************
 * Implementation of library HGWeber
 ********************************************************************) 

(*Toggles A Bool At A Rate After An Initial Delay*)
FUNCTION_BLOCK HGW_KeyRepeat
	
	TON_0(IN:=Key_In,PT:=Delay);
	TON_1(IN:=(TON_0.Q AND (NOT TON_2.Q)),PT:=Rate/2);
	TON_2(IN:=TON_1.Q,PT:=Rate/2);

	R_Trig0(CLK:=Key_In);
	R_Trig1(CLK:=TON_0.Q);
	R_Trig2(CLK:=TON_1.Q);

	IF (R_Trig0.Q OR R_Trig1.Q OR R_Trig2.Q) THEN
		Key_Out:=1;
	ELSE
		Key_Out:=0;
	END_IF

END_FUNCTION_BLOCK
