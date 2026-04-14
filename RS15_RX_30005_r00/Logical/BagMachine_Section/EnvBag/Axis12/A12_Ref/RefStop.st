(********************************************************************
 * COPYRIGHT -- .
 ********************************************************************
 * Program: A12_Control
 * File: RefStop.st
 * Author: dominique
 * Created: November 27, 2011
 ********************************************************************
 * Implementation of program A12_Control
 ********************************************************************) 

(*Ref Stop management*)
ACTION RefStop: 
  // Ref PB aniamtion 
  uiRefPBTxt_Ind   := 0 ;
  uiRefPBColor_Ind := gBlue + gWhite * 256 ;
  
  IF gA12Ref_Horn THEN 
    uiRefPBTxt_Ind   := 1 ;
    uiRefPBColor_Ind := gGreen + gBlack * 256 ;
  END_IF     
  
  IF Ref_Seq[3] THEN 
    uiRefPBTxt_Ind   := 2 ;
    uiRefPBColor_Ind := gRed + gBlack * 256 ;
  END_IF     
  
  
  IF ( NOT(gAlarmsOK)        OR 
       EDGEPOS(gA12Ref_PB)   OR 
       NOT(gStopStringOK) )  AND
     NOT(Ref_Seq[5])         AND     
     1                       THEN   
    IF Ref_Seq[3] THEN 
      gA[12].Cmd_Halt := 1 ; 
    ELSE
      Ref_Seq[5] := 1 ; 
    END_IF     
  END_IF     
  IF EDGENEG(gA[12].Cmd_Halt) AND 
     Ref_Seq[3]               THEN  
    Ref_Seq[5] := 1 ; 
  END_IF     
     
END_ACTION
