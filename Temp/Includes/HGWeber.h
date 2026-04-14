/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _HGWEBER_
#define _HGWEBER_
#ifdef __cplusplus
extern "C" 
{
#endif

#include <bur/plctypes.h>

/* Datatypes and datatypes of function blocks */
typedef struct HGW_2StatePB
{
	/* VAR_INPUT (analog) */
	unsigned short BackColor_State0;
	unsigned short ForeColor_State0;
	unsigned short BackColor_State1;
	unsigned short ForeColor_State1;
	/* VAR_OUTPUT (analog) */
	unsigned short Text_Ind;
	unsigned short Color_Ind;
	/* VAR (analog) */
	struct r_trig R_Trig1;
	/* VAR_INPUT (digital) */
	plcbit PB;
	plcbit Reset;
	/* VAR_OUTPUT (digital) */
	plcbit State0;
	plcbit State1;
} HGW_2StatePB_typ;

typedef struct HGW_3StatePB
{
	/* VAR_INPUT (analog) */
	unsigned short BackColor_State0;
	unsigned short ForeColor_State0;
	unsigned short BackColor_State1;
	unsigned short ForeColor_State1;
	unsigned short BackColor_State2;
	unsigned short ForeColor_State2;
	/* VAR_OUTPUT (analog) */
	unsigned short Text_Ind;
	unsigned short Color_Ind;
	/* VAR (analog) */
	struct r_trig R_Trig1;
	/* VAR_INPUT (digital) */
	plcbit PB;
	plcbit Reset;
	/* VAR_OUTPUT (digital) */
	plcbit State0;
	plcbit State1;
	plcbit State2;
} HGW_3StatePB_typ;

typedef struct HGW_4StatePB
{
	/* VAR_INPUT (analog) */
	unsigned short BackColor_State0;
	unsigned short ForeColor_State0;
	unsigned short BackColor_State1;
	unsigned short ForeColor_State1;
	unsigned short BackColor_State2;
	unsigned short ForeColor_State2;
	unsigned short BackColor_State3;
	unsigned short ForeColor_State3;
	/* VAR_OUTPUT (analog) */
	unsigned short Text_Ind;
	unsigned short Color_Ind;
	/* VAR (analog) */
	struct r_trig R_Trig1;
	/* VAR_INPUT (digital) */
	plcbit PB;
	plcbit Reset;
	/* VAR_OUTPUT (digital) */
	plcbit State0;
	plcbit State1;
	plcbit State2;
	plcbit State3;
} HGW_4StatePB_typ;

typedef struct HGW_2StateIND
{
	/* VAR_INPUT (analog) */
	unsigned short BackColor_State0;
	unsigned short ForeColor_State0;
	unsigned short BackColor_State1;
	unsigned short ForeColor_State1;
	/* VAR_OUTPUT (analog) */
	unsigned short Text_Ind;
	unsigned short Color_Ind;
	/* VAR_INPUT (digital) */
	plcbit In_State;
	/* VAR_OUTPUT (digital) */
	plcbit State0;
	plcbit State1;
} HGW_2StateIND_typ;

typedef struct HGW_3StateIND
{
	/* VAR_INPUT (analog) */
	unsigned short BackColor_State0;
	unsigned short ForeColor_State0;
	unsigned short BackColor_State1;
	unsigned short ForeColor_State1;
	unsigned short BackColor_State2;
	unsigned short ForeColor_State2;
	/* VAR_OUTPUT (analog) */
	unsigned short Text_Ind;
	unsigned short Color_Ind;
	/* VAR_INPUT (digital) */
	plcbit In_State0;
	plcbit In_State1;
	plcbit In_State2;
	/* VAR_OUTPUT (digital) */
	plcbit State0;
	plcbit State1;
	plcbit State2;
} HGW_3StateIND_typ;

typedef struct HGW_3StateIND1
{
	/* VAR_INPUT (analog) */
	unsigned short IN_uiTxt_Ind_State0;
	unsigned short IN_uiTxt_Ind_State1;
	unsigned short IN_uiTxt_Ind_State2;
	float IN_rNumFlashPerSec;
	unsigned short IN_uiBackCol_State0;
	unsigned short IN_uiForeCol_State0;
	unsigned short IN_uiBackCol_State1;
	unsigned short IN_uiForeCol_State1;
	unsigned short IN_uiBackCol_State2;
	unsigned short IN_uiForeCol_State2;
	unsigned short IN_uiBackColFlash_Off_State0;
	unsigned short IN_uiForeColFlash_Off_State0;
	unsigned short IN_uiBackColFlash_On_State0;
	unsigned short IN_uiForeColFlash_On_State0;
	unsigned short IN_uiBackColFlash_Off_State1;
	unsigned short IN_uiForeColFlash_Off_State1;
	unsigned short IN_uiBackColFlash_On_State1;
	unsigned short IN_uiForeColFlash_On_State1;
	unsigned short IN_uiBackColFlash_Off_State2;
	unsigned short IN_uiForeColFlash_Off_State2;
	unsigned short IN_uiBackColFlash_On_State2;
	unsigned short IN_uiForeColFlash_On_State2;
	/* VAR_OUTPUT (analog) */
	unsigned short OUT_uiTxt_Ind;
	unsigned short OUT_uiCol_Ind;
	/* VAR (analog) */
	struct TON stTON_1;
	struct TON stTON_0;
	plctime tTpFlash;
	/* VAR_INPUT (digital) */
	plcbit IN_bState0;
	plcbit IN_bState1;
	plcbit IN_bState2;
	plcbit IN_bFlash;
	/* VAR_OUTPUT (digital) */
	plcbit OUT_bState0;
	plcbit OUT_bState1;
	plcbit OUT_bState2;
	/* VAR (digital) */
	plcbit bFlash;
} HGW_3StateIND1_typ;

typedef struct HGW_4StateIND
{
	/* VAR_INPUT (analog) */
	unsigned short BackColor_State0;
	unsigned short ForeColor_State0;
	unsigned short BackColor_State1;
	unsigned short ForeColor_State1;
	unsigned short BackColor_State2;
	unsigned short ForeColor_State2;
	unsigned short BackColor_State3;
	unsigned short ForeColor_State3;
	/* VAR_OUTPUT (analog) */
	unsigned short Text_Ind;
	unsigned short Color_Ind;
	/* VAR_INPUT (digital) */
	plcbit In_State0;
	plcbit In_State1;
	plcbit In_State2;
	plcbit In_State3;
	/* VAR_OUTPUT (digital) */
	plcbit State0;
	plcbit State1;
	plcbit State2;
	plcbit State3;
} HGW_4StateIND_typ;

typedef struct HGW_Toggle
{
	/* VAR_INPUT (analog) */
	plctime Time;
	/* VAR (analog) */
	signed char zzInternalMemory[10];
	struct TON TON_0;
	struct TON TON_1;
	/* VAR_INPUT (digital) */
	plcbit In;
	/* VAR_OUTPUT (digital) */
	plcbit Out;
} HGW_Toggle_typ;

typedef struct HGW_2StepMove
{
	/* VAR (analog) */
	struct TON TON_0;
	struct TON TON_1;
	struct TON TON_2;
	signed char zzInternalMemory[10];
	/* VAR_INPUT (digital) */
	plcbit MoveRequest;
	plcbit Permissive;
	/* VAR_OUTPUT (digital) */
	plcbit Horn;
	plcbit StartMove;
	/* VAR (digital) */
	plcbit HornDone;
	plcbit StartWindow;
} HGW_2StepMove_typ;

typedef struct HGW_ChangeReal
{
	/* VAR_INPUT (analog) */
	float Input;
	/* VAR (analog) */
	float Old;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	/* VAR_OUTPUT (digital) */
	plcbit OK;
	plcbit Change;
} HGW_ChangeReal_typ;

typedef struct HGW_ScaleReal
{
	/* VAR_INPUT (analog) */
	float InputMin;
	float InputMax;
	float InputRaw;
	float ScaledMin;
	float ScaledMax;
	/* VAR_OUTPUT (analog) */
	float ScaledOut;
	/* VAR (analog) */
	float InputDiff;
	float ScaledDiff;
	float Slope;
	float Offset;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	/* VAR_OUTPUT (digital) */
	plcbit OK;
	plcbit Error;
} HGW_ScaleReal_typ;

typedef struct HGW_RelativeChangeReal
{
	/* VAR_INPUT (analog) */
	float Input;
	/* VAR_OUTPUT (analog) */
	float Diff;
	/* VAR (analog) */
	float Old;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	/* VAR_OUTPUT (digital) */
	plcbit OK;
	plcbit Change;
} HGW_RelativeChangeReal_typ;

typedef struct HGW_Average
{
	/* VAR_INPUT (analog) */
	float ProgramLength;
	float ActualLength;
	/* VAR_OUTPUT (analog) */
	float AverageLength;
	/* VAR (analog) */
	struct r_trig R_Trig0;
	struct r_trig R_Trig1;
	signed short Count;
	float Accum;
	float Length;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Update;
} HGW_Average_typ;

typedef struct HGW_RegCorrectABS
{
	/* VAR_INPUT (analog) */
	float NewCapture;
	float Expected;
	float Period;
	float WeightingFactor;
	float MaxCorrection;
	/* VAR_OUTPUT (analog) */
	float Correction;
	/* VAR (analog) */
	struct r_trig R_Trig0;
	struct r_trig R_Trig1;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit OK;
	plcbit MaxCorrectionExceeded;
	/* VAR (digital) */
	plcbit Max_Positive;
	plcbit Max_Negative;
} HGW_RegCorrectABS_typ;

typedef struct HGW_KeyRepeat
{
	/* VAR_INPUT (analog) */
	plctime Delay;
	plctime Rate;
	/* VAR (analog) */
	struct TON TON_0;
	struct TON TON_1;
	struct TON TON_2;
	struct r_trig R_Trig0;
	struct r_trig R_Trig1;
	struct r_trig R_Trig2;
	/* VAR_INPUT (digital) */
	plcbit Key_In;
	/* VAR_OUTPUT (digital) */
	plcbit Key_Out;
} HGW_KeyRepeat_typ;

typedef struct HGW_2StateIND1
{
	/* VAR_INPUT (analog) */
	unsigned short BackColorFlash_Off;
	unsigned short ForeColorFlash_Off;
	unsigned short BackColorFlash_On;
	unsigned short ForeColorFlash_On;
	unsigned short BackColor_State1;
	unsigned short ForeColor_State1;
	/* VAR_OUTPUT (analog) */
	unsigned short Text_Ind;
	unsigned short Color_Ind;
	/* VAR (analog) */
	struct TON TON_1;
	struct TON TON_0;
	/* VAR_INPUT (digital) */
	plcbit In_State;
	/* VAR_OUTPUT (digital) */
	plcbit State0;
	plcbit State1;
	/* VAR (digital) */
	plcbit Flash;
} HGW_2StateIND1_typ;

typedef struct HGW_2StepMove1
{
	/* VAR_INPUT (analog) */
	plctime IN_tTpHorn;
	/* VAR (analog) */
	plctime tTimReset;
	struct TON stTON_0;
	struct TON stTON_1;
	struct TON stTON_2;
	signed char zzInternalMemory[13];
	/* VAR_INPUT (digital) */
	plcbit IN_bMoveRequest;
	plcbit IN_bPermissive;
	plcbit IN_bCasRun;
	/* VAR_OUTPUT (digital) */
	plcbit OUT_bHorn;
	plcbit OUT_bStartMove;
	/* VAR (digital) */
	plcbit bHornDone;
	plcbit bStartWindow;
} HGW_2StepMove1_typ;

typedef struct H_FB_2StepMove
{
	/* VAR_INPUT (analog) */
	plctime IN_tTpHorn;
	/* VAR_OUTPUT (analog) */
	signed short OUT_iActStep;
	/* VAR (analog) */
	struct TON stTON_0;
	struct TON stTON_1;
	struct TON stTON_2;
	struct TON stTON_3;
	signed short iStep;
	/* VAR_INPUT (digital) */
	plcbit IN_bStart;
	plcbit IN_bPermis;
	/* VAR_OUTPUT (digital) */
	plcbit OUT_bHorn;
	plcbit OUT_bStartMove;
	/* VAR (digital) */
	plcbit zzEdge00000;
	plcbit zzEdge00001;
} H_FB_2StepMove_typ;

typedef struct H_FB_ToggleTB
{
	/* VAR_INPUT (analog) */
	signed short IN_uiTxt1_Ind;
	signed short IN_uiTxt0_Ind;
	unsigned short IN_uiBackCol_State0;
	unsigned short IN_uiForeCol_State0;
	unsigned short IN_uiBackCol_State1;
	unsigned short IN_uiForeCol_State1;
	/* VAR_OUTPUT (analog) */
	unsigned short OUT_uiTxt_Ind;
	unsigned short OUT_uiCol_Ind;
	/* VAR_INPUT (digital) */
	plcbit IN_bTB;
	/* VAR (digital) */
	plcbit zzEdge00000;
} H_FB_ToggleTB_typ;

typedef struct H_FB_WatchSensor
{
	/* VAR_INPUT (analog) */
	plctime IN_tTpWatchIn;
	plctime IN_tTpWatchOut;
	plctime IN_tTpFiltDI;
	/* VAR (analog) */
	struct TON stTON_SOL_Out;
	struct TON stTON_SOL_In;
	struct TON stTON_FiltSensIn;
	struct TOF stTOF_FiltSensIn;
	struct TON stTON_FiltSensOut;
	struct TOF stTOF_FiltSensOut;
	/* VAR_INPUT (digital) */
	plcbit IN_bActSensIn;
	plcbit IN_bSensorIn;
	plcbit IN_bActSensOut;
	plcbit IN_bSensorOut;
	plcbit IN_bSOL_In;
	plcbit IN_bSOL_Out;
	plcbit IN_bReset;
	/* VAR_OUTPUT (digital) */
	plcbit OUT_bSensIn_FaultIn;
	plcbit OUT_bSensIn_FaultOut;
	plcbit OUT_bSensOut_FaultIn;
	plcbit OUT_bSensOut_FaultOut;
	plcbit OUT_bSensIn_Fault;
	plcbit OUT_bSensOut_Fault;
	plcbit OUT_bSens_Fault;
	/* VAR (digital) */
	plcbit bReset;
	plcbit bSensorIn;
	plcbit bSensorOut;
	plcbit zzEdge00000;
} H_FB_WatchSensor_typ;

typedef struct H_FB_Flash
{
	/* VAR_INPUT (analog) */
	float IN_rNumFlashPerSec;
	/* VAR (analog) */
	plctime tTpFlash;
	struct TON stTON_0;
	struct TON stTON_1;
	/* VAR_INPUT (digital) */
	plcbit IN_bEnable;
	/* VAR_OUTPUT (digital) */
	plcbit OUT_bFlash;
	/* VAR (digital) */
	plcbit zzEdge00000;
} H_FB_Flash_typ;

typedef struct H_FB_RelativeChangeLimitReal
{
	/* VAR_INPUT (analog) */
	float IN_rMax;
	float IN_rMin;
	float IN_rInput;
	float IN_rRepeat;
	/* VAR_OUTPUT (analog) */
	float OUT_rDiff;
	/* VAR_IN_OUT (analog and digital) */
	float* INOUT_rLimitIn;
	/* VAR (analog) */
	float rInput;
	float rOld;
	float rDiff;
	float rMax;
	float rMin;
	float rOldLimitIn;
	float rLimitIn;
	/* VAR_INPUT (digital) */
	plcbit IN_bEnable;
	/* VAR_OUTPUT (digital) */
	plcbit OUT_bOK;
	plcbit OUT_bChange;
} H_FB_RelativeChangeLimitReal_typ;

typedef struct H_FB_RelativeChangeLimitReal1
{
	/* VAR_INPUT (analog) */
	float IN_rMax;
	float IN_rMin;
	float IN_rInput;
	float IN_rRepeat;
	float IN_rLimitIn;
	/* VAR_OUTPUT (analog) */
	float OUT_rDiff;
	float OUT_rLimitIn;
	/* VAR (analog) */
	float rInput;
	float rOld;
	float rDiff;
	float rMax;
	float rMin;
	float rOldLimitIn;
	signed short iCount;
	/* VAR_INPUT (digital) */
	plcbit IN_bEnable;
	/* VAR_OUTPUT (digital) */
	plcbit OUT_bOK;
	plcbit OUT_bChange;
} H_FB_RelativeChangeLimitReal1_typ;



/* Prototyping of functions and function blocks */
void HGW_2StatePB(struct HGW_2StatePB* inst);
void HGW_3StatePB(struct HGW_3StatePB* inst);
void HGW_4StatePB(struct HGW_4StatePB* inst);
void HGW_2StateIND(struct HGW_2StateIND* inst);
void HGW_3StateIND(struct HGW_3StateIND* inst);
void HGW_3StateIND1(struct HGW_3StateIND1* inst);
void HGW_4StateIND(struct HGW_4StateIND* inst);
void HGW_Toggle(struct HGW_Toggle* inst);
void HGW_2StepMove(struct HGW_2StepMove* inst);
void HGW_ChangeReal(struct HGW_ChangeReal* inst);
void HGW_ScaleReal(struct HGW_ScaleReal* inst);
void HGW_RelativeChangeReal(struct HGW_RelativeChangeReal* inst);
void HGW_Average(struct HGW_Average* inst);
void HGW_RegCorrectABS(struct HGW_RegCorrectABS* inst);
void HGW_KeyRepeat(struct HGW_KeyRepeat* inst);
void HGW_2StateIND1(struct HGW_2StateIND1* inst);
void HGW_2StepMove1(struct HGW_2StepMove1* inst);
void H_FB_2StepMove(struct H_FB_2StepMove* inst);
void H_FB_ToggleTB(struct H_FB_ToggleTB* inst);
void H_FB_WatchSensor(struct H_FB_WatchSensor* inst);
void H_FB_Flash(struct H_FB_Flash* inst);
void H_FB_RelativeChangeLimitReal(struct H_FB_RelativeChangeLimitReal* inst);
void H_FB_RelativeChangeLimitReal1(struct H_FB_RelativeChangeLimitReal1* inst);
float H_FC_Modulus_V0(float IN_rMod, float IN_rVar);
float H_FC_Modulus(float IN_rMod, float IN_rVar);


#ifdef __cplusplus
};
#endif
#endif /* _HGWEBER_ */

