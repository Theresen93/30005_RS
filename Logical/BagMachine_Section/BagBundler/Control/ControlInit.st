(********************************************************************
 * COPYRIGHT -- .
 ********************************************************************
 * Program: Control
 * File: ControlInit.st
 * Author: dominique
 * Created: August 16, 2011
 ********************************************************************
 * Implementation of program Control
 ********************************************************************)

PROGRAM _INIT


// Bundler Manual/Auto TB Colors  
  H_FB_ToggleTB_0.IN_uiTxt0_Ind := 0 ;
  H_FB_ToggleTB_0.IN_uiTxt1_Ind := -1 ;
  H_FB_ToggleTB_0.IN_uiBackCol_State0 := gYellow;
  H_FB_ToggleTB_0.IN_uiForeCol_State0 := gBlack;
  H_FB_ToggleTB_0.IN_uiBackCol_State1 := gGreen;
  H_FB_ToggleTB_0.IN_uiForeCol_State1 := gBlack;
  
  tBundInitTpHorn     := T#1s ;
  g_tBund_TpWatchSens := T#3s ;
  
  bHMI_Bund_OnOff := 0 ;
  


END_PROGRAM

