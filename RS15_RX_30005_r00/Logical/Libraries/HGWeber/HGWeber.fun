(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Library: HGWeber
 * File: HGWeber.fun
 * Author: pkiel
 * Created: September 03, 2009
 ********************************************************************
 * Functions and function blocks of library HGWeber
 ********************************************************************)

FUNCTION H_FC_Modulus_V0 : REAL  (*Calculat the modulus of number*)
  VAR_INPUT
    IN_rMod : REAL ;
    IN_rVar : REAL ;
  END_VAR
  VAR
    rVar : REAL;
  END_VAR
END_FUNCTION

FUNCTION H_FC_Modulus : REAL  (*Calculat the modulus of number*)
  VAR_INPUT
    IN_rMod : REAL ;
    IN_rVar : REAL ;
  END_VAR
  VAR
    rVar : REAL;
  END_VAR
END_FUNCTION

FUNCTION_BLOCK HGW_2StatePB (*Two State Pushbutton Control/Indication*)
	VAR_INPUT
		PB : BOOL; (*Add your parameter comment*)
		Reset : BOOL; (*Add your parameter comment*)
		BackColor_State0 : UINT; (*Add your parameter comment*)
		ForeColor_State0 : UINT; (*Add your parameter comment*)
		BackColor_State1 : UINT; (*Add your parameter comment*)
		ForeColor_State1 : UINT; (*Add your parameter comment*)
	END_VAR
	VAR_OUTPUT
		Text_Ind : UINT; (*Add your parameter comment*)
		Color_Ind : UINT; (*Add your parameter comment*)
		State0 : BOOL; (*Add your parameter comment*)
		State1 : BOOL; (*Add your parameter comment*)
	END_VAR
	VAR
		R_Trig1 : r_trig;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK HGW_3StatePB (*Three State Pushbutton Control/Indication*)
	VAR_INPUT
		PB : BOOL; (*Add your parameter comment*)
		Reset : BOOL; (*Add your parameter comment*)
		BackColor_State0 : UINT; (*Add your parameter comment*)
		ForeColor_State0 : UINT; (*Add your parameter comment*)
		BackColor_State1 : UINT; (*Add your parameter comment*)
		ForeColor_State1 : UINT; (*Add your parameter comment*)
		BackColor_State2 : UINT;
		ForeColor_State2 : UINT;
	END_VAR
	VAR_OUTPUT
		Text_Ind : UINT; (*Add your parameter comment*)
		Color_Ind : UINT; (*Add your parameter comment*)
		State0 : BOOL; (*Add your parameter comment*)
		State1 : BOOL; (*Add your parameter comment*)
		State2 : BOOL; (*Add your parameter comment*)
	END_VAR
	VAR
		R_Trig1 : r_trig;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK HGW_4StatePB (*Four State Pushbutton Control/Indication*)
	VAR_INPUT
		PB : BOOL; (*Add your parameter comment*)
		Reset : BOOL; (*Add your parameter comment*)
		BackColor_State0 : UINT; (*Add your parameter comment*)
		ForeColor_State0 : UINT; (*Add your parameter comment*)
		BackColor_State1 : UINT; (*Add your parameter comment*)
		ForeColor_State1 : UINT; (*Add your parameter comment*)
		BackColor_State2 : UINT; (*Add your parameter comment*)
		ForeColor_State2 : UINT; (*Add your parameter comment*)
		BackColor_State3 : UINT; (*Add your parameter comment*)
		ForeColor_State3 : UINT; (*Add your parameter comment*)
	END_VAR
	VAR_OUTPUT
		Text_Ind : UINT; (*Add your parameter comment*)
		Color_Ind : UINT; (*Add your parameter comment*)
		State0 : BOOL; (*Add your parameter comment*)
		State1 : BOOL; (*Add your parameter comment*)
		State2 : BOOL; (*Add your parameter comment*)
		State3 : BOOL; (*Add your parameter comment*)
	END_VAR
	VAR
		R_Trig1 : r_trig;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK HGW_2StateIND (*Two State Indication*)
	VAR_INPUT
		In_State : BOOL; (*Add your parameter comment*)
		BackColor_State0 : UINT; (*Add your parameter comment*)
		ForeColor_State0 : UINT; (*Add your parameter comment*)
		BackColor_State1 : UINT; (*Add your parameter comment*)
		ForeColor_State1 : UINT; (*Add your parameter comment*)
	END_VAR
	VAR_OUTPUT
		Text_Ind : UINT; (*Add your parameter comment*)
		Color_Ind : UINT; (*Add your parameter comment*)
		State0 : BOOL; (*Add your parameter comment*)
		State1 : BOOL; (*Add your parameter comment*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK HGW_3StateIND (*Three State Indication*)
  VAR_INPUT
    In_State0 : BOOL; (*Add your parameter comment*)
    In_State1 : BOOL; (*Add your parameter comment*)
    In_State2 : BOOL; (*Add your parameter comment*)
    BackColor_State0 : UINT; (*Add your parameter comment*)
    ForeColor_State0 : UINT; (*Add your parameter comment*)
    BackColor_State1 : UINT; (*Add your parameter comment*)
    ForeColor_State1 : UINT; (*Add your parameter comment*)
    BackColor_State2 : UINT; (*Add your parameter comment*)
    ForeColor_State2 : UINT; (*Add your parameter comment*)
  END_VAR
  VAR_OUTPUT
    Text_Ind : UINT; (*Add your parameter comment*)
    Color_Ind : UINT; (*Add your parameter comment*)
    State0 : BOOL; (*Add your parameter comment*)
    State1 : BOOL; (*Add your parameter comment*)
    State2 : BOOL; (*Add your parameter comment*)
  END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK HGW_3StateIND1 (*Three State Indication*)
  VAR_INPUT
    IN_bState0 : BOOL; (*Add your parameter comment*)
    IN_bState1 : BOOL; (*Add your parameter comment*)
    IN_bState2 : BOOL; (*Add your parameter comment*)
    IN_bFlash  : BOOL; (*Add your parameter comment*)
    IN_uiTxt_Ind_State0 : UINT := 0 ;
    IN_uiTxt_Ind_State1 : UINT := 1 ;
    IN_uiTxt_Ind_State2 : UINT := 2 ;
    IN_rNumFlashPerSec  : REAL := 1 ; (*Number of flash per second*)
    IN_uiBackCol_State0 : UINT; (*Add your parameter comment*)
    IN_uiForeCol_State0 : UINT; (*Add your parameter comment*)
    IN_uiBackCol_State1 : UINT; (*Add your parameter comment*)
    IN_uiForeCol_State1 : UINT; (*Add your parameter comment*)
    IN_uiBackCol_State2 : UINT; (*Add your parameter comment*)
    IN_uiForeCol_State2 : UINT; (*Add your parameter comment*)
    IN_uiBackColFlash_Off_State0 : UINT; (*Add your parameter comment*)
    IN_uiForeColFlash_Off_State0 : UINT; (*Add your parameter comment*)
    IN_uiBackColFlash_On_State0  : UINT; (*Add your parameter comment*)
    IN_uiForeColFlash_On_State0  : UINT; (*Add your parameter comment*)
    IN_uiBackColFlash_Off_State1 : UINT; (*Add your parameter comment*)
    IN_uiForeColFlash_Off_State1 : UINT; (*Add your parameter comment*)
    IN_uiBackColFlash_On_State1  : UINT; (*Add your parameter comment*)
    IN_uiForeColFlash_On_State1  : UINT; (*Add your parameter comment*)
    IN_uiBackColFlash_Off_State2 : UINT; (*Add your parameter comment*)
    IN_uiForeColFlash_Off_State2 : UINT; (*Add your parameter comment*)
    IN_uiBackColFlash_On_State2  : UINT; (*Add your parameter comment*)
    IN_uiForeColFlash_On_State2  : UINT; (*Add your parameter comment*)
    
  END_VAR
  VAR_OUTPUT
    OUT_uiTxt_Ind : UINT; (*Add your parameter comment*)
    OUT_uiCol_Ind : UINT; (*Add your parameter comment*)
    OUT_bState0   : BOOL; (*Add your parameter comment*)
    OUT_bState1   : BOOL; (*Add your parameter comment*)
    OUT_bState2   : BOOL; (*Add your parameter comment*)
  END_VAR
  VAR  
    stTON_1  : TON;
    stTON_0  : TON;
    bFlash   : BOOL;
    tTpFlash : TIME ; 
  END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK HGW_4StateIND (*Four State Indication*)
	VAR_INPUT
		In_State0 : BOOL; (*Add your parameter comment*)
		In_State1 : BOOL; (*Add your parameter comment*)
		In_State2 : BOOL; (*Add your parameter comment*)
		In_State3 : BOOL; (*Add your parameter comment*)
		BackColor_State0 : UINT; (*Add your parameter comment*)
		ForeColor_State0 : UINT; (*Add your parameter comment*)
		BackColor_State1 : UINT; (*Add your parameter comment*)
		ForeColor_State1 : UINT; (*Add your parameter comment*)
		BackColor_State2 : UINT; (*Add your parameter comment*)
		ForeColor_State2 : UINT; (*Add your parameter comment*)
		BackColor_State3 : UINT; (*Add your parameter comment*)
		ForeColor_State3 : UINT; (*Add your parameter comment*)
	END_VAR
	VAR_OUTPUT
		Text_Ind : UINT; (*Add your parameter comment*)
		Color_Ind : UINT; (*Add your parameter comment*)
		State0 : BOOL; (*Add your parameter comment*)
		State1 : BOOL; (*Add your parameter comment*)
		State2 : BOOL; (*Add your parameter comment*)
		State3 : BOOL; (*Add your parameter comment*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK HGW_Toggle (*Time Based Toggle For Bool*)
	VAR_INPUT
		In : BOOL; (*Add your parameter comment*)
		Time : TIME; (*Add your parameter comment*)
	END_VAR
	VAR_OUTPUT
		Out : BOOL; (*Add your parameter comment*)
	END_VAR
	VAR
		zzInternalMemory : ARRAY[0..9] OF SINT; (*Internal memory*)
		TON_0 : TON; (*Add your parameter comment*)
		TON_1 : TON; (*Add your parameter comment*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK HGW_2StepMove (*Standard Two Step Move*)
  VAR_INPUT
    MoveRequest : BOOL; (*Add your parameter comment*)
    Permissive  : BOOL; (*Add your parameter comment*)
  END_VAR
  VAR_OUTPUT
    Horn : BOOL; (*Add your parameter comment*)
    StartMove : BOOL; (*Add your parameter comment*)
  END_VAR
  VAR
    HornDone : BOOL; (*Add your parameter comment*)
    StartWindow : BOOL; (*Add your parameter comment*)
    TON_0 : TON; (*Add your parameter comment*)
    TON_1 : TON; (*Add your parameter comment*)
    TON_2 : TON; (*Add your parameter comment*)
    zzInternalMemory : ARRAY[0..9] OF SINT; (*Internal memory*)
  END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK HGW_ChangeReal (*Detects A Change Of A Real Number For One Scan*)
	VAR_INPUT
		Enable : BOOL; (*Add your parameter comment*)
		Input : REAL; (*Add your parameter comment*)
	END_VAR
	VAR_OUTPUT
		OK : BOOL; (*Add your parameter comment*)
		Change : BOOL; (*Add your parameter comment*)
	END_VAR
	VAR
		Old : REAL; (*Add your parameter comment*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK HGW_ScaleReal (*Scales A Real Value A Scaled Range*)
	VAR_INPUT
		Enable : BOOL; (*Add your parameter comment*)
		InputMin : REAL; (*Add your parameter comment*)
		InputMax : REAL; (*Add your parameter comment*)
		InputRaw : REAL; (*Add your parameter comment*)
		ScaledMin : REAL; (*Add your parameter comment*)
		ScaledMax : REAL; (*Add your parameter comment*)
	END_VAR
	VAR_OUTPUT
		OK : BOOL; (*Add your parameter comment*)
		ScaledOut : REAL; (*Add your parameter comment*)
		Error : BOOL; (*Add your parameter comment*)
	END_VAR
	VAR
		InputDiff : REAL; (*Add your parameter comment*)
		ScaledDiff : REAL; (*Add your parameter comment*)
		Slope : REAL; (*Add your parameter comment*)
		Offset : REAL; (*Add your parameter comment*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK HGW_RelativeChangeReal (*Detects A Change Of A Real Variable & Outputs the Relative Change*)
	VAR_INPUT
		Enable : BOOL; (*Add your parameter comment*)
		Input : REAL; (*Add your parameter comment*)
	END_VAR
	VAR_OUTPUT
		OK : BOOL; (*Add your parameter comment*)
		Change : BOOL; (*Add your parameter comment*)
		Diff : REAL; (*Add your parameter comment*)
	END_VAR
	VAR
		Old : REAL; (*Add your parameter comment*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK HGW_Average (*Running/Weighted Averaging Of A Real Value*)
	VAR_INPUT
		Enable : BOOL; (*Add your parameter comment*)
		Execute : BOOL; (*Add your parameter comment*)
		ProgramLength : REAL; (*Add your parameter comment*)
		ActualLength : REAL; (*Add your parameter comment*)
	END_VAR
	VAR_OUTPUT
		AverageLength : REAL; (*Add your parameter comment*)
		Update : BOOL; (*Add your parameter comment*)
	END_VAR
	VAR
		R_Trig0 : r_trig; (*Add your parameter comment*)
		R_Trig1 : r_trig; (*Add your parameter comment*)
		Count : INT; (*Add your parameter comment*)
		Accum : REAL; (*Add your parameter comment*)
		Length : REAL; (*Add your parameter comment*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK HGW_RegCorrectABS (*Calculates Registration Correction For Absolute Type Registration*)
	VAR_INPUT
		Enable : BOOL; (*Add your parameter comment*)
		Execute : BOOL; (*Add your parameter comment*)
		NewCapture : REAL; (*Add your parameter comment*)
		Expected : REAL; (*Add your parameter comment*)
		Period : REAL; (*Add your parameter comment*)
		WeightingFactor : REAL; (*Add your parameter comment*)
		MaxCorrection : REAL; (*Add your parameter comment*)
	END_VAR
	VAR_OUTPUT
		OK : BOOL; (*Add your parameter comment*)
		Correction : REAL; (*Add your parameter comment*)
		MaxCorrectionExceeded : BOOL; (*Add your parameter comment*)
	END_VAR
	VAR
		R_Trig0 : r_trig; (*Add your parameter comment*)
		R_Trig1 : r_trig; (*Add your parameter comment*)
		Max_Positive : BOOL;
		Max_Negative : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK HGW_KeyRepeat (*Toggles A Bool At A Rate After An Initial Delay*)
	VAR_INPUT
		Key_In : BOOL; (*Add your parameter comment*)
		Delay : TIME; (*Add your parameter comment*)
		Rate : TIME; (*Add your parameter comment*)
	END_VAR
	VAR_OUTPUT
		Key_Out : BOOL; (*Add your parameter comment*)
	END_VAR
	VAR
		TON_0 : TON; (*Add your parameter comment*)
		TON_1 : TON; (*Add your parameter comment*)
		TON_2 : TON; (*Add your parameter comment*)
		R_Trig0 : r_trig; (*Add your parameter comment*)
		R_Trig1 : r_trig; (*Add your parameter comment*)
		R_Trig2 : r_trig;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK HGW_2StateIND1 (*Two State Indication With "0" State Flash*)
	VAR_INPUT
		In_State : BOOL; (*Add your parameter comment*)
		BackColorFlash_Off : UINT; (*Add your parameter comment*)
		ForeColorFlash_Off : UINT; (*Add your parameter comment*)
		BackColorFlash_On : UINT; (*Add your parameter comment*)
		ForeColorFlash_On : UINT; (*Add your parameter comment*)
		BackColor_State1 : UINT; (*Add your parameter comment*)
		ForeColor_State1 : UINT; (*Add your parameter comment*)
	END_VAR
	VAR_OUTPUT
		Text_Ind : UINT; (*Add your parameter comment*)
		Color_Ind : UINT; (*Add your parameter comment*)
		State0 : BOOL; (*Add your parameter comment*)
		State1 : BOOL; (*Add your parameter comment*)
	END_VAR
	VAR
		TON_1 : TON;
		TON_0 : TON;
		Flash : BOOL;
	END_VAR
  
END_FUNCTION_BLOCK

FUNCTION_BLOCK HGW_2StepMove1  (*TODO: Add your comment here*) 

  VAR_INPUT
    IN_bMoveRequest : BOOL; (*Add your parameter comment*)
    IN_bPermissive  : BOOL; (*Add your parameter comment*)
    IN_bCasRun      : BOOL := 0; (*=1 case Run, =0 case Jog*)
    IN_tTpHorn      : TIME; (*Horn duration, in s*)
  END_VAR
  VAR_OUTPUT
    OUT_bHorn : BOOL; (*Add your parameter comment*)
    OUT_bStartMove : BOOL; (*Add your parameter comment*)
  END_VAR
  VAR
    tTimReset : TIME; (*Add your parameter comment*)
    bHornDone : BOOL; (*Add your parameter comment*)
    bStartWindow : BOOL; (*Add your parameter comment*)
    stTON_0 : TON; (*Add your parameter comment*)
    stTON_1 : TON; (*Add your parameter comment*)
    stTON_2 : TON; (*Add your parameter comment*)
    zzInternalMemory : ARRAY[0..12] OF SINT; (*Internal memory*)
  END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK H_FB_2StepMove  (*TODO: Add your comment here*) 

  VAR_INPUT
    IN_bStart  : BOOL ;  (**)
    IN_bPermis : BOOL ;   
    IN_tTpHorn : TIME ;   
  END_VAR
  VAR_OUTPUT
    OUT_bHorn      : BOOL ;  (**)
    OUT_bStartMove : BOOL ;  (**)
    OUT_iActStep   : INT ; 
  END_VAR
  VAR_IN_OUT
  END_VAR
  VAR
    stTON_0 : TON ;  (**)
    stTON_1 : TON ;  (**)
    stTON_2 : TON ;  (**)
    stTON_3 : TON ;  (**)
    iStep   : INT ;
    zzEdge00000 : BOOL;
    zzEdge00001 : BOOL;
  END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK H_FB_ToggleTB  (*TODO: Add your comment here*) 

  VAR_INPUT
    IN_bTB : BOOL ;  (**)
    IN_uiTxt1_Ind       : INT ;
    IN_uiTxt0_Ind       : INT ;
    IN_uiBackCol_State0 : UINT; (*Add your parameter comment*)
    IN_uiForeCol_State0 : UINT; (*Add your parameter comment*)
    IN_uiBackCol_State1 : UINT; (*Add your parameter comment*)
    IN_uiForeCol_State1 : UINT; (*Add your parameter comment*)
  END_VAR
  VAR_OUTPUT
    OUT_uiTxt_Ind : UINT; (*Add your parameter comment*)
    OUT_uiCol_Ind : UINT; (*Add your parameter comment*)
  END_VAR
  VAR_IN_OUT
  END_VAR
  VAR
    zzEdge00000 : BOOL;
  END_VAR
END_FUNCTION_BLOCK
  
FUNCTION_BLOCK H_FB_WatchSensor  (*TODO: Add your comment here*) 

  VAR_INPUT
    IN_bActSensIn       : BOOL ; (*Act watch sensor In*)  
    IN_bSensorIn        : BOOL := 0 ;  
    IN_bActSensOut      : BOOL ; (*Act watch sensor Out*) 
    IN_bSensorOut       : BOOL := 0 ;  
    IN_bSOL_In          : BOOL := 0 ;  
    IN_bSOL_Out         : BOOL := 0 ;   
    IN_bReset           : BOOL ;           
    IN_tTpWatchIn       : TIME := T#4s ; (*Default time =4s*)
    IN_tTpWatchOut      : TIME := T#4s ; (*Default time =4s*)
    IN_tTpFiltDI        : TIME := T#30ms ; (*Time filtering input sensor default time =30ms*)
  END_VAR
  VAR_OUTPUT
    OUT_bSensIn_FaultIn   : BOOL ; (*Add your parameter comment*)
    OUT_bSensIn_FaultOut  : BOOL ; (*Add your parameter comment*)
    OUT_bSensOut_FaultIn  : BOOL ; (*Add your parameter comment*)
    OUT_bSensOut_FaultOut : BOOL ; (*Add your parameter comment*)
    OUT_bSensIn_Fault     : BOOL ; (*Add your parameter comment*)
    OUT_bSensOut_Fault    : BOOL ; (*Add your parameter comment*)
    OUT_bSens_Fault       : BOOL ; (*Add your parameter comment*)
  END_VAR
  VAR_IN_OUT
  END_VAR
  VAR
    bReset  : BOOL ; 
    bSensorIn     : BOOL ;
    bSensorOut    : BOOL ;
    stTON_SOL_Out : TON ;
    stTON_SOL_In  : TON ;
    stTON_FiltSensIn  : TON ;
    stTOF_FiltSensIn  : TOF ;
    stTON_FiltSensOut : TON ;
    stTOF_FiltSensOut : TOF ;
    zzEdge00000 : BOOL;
  END_VAR
END_FUNCTION_BLOCK
  
FUNCTION_BLOCK H_FB_Flash  (*TODO: Add your comment here*) 

  VAR_INPUT
    IN_bEnable          : BOOL ;  
    IN_rNumFlashPerSec  : REAL := 1 ; (*Number of flash per second*)
  END_VAR
  VAR_OUTPUT
    OUT_bFlash : BOOL ; (*Add your parameter comment*)
  END_VAR
  VAR
    tTpFlash : TIME ; 
    stTON_0  : TON ;
    stTON_1  : TON ;
    zzEdge00000 : BOOL;
  END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK H_FB_RelativeChangeLimitReal  (*TODO: Add your comment here*) 
  VAR_INPUT
    IN_bEnable : BOOL; (*Add your parameter comment*)
    IN_rMax    : REAL; 
    IN_rMin    : REAL; 
    IN_rInput  : REAL;
    IN_rRepeat : REAL;
  END_VAR
  VAR_IN_OUT
    INOUT_rLimitIn : REAL; (*Limited input*)
  END_VAR
  VAR_OUTPUT
    OUT_bOK : BOOL; (*Add your parameter comment*)
    OUT_bChange : BOOL; (*Add your parameter comment*)
    OUT_rDiff : REAL; (*Add your parameter comment*)
  END_VAR
  VAR
    rInput : REAL; (*Add your parameter comment*)
    rOld   : REAL; (*Add your parameter comment*)
    rDiff  : REAL; (*Add your parameter comment*)
    rMax   : REAL; (*Add your parameter comment*)   
    rMin   : REAL; (*Add your parameter comment*)  
    rOldLimitIn : REAL; (*Add your parameter comment*)  
    rLimitIn    : REAL; (*Add your parameter comment*) 
  END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK H_FB_RelativeChangeLimitReal1  (*TODO: Add your comment here*) 
  VAR_INPUT
    IN_bEnable : BOOL; (*Add your parameter comment*)
    IN_rMax    : REAL; 
    IN_rMin    : REAL; 
    IN_rInput  : REAL;
    IN_rRepeat : REAL;
    IN_rLimitIn : REAL; (*Limited input*)
  END_VAR
  VAR_IN_OUT
  END_VAR
  VAR_OUTPUT
    OUT_bOK : BOOL; (*Add your parameter comment*)
    OUT_bChange : BOOL; (*Add your parameter comment*)
    OUT_rDiff : REAL; (*Add your parameter comment*)
    OUT_rLimitIn : REAL; (*Limited input*)
  END_VAR
  VAR
    rInput : REAL; (*Add your parameter comment*)
    rOld   : REAL; (*Add your parameter comment*)
    rDiff  : REAL; (*Add your parameter comment*)
    rMax   : REAL; (*Add your parameter comment*)   
    rMin   : REAL; (*Add your parameter comment*)  
    rOldLimitIn : REAL; (*Add your parameter comment*)  
    iCount : INT ;
  END_VAR
END_FUNCTION_BLOCK
