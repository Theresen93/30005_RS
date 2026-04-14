(********************************************************************
 * COPYRIGHT -- .
 ********************************************************************
 * Library: HGWeber
 * File: H_FB_WatchSensor.st
 * Author: dominique
 * Created: August 19, 2011
 ********************************************************************
 * Implementation of library HGWeber
 ********************************************************************) 


FUNCTION_BLOCK H_FB_WatchSensor 
    // Reset fault   
    bReset := EDGEPOS(IN_bReset) ;
    // Filtering sensor input
    stTON_FiltSensIn(IN:=IN_bSensorIn, PT:=IN_tTpFiltDI);
    stTON_FiltSensOut(IN:=IN_bSensorOut, PT:=IN_tTpFiltDI);
    stTOF_FiltSensIn(IN:=stTON_FiltSensIn.Q, PT:=IN_tTpFiltDI) ;
    stTOF_FiltSensOut(IN:=stTON_FiltSensOut.Q, PT:=IN_tTpFiltDI) ;
    
    bSensorIn  := stTOF_FiltSensIn.Q ;
    bSensorOut := stTOF_FiltSensOut.Q ;
    
    // Fault calculation 
    stTON_SOL_Out(IN:=IN_bSOL_Out AND NOT(bReset), PT:=IN_tTpWatchOut+IN_tTpFiltDI) ;
    stTON_SOL_In(IN:=IN_bSOL_In AND NOT(bReset), PT:=IN_tTpWatchIn+IN_tTpFiltDI) ;
    IF stTON_SOL_Out.Q THEN 
      IF bSensorIn THEN 
        OUT_bSensIn_FaultOut := IN_bActSensIn ;  
      END_IF  
      IF NOT(bSensorOut) THEN 
        OUT_bSensOut_FaultOut := IN_bActSensOut ;  
      END_IF  
    END_IF 
       
    IF stTON_SOL_In.Q THEN 
      IF NOT(bSensorIn) THEN 
        OUT_bSensIn_FaultIn := IN_bActSensIn ;  
      END_IF  
      IF bSensorOut THEN 
        OUT_bSensOut_FaultIn := IN_bActSensOut ;  
      END_IF    
    END_IF 
    
    IF bReset THEN 
      OUT_bSensIn_FaultOut  := 0 ;  
      OUT_bSensOut_FaultOut := 0 ; 
      OUT_bSensIn_FaultIn   := 0 ;
      OUT_bSensOut_FaultIn  := 0 ;
    END_IF 

    OUT_bSensIn_Fault  := OUT_bSensIn_FaultOut OR OUT_bSensIn_FaultIn ; 
    OUT_bSensOut_Fault := OUT_bSensOut_FaultOut OR OUT_bSensOut_FaultIn ;  
    OUT_bSens_Fault    := OUT_bSensIn_Fault OR OUT_bSensOut_Fault ;  

END_FUNCTION_BLOCK
