(********************************************************************
 * COPYRIGHT -- .
 ********************************************************************
 * Program: SetSpeedMode
 * File: SetSpeedModeCyclic.st
 * Author: dominique
 * Created: September 29, 2011
 ********************************************************************
 * Implementation of program SetSpeedMode
 ********************************************************************)

PROGRAM _CYCLIC

// Select set speed mode
  IF HMI_bSetSpeed_PB THEN 
    IF NOT(gr_bSetSpeedMode) THEN 
      gr_bSetSpeedMode := 1 ; // Set MANU 
    ELSE
      HMI_uiConfirmSetSpeedVisibl := 0 ; // Display PopUp confirm set AUTO
    END_IF ;  
    HMI_bSetSpeed_PB := 0 ;
  END_IF ;  

END_PROGRAM
