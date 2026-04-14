(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Library: HGWeber
 * File: HGW_3StateIND.st
 * Author: pkiel
 * Created: September 03, 2009
 ********************************************************************
 * Implementation of library HGWeber
 ********************************************************************) 

(*Three State Indication*)
FUNCTION_BLOCK HGW_3StateIND1
	
	IF(IN_bState0)THEN
		OUT_uiTxt_Ind := IN_uiTxt_Ind_State0 ;
	END_IF
	IF(IN_bState1)THEN
		OUT_uiTxt_Ind := IN_uiTxt_Ind_State1 ;
	END_IF
	IF(IN_bState2)THEN
		OUT_uiTxt_Ind := IN_uiTxt_Ind_State2 ;
	END_IF
  
  tTpFlash := REAL_TO_TIME(1000/IN_rNumFlashPerSec) ;
  stTON_0(IN:=NOT(stTON_1.Q),PT:=tTpFlash);
  stTON_1(IN:=stTON_0.Q,PT:=tTpFlash);
  bFlash:=stTON_0.Q;
  
	CASE OUT_uiTxt_Ind OF
		0:
      IF IN_bFlash THEN
        IF (bFlash) THEN
          OUT_uiCol_Ind := IN_uiBackColFlash_On_State0 + IN_uiForeColFlash_On_State0 * 256;
        ELSE
          OUT_uiCol_Ind := IN_uiBackColFlash_Off_State0 + IN_uiForeColFlash_Off_State0 * 256;
        END_IF
      ELSE
        OUT_uiCol_Ind := IN_uiBackCol_State0 + IN_uiForeCol_State0 * 256;
      END_IF
			OUT_bState0 := 1;
			OUT_bState1 := 0;
			OUT_bState2 := 0;
		1:
      IF IN_bFlash THEN
        IF (bFlash) THEN
          OUT_uiCol_Ind := IN_uiBackColFlash_On_State1 + IN_uiForeColFlash_On_State1 * 256;
        ELSE
          OUT_uiCol_Ind := IN_uiBackColFlash_Off_State1 + IN_uiForeColFlash_Off_State1 * 256;
        END_IF
      ELSE
        OUT_uiCol_Ind := IN_uiBackCol_State1 + IN_uiForeCol_State1 * 256;
      END_IF
			OUT_bState0 := 0;
			OUT_bState1 := 1;
			OUT_bState2 := 0;
		2:
      IF IN_bFlash THEN
        IF (bFlash) THEN
          OUT_uiCol_Ind := IN_uiBackColFlash_On_State2 + IN_uiForeColFlash_On_State2 * 256;
        ELSE
          OUT_uiCol_Ind := IN_uiBackColFlash_Off_State2 + IN_uiForeColFlash_Off_State2 * 256;
        END_IF
      ELSE
        OUT_uiCol_Ind := IN_uiBackCol_State2 + IN_uiForeCol_State2 * 256;
      END_IF
			OUT_bState0 := 0;
			OUT_bState1 := 0;
			OUT_bState2 := 1;
		3:
			OUT_uiTxt_Ind := 0;
	END_CASE

END_FUNCTION_BLOCK
