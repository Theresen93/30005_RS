(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: Splash
 * File: SplashCyclic.st
 * Author: pkiel
 * Created: October 09, 2009
 ********************************************************************
 * Implementation of program Splash
 ********************************************************************)

PROGRAM _CYCLIC

(* MAIN SCREEEN *)
	(* Get Handle For Main HMI *)
		IF Ready <> 1 THEN
		 	VC_HANDLE:= VA_Setup(1,'HMI_10');
		 	IF (VC_HANDLE <> 0) THEN
		 		Ready:= 1;
			END_IF
		END_IF
	
	(* Monitor To See If Main HMI Screen Calibration Is Active *)
		 IF (Ready = 1) THEN
		 	IF (VA_Saccess(1,VC_HANDLE)= 0) THEN
			 	Status:= VA_GetCalStatus (1,VC_HANDLE);
		 		VA_Srelease(1,VC_HANDLE);
			END_IF
		END_IF

	(* Main HMI Splash Screen Control *)
		IF (gCurrentScreen=0 AND Status=0) THEN
			TON_0( IN:=NOT SplashDone, PT:=T#12s );
			ElapsedTime:=TIME_TO_REAL(TON_0.ET);
			CountDown:=12-(ElapsedTime/1000);
			SplashDone:=TON_0.Q;
			IF (TON_0.Q) THEN
				gScreenControl:=1;
        g_bSplashDone := 1 ;
			END_IF
		END_IF
	
END_PROGRAM
