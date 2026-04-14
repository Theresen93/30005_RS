(********************************************************************
 * COPYRIGHT -- .
 ********************************************************************
 * Program: Alarms1
 * File: actAnimAlarmVisu.st
 * Author: dominique
 * Created: January 27, 2012
 ********************************************************************
 * Implementation of program Alarms1
 ********************************************************************) 

(*Alarme animation on visu*)
ACTION actAnimAlarmVisu: 
  
  H_FB_Flash_0(IN_bEnable:=1, IN_rNumFlashPerSec:=1.0) ;
  
  // BP AU Panel +R4
  IF gI_EstopPB_1            AND 
     H_FB_Flash_0.OUT_bFlash THEN 
    iVisiblES_BP1 := 0 ; // Visible 
  ELSE
    iVisiblES_BP1 := 1 ; // Unvisible 
  END_IF 
  // BP AU Panel +R3
  IF gI_EstopPB_2            AND 
     H_FB_Flash_0.OUT_bFlash THEN 
    iVisiblES_BP2 := 0 ; // Visible 
  ELSE
    iVisiblES_BP2 := 1 ; // Unvisible 
  END_IF 
  // BP AU Panel +R1
  IF gI_EstopPB_3            AND 
     H_FB_Flash_0.OUT_bFlash THEN 
    iVisiblES_BP3 := 0 ; // Visible 
  ELSE
    iVisiblES_BP3 := 1 ; // Unvisible 
  END_IF 
  // BP AU Panel +R3
  IF gI_EstopPB_4            AND 
     H_FB_Flash_0.OUT_bFlash THEN 
    iVisiblES_BP4 := 0 ; // Visible 
  ELSE
    iVisiblES_BP4 := 1 ; // Unvisible 
  END_IF 
  // BP AU Panel +R1A
  IF gI_EstopPB_5            AND 
     H_FB_Flash_0.OUT_bFlash THEN 
    iVisiblES_BP5 := 0 ; // Visible 
  ELSE
    iVisiblES_BP5 := 1 ; // Unvisible 
  END_IF 
  // BP AU Footswitch Jog
  IF NOT(gI_SafetyRelay_EStopOK) AND 
     gI_JogPB_1                  AND 
     H_FB_Flash_0.OUT_bFlash     THEN 
    iVisiblES_BP6 := 0 ; // Visible 
  ELSE
    iVisiblES_BP6 := 1 ; // Unvisible 
  END_IF 
  
  // BP AU Flexo
  IF gI_EstopPB_FlexoPress   AND 
    H_FB_Flash_0.OUT_bFlash THEN 
    iVisiblES_BP9 := 0 ; // Visible 
  ELSE
    iVisiblES_BP9 := 1 ; // Unvisible 
  END_IF 
  
  // BP AU DHS
  IF gI_EstopPB_Unwind       AND 
    H_FB_Flash_0.OUT_bFlash THEN 
    iVisiblES_BP10 := 0 ; // Visible 
  ELSE
    iVisiblES_BP10 := 1 ; // Unvisible 
  END_IF 
       
       
          

END_ACTION
