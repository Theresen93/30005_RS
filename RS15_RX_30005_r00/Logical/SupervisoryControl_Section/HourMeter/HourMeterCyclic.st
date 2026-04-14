(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: HourMeter
 * File: HourMeterCyclic.st
 * Author: pkiel
 * Created: December 04, 2009
 ********************************************************************
 * Implementation of program HourMeter
 ********************************************************************)

PROGRAM _CYCLIC

(* NOTE: This cyclic program must be run in a 1 second class task to operate properly! *)

	(* Track Machine Run/Jog Time *)
	IF (gMachine_Run OR gMachine_Jog) THEN
		gMachineTime.Seconds := gMachineTime.Seconds+1;
		IF (gMachineTime.Seconds>=60) THEN
			gMachineTime.Minutes := gMachineTime.Minutes + 1;
			gMachineTime.Seconds := 0;
			IF (gMachineTime.Minutes>=60) THEN
				gMachineTime.Hours := gMachineTime.Hours +1;
				gMachineTime.Minutes := 0;
			END_IF
		END_IF
	END_IF

	HourMeterDisplay := DINT_TO_REAL(gMachineTime.Hours)+((INT_TO_REAL(gMachineTime.Minutes))/60.0);
	
END_PROGRAM
