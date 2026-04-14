(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Library: HGWeber
 * File: HGW_Average.st
 * Author: pkiel
 * Created: September 03, 2009
 ********************************************************************
 * Implementation of library HGWeber
 ********************************************************************) 

(*Running/Weighted Averaging Of A Real Value*)
FUNCTION_BLOCK HGW_Average

	R_Trig0 (CLK:=Enable);
	IF (R_Trig0.Q) THEN
		AverageLength:=ProgramLength;
		Count:=0;
		Accum:=0;
	END_IF;

	R_Trig1 (CLK:=Execute);
	IF (R_Trig1.Q) THEN
		Length:=LIMIT(0.99*ProgramLength,ActualLength,1.01*ProgramLength);
		Accum:=Accum+Length;
		Count:=Count+1;
		AverageLength:=Accum/Count;
	END_IF;
	IF (Count>=24) THEN
		Count:=Count/2;
		Accum:=Accum/2;
		Update:=1;
	ELSE;
		Update:=0;
	END_IF;

END_FUNCTION_BLOCK
