(********************************************************************
 * COPYRIGHT -- .
 ********************************************************************
 * Program: FP_Heater
 * File: FP_HeaterInit.st
 * Author: dominique
 * Created: August 22, 2012
 ********************************************************************
 * Implementation of program FP_Heater
 ********************************************************************)

PROGRAM _INIT

  rPT1_t                   := 25 ;
  rDeltaTStopPicChauf      := 68 ; 
  rSeuilConsTempActBattTOR := 132.8 ;
  
  rPIDRegTChaufKP[1] := 18 ; 
  rPIDRegTChaufKI[1] := 30 ; 
  rPIDRegTChaufKD[1] := 1 ;

END_PROGRAM

