(********************************************************************
 * COPYRIGHT -- Microsoft
 ********************************************************************
 * Program: ManMode
 * File: ManModeCyclic.st
 * Author: pkiel
 * Created: July 22, 2011
 ********************************************************************
 * Implementation of program ManMode
 ********************************************************************)

PROGRAM _CYCLIC

(* Manual Mode Off/On From HMI *)
	HGW_2StatePB_0.PB := EDGEPOS(ManualMode_PB);
	ManualModeText_Ind := HGW_2StatePB_0.Text_Ind;
	ManualModeColor_Ind := HGW_2StatePB_0.Color_Ind;
	gManualMode_On := HGW_2StatePB_0.State1;
	HGW_2StatePB_0();

(* Manaul Mode Data Lock *)
	IF (gManualMode_On) THEN
		ManualDataLock := 0;
	ELSE
		ManualDataLock := 2;
  END_IF
  
  // Screen axis phase setting lock
  IF g_bMachineRun       AND 
     gManualMode_On      AND 
     g_bSynchroAxisOK    AND 
     g_bIndPhasDrumInact AND 
     1                   THEN   
    uiPhasSetLock := 0 ; // Free
  ELSE
    uiPhasSetLock := 2;  // Lock
  END_IF
  uiPhasTearingSetLock := 2 ; // When machine is running not possible to move Tearing axis alone always Holding+Tearing 
END_PROGRAM
