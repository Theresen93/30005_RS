(********************************************************************
 * COPYRIGHT -- .
 ********************************************************************
 * Library: HGWeber
 * File: H_FB_ToggleTB.st
 * Author: dominique
 * Created: August 19, 2011
 ********************************************************************
 * Implementation of library HGWeber
 ********************************************************************) 


FUNCTION_BLOCK H_FB_ToggleTB
    
    IF IN_bTB THEN 
      OUT_uiTxt_Ind := IN_uiTxt1_Ind ;
    ELSE
      OUT_uiTxt_Ind := IN_uiTxt0_Ind ;
    END_IF 
    
    IF IN_bTB THEN 
      OUT_uiCol_Ind := IN_uiBackCol_State0 + IN_uiForeCol_State0 * 256;
    ELSE
      OUT_uiCol_Ind := IN_uiBackCol_State1 + IN_uiForeCol_State1 * 256;   
    END_IF 
      
END_FUNCTION_BLOCK
