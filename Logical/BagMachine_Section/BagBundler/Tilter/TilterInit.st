(********************************************************************
 * COPYRIGHT -- .
 ********************************************************************
 * Program: Tilting
 * File: TiltingInit.st
 * Author: dominique
 * Created: August 16, 2011
 ********************************************************************
 * Implementation of program Tilting
 ********************************************************************)

PROGRAM _INIT


(* TODO : Add your code here *)
  rPosTiltDegPts := gr_rPosTiltTravel/C_rMaxAna ;
  rK := 1 ;
  rK_HMI := 35 ;
  rPosTiltInit_OK  := 1.0 ;
  rPosTiltInitHyst := 0.5 ;
  tTpStopTilt      := T#0.5s ;
  tTpOut14C5       := T#0.5s ;
  tTpOut14C3       := T#1s ;
  tTpWatchCyc      := T#6s ;

END_PROGRAM

