(********************************************************************
 * COPYRIGHT -- .
 ********************************************************************
 * Program: CPURestart
 * File: CPURestartCyclic.st
 * Author: dominique
 * Created: March 18, 2012
 ********************************************************************
 * Implementation of program CPURestart
 ********************************************************************)

PROGRAM _CYCLIC

  // Sytem Restart from HMI
  
  // Cold
  IF HMI_CmdColdRestart THEN 
    HMI_CmdColdRestart := 0 ;
    uiRetColdRestart := SYSreset(1, 2) ;
    IF (uiRetColdRestart <> 0) THEN 
      HMI_iCRestartStat := uiRetColdRestart ;
    END_IF 
  END_IF 
  
  // Warm
  IF HMI_CmdWarmRestart THEN 
    HMI_CmdWarmRestart := 0 ;
    uiRetWarmRestart := SYSreset(1, 1) ;
    IF (uiRetWarmRestart <> 0) THEN 
      HMI_iWRestartStat := uiRetWarmRestart ;
    END_IF 
  END_IF 
  
  // Reset stat
  IF EDGEPOS(gAlarmReset) THEN 
    HMI_iCRestartStat := 0 ;
    HMI_iWRestartStat := 0 ;
  END_IF 
  

END_PROGRAM
