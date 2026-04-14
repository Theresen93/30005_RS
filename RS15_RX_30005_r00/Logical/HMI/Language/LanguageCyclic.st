(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: Language
 * File: LanguageCyclic.st
 * Author: pkiel
 * Created: October 09, 2009
 ********************************************************************
 * Implementation of program Language
 ********************************************************************)

PROGRAM _CYCLIC

(*Language Control*)
	IF (Language_PB=0) THEN
		Language_Ind := 0;
	ELSE
		Language_Ind := 2; // Fr
	END_IF

END_PROGRAM
