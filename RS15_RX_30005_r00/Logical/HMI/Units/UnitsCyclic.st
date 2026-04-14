(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: Units
 * File: UnitsCyclic.st
 * Author: pkiel
 * Created: October 09, 2009
 ********************************************************************
 * Implementation of program Units
 ********************************************************************)

PROGRAM _CYCLIC
	
(*Inch/Metric Control*)
	IF (InchMetric_PB=0) THEN
		gInchMetric_Ind := 1; // 1 => Inch
	ELSE
		gInchMetric_Ind := 2; // 2 => Metric
	END_IF
	
END_PROGRAM
