/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _ACP10_MC_
#define _ACP10_MC_

#include <bur/plctypes.h>

#ifndef _IEC_CONST
#define _IEC_CONST _WEAK const
#endif

/* Constants */
#ifdef _REPLACE_CONST
 #define mcWRAP 2U
 #define mcWITHOUT_PERIOD 4U
 #define mcWITHIN_PERIOD 6U
 #define mcWITH_PARAM 2U
 #define mcVELOCITY_CONTROL 4U
 #define mcUSE_FIRST_TRIGGER_POS 64U
 #define mcUNEQUAL 5U
 #define mcTRANSITION_ON 1U
 #define mcTRANSITION_OFF 0U
 #define mcTRACE_TRIGGER 3U
 #define mcTRACE_TIME 2U
 #define mcTRACE_STARTED 20U
 #define mcTRACE_RING 4U
 #define mcTRACE_REST 5U
 #define mcTRACE_FINISHED 1U
 #define mcTRACE_DELAY 6U
 #define mcTIME_BASED 1U
 #define mcTEST 31U
 #define mcT_FILTER 64U
 #define mcSWITCH_ON 258U
 #define mcSWITCH_OFF 259U
 #define mcSTRAIGHT_LINE 1U
 #define mcSTOP 261U
 #define mcSTEPPER 31U
 #define mcSTART_ONLY 3U
 #define mcSTART 260U
 #define mcSPEED 2U
 #define mcSMALLER 1U
 #define mcSLOW_DOWN 5U
 #define mcSLAVE_POSITION 0U
 #define mcSIMULATION_OFF 259U
 #define mcSIMPLE_SINE_CURVE 3U
 #define mcSHORTEST_WAY 3U
 #define mcSHIFT_FROM_RESULT 49U
 #define mcSHIFT_FROM_EXPECTED 50U
 #define mcSET_OFFSET 34U
 #define mcSE 3U
 #define mcSAVE 341U
 #define mcSATURATION 30U
 #define mcREVERSE 8U
 #define mcRESET 320U
 #define mcRELATIVE 1U
 #define mcQUEUED 1U
 #define mcQUADRATIC_PARABOLA 2U
 #define mcPOSITIVE_DIR 0U
 #define mcPOSITION 1U
 #define mcPERIODIC 1
 #define mcP_EDGE 0U
 #define mcOUT_WINDOW 30U
 #define mcOPTIMIZED_VELOCITY 512U
 #define mcOPTIMIZED_ACCELERATION 768U
 #define mcOPEN 1U
 #define mcONLY_PSM 1U
 #define mcONLY_EVENTS 254U
 #define mcONE_RECORD 0U
 #define mcONCE 1U
 #define mcON 1
 #define mcOFF 0
 #define mcNULL 1U
 #define mcNON_PERIODIC 0
 #define mcNO_PARAMS 253U
 #define mcNO_EVENTS 253U
 #define mcNET_TRACE_GLOBAL 0U
 #define mcNEGATIVE_DIR 1U
 #define mcN_EDGE 1U
 #define mcMULTI_AXIS_TRACE 0U
 #define mcMOTOR 258U
 #define mcMODIFIED_SINE_CURVE 7U
 #define mcMODIFIED_ACCEL_TRAPEZOID 6U
 #define mcMIDDLE 5U
 #define mcMASTER_POSITION_BASED 2U
 #define mcMASTER_POSITION 256U
 #define mcMASTER_DISTANCE_BASED 3U
 #define mcMANUAL_SEARCH 64U
 #define mcLOAD 276U
 #define mcLINEAR_CAM_PERIODIC 255U
 #define mcLINEAR_CAM_NON_PERIODIC 254U
 #define mcLINEAR_CAM 253U
 #define mcLIMIT 40U
 #define mcLENGTH_ONLY 32U
 #define mcLEAD_OUT 4U
 #define mcLEAD_IN 2U
 #define mcLAST_POINT 0U
 #define mcISQ_RIPPLE 20U
 #define mcISQ_F1_NOTCH 128U
 #define mcINTERVAL_EVENT 16U
 #define mcINCLINED_SINE_CURVE 5U
 #define mcIN_WINDOW 20U
 #define mcIMMEDIATE 0U
 #define mcIDENTIFICATION 10U
 #define mcHOME_SWITCH_GATE 8U
 #define mcHOME_SET_PHASE 7U
 #define mcHOME_RESTORE_POS 11U
 #define mcHOME_REF_PULSE 5U
 #define mcHOME_LIMIT_SWITCH 3U
 #define mcHOME_DIRECT 1U
 #define mcHOME_DEFAULT 0U
 #define mcHOME_DCM_CORR 10U
 #define mcHOME_DCM 9U
 #define mcHOME_AXIS_REF 12U
 #define mcHOME_ABSOLUTE_CORR 6U
 #define mcHOME_ABSOLUTE 4U
 #define mcHOME_ABS_SWITCH 2U
 #define mcHOLDOFF_DISTANCE 16384U
 #define mcHARMONIC_COMBINATION 8U
 #define mcGREATER 4U
 #define mcGE 6U
 #define mcFLUX 1U
 #define mcFIRST_TRIGGER 2U
 #define mcFILE 1U
 #define mcFF_POS_MOVE 33U
 #define mcFF_NEG_MOVE 34U
 #define mcFF 32U
 #define mcEXCEED_PERIOD 8U
 #define mcEVERY_RECORD 1U
 #define mcEQUAL 2U
 #define mcENCODER 0U
 #define mcEDGE_SENSITIVE 4U
 #define mcDITHER 32U
 #define mcDISTANCE_BASED 0U
 #define mcDIRECT 7U
 #define mcDATOBJ 0U
 #define mcCYCLIC_ALL_EVENTS 3U
 #define mcCYCLIC 2U
 #define mcCURRENT_DIR 2U
 #define mcCUBIC_SPLINE 256U
 #define mcCLOSE 0U
 #define mcCATCH_UP 4U
 #define mcCALCULATION 11U
 #define mcBLANK 0U
 #define mcBESTFIT_6TH_ORDER 1280U
 #define mcBESTFIT_5TH_ORDER 1024U
 #define mcBELOW_WINDOW 50U
 #define mcAVERAGE_WEIGHTED 4U
 #define mcAVERAGE 2U
 #define mcAUTOMAT_POS 100U
 #define mcALL_STATES 255U
 #define mcALL_PARAMS 0U
 #define mcALL_EVENTS 255U
 #define mcADD_DATE_TIME 1U
 #define mcACT_CFG 1U
 #define mcABSOLUTE_NO_RESET 2U
 #define mcABSOLUTE 0U
 #define mcABOVE_WINDOW 40U
 #define mc5TH_ORDER_POLYNOMIAL 4U
#else
 _IEC_CONST unsigned short mcWRAP = 2U;
 _IEC_CONST unsigned short mcWITHOUT_PERIOD = 4U;
 _IEC_CONST unsigned char mcWITHIN_PERIOD = 6U;
 _IEC_CONST unsigned char mcWITH_PARAM = 2U;
 _IEC_CONST unsigned short mcVELOCITY_CONTROL = 4U;
 _IEC_CONST unsigned short mcUSE_FIRST_TRIGGER_POS = 64U;
 _IEC_CONST unsigned short mcUNEQUAL = 5U;
 _IEC_CONST unsigned short mcTRANSITION_ON = 1U;
 _IEC_CONST unsigned short mcTRANSITION_OFF = 0U;
 _IEC_CONST unsigned char mcTRACE_TRIGGER = 3U;
 _IEC_CONST unsigned char mcTRACE_TIME = 2U;
 _IEC_CONST unsigned char mcTRACE_STARTED = 20U;
 _IEC_CONST unsigned char mcTRACE_RING = 4U;
 _IEC_CONST unsigned char mcTRACE_REST = 5U;
 _IEC_CONST unsigned char mcTRACE_FINISHED = 1U;
 _IEC_CONST unsigned char mcTRACE_DELAY = 6U;
 _IEC_CONST unsigned short mcTIME_BASED = 1U;
 _IEC_CONST unsigned short mcTEST = 31U;
 _IEC_CONST unsigned short mcT_FILTER = 64U;
 _IEC_CONST unsigned short mcSWITCH_ON = 258U;
 _IEC_CONST unsigned short mcSWITCH_OFF = 259U;
 _IEC_CONST unsigned short mcSTRAIGHT_LINE = 1U;
 _IEC_CONST unsigned short mcSTOP = 261U;
 _IEC_CONST unsigned char mcSTEPPER = 31U;
 _IEC_CONST unsigned char mcSTART_ONLY = 3U;
 _IEC_CONST unsigned short mcSTART = 260U;
 _IEC_CONST unsigned char mcSPEED = 2U;
 _IEC_CONST unsigned short mcSMALLER = 1U;
 _IEC_CONST unsigned char mcSLOW_DOWN = 5U;
 _IEC_CONST unsigned short mcSLAVE_POSITION = 0U;
 _IEC_CONST unsigned short mcSIMULATION_OFF = 259U;
 _IEC_CONST unsigned short mcSIMPLE_SINE_CURVE = 3U;
 _IEC_CONST unsigned char mcSHORTEST_WAY = 3U;
 _IEC_CONST unsigned short mcSHIFT_FROM_RESULT = 49U;
 _IEC_CONST unsigned short mcSHIFT_FROM_EXPECTED = 50U;
 _IEC_CONST unsigned char mcSET_OFFSET = 34U;
 _IEC_CONST unsigned short mcSE = 3U;
 _IEC_CONST unsigned short mcSAVE = 341U;
 _IEC_CONST unsigned char mcSATURATION = 30U;
 _IEC_CONST unsigned short mcREVERSE = 8U;
 _IEC_CONST unsigned short mcRESET = 320U;
 _IEC_CONST unsigned char mcRELATIVE = 1U;
 _IEC_CONST unsigned short mcQUEUED = 1U;
 _IEC_CONST unsigned short mcQUADRATIC_PARABOLA = 2U;
 _IEC_CONST unsigned char mcPOSITIVE_DIR = 0U;
 _IEC_CONST unsigned char mcPOSITION = 1U;
 _IEC_CONST plcbit mcPERIODIC = 1;
 _IEC_CONST unsigned char mcP_EDGE = 0U;
 _IEC_CONST unsigned char mcOUT_WINDOW = 30U;
 _IEC_CONST unsigned short mcOPTIMIZED_VELOCITY = 512U;
 _IEC_CONST unsigned short mcOPTIMIZED_ACCELERATION = 768U;
 _IEC_CONST unsigned char mcOPEN = 1U;
 _IEC_CONST unsigned char mcONLY_PSM = 1U;
 _IEC_CONST unsigned char mcONLY_EVENTS = 254U;
 _IEC_CONST unsigned short mcONE_RECORD = 0U;
 _IEC_CONST unsigned short mcONCE = 1U;
 _IEC_CONST plcbit mcON = 1;
 _IEC_CONST plcbit mcOFF = 0;
 _IEC_CONST unsigned short mcNULL = 1U;
 _IEC_CONST plcbit mcNON_PERIODIC = 0;
 _IEC_CONST unsigned char mcNO_PARAMS = 253U;
 _IEC_CONST unsigned char mcNO_EVENTS = 253U;
 _IEC_CONST unsigned long mcNET_TRACE_GLOBAL = 0U;
 _IEC_CONST unsigned char mcNEGATIVE_DIR = 1U;
 _IEC_CONST unsigned char mcN_EDGE = 1U;
 _IEC_CONST unsigned long mcMULTI_AXIS_TRACE = 0U;
 _IEC_CONST unsigned short mcMOTOR = 258U;
 _IEC_CONST unsigned short mcMODIFIED_SINE_CURVE = 7U;
 _IEC_CONST unsigned short mcMODIFIED_ACCEL_TRAPEZOID = 6U;
 _IEC_CONST unsigned char mcMIDDLE = 5U;
 _IEC_CONST unsigned short mcMASTER_POSITION_BASED = 2U;
 _IEC_CONST unsigned short mcMASTER_POSITION = 256U;
 _IEC_CONST unsigned short mcMASTER_DISTANCE_BASED = 3U;
 _IEC_CONST unsigned short mcMANUAL_SEARCH = 64U;
 _IEC_CONST unsigned short mcLOAD = 276U;
 _IEC_CONST unsigned char mcLINEAR_CAM_PERIODIC = 255U;
 _IEC_CONST unsigned char mcLINEAR_CAM_NON_PERIODIC = 254U;
 _IEC_CONST unsigned char mcLINEAR_CAM = 253U;
 _IEC_CONST unsigned char mcLIMIT = 40U;
 _IEC_CONST unsigned short mcLENGTH_ONLY = 32U;
 _IEC_CONST unsigned short mcLEAD_OUT = 4U;
 _IEC_CONST unsigned short mcLEAD_IN = 2U;
 _IEC_CONST unsigned short mcLAST_POINT = 0U;
 _IEC_CONST unsigned short mcISQ_RIPPLE = 20U;
 _IEC_CONST unsigned short mcISQ_F1_NOTCH = 128U;
 _IEC_CONST unsigned short mcINTERVAL_EVENT = 16U;
 _IEC_CONST unsigned short mcINCLINED_SINE_CURVE = 5U;
 _IEC_CONST unsigned char mcIN_WINDOW = 20U;
 _IEC_CONST unsigned short mcIMMEDIATE = 0U;
 _IEC_CONST unsigned short mcIDENTIFICATION = 10U;
 _IEC_CONST unsigned char mcHOME_SWITCH_GATE = 8U;
 _IEC_CONST unsigned char mcHOME_SET_PHASE = 7U;
 _IEC_CONST unsigned char mcHOME_RESTORE_POS = 11U;
 _IEC_CONST unsigned char mcHOME_REF_PULSE = 5U;
 _IEC_CONST unsigned char mcHOME_LIMIT_SWITCH = 3U;
 _IEC_CONST unsigned char mcHOME_DIRECT = 1U;
 _IEC_CONST unsigned char mcHOME_DEFAULT = 0U;
 _IEC_CONST unsigned char mcHOME_DCM_CORR = 10U;
 _IEC_CONST unsigned char mcHOME_DCM = 9U;
 _IEC_CONST unsigned char mcHOME_AXIS_REF = 12U;
 _IEC_CONST unsigned char mcHOME_ABSOLUTE_CORR = 6U;
 _IEC_CONST unsigned char mcHOME_ABSOLUTE = 4U;
 _IEC_CONST unsigned char mcHOME_ABS_SWITCH = 2U;
 _IEC_CONST unsigned short mcHOLDOFF_DISTANCE = 16384U;
 _IEC_CONST unsigned short mcHARMONIC_COMBINATION = 8U;
 _IEC_CONST unsigned short mcGREATER = 4U;
 _IEC_CONST unsigned short mcGE = 6U;
 _IEC_CONST unsigned char mcFLUX = 1U;
 _IEC_CONST unsigned short mcFIRST_TRIGGER = 2U;
 _IEC_CONST unsigned short mcFILE = 1U;
 _IEC_CONST unsigned short mcFF_POS_MOVE = 33U;
 _IEC_CONST unsigned short mcFF_NEG_MOVE = 34U;
 _IEC_CONST unsigned char mcFF = 32U;
 _IEC_CONST unsigned char mcEXCEED_PERIOD = 8U;
 _IEC_CONST unsigned short mcEVERY_RECORD = 1U;
 _IEC_CONST unsigned short mcEQUAL = 2U;
 _IEC_CONST unsigned char mcENCODER = 0U;
 _IEC_CONST unsigned char mcEDGE_SENSITIVE = 4U;
 _IEC_CONST unsigned char mcDITHER = 32U;
 _IEC_CONST unsigned short mcDISTANCE_BASED = 0U;
 _IEC_CONST unsigned char mcDIRECT = 7U;
 _IEC_CONST unsigned short mcDATOBJ = 0U;
 _IEC_CONST unsigned short mcCYCLIC_ALL_EVENTS = 3U;
 _IEC_CONST unsigned short mcCYCLIC = 2U;
 _IEC_CONST unsigned char mcCURRENT_DIR = 2U;
 _IEC_CONST unsigned short mcCUBIC_SPLINE = 256U;
 _IEC_CONST unsigned char mcCLOSE = 0U;
 _IEC_CONST unsigned char mcCATCH_UP = 4U;
 _IEC_CONST unsigned short mcCALCULATION = 11U;
 _IEC_CONST unsigned short mcBLANK = 0U;
 _IEC_CONST unsigned short mcBESTFIT_6TH_ORDER = 1280U;
 _IEC_CONST unsigned short mcBESTFIT_5TH_ORDER = 1024U;
 _IEC_CONST unsigned char mcBELOW_WINDOW = 50U;
 _IEC_CONST unsigned short mcAVERAGE_WEIGHTED = 4U;
 _IEC_CONST unsigned short mcAVERAGE = 2U;
 _IEC_CONST unsigned char mcAUTOMAT_POS = 100U;
 _IEC_CONST unsigned char mcALL_STATES = 255U;
 _IEC_CONST unsigned char mcALL_PARAMS = 0U;
 _IEC_CONST unsigned char mcALL_EVENTS = 255U;
 _IEC_CONST unsigned short mcADD_DATE_TIME = 1U;
 _IEC_CONST unsigned short mcACT_CFG = 1U;
 _IEC_CONST unsigned char mcABSOLUTE_NO_RESET = 2U;
 _IEC_CONST unsigned char mcABSOLUTE = 0U;
 _IEC_CONST unsigned char mcABOVE_WINDOW = 40U;
 _IEC_CONST unsigned short mc5TH_ORDER_POLYNOMIAL = 4U;
#endif


/* Variables */


/* Datatypes and datatypes of function blocks */
typedef struct MC_ACP_ENCOD_REF
{
	unsigned long Axis;
	unsigned char Slot;
} MC_ACP_ENCOD_REF;

typedef struct MC_ACP_ENCOD_PARAM_REF
{
	unsigned char HomingMode;
	plcbit ReadOffset;
	float Position;
	signed long Offset;
} MC_ACP_ENCOD_PARAM_REF;

typedef struct MC_ADVANCEDSHIFTPAR_REF
{
	unsigned short ShiftParID;
} MC_ADVANCEDSHIFTPAR_REF;

typedef struct MC_AUTDATA_EVENT_TYP
{
	unsigned char Type;
	unsigned char Attribute;
	unsigned long Action;
	unsigned char NextState;
} MC_AUTDATA_EVENT_TYP;

typedef struct MC_AUTDATA_STATE_TYP
{
	unsigned char DisableStateInit;
	unsigned short CamProfileIndex;
	unsigned long MasterFactor;
	signed long SlaveFactor;
	unsigned char CompMode;
	float MasterCompDistance;
	float SlaveCompDistance;
	unsigned short RepeatCounterInit;
	unsigned short RepeatCounterSet;
	float MasterCamLeadIn;
	unsigned short ExtendedCompLimits;
	float MinMasterCompDistance;
	float MinSlaveCompDistance;
	float MaxSlaveCompDistance;
	float MinSlaveCompVelocity;
	float MaxSlaveCompVelocity;
	float MaxSlaveAccelComp1;
	float MaxSlaveAccelComp2;
	float SlaveCompJoltTime;
	unsigned short MasterParID;
	struct MC_AUTDATA_EVENT_TYP Event[5];
} MC_AUTDATA_STATE_TYP;

typedef struct MC_AUTDATA_TYP
{
	unsigned long Master;
	float StartPosition;
	float StartInterval;
	unsigned char StartState;
	float StartMaRelPos;
	unsigned char MasterStartPosMode;
	float MaxMasterVelocity;
	unsigned short MasterParID;
	unsigned short AddMasterParID;
	unsigned short AddSlaveParID;
	unsigned short SlaveFactorParID;
	unsigned short EventParID;
	unsigned short EventParID2;
	unsigned short EventParID3;
	unsigned short EventParID4;
	unsigned short SlaveLatchParID;
	struct MC_AUTDATA_STATE_TYP State[15];
} MC_AUTDATA_TYP;

typedef struct MC_AUTINITOPTIONS_REF
{
	unsigned char GlobalParams;
	unsigned char StateIndex;
	unsigned char EventIndex;
	unsigned char MaxStatesPerCycle;
	unsigned char ParLock;
	plcbit Force;
} MC_AUTINITOPTIONS_REF;

typedef struct MC_BR_EVINPUT_REF
{
	unsigned short EventSourceParID;
	unsigned char Edge;
} MC_BR_EVINPUT_REF;

typedef struct MC_BR_TRIGGER_REF
{
	unsigned short EventSourceParID;
	unsigned short ProbeParID;
	unsigned char Edge;
	float MinWidth;
	float MaxWidth;
} MC_BR_TRIGGER_REF;

typedef struct MC_CALC_CAM_CONFIG_REF
{
	unsigned short Mode;
	plcbit CamType;
	unsigned char NumberOfPolynomials;
	signed long MasterPeriod;
	float StartSlope;
	float StartCurvature;
	float EndSlope;
	float EndCurvature;
} MC_CALC_CAM_CONFIG_REF;

typedef struct MC_POLYNOMIAL_DATA
{
	float a;
	float b;
	float c;
	float d;
	float e;
	float f;
	float g;
	float x;
	unsigned long Reserve;
} MC_POLYNOMIAL_DATA;

typedef struct MC_CAMPROFILE_TYP
{
	signed long MasterPeriod;
	signed long SlavePeriod;
	unsigned long PolynomialNumber;
	struct MC_POLYNOMIAL_DATA PolynomialData[64];
} MC_CAMPROFILE_TYP;

typedef struct MC_CAMSWITCH_REF
{
	signed short TrackNumber;
	float FirstOnPosition[16];
	float LastOnPosition[16];
	float Period;
} MC_CAMSWITCH_REF;

typedef struct MC_CAM_SECTION_TYP
{
	float MasterPosition;
	float SlavePosition;
	float FirstDerivative;
	float SecondDerivative;
	unsigned char Mode;
	unsigned short Type;
	float InflectionPoint;
} MC_CAM_SECTION_TYP;

typedef struct MC_CAM_SECTIONS_TYP
{
	struct MC_CAM_SECTION_TYP Section[65];
} MC_CAM_SECTIONS_TYP;

typedef struct MC_CYCLIC_POSITION
{
	signed long Integer;
	float Real;
} MC_CYCLIC_POSITION;

typedef struct MC_DATOBJ_REF
{
	plcstring Name[33];
	unsigned short Type;
	unsigned short Reserve;
	plcstring Device[33];
} MC_DATOBJ_REF;

typedef struct MC_DRIVESTATUS_TYP
{
	plcbit Simulation;
	plcbit NetworkInit;
	plcbit HomeSwitch;
	plcbit PosHWSwitch;
	plcbit NegHWSwitch;
	plcbit Trigger1;
	plcbit Trigger2;
	plcbit DriveEnable;
	plcbit ControllerReady;
	plcbit ControllerStatus;
	plcbit HomingOk;
	plcbit AxisError;
	plcbit LagWarning;
} MC_DRIVESTATUS_TYP;

typedef struct MC_ENDLESS_POSITION_DATA
{
	signed long MTPhase;
	signed long MTDiffInteger;
	signed long MTDiffFract;
	signed long RefOffset;
	unsigned long Checksum;
} MC_ENDLESS_POSITION_DATA;

typedef struct MC_ENDLESS_POSITION
{
	struct MC_ENDLESS_POSITION_DATA EndlessPositionData[2];
} MC_ENDLESS_POSITION;

typedef struct MC_ERRORRECORD_REF
{
	unsigned short ParID;
	unsigned short Number;
	unsigned long Info;
} MC_ERRORRECORD_REF;

typedef struct MC_ERRORTEXTCONFIG_REF
{
	unsigned short Format;
	unsigned short LineLength;
	unsigned short DataLength;
	unsigned long DataAddress;
	plcstring DataObjectName[13];
} MC_ERRORTEXTCONFIG_REF;

typedef struct MC_INPUT_REF
{
	unsigned long Axis;
	unsigned char Slot;
	unsigned char Channel;
} MC_INPUT_REF;

typedef struct MC_NETTRACE_REF
{
	unsigned long Type;
	unsigned long Reserve;
} MC_NETTRACE_REF;

typedef struct MC_NETTRACECONFIG_REF
{
	struct MC_DATOBJ_REF DatObj;
	struct MC_NETTRACE_REF NetTrace;
} MC_NETTRACECONFIG_REF;

typedef struct MC_OUTPUT_REF
{
	unsigned long Axis;
	unsigned char Slot;
	unsigned char Channel;
} MC_OUTPUT_REF;

typedef struct MC_TRACETRIGGER_REF
{
	unsigned long Axis;
	unsigned short ParID;
	unsigned char Event;
	unsigned char Reserve;
	float Threshold;
	float Window;
} MC_TRACETRIGGER_REF;

typedef struct MC_TRACEPARAM_REF
{
	unsigned long Axis;
	unsigned short ParID;
	unsigned short Reserve;
} MC_TRACEPARAM_REF;

typedef struct MC_PARTRACE_REF
{
	unsigned long Type;
	unsigned long Reserve;
	float TracingTime;
	float SamplingTime;
	float Delay;
	float NetTriggerDelay;
	struct MC_TRACETRIGGER_REF Trigger;
	struct MC_TRACEPARAM_REF Parameter[30];
} MC_PARTRACE_REF;

typedef struct MC_PARTRACECONFIG_REF
{
	struct MC_DATOBJ_REF DatObj;
	struct MC_PARTRACE_REF ParTrace;
} MC_PARTRACECONFIG_REF;

typedef struct MC_POWERDATA_REF
{
	unsigned long IntervalNumber;
	signed long IntervalDuration;
	float AverageActivePower;
	float AverageReactivePower;
	float MaximumActivePower;
	float MinimalActivePower;
	float ConsumedEnergy;
	float RegeneratedEnergy;
	float EnergyBalance;
	float Reserve1;
	float Reserve2;
	float Reserve3;
	float Reserve4;
	float Reserve5;
} MC_POWERDATA_REF;

typedef struct MC_RECORD_REF
{
	unsigned short Size;
	unsigned short Reserve1;
	unsigned char OneByteCount;
	unsigned char TwoByteCount;
	unsigned char FourByteCount;
	unsigned char Reserve2;
	unsigned short ParID[6];
	unsigned short Reserve3[4];
} MC_RECORD_REF;

typedef struct MC_RECORD_INFO_REF
{
	struct MC_RECORD_REF Record[8];
} MC_RECORD_INFO_REF;

typedef struct MC_SETUP_CONTROLLER_PAR_REF
{
	unsigned short Mode;
	float MaxCurrentPercent;
	float MaxSpeedPercent;
	float MaxDistance;
	float MaxLagError;
} MC_SETUP_CONTROLLER_PAR_REF;

typedef struct MC_SETUP_CONTROLLER_CFG_REF
{
	struct MC_DATOBJ_REF DatObj;
	struct MC_SETUP_CONTROLLER_PAR_REF SetupControllerPar;
} MC_SETUP_CONTROLLER_CFG_REF;

typedef struct MC_SETUP_IND_MOTOR_PAR_OPT_REF
{
	unsigned char PolePairs;
	float VoltageConstant;
	float MaxSpeed;
	float StallTorque;
	float RatedTorque;
	float PeakTorque;
	float TorqueConstant;
	float StallCurrent;
	float PeakCurrent;
	float MagnetizingCurrent;
} MC_SETUP_IND_MOTOR_PAR_OPT_REF;

typedef struct MC_SETUP_IND_MOTOR_PAR_REF
{
	unsigned short Mode;
	float RatedVoltage;
	float RatedCurrent;
	float RatedSpeed;
	float RatedFrequency;
	float PowerFactor;
	struct MC_SETUP_IND_MOTOR_PAR_OPT_REF OptionalData;
} MC_SETUP_IND_MOTOR_PAR_REF;

typedef struct MC_SETUP_IND_MOTOR_CFG_REF
{
	struct MC_DATOBJ_REF DatObj;
	struct MC_SETUP_IND_MOTOR_PAR_REF SetupInductionMotorPar;
} MC_SETUP_IND_MOTOR_CFG_REF;

typedef struct MC_SETUP_ISQ_RIPPLE_PAR_REF
{
	unsigned short Mode;
	unsigned short RefSystem;
	float PositionOffset;
	float Velocity;
} MC_SETUP_ISQ_RIPPLE_PAR_REF;

typedef struct MC_SETUP_ISQ_RIPPLE_CFG_REF
{
	struct MC_DATOBJ_REF DatObj;
	struct MC_SETUP_ISQ_RIPPLE_PAR_REF SetupIsqRipplePar;
} MC_SETUP_ISQ_RIPPLE_CFG_REF;

typedef struct MC_SETUP_MOTOR_PHA_PAR_REF
{
	unsigned short Mode;
	float Current;
	float Time;
} MC_SETUP_MOTOR_PHA_PAR_REF;

typedef struct MC_SETUP_MOTOR_PHA_CFG_REF
{
	struct MC_DATOBJ_REF DatObj;
	struct MC_SETUP_MOTOR_PHA_PAR_REF SetupMotorPhasingPar;
} MC_SETUP_MOTOR_PHA_CFG_REF;

typedef struct MC_SETUP_OUTPUT_REF
{
	float Quality;
	unsigned long DataObjectIdent;
} MC_SETUP_OUTPUT_REF;

typedef struct MC_SETUP_PHASING_RESULT_REF
{
	unsigned char PolePairs;
	float CommutationOffset;
} MC_SETUP_PHASING_RESULT_REF;

typedef struct MC_TRACK_REF
{
	plctime OnCompensation;
	plctime OffCompensation;
	float Hysteresis;
} MC_TRACK_REF;

typedef struct MC_TRIGGER_REF
{
	unsigned char InputSource;
	unsigned char Edge;
	unsigned char PosSource;
	unsigned char TouchProbeID;
} MC_TRIGGER_REF;

typedef struct MC_0068_IS_TYP
{
	plcbit C_Execute;
	plcbit C_Done;
	plcbit C_Busy;
	plcbit C_CommandAborted;
	plcbit C_Error;
	unsigned char LockID;
	unsigned short C_ErrorID;
	signed long C_EncoderOffset;
	unsigned char C_HomingMode;
	unsigned char C_HomingModeBits;
	plcbit C_ReadOffset;
	unsigned char C_Slot;
	unsigned char state;
	unsigned char LockIDPar;
	signed long C_Position;
	signed long C_Offset;
	unsigned short BitIndex;
	unsigned short HomingStatusOffset;
	unsigned char HomingStatusRecIndex;
	unsigned char FbID;
} MC_0068_IS_TYP;

typedef struct MC_0069_IS_TYP
{
	plcbit C_Valid;
	plcbit C_Busy;
	plcbit C_Error;
	unsigned char LockIDPar;
	unsigned short C_ErrorID;
	unsigned short C_ParID;
	unsigned long C_DataAddress;
	unsigned short C_DataType;
	unsigned short C_Mode;
	unsigned short Offset;
	unsigned char RecIndex;
	unsigned char ParIndex;
	unsigned char state;
	unsigned char LockID;
} MC_0069_IS_TYP;

typedef struct MC_0070_IS_TYP
{
	plcbit C_Valid;
	plcbit C_Busy;
	plcbit C_Error;
	unsigned char LockIDPar;
	unsigned short C_ErrorID;
	unsigned short C_ParID;
	unsigned long C_DataAddress;
	unsigned short C_DataType;
	unsigned short C_Mode;
	unsigned char ParIndex;
	unsigned char state;
	unsigned char DataLength;
	unsigned char LockID;
	unsigned short Reserve;
} MC_0070_IS_TYP;

typedef struct MC_0071_IS_TYP
{
	plcbit C_Execute;
	plcbit C_Done;
	plcbit C_Busy;
	plcbit C_Error;
	unsigned short C_ErrorID;
	unsigned char state;
	unsigned char LockIDPar;
	unsigned short C_SimulationCommand;
} MC_0071_IS_TYP;

typedef struct MC_0076_IS_TYP
{
	plcbit C_Execute;
	plcbit C_Done;
	plcbit C_Busy;
	plcbit C_Error;
	unsigned short C_ErrorID;
	unsigned char C_GlobalParams;
	unsigned char C_StateIndex;
	unsigned char C_EventIndex;
	unsigned char C_MaxStatesPerCycle;
	unsigned char C_ParLock;
	struct MC_AUTDATA_TYP C_AutData;
	unsigned char LockIDMa;
	unsigned char LockIDPar;
	unsigned char C_Force;
	unsigned char readSlot;
	unsigned char sendSlot;
	unsigned short paramCount;
	plcbit lockActive;
	unsigned char actStatesInCycle;
	unsigned char stateCount;
	unsigned char eventCount;
	unsigned char stateParInImg;
	plcbit resetStates;
	plcbit setStateIndex;
	unsigned char lastState;
	unsigned char nextState;
	unsigned char state;
	unsigned char LockIDSend;
	unsigned char Reserve1;
	unsigned short Reserve2;
} MC_0076_IS_TYP;

typedef struct MC_0077_IS_TYP
{
	plcbit C_Execute;
	unsigned char LockID;
	struct MC_ERRORRECORD_REF C_ErrorRecord;
	struct MC_ERRORTEXTCONFIG_REF C_Configuration;
	plcbit C_Done;
	plcbit C_Busy;
	plcbit C_Error;
	unsigned short C_ErrorID;
	unsigned char state;
} MC_0077_IS_TYP;

typedef struct MC_0078_IS_TYP
{
	plcbit C_Execute;
	unsigned short C_Command;
	struct MC_NETTRACECONFIG_REF C_Configuration;
	plcbit C_Done;
	plcbit C_Busy;
	plcbit C_Error;
	unsigned short C_ErrorID;
	struct MC_ERRORRECORD_REF C_ErrorRecord;
	unsigned char state;
} MC_0078_IS_TYP;

typedef struct MC_0080_IS_TYP
{
	plcbit C_Execute;
	unsigned short C_Command;
	struct MC_PARTRACECONFIG_REF C_Configuration;
	plcbit C_Done;
	plcbit C_Busy;
	plcbit C_Error;
	unsigned short C_ErrorID;
	struct MC_ERRORRECORD_REF C_ErrorRecord;
	plcbit StartSaveStarted;
	unsigned char state;
} MC_0080_IS_TYP;

typedef struct MC_0081_IS_TYP
{
	struct MC_CYCLIC_POSITION C_CyclicPosition;
	float C_Velocity;
	float C_Acceleration;
	float C_Deceleration;
	unsigned short C_PositionParID;
	plcbit C_Busy;
	plcbit C_CommandAborted;
	plcbit C_Error;
	plcbit C_Valid;
	unsigned short C_ErrorID;
	unsigned short C_ReceiveParID;
	unsigned short readSlot;
	unsigned long Reserve1;
	unsigned char LockIDPar;
	unsigned char MoveID;
	unsigned char state;
} MC_0081_IS_TYP;

typedef struct MC_0082_IS_TYP
{
	unsigned short C_ParID;
	plcbit C_Busy;
	plcbit C_Error;
	unsigned short C_ErrorID;
	plcbit C_Valid;
	struct MC_CYCLIC_POSITION C_CyclicPosition;
	signed long C_Offset;
	unsigned short sendSlot;
	unsigned short MnPResParIndex;
	unsigned char LockIDPar;
	unsigned char state;
} MC_0082_IS_TYP;

typedef struct MC_0083_IS_TYP
{
	plcbit C_Execute;
	unsigned long C_DataAddress;
	float C_MasterPosition;
	unsigned long C_MasterFactor;
	signed long C_SlaveFactor;
	plcbit C_Done;
	plcbit C_Busy;
	plcbit C_Error;
	unsigned short C_ErrorID;
	float C_SlavePosition;
	unsigned char state;
} MC_0083_IS_TYP;

typedef struct MC_0084_IS_TYP
{
	plcbit C_Execute;
	unsigned long C_DataAddress;
	float C_MasterStartPosition;
	float C_SlavePosition;
	unsigned long C_MasterFactor;
	signed long C_SlaveFactor;
	plcbit C_Done;
	plcbit C_Busy;
	plcbit C_Error;
	unsigned short C_ErrorID;
	float C_MasterPosition;
	unsigned char state;
} MC_0084_IS_TYP;

typedef struct MC_0088_IS_TYP
{
	plcbit C_Execute;
	unsigned short C_Command;
	struct MC_SETUP_IND_MOTOR_CFG_REF C_Configuration;
	plcbit C_Done;
	plcbit C_Busy;
	plcbit C_CommandAborted;
	plcbit C_Error;
	unsigned short C_ErrorID;
	struct MC_SETUP_OUTPUT_REF C_SetupOutput;
	unsigned char LockIDPar;
	unsigned char Reserve;
	unsigned char state;
} MC_0088_IS_TYP;

typedef struct MC_0089_IS_TYP
{
	unsigned char C_Mode;
	unsigned short C_IntervalTime;
	plcbit C_RestartInterval;
	struct MC_BR_EVINPUT_REF C_EventInput;
	plcbit C_Valid;
	plcbit C_Busy;
	plcbit C_Error;
	unsigned short C_ErrorID;
	unsigned short CC_ErrorID;
	struct MC_POWERDATA_REF C_PowerData;
	unsigned short C_MissedIntervals;
	unsigned char LockID;
	unsigned char LockIDPar;
	unsigned short IntervalDurationOffset;
	unsigned char IntervalDurationRecIndex;
	unsigned short AverageActivePowerOffset;
	unsigned char AverageActivePowerRecIndex;
	unsigned short AverageReactivePowerOffset;
	unsigned char AverageReactivePowerRecIndex;
	unsigned short MaximumActivePowerOffset;
	unsigned char MaximumActivePowerRecIndex;
	unsigned short MinimalActivePowerOffset;
	unsigned char MinimalActivePowerRecIndex;
	unsigned short ConsumedEnergyOffset;
	unsigned char ConsumedEnergyRecIndex;
	unsigned short RegEnergyOffset;
	unsigned char RegEnergyRecIndex;
	unsigned char LockIDPmet;
	unsigned char CDLockID;
	unsigned short Reserve1;
	unsigned short Reserve2;
	signed long IntervalTimeMin;
	unsigned char ParamCnt;
	unsigned char CountCnt;
	unsigned short CountOffset[8];
	unsigned char CountRecIndex[8];
	unsigned char saveParamCnt;
	unsigned char firstFreeParam;
	unsigned char lastFreeParam;
	plcbit dataConfigDone;
	unsigned char SptID;
	unsigned short VarIndex;
	unsigned short CompIndex;
	unsigned char NextState;
	unsigned short ReserveOffset01;
	unsigned char ReserveRecIndex01;
	unsigned short ReserveOffset02;
	unsigned char ReserveRecIndex02;
	unsigned short ReserveOffset03;
	unsigned char ReserveRecIndex03;
	unsigned short ReserveOffset04;
	unsigned char ReserveRecIndex04;
	unsigned short ReserveOffset05;
	unsigned char ReserveRecIndex05;
	unsigned long Reserve3;
	unsigned long Reserve4;
	unsigned long CyclicDataTaskClassCycleTime;
	unsigned char Reserve5;
	unsigned short Reserve6;
	unsigned char state;
} MC_0089_IS_TYP;

typedef struct MC_0090_IS_TYP
{
	plcbit C_Execute;
	unsigned short C_Command;
	struct MC_SETUP_CONTROLLER_CFG_REF C_Configuration;
	plcbit C_Done;
	plcbit C_Busy;
	plcbit C_CommandAborted;
	plcbit C_Error;
	unsigned short C_ErrorID;
	struct MC_SETUP_OUTPUT_REF C_SetupOutput;
	unsigned char LockIDPar;
	unsigned char Reserve;
	unsigned char state;
} MC_0090_IS_TYP;

typedef struct MC_0092_IS_TYP
{
	float C_CyclicVelocity;
	unsigned char C_Direction;
	float C_Acceleration;
	float C_Deceleration;
	unsigned short C_VelocityParID;
	plcbit C_Valid;
	plcbit C_Busy;
	plcbit C_CommandAborted;
	plcbit C_Error;
	unsigned short C_ErrorID;
	unsigned short C_ReceiveParID;
	unsigned char LockIDPar;
	unsigned char MoveID;
	unsigned short VarIndex;
	unsigned char SptID;
	unsigned short readSlot;
	unsigned long Reserve1;
	unsigned short ArithIndex;
	unsigned char state;
} MC_0092_IS_TYP;

typedef struct MC_0093_IS_TYP
{
	struct MC_CALC_CAM_CONFIG_REF C_Configuration;
	unsigned char state;
	unsigned char LockID;
	plcbit C_Done;
	plcbit C_Busy;
	plcbit C_Error;
	unsigned short C_ErrorID;
} MC_0093_IS_TYP;

typedef struct MC_0095_IS_TYP
{
	plcbit Enable;
	unsigned char Reserve1;
	unsigned char Reserve2;
	unsigned char Reserve3;
	float CyclicVelocity;
	float CyclicVelocityCorrection;
	float CyclicVelCorrPerRev;
	float CyclicTorque;
	unsigned char TorqueMode;
	unsigned char Reserve4;
	unsigned char Reserve5;
	unsigned char Reserve6;
	float Acceleration;
	float Deceleration;
	float SctrlKv;
	float SctrlTn;
	plcbit InitSctrl;
	plcbit Active;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
	unsigned char Reserve;
	unsigned short ErrorID;
	plcbit SctrlInitialized;
	plcbit DisableFBactive;
	unsigned short state;
	unsigned short LastState;
	unsigned short NextState;
	unsigned short VarID;
	unsigned char SptID;
	unsigned char LockID;
	unsigned char LockIDPar;
	unsigned char MoveID;
	unsigned char LockIDFb;
	unsigned char CyclicVelParIndex;
	unsigned char CyclicVelCorrParIndex;
	unsigned char CyclicTorqueParIndex;
	unsigned char Reserve7;
	unsigned char Reserve8;
	float InitValue_SctrlKv;
	float InitValue_SctrlTn;
	float InitValue_tpredict;
	unsigned short InitValue_S_ACT_PARID;
	unsigned char Reserve9;
	unsigned char Reserve12;
	unsigned short C_ErrorID;
	unsigned char Reserve10;
	unsigned char Reserve11;
} MC_0095_IS_TYP;

typedef struct MC_0097_IS_TYP
{
	plcbit C_Execute;
	unsigned short C_Command;
	struct MC_SETUP_MOTOR_PHA_CFG_REF C_Configuration;
	plcbit C_Done;
	plcbit C_Busy;
	plcbit C_CommandAborted;
	plcbit C_Error;
	unsigned short C_ErrorID;
	struct MC_SETUP_OUTPUT_REF C_SetupOutput;
	struct MC_SETUP_PHASING_RESULT_REF C_SetupResult;
	unsigned long Reserve1;
	unsigned long Reserve2;
	unsigned long Reserve3;
	unsigned char LockIDPar;
	unsigned char state;
} MC_0097_IS_TYP;

typedef struct MC_0098_IS_TYP
{
	plcbit Valid;
	plcbit Busy;
	plcbit Error;
	signed char tkNo;
	unsigned short ErrorID;
	unsigned short state;
	unsigned char LockID;
	unsigned char Reserve1;
	unsigned short Reserve2;
	unsigned long cycleTime;
} MC_0098_IS_TYP;

typedef struct MC_0099_IS_TYP
{
	plcbit Enable;
	plcbit Start;
	plcbit Stop;
	plcbit Restart;
	float Deceleration;
	plcbit EndAutomat;
	plcbit SetSignal1;
	plcbit SetSignal2;
	plcbit SetSignal3;
	plcbit SetSignal4;
	plcbit ResetSignal1;
	plcbit ResetSignal2;
	plcbit ResetSignal3;
	plcbit ResetSignal4;
	plcbit TransferParLock;
	unsigned char SelectParLock;
	plcbit Active;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
	plcbit Running;
	unsigned short ErrorID;
	plcbit StandBy;
	plcbit ParLockTransferred;
	unsigned char ActualStateIndex;
	plcbit InCam;
	unsigned short ActualStateCamIndex;
	plcbit InCompensation;
	unsigned char state;
	plcbit cmdStart;
	plcbit cmdStop;
	plcbit cmdSetSignal[4];
	plcbit cmdResetSignal[4];
	plcbit cmdRestart;
	plcbit cmdEndAutomat;
	plcbit cmdParLock;
	unsigned char SptID;
	unsigned short BitIndex;
	unsigned char LockIDPar;
	unsigned char LockID;
	unsigned long BitValue;
	unsigned short BitValueOffset;
	unsigned char BitValueRecIndex;
	unsigned char StateDataIdxRecIndex;
	unsigned short StateDataIdxOffset;
	unsigned char SignalSet;
	unsigned char SignalReset;
	plcbit ParLockPending;
	unsigned char AutStatus;
	unsigned char AutActCamType;
	unsigned char MoveID;
	plcbit ChangeAxisState;
	plcbit expectRunning;
	unsigned short C_ErrorID;
} MC_0099_IS_TYP;

typedef struct MC_0101_IS_TYP
{
	plcbit Execute;
	plcbit Done;
	unsigned short Command;
	struct MC_SETUP_ISQ_RIPPLE_CFG_REF Configuration;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
	unsigned char state;
	unsigned short ErrorID;
	unsigned char LockIDPar;
	struct MC_SETUP_OUTPUT_REF SetupOutput;
} MC_0101_IS_TYP;

typedef struct MC_0102_IS_TYP
{
	plcbit C_Execute;
	unsigned short C_Command;
	unsigned long C_AdrTraceConfig;
	struct MC_PARTRACE_REF C_TraceConfig;
	struct MC_DATOBJ_REF C_DataObject;
	plcbit C_Done;
	plcbit C_Busy;
	plcbit C_Error;
	unsigned short C_ErrorID;
	struct MC_ERRORRECORD_REF C_ErrorRecord;
	unsigned char state;
} MC_0102_IS_TYP;

typedef struct MC_AbortTrigger
{
	/* VAR_INPUT (analog) */
	unsigned long Axis;
	struct MC_TRIGGER_REF TriggerInput;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	/* VAR (analog) */
	unsigned long C_Axis;
	unsigned char state;
	unsigned short C_ErrorID;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
	/* VAR (digital) */
	plcbit C_Done;
	plcbit C_Error;
} MC_AbortTrigger_typ;

typedef struct MC_CamIn
{
	/* VAR_INPUT (analog) */
	unsigned long Master;
	unsigned long Slave;
	float MasterOffset;
	float SlaveOffset;
	float MasterScaling;
	float SlaveScaling;
	unsigned char StartMode;
	unsigned char CamTableID;
	unsigned short MasterParID;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	/* VAR (analog) */
	unsigned char LockIDPar;
	unsigned char LockIDInSync;
	unsigned long C_Master;
	unsigned long C_Slave;
	signed long C_MasterOffset;
	signed long C_SlaveOffset;
	signed long C_MasterScaling;
	signed long C_SlaveScaling;
	unsigned char C_StartMode;
	unsigned char LockID;
	unsigned short C_CamTableID;
	unsigned short C_MasterParID;
	unsigned short C_ErrorID;
	signed long OldMaCamOffset;
	signed long MaPosition;
	unsigned short DataTyp;
	unsigned short MpgenIndex;
	unsigned short AutActualStateIndexOffset;
	unsigned char AutActualStateIndexRecIndex;
	unsigned char Reserve1;
	unsigned short AutActualCamIndexOffset;
	unsigned char AutActualCamIndexRecIndex;
	unsigned char LockIDSend;
	unsigned short AutMaCamOffsetOffset;
	unsigned char AutMaCamOffsetRecIndex;
	unsigned char LockIDMa;
	unsigned char sendSlot;
	unsigned char readSlot;
	unsigned char state;
	unsigned char MoveID;
	unsigned short Reserve4;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit InSync;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
	plcbit EndOfProfile;
	/* VAR (digital) */
	plcbit C_Execute;
	plcbit C_Periodic;
	plcbit C_InSync;
	plcbit C_CommandAborted;
	plcbit C_Error;
	plcbit C_EndOfProfile;
} MC_CamIn_typ;

typedef struct MC_CamOut
{
	/* VAR_INPUT (analog) */
	unsigned long Slave;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	/* VAR (analog) */
	unsigned long C_Slave;
	unsigned short C_ErrorID;
	unsigned char state;
	unsigned char LockIDPar;
	unsigned char MoveID;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
	/* VAR (digital) */
	plcbit C_Execute;
	plcbit C_Done;
	plcbit C_Error;
} MC_CamOut_typ;

typedef struct MC_CamTableSelect
{
	/* VAR_INPUT (analog) */
	unsigned long Master;
	unsigned long Slave;
	plcstring CamTable[13];
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	unsigned char CamTableID;
	/* VAR (analog) */
	unsigned long C_Master;
	unsigned long C_Slave;
	plcstring C_CamTable[13];
	unsigned char Reserve;
	unsigned short C_ErrorID;
	unsigned char state;
	unsigned char LockIDPar;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	plcbit Periodic;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
	/* VAR (digital) */
	plcbit C_Periodic;
	plcbit C_Error;
} MC_CamTableSelect_typ;

typedef struct MC_DigitalCamSwitch
{
	/* VAR_INPUT (analog) */
	unsigned long Axis;
	struct MC_CAMSWITCH_REF Switches;
	struct MC_OUTPUT_REF Outputs;
	struct MC_TRACK_REF TrackOptions;
	unsigned long EnableMask;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	/* VAR (analog) */
	unsigned long C_Master;
	unsigned long C_Slave;
	struct MC_CAMSWITCH_REF C_Switches;
	struct MC_OUTPUT_REF C_Outputs;
	struct MC_TRACK_REF C_TrackOptions;
	unsigned long C_EnableMask;
	unsigned char C_CamConActRec;
	unsigned char nextParRec;
	unsigned char SelectRecMode;
	unsigned char LockIDSend;
	unsigned short C_ErrorID;
	unsigned short CC_ErrorID;
	unsigned short CamConIndex;
	unsigned short LogicIndex;
	unsigned short VarIndex;
	unsigned short CamConActRecOffset;
	unsigned char CamConActRecRecIndex;
	unsigned char LockIDMa;
	unsigned char LockIDPar;
	unsigned char LockID;
	unsigned char sendSlot;
	unsigned char readSlot;
	unsigned char state;
	unsigned char SptID;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit InitSwitches;
	plcbit InitTrackOptions;
	/* VAR_OUTPUT (digital) */
	plcbit InOperation;
	plcbit Busy;
	plcbit SwitchesInitialized;
	plcbit TrackOptionsInitialized;
	plcbit Error;
	/* VAR (digital) */
	plcbit C_InOperation;
	plcbit C_Error;
	plcbit CC_Error;
	plcbit EdgeInitSwitches;
	plcbit EdgeInitTrackOptions;
} MC_DigitalCamSwitch_typ;

typedef struct MC_GearIn
{
	/* VAR_INPUT (analog) */
	unsigned long Master;
	unsigned long Slave;
	signed short RatioNumerator;
	unsigned short RatioDenominator;
	float Acceleration;
	float Deceleration;
	unsigned short MasterParID;
	float MasterParIDMaxVelocity;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	/* VAR (analog) */
	unsigned char LockID;
	unsigned long C_Master;
	unsigned long C_Slave;
	signed long C_RatioNumerator;
	signed long C_RatioDenominator;
	float C_Acceleration;
	float C_Deceleration;
	unsigned short C_MasterParID;
	float C_MasterParIDMaxVelocity;
	unsigned short C_ErrorID;
	unsigned short MpgenIndex;
	unsigned short AutActualStateIndexOffset;
	unsigned char AutActualStateIndexRecIndex;
	unsigned char LockIDMa;
	unsigned char sendSlot;
	unsigned char readSlot;
	unsigned char state;
	unsigned char LockIDPar;
	unsigned char MoveID;
	unsigned char LockIDSend;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit InGear;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
	/* VAR (digital) */
	plcbit C_Execute;
	plcbit C_InGear;
	plcbit C_CommandAborted;
	plcbit C_Error;
} MC_GearIn_typ;

typedef struct MC_GearOut
{
	/* VAR_INPUT (analog) */
	unsigned long Slave;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	/* VAR (analog) */
	unsigned long C_Slave;
	unsigned short C_ErrorID;
	unsigned char state;
	unsigned char LockIDPar;
	unsigned char MoveID;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
	/* VAR (digital) */
	plcbit C_Execute;
	plcbit C_Done;
	plcbit C_Error;
} MC_GearOut_typ;

typedef struct MC_Halt
{
	/* VAR_INPUT (analog) */
	unsigned long Axis;
	float Deceleration;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	/* VAR (analog) */
	unsigned long C_Axis;
	float C_Deceleration;
	unsigned short C_ErrorID;
	unsigned char state;
	unsigned char MoveID;
	unsigned char LockIDPar;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
	/* VAR (digital) */
	plcbit C_Execute;
	plcbit C_Done;
	plcbit C_CommandAborted;
	plcbit C_Error;
} MC_Halt_typ;

typedef struct MC_Home
{
	/* VAR_INPUT (analog) */
	unsigned long Axis;
	float Position;
	unsigned char HomingMode;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	/* VAR (analog) */
	unsigned long C_Axis;
	signed long C_Position;
	unsigned char C_HomingMode;
	unsigned char LockIDPar;
	unsigned short C_ErrorID;
	unsigned char state;
	unsigned char MoveID;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
	/* VAR (digital) */
	plcbit C_Execute;
	plcbit C_Done;
	plcbit C_CommandAborted;
	plcbit C_Error;
} MC_Home_typ;

typedef struct MC_MoveAbsolute
{
	/* VAR_INPUT (analog) */
	unsigned long Axis;
	float Position;
	float Velocity;
	float Acceleration;
	float Deceleration;
	unsigned char Direction;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	/* VAR (analog) */
	unsigned long C_Axis;
	signed long C_Position;
	float C_Velocity;
	float C_Acceleration;
	float C_Deceleration;
	unsigned char C_Direction;
	unsigned char LockIDPar;
	unsigned short C_ErrorID;
	signed long C_CommandedOffset;
	unsigned char state;
	unsigned char MoveID;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
	/* VAR (digital) */
	plcbit C_Execute;
	plcbit C_Done;
	plcbit C_CommandAborted;
	plcbit C_Error;
} MC_MoveAbsolute_typ;

typedef struct MC_MoveAdditive
{
	/* VAR_INPUT (analog) */
	unsigned long Axis;
	float Distance;
	float Velocity;
	float Acceleration;
	float Deceleration;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	/* VAR (analog) */
	unsigned long C_Axis;
	signed long C_Distance;
	float C_Velocity;
	float C_Acceleration;
	float C_Deceleration;
	unsigned short C_ErrorID;
	signed long C_CommandedPosition;
	signed long C_CommandedOffset;
	unsigned char state;
	unsigned char LockIDPar;
	unsigned char MoveID;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
	/* VAR (digital) */
	plcbit C_Execute;
	plcbit C_Done;
	plcbit C_CommandAborted;
	plcbit C_Error;
} MC_MoveAdditive_typ;

typedef struct MC_MoveVelocity
{
	/* VAR_INPUT (analog) */
	unsigned long Axis;
	float Velocity;
	float Acceleration;
	float Deceleration;
	unsigned char Direction;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	/* VAR (analog) */
	unsigned long C_Axis;
	float C_Velocity;
	float C_Acceleration;
	float C_Deceleration;
	unsigned char C_Direction;
	unsigned char LockIDPar;
	unsigned short C_ErrorID;
	unsigned char state;
	unsigned char MoveID;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit InVelocity;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
	/* VAR (digital) */
	plcbit C_Execute;
	plcbit C_InVelocity;
	plcbit C_CommandAborted;
	plcbit C_Error;
} MC_MoveVelocity_typ;

typedef struct MC_Phasing
{
	/* VAR_INPUT (analog) */
	unsigned long Master;
	unsigned long Slave;
	float PhaseShift;
	float Velocity;
	float Acceleration;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	/* VAR (analog) */
	unsigned long C_Master;
	unsigned long C_Slave;
	signed long C_PhaseShift;
	float C_Velocity;
	float C_Acceleration;
	unsigned short C_ErrorID;
	unsigned short MpgenIndex;
	unsigned short MpgenStatusOffset;
	unsigned char MpgenStatusRecIndex;
	unsigned char LockIDPar;
	signed char timer;
	unsigned char state;
	unsigned char FbID;
	unsigned char Reserve;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
	/* VAR (digital) */
	plcbit C_Execute;
	plcbit C_Done;
	plcbit C_CommandAborted;
	plcbit C_Error;
} MC_Phasing_typ;

typedef struct MC_Power
{
	/* VAR_INPUT (analog) */
	unsigned long Axis;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	/* VAR (analog) */
	unsigned char state;
	unsigned short C_ErrorID;
	unsigned long C_Axis;
	unsigned long startTicks;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	/* VAR_OUTPUT (digital) */
	plcbit Status;
	plcbit Busy;
	plcbit Error;
	/* VAR (digital) */
	plcbit C_Error;
} MC_Power_typ;

typedef struct MC_ReadActualPosition
{
	/* VAR_INPUT (analog) */
	unsigned long Axis;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	float Position;
	/* VAR (analog) */
	unsigned long C_Axis;
	unsigned short C_ErrorID;
	unsigned char state;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
	plcbit Busy;
	plcbit Error;
	/* VAR (digital) */
	plcbit C_Error;
} MC_ReadActualPosition_typ;

typedef struct MC_ReadAxisError
{
	/* VAR_INPUT (analog) */
	unsigned long Axis;
	unsigned long DataAddress;
	unsigned short DataLength;
	plcstring DataObjectName[13];
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	unsigned short AxisErrorID;
	unsigned short AxisErrorCount;
	/* VAR (analog) */
	unsigned long C_Axis;
	plcstring C_DataObjectName[13];
	unsigned short count;
	unsigned short C_ErrorID;
	unsigned char state;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit Acknowledge;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
	plcbit Busy;
	plcbit Error;
	/* VAR (digital) */
	plcbit C_Acknowledge;
	plcbit C_OldAcknowledge;
	plcbit writeText;
	plcbit C_Error;
} MC_ReadAxisError_typ;

typedef struct MC_ReadBoolParameter
{
	/* VAR_INPUT (analog) */
	unsigned long Axis;
	signed short ParameterNumber;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	/* VAR (analog) */
	unsigned long C_Axis;
	unsigned short C_ErrorID;
	unsigned char state;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
	plcbit Busy;
	plcbit Error;
	plcbit Value;
	/* VAR (digital) */
	plcbit C_Error;
} MC_ReadBoolParameter_typ;

typedef struct MC_ReadParameter
{
	/* VAR_INPUT (analog) */
	unsigned long Axis;
	signed short ParameterNumber;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	float Value;
	/* VAR (analog) */
	unsigned long C_Axis;
	unsigned short C_ErrorID;
	unsigned char state;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
	plcbit Busy;
	plcbit Error;
	/* VAR (digital) */
	plcbit C_Error;
} MC_ReadParameter_typ;

typedef struct MC_ReadStatus
{
	/* VAR_INPUT (analog) */
	unsigned long Axis;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	/* VAR (analog) */
	unsigned long C_Axis;
	unsigned short C_ErrorID;
	unsigned char state;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
	plcbit Busy;
	plcbit Error;
	plcbit Errorstop;
	plcbit Disabled;
	plcbit Stopping;
	plcbit StandStill;
	plcbit DiscreteMotion;
	plcbit ContinuousMotion;
	plcbit SynchronizedMotion;
	plcbit Homing;
	/* VAR (digital) */
	plcbit C_Error;
} MC_ReadStatus_typ;

typedef struct MC_Reset
{
	/* VAR_INPUT (analog) */
	unsigned long Axis;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	/* VAR (analog) */
	unsigned long C_Axis;
	unsigned short C_ErrorID;
	unsigned char state;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
	/* VAR (digital) */
	plcbit C_Error;
} MC_Reset_typ;

typedef struct MC_SetOverride
{
	/* VAR_INPUT (analog) */
	unsigned long Axis;
	float VelFactor;
	float AccFactor;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	/* VAR (analog) */
	unsigned long C_Axis;
	float OldVelFactor;
	unsigned short C_ErrorID;
	unsigned char state;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	/* VAR_OUTPUT (digital) */
	plcbit Enabled;
	plcbit Busy;
	plcbit Error;
	/* VAR (digital) */
	plcbit C_Error;
} MC_SetOverride_typ;

typedef struct MC_Stop
{
	/* VAR_INPUT (analog) */
	unsigned long Axis;
	float Deceleration;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	/* VAR (analog) */
	unsigned long C_Axis;
	unsigned short C_ErrorID;
	float C_Deceleration;
	unsigned char state;
	unsigned char MoveID;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
	/* VAR (digital) */
	plcbit C_Execute;
	plcbit C_Error;
	plcbit C_CommandAborted;
} MC_Stop_typ;

typedef struct MC_TouchProbe
{
	/* VAR_INPUT (analog) */
	unsigned long Axis;
	struct MC_TRIGGER_REF TriggerInput;
	float FirstPosition;
	float LastPosition;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	float RecordedPosition;
	/* VAR (analog) */
	unsigned long C_Axis;
	struct MC_TRIGGER_REF C_TriggerInput;
	float C_FirstPosition;
	float C_LastPosition;
	unsigned short C_ErrorID;
	float C_RecordedPosition;
	unsigned char SavedToDrvCnt;
	unsigned char Reserve2;
	unsigned char state;
	unsigned char LockID;
	unsigned char LockIDPar;
	unsigned short cycleTime;
	signed long LatchPos;
	unsigned short LatchStatusOffset;
	unsigned char LatchStatusRecIndex;
	unsigned char Reserve1;
	unsigned short LatchPosOffset;
	unsigned char LatchPosRecIndex;
	unsigned char SptID;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	plcbit WindowOnly;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
	/* VAR (digital) */
	plcbit C_Done;
	plcbit C_Busy;
	plcbit C_Execute;
	plcbit C_WindowOnly;
	plcbit C_Error;
	plcbit C_CommandAborted;
	plcbit InputSourceChanged;
	plcbit EdgeChanged;
	plcbit PosSourceChanged;
} MC_TouchProbe_typ;

typedef struct MC_WriteBoolParameter
{
	/* VAR_INPUT (analog) */
	unsigned long Axis;
	signed short ParameterNumber;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	/* VAR (analog) */
	unsigned long C_Axis;
	signed short C_ParameterNumber;
	unsigned short Reserve;
	unsigned char state;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	plcbit Value;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} MC_WriteBoolParameter_typ;

typedef struct MC_WriteParameter
{
	/* VAR_INPUT (analog) */
	unsigned long Axis;
	signed short ParameterNumber;
	float Value;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	/* VAR (analog) */
	unsigned long C_Axis;
	signed short C_ParameterNumber;
	float C_Value;
	unsigned short C_ErrorID;
	unsigned char state;
	unsigned char LockIDPar;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
	/* VAR (digital) */
	plcbit C_Execute;
	plcbit C_Done;
	plcbit C_Error;
} MC_WriteParameter_typ;

typedef struct MC_001_ReadActualVelocity
{
	/* VAR_INPUT (analog) */
	unsigned long Axis;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	float Velocity;
	/* VAR (analog) */
	unsigned long C_Axis;
	unsigned short C_ErrorID;
	unsigned char state;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
	plcbit Busy;
	plcbit Error;
	/* VAR (digital) */
	plcbit C_Error;
} MC_001_ReadActualVelocity_typ;

typedef struct MC_002_ReadActualTorque
{
	/* VAR_INPUT (analog) */
	unsigned long Axis;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	float Torque;
	/* VAR (analog) */
	unsigned long C_Axis;
	unsigned short TorqueOffset;
	unsigned char TorqueRecIndex;
	unsigned char LockID;
	unsigned short C_ErrorID;
	unsigned char state;
	unsigned char LockIDPar;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
	plcbit Busy;
	plcbit Error;
	/* VAR (digital) */
	plcbit C_Error;
} MC_002_ReadActualTorque_typ;

typedef struct MC_003_GearInPos
{
	/* VAR_INPUT (analog) */
	unsigned long Master;
	unsigned long Slave;
	signed short RatioNumerator;
	unsigned short RatioDenominator;
	float MasterSyncPosition;
	float SlaveSyncPosition;
	unsigned char SyncMode;
	float MasterStartDistance;
	float Velocity;
	float Acceleration;
	unsigned short MasterParID;
	float MasterParIDMaxVelocity;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	/* VAR (analog) */
	unsigned long C_Master;
	unsigned long C_Slave;
	signed long C_RatioNumerator;
	signed long C_RatioDenominator;
	signed long C_MasterSyncPosition;
	signed long C_SlaveSyncPosition;
	unsigned char C_SyncMode;
	unsigned char LockID;
	unsigned char LockIDPar;
	signed long C_MasterStartDistance;
	float C_Acceleration;
	unsigned short C_MasterParID;
	float C_MasterParIDMaxVelocity;
	unsigned short C_ErrorID;
	signed short CC_RatioNumerator;
	unsigned short CC_RatioDenominator;
	float C_Velocity;
	signed long MaPosition;
	unsigned short DataTyp;
	signed long MA_LastSyncPosition;
	signed long SL_LastSyncPosition;
	unsigned short MpgenIndex;
	unsigned short AutActualCamTypeOffset;
	unsigned char AutActualCamTypeRecIndex;
	unsigned char LockIDSend;
	unsigned short AutActualStateIndexOffset;
	unsigned char AutActualStateIndexRecIndex;
	unsigned char LockIDMa;
	unsigned char sendSlot;
	unsigned char readSlot;
	unsigned char state;
	unsigned char MoveID;
	unsigned short Reserve2;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit StartSync;
	plcbit InSync;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
	/* VAR (digital) */
	plcbit C_Execute;
	plcbit C_StartSync;
	plcbit C_InSync;
	plcbit C_CommandAborted;
	plcbit C_Error;
	plcbit CC_Error;
} MC_003_GearInPos_typ;

typedef struct MC_004BR_BrakeOperation
{
	/* VAR_INPUT (analog) */
	unsigned long Axis;
	unsigned char BrakeCommand;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	/* VAR (analog) */
	unsigned long C_Axis;
	unsigned char C_BrakeCommand;
	unsigned char LockIDPar;
	unsigned short C_ErrorID;
	unsigned char state;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
	/* VAR (digital) */
	plcbit C_Execute;
	plcbit C_Done;
	plcbit C_Error;
} MC_004BR_BrakeOperation_typ;

typedef struct MC_005BR_MoveAbsoluteTriggSto
{
	/* VAR_INPUT (analog) */
	unsigned long Axis;
	struct MC_TRIGGER_REF TriggerInput;
	float Position;
	float Velocity;
	float Acceleration;
	float Deceleration;
	unsigned char Direction;
	float TriggerDistance;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	/* VAR (analog) */
	unsigned long C_Axis;
	struct MC_TRIGGER_REF C_TriggerInput;
	signed long C_Position;
	float C_Velocity;
	float C_Acceleration;
	float C_Deceleration;
	unsigned char C_Direction;
	signed long C_TriggerDistance;
	unsigned short C_ErrorID;
	signed long C_CommandedOffset;
	unsigned char state;
	unsigned char LockIDPar;
	unsigned char MoveID;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	plcbit ForceTriggerDistance;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
	/* VAR (digital) */
	plcbit C_Execute;
	plcbit C_ForceTriggerDistance;
	plcbit C_Done;
	plcbit C_CommandAborted;
	plcbit C_Error;
} MC_005BR_MoveAbsoluteTriggSto_typ;

typedef struct MC_006BR_MoveAdditiveTriggSto
{
	/* VAR_INPUT (analog) */
	unsigned long Axis;
	struct MC_TRIGGER_REF TriggerInput;
	float Distance;
	float Velocity;
	float Acceleration;
	float Deceleration;
	float TriggerDistance;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	/* VAR (analog) */
	unsigned long C_Axis;
	struct MC_TRIGGER_REF C_TriggerInput;
	signed long C_Distance;
	float C_Velocity;
	float C_Acceleration;
	float C_Deceleration;
	signed long C_TriggerDistance;
	unsigned short C_ErrorID;
	signed long C_CommandedOffset;
	float C_CommandedPosition;
	unsigned char state;
	unsigned char LockIDPar;
	unsigned char MoveID;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	plcbit ForceTriggerDistance;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
	/* VAR (digital) */
	plcbit C_Execute;
	plcbit C_ForceTriggerDistance;
	plcbit C_Done;
	plcbit C_CommandAborted;
	plcbit C_Error;
} MC_006BR_MoveAdditiveTriggSto_typ;

typedef struct MC_007BR_MoveVelocityTriggSto
{
	/* VAR_INPUT (analog) */
	unsigned long Axis;
	struct MC_TRIGGER_REF TriggerInput;
	float Velocity;
	float Acceleration;
	float Deceleration;
	unsigned char Direction;
	float TriggerDistance;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	/* VAR (analog) */
	unsigned long C_Axis;
	struct MC_TRIGGER_REF C_TriggerInput;
	float C_Velocity;
	float C_Acceleration;
	float C_Deceleration;
	unsigned char C_Direction;
	signed long C_TriggerDistance;
	unsigned short C_ErrorID;
	unsigned char state;
	unsigned char LockIDPar;
	unsigned char MoveID;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
	/* VAR (digital) */
	plcbit C_Execute;
	plcbit C_Done;
	plcbit C_CommandAborted;
	plcbit C_Error;
} MC_007BR_MoveVelocityTriggSto_typ;

typedef struct MC_008BR_ReadParID
{
	/* VAR_INPUT (analog) */
	unsigned long Axis;
	unsigned short ParID;
	unsigned long DataAddress;
	unsigned short DataType;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	/* VAR (analog) */
	unsigned long C_Axis;
	unsigned short C_ParID;
	unsigned char LockIDPar;
	unsigned long C_DataAddress;
	unsigned short C_DataType;
	unsigned short C_ErrorID;
	unsigned char state;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
	/* VAR (digital) */
	plcbit C_Execute;
	plcbit C_Done;
	plcbit C_Error;
} MC_008BR_ReadParID_typ;

typedef struct MC_009BR_WriteParID
{
	/* VAR_INPUT (analog) */
	unsigned long Axis;
	unsigned short ParID;
	unsigned long DataAddress;
	unsigned short DataType;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	/* VAR (analog) */
	unsigned long C_Axis;
	unsigned short C_ParID;
	unsigned char LockIDPar;
	unsigned long C_DataAddress;
	unsigned short C_DataType;
	unsigned short C_ErrorID;
	unsigned char state;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
	/* VAR (digital) */
	plcbit C_Execute;
	plcbit C_Done;
	plcbit C_Error;
} MC_009BR_WriteParID_typ;

typedef struct MC_010BR_InitCyclicRead
{
	/* VAR_INPUT (analog) */
	unsigned long Axis;
	unsigned short ParID;
	unsigned long DataAddress;
	unsigned short DataType;
	unsigned short Mode;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	/* VAR (analog) */
	unsigned char LockID;
	unsigned char LockIDPar;
	unsigned long C_Axis;
	unsigned short C_ParID;
	unsigned long C_DataAddress;
	unsigned short C_DataType;
	unsigned short C_Mode;
	unsigned short C_ErrorID;
	unsigned short ParIDOffset;
	unsigned char ParIDRecIndex;
	unsigned char Reserve;
	unsigned char DataLength;
	unsigned char state;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
	/* VAR (digital) */
	plcbit C_Execute;
	plcbit C_Done;
	plcbit C_Error;
} MC_010BR_InitCyclicRead_typ;

typedef struct MC_011BR_InitCyclicWrite
{
	/* VAR_INPUT (analog) */
	unsigned long Axis;
	unsigned short ParID;
	unsigned long DataAddress;
	unsigned short DataType;
	unsigned short Mode;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	/* VAR (analog) */
	unsigned char LockID;
	unsigned char LockIDPar;
	unsigned long C_Axis;
	unsigned short C_ParID;
	unsigned long C_DataAddress;
	unsigned short C_DataType;
	unsigned short C_Mode;
	unsigned short C_ErrorID;
	unsigned char ParIDParIndex;
	unsigned char DataLength;
	unsigned char state;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
	/* VAR (digital) */
	plcbit C_Execute;
	plcbit C_Done;
	plcbit C_Error;
} MC_011BR_InitCyclicWrite_typ;

typedef struct MC_012BR_InitParList
{
	/* VAR_INPUT (analog) */
	unsigned long Axis;
	unsigned long DataAddress;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	/* VAR (analog) */
	unsigned char LockIDPar;
	unsigned short C_ErrorID;
	unsigned long C_Axis;
	unsigned long C_DataAddress;
	unsigned char state;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
	/* VAR (digital) */
	plcbit C_Error;
	plcbit C_Done;
} MC_012BR_InitParList_typ;

typedef struct MC_013BR_InitParTabObj
{
	/* VAR_INPUT (analog) */
	unsigned long Axis;
	plcstring DataObjectName[13];
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	/* VAR (analog) */
	unsigned long C_Axis;
	plcstring C_DataObjectName[13];
	unsigned short C_ErrorID;
	unsigned char LockIDPar;
	unsigned short Reserve;
	unsigned char state;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
	/* VAR (digital) */
	plcbit C_Error;
	plcbit C_Done;
} MC_013BR_InitParTabObj_typ;

typedef struct MC_014BR_DownloadCamProfileOb
{
	/* VAR_INPUT (analog) */
	unsigned long Axis;
	plcstring DataObjectName[13];
	unsigned short Index;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	/* VAR (analog) */
	unsigned long C_Axis;
	plcstring C_DataObjectName[13];
	unsigned char LockIDPar;
	unsigned short C_Index;
	unsigned short C_ErrorID;
	unsigned char state;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	plcbit Periodic;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
	/* VAR (digital) */
	plcbit C_Error;
	plcbit C_Periodic;
	plcbit C_Done;
} MC_014BR_DownloadCamProfileOb_typ;

typedef struct MC_015BR_DownloadParSequ
{
	/* VAR_INPUT (analog) */
	unsigned long Axis;
	unsigned long DataAddress;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	/* VAR (analog) */
	unsigned long C_Axis;
	unsigned long C_DataAddress;
	unsigned short C_ErrorID;
	unsigned char LockIDPar;
	unsigned char index;
	unsigned long SizeOfFormat;
	unsigned char state;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
	/* VAR (digital) */
	plcbit C_Done;
	plcbit C_Error;
} MC_015BR_DownloadParSequ_typ;

typedef struct MC_016BR_InitParSequ
{
	/* VAR_INPUT (analog) */
	unsigned long Axis;
	unsigned long DataAddress;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	/* VAR (analog) */
	unsigned long C_Axis;
	unsigned long C_DataAddress;
	unsigned short size;
	unsigned long startTicks;
	unsigned short C_ErrorID;
	unsigned long timeOut;
	unsigned char index;
	unsigned short errorCount;
	unsigned char state;
	unsigned char LockIDPar;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
	/* VAR (digital) */
	plcbit C_Error;
} MC_016BR_InitParSequ_typ;

typedef struct MC_017BR_InitAutPar
{
	/* VAR_INPUT (analog) */
	unsigned long Master;
	unsigned long Slave;
	float StartPosition;
	float StartInterval;
	unsigned char StartState;
	float StartMaRelPos;
	float MaxMasterVelocity;
	unsigned short MasterParID;
	unsigned short AddMasterParID;
	unsigned short AddSlaveParID;
	unsigned short SlaveFactorParID;
	unsigned short EventParID;
	unsigned short SlaveLatchParID;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	/* VAR (analog) */
	unsigned long C_Master;
	unsigned long C_Slave;
	signed long C_StartPosition;
	signed long C_StartInterval;
	unsigned char C_StartState;
	unsigned char LockIDMa;
	unsigned char LockIDPar;
	unsigned char LockIDSend;
	signed long C_StartMaRelPos;
	float C_MaxMasterVelocity;
	unsigned short C_MasterParID;
	unsigned short C_AddMasterParID;
	unsigned short C_AddSlaveParID;
	unsigned short C_SlaveFactorParID;
	unsigned short C_EventParID;
	unsigned short C_SlaveLatchParID;
	unsigned short C_ErrorID;
	unsigned short Reserve2;
	unsigned char sendSlot;
	unsigned char readSlot;
	unsigned char state;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
	/* VAR (digital) */
	plcbit C_Execute;
	plcbit C_Done;
	plcbit C_Error;
} MC_017BR_InitAutPar_typ;

typedef struct MC_018BR_InitAutState
{
	/* VAR_INPUT (analog) */
	unsigned long Master;
	unsigned long Slave;
	unsigned char StateIndex;
	unsigned short CamProfileIndex;
	unsigned long MasterFactor;
	signed long SlaveFactor;
	unsigned short RepeatCounterInit;
	unsigned short RepeatCounterSet;
	unsigned char CompMode;
	float MasterCompDistance;
	float SlaveCompDistance;
	unsigned char ExtendedCompLimits;
	float MinMasterCompDistance;
	float MinSlaveCompDistance;
	float MaxSlaveCompDistance;
	float MinSlaveCompVelocity;
	float MaxSlaveCompVelocity;
	float MaxSlaveAccelComp1;
	float MaxSlaveAccelComp2;
	float SlaveCompJoltTime;
	unsigned short MasterParID;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	/* VAR (analog) */
	unsigned long C_Master;
	unsigned long C_Slave;
	unsigned char C_StateIndex;
	unsigned char Reserve1;
	unsigned short C_CamProfileIndex;
	signed long C_MasterFactor;
	signed long C_SlaveFactor;
	unsigned short C_RepeatCounterInit;
	unsigned short C_RepeatCounterSet;
	unsigned char C_CompMode;
	unsigned char LockIDPar;
	signed long C_MasterCompDistance;
	signed long C_SlaveCompDistance;
	unsigned char C_ExtendedCompLimits;
	unsigned char Reserve2;
	signed long C_MinMasterCompDistance;
	signed long C_MinSlaveCompDistance;
	signed long C_MaxSlaveCompDistance;
	float C_MinSlaveCompVelocity;
	float C_MaxSlaveCompVelocity;
	float C_MaxSlaveAccelComp1;
	float C_MaxSlaveAccelComp2;
	float C_SlaveCompJoltTime;
	unsigned short C_MasterParID;
	unsigned short C_ErrorID;
	unsigned char Reserve3;
	unsigned char state;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
	/* VAR (digital) */
	plcbit C_Execute;
	plcbit C_Done;
	plcbit C_Error;
} MC_018BR_InitAutState_typ;

typedef struct MC_019BR_InitAutEvent
{
	/* VAR_INPUT (analog) */
	unsigned long Slave;
	unsigned char StateIndex;
	unsigned char EventIndex;
	unsigned char Type;
	unsigned char Attribute;
	unsigned long Action;
	unsigned char NextState;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	/* VAR (analog) */
	unsigned long C_Slave;
	unsigned char C_StateIndex;
	unsigned char C_EventIndex;
	unsigned char C_Type;
	unsigned char C_Attribute;
	unsigned long C_Action;
	unsigned char C_NextState;
	unsigned char LockIDPar;
	unsigned short C_ErrorID;
	unsigned short Reserve;
	unsigned char state;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
	/* VAR (digital) */
	plcbit C_Execute;
	plcbit C_Done;
	plcbit C_Error;
} MC_019BR_InitAutEvent_typ;

typedef struct MC_020BR_AutControl
{
	/* VAR_INPUT (analog) */
	unsigned long Slave;
	unsigned char ParLock;
	float Deceleration;
	unsigned long AdrAutData;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	unsigned char ActualStateIndex;
	unsigned char ActualCamType;
	/* VAR (analog) */
	unsigned long C_Slave;
	unsigned char ParLockOld;
	unsigned char LockID;
	float C_Deceleration;
	struct MC_AUTDATA_TYP C_AutData;
	unsigned long C_Master;
	unsigned short C_ErrorID;
	unsigned short CC_ErrorID;
	unsigned char SignalSet;
	unsigned char SignalReset;
	unsigned short CmdAutStart;
	unsigned char AutStateDld;
	unsigned char Reserve1;
	unsigned short AutStatusOffset;
	unsigned char AutStatusRecIndex;
	unsigned short AutActualStateIndexOffset;
	unsigned char AutActualStateIndexRecIndex;
	unsigned char LockIDSend;
	unsigned short AutActualCamTypeOffset;
	unsigned short Reserve4;
	unsigned char AutActualCamTypeRecIndex;
	unsigned char LockIDMa;
	unsigned char sendSlot;
	unsigned char readSlot;
	unsigned char state;
	unsigned char LockIDPar;
	unsigned char MoveID;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit Signal1;
	plcbit Signal2;
	plcbit Signal3;
	plcbit Signal4;
	plcbit Start;
	plcbit Stop;
	plcbit Restart;
	plcbit InitAutData;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Busy;
	plcbit Error;
	plcbit AutDataInitialized;
	plcbit Running;
	/* VAR (digital) */
	plcbit CmdParLock;
	plcbit EdgeSignal1;
	plcbit EdgeSignal2;
	plcbit EdgeSignal3;
	plcbit EdgeSignal4;
	plcbit EdgeStart;
	plcbit CmdStart;
	plcbit EdgeStop;
	plcbit CmdStop;
	plcbit EdgeRestart;
	plcbit CmdRestart;
	plcbit EdgeInitAutData;
	plcbit CmdInitAutData;
	plcbit C_Error;
	plcbit AutStatusValid;
	plcbit C_Busy;
} MC_020BR_AutControl_typ;

typedef struct MC_021_ReadDigitalInput
{
	/* VAR_INPUT (analog) */
	struct MC_INPUT_REF Input;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	/* VAR (analog) */
	struct MC_INPUT_REF C_Input;
	unsigned long C_Axis;
	unsigned short C_ErrorID;
	unsigned short ReadDigitalInputOffset;
	unsigned char ReadDigitalInputRecIndex;
	unsigned char LockID;
	unsigned short ReadDigitalInputValue;
	unsigned short ReadDigitalInputMask;
	unsigned char state;
	unsigned char LockIDPar;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
	plcbit Busy;
	plcbit Error;
	plcbit Value;
	/* VAR (digital) */
	plcbit C_Error;
} MC_021_ReadDigitalInput_typ;

typedef struct MC_022_ReadDigitalOutput
{
	/* VAR_INPUT (analog) */
	struct MC_OUTPUT_REF Output;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	/* VAR (analog) */
	unsigned long C_Axis;
	struct MC_OUTPUT_REF C_Output;
	unsigned short C_ErrorID;
	unsigned short ReadDigitalOutputOffset;
	unsigned char ReadDigitalOutputRecIndex;
	unsigned char LockID;
	unsigned short ReadDigitalOutputValue;
	unsigned short ReadDigitalOutputMask;
	unsigned char state;
	unsigned char LockIDPar;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
	plcbit Busy;
	plcbit Error;
	plcbit Value;
	/* VAR (digital) */
	plcbit C_Error;
} MC_022_ReadDigitalOutput_typ;

typedef struct MC_023_WriteDigitalOutput
{
	/* VAR_INPUT (analog) */
	struct MC_OUTPUT_REF Output;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	/* VAR (analog) */
	unsigned long C_Axis;
	struct MC_OUTPUT_REF C_Output;
	unsigned short C_ErrorID;
	unsigned short WriteDigitalOutputMask;
	unsigned char state;
	unsigned char LockIDPar;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	plcbit Value;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
	/* VAR (digital) */
	plcbit C_Execute;
	plcbit C_Value;
	plcbit C_Done;
	plcbit C_Error;
} MC_023_WriteDigitalOutput_typ;

typedef struct MC_024BR_InitMasterParIDTrans
{
	/* VAR_INPUT (analog) */
	unsigned long Master;
	unsigned long Slave;
	unsigned short MasterParID;
	unsigned char SlaveChannel;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	unsigned short ReceiveParID;
	/* VAR (analog) */
	unsigned long C_Master;
	unsigned long C_Slave;
	unsigned short C_MasterParID;
	unsigned char C_SlaveChannel;
	unsigned char LockIDSend;
	unsigned short C_ErrorID;
	unsigned short C_ReceiveParID;
	unsigned char sendSlot;
	unsigned char readSlot;
	unsigned char state;
	unsigned char LockIDMa;
	unsigned char LockIDPar;
	unsigned long Reserve2;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
	/* VAR (digital) */
	plcbit C_Execute;
	plcbit C_Done;
	plcbit C_Error;
} MC_024BR_InitMasterParIDTrans_typ;

typedef struct MC_025BR_InitModPos
{
	/* VAR_INPUT (analog) */
	unsigned long Axis;
	unsigned long Period;
	unsigned long Factor;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	/* VAR (analog) */
	unsigned long C_Axis;
	unsigned long C_Period;
	unsigned long C_Factor;
	unsigned short C_ErrorID;
	unsigned char state;
	unsigned char LockIDPar;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
	/* VAR (digital) */
	plcbit C_Error;
} MC_025BR_InitModPos_typ;

typedef struct MC_026BR_DownloadCamProfileDa
{
	/* VAR_INPUT (analog) */
	unsigned long Axis;
	unsigned long DataAddress;
	unsigned short Index;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	/* VAR (analog) */
	unsigned long C_Axis;
	unsigned long C_DataAddress;
	unsigned short C_Index;
	unsigned short C_ErrorID;
	unsigned char state;
	unsigned char LockIDPar;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	plcbit Periodic;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
	/* VAR (digital) */
	plcbit C_Error;
	plcbit C_Periodic;
	plcbit C_Done;
} MC_026BR_DownloadCamProfileDa_typ;

typedef struct MC_027BR_InitAxisPar
{
	/* VAR_INPUT (analog) */
	unsigned long Axis;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	/* VAR (analog) */
	unsigned long C_Axis;
	unsigned short C_ErrorID;
	unsigned char* pInit;
	unsigned char* pError;
	unsigned char LockIDPar;
	unsigned char state;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
	/* VAR (digital) */
	plcbit C_Error;
} MC_027BR_InitAxisPar_typ;

typedef struct MC_028BR_SaveAxisPar
{
	/* VAR_INPUT (analog) */
	unsigned long Axis;
	plcstring DataObjectName[13];
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	unsigned long DataObjectIdent;
	/* VAR (analog) */
	unsigned long C_Axis;
	plcstring C_DataObjectName[13];
	unsigned short C_ErrorID;
	unsigned char* pInit;
	unsigned char* pError;
	unsigned char LockIDPar;
	unsigned char state;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
	/* VAR (digital) */
	plcbit C_Error;
} MC_028BR_SaveAxisPar_typ;

typedef struct MC_029BR_LoadAxisPar
{
	/* VAR_INPUT (analog) */
	unsigned long Axis;
	plcstring DataObjectName[13];
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	/* VAR (analog) */
	unsigned long C_Axis;
	plcstring C_DataObjectName[13];
	unsigned short C_ErrorID;
	unsigned char* pInit;
	unsigned char* pError;
	unsigned char LockIDPar;
	unsigned char state;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
	/* VAR (digital) */
	plcbit C_Error;
} MC_029BR_LoadAxisPar_typ;

typedef struct MC_030BR_InitAxisSubjectPar
{
	/* VAR_INPUT (analog) */
	unsigned long Axis;
	unsigned short Subject;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	/* VAR (analog) */
	unsigned long C_Axis;
	unsigned short C_Subject;
	unsigned short C_ErrorID;
	unsigned char* pInit;
	unsigned char* pError;
	unsigned long CheckModeBits;
	unsigned char LockIDPar;
	unsigned char state;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
	/* VAR (digital) */
	plcbit C_Error;
} MC_030BR_InitAxisSubjectPar_typ;

typedef struct MC_031BR_TouchProbe
{
	/* VAR_INPUT (analog) */
	unsigned long Axis;
	struct MC_BR_TRIGGER_REF TriggerInput;
	float Period;
	float PeriodChange;
	float ExpectedValue;
	float WindowNegative;
	float WindowPositive;
	unsigned short Mode;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	float RecordedPeriodicValue;
	signed long RecordedValue;
	float DeltaExpectedValue;
	unsigned long ProbeCounter;
	unsigned long MissedTriggers;
	/* VAR (analog) */
	unsigned long C_Axis;
	struct MC_BR_TRIGGER_REF C_TriggerInput;
	signed long C_Period;
	signed long C_PeriodChange;
	signed long C_ExpectedValue;
	signed long C_WindowNegative;
	signed long C_WindowPositive;
	unsigned short C_Mode;
	unsigned short C_ErrorID;
	float C_RecordedPeriodicValue;
	signed long C_RecordedValue;
	float C_DeltaExpectedValue;
	unsigned long C_ProbeCounter;
	unsigned long C_MissedTriggers;
	signed long PeriodOffset;
	signed long LatchValue;
	signed long LatchDeltaIv;
	unsigned char state;
	unsigned char NextState;
	unsigned short DataTyp;
	unsigned char LockIDPar;
	unsigned char LockID;
	signed long ActualPosition;
	unsigned short LatchIndex;
	unsigned short BitIndex;
	unsigned short BitValueOffset;
	unsigned char BitValueRecIndex;
	unsigned char SptID;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Busy;
	plcbit Error;
	/* VAR (digital) */
	plcbit C_Active;
	plcbit C_Busy;
	plcbit C_Error;
	plcbit NewValue;
} MC_031BR_TouchProbe_typ;

typedef struct MC_032BR_Offset
{
	/* VAR_INPUT (analog) */
	unsigned long Slave;
	float Shift;
	float Velocity;
	float Acceleration;
	float ApplicationDistance;
	unsigned short ApplicationMode;
	unsigned short ShiftMode;
	struct MC_ADVANCEDSHIFTPAR_REF AdvancedParameters;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	float ActualShiftValue;
	/* VAR (analog) */
	unsigned long C_Slave;
	signed long C_Shift;
	float C_Velocity;
	float C_Acceleration;
	signed long C_ApplicationDistance;
	unsigned short C_ApplicationMode;
	unsigned short C_SelectedMaster;
	unsigned short C_ShiftMode;
	struct MC_ADVANCEDSHIFTPAR_REF C_AdvancedParameters;
	unsigned short C_ErrorID;
	unsigned short CC_ErrorID;
	unsigned short C_AxisState;
	unsigned char NextState;
	unsigned char state;
	unsigned char LockID;
	unsigned char LockIDPar;
	unsigned long Factor;
	float RtN;
	unsigned short VarIndex;
	unsigned short MpgenIndex;
	unsigned char C_MpgenStatus;
	unsigned short MpgenStatusOffset;
	unsigned char MpgenStatusRecIndex;
	unsigned char Reserve;
	unsigned short MpgenValueOffset;
	unsigned char MpgenValueRecIndex;
	unsigned char FbID;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit InitData;
	plcbit PerformVelocityControl;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Busy;
	plcbit Error;
	plcbit ShiftAttained;
	plcbit DataInitialized;
	/* VAR (digital) */
	plcbit C_InitData;
	plcbit C_PerformVelocityControl;
	plcbit C_Active;
	plcbit C_Busy;
	plcbit C_Error;
	plcbit C_ShiftAttained;
	plcbit C_DataInitialized;
	plcbit InitDataActive;
} MC_032BR_Offset_typ;

typedef struct MC_033BR_Phasing
{
	/* VAR_INPUT (analog) */
	unsigned long Slave;
	float Shift;
	float Velocity;
	float Acceleration;
	float ApplicationDistance;
	unsigned short ApplicationMode;
	unsigned short ShiftMode;
	struct MC_ADVANCEDSHIFTPAR_REF AdvancedParameters;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	float ActualShiftValue;
	/* VAR (analog) */
	unsigned long C_Slave;
	signed long C_Shift;
	float C_Velocity;
	float C_Acceleration;
	signed long C_ApplicationDistance;
	unsigned short C_ApplicationMode;
	unsigned short C_SelectedMaster;
	unsigned short C_ShiftMode;
	struct MC_ADVANCEDSHIFTPAR_REF C_AdvancedParameters;
	unsigned short C_ErrorID;
	unsigned short CC_ErrorID;
	unsigned short C_AxisState;
	unsigned char NextState;
	unsigned char state;
	unsigned char LockID;
	unsigned char LockIDPar;
	unsigned long Factor;
	float RtN;
	unsigned short VarIndex;
	unsigned short MpgenIndex;
	unsigned char C_MpgenStatus;
	unsigned short MpgenStatusOffset;
	unsigned char MpgenStatusRecIndex;
	unsigned char Reserve;
	unsigned short MpgenValueOffset;
	unsigned char MpgenValueRecIndex;
	unsigned char FbID;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit InitData;
	plcbit PerformVelocityControl;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Busy;
	plcbit Error;
	plcbit ShiftAttained;
	plcbit DataInitialized;
	/* VAR (digital) */
	plcbit C_InitiData;
	plcbit C_PerformVelocityControl;
	plcbit C_Active;
	plcbit C_Busy;
	plcbit C_Error;
	plcbit C_ShiftAttained;
	plcbit C_DataInitialized;
	plcbit InitDataActive;
} MC_033BR_Phasing_typ;

typedef struct MC_034BR_EventMoveAbsolute
{
	/* VAR_INPUT (analog) */
	unsigned long Axis;
	struct MC_BR_EVINPUT_REF EventInput;
	float Position;
	float Velocity;
	float Acceleration;
	float Deceleration;
	unsigned char Direction;
	unsigned short Mode;
	unsigned short PositionParID;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	/* VAR (analog) */
	unsigned long C_Axis;
	struct MC_BR_EVINPUT_REF C_EventInput;
	signed long C_Position;
	float C_Velocity;
	float C_Acceleration;
	float C_Deceleration;
	unsigned char C_Direction;
	unsigned short C_Mode;
	unsigned short C_PositionParID;
	unsigned short C_ErrorID;
	signed long C_CommandedOffset;
	unsigned short CmpIndex;
	unsigned short VarIndex;
	unsigned short EvMoveStatusOffset;
	unsigned char EvMoveStatusRecIndex;
	unsigned char Reserve;
	unsigned char state;
	unsigned char LockID;
	unsigned char LockIDPar;
	unsigned char MoveID;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit InPosition;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
	plcbit WaitingForEvent;
	/* VAR (digital) */
	plcbit C_Execute;
	plcbit C_InPosition;
	plcbit C_WaitingForEvent;
	plcbit C_Busy;
	plcbit C_CommandAborted;
	plcbit C_Error;
	plcbit StatusBitDisabled;
	plcbit C_MoveActive;
} MC_034BR_EventMoveAbsolute_typ;

typedef struct MC_035BR_EventMoveAdditive
{
	/* VAR_INPUT (analog) */
	unsigned long Axis;
	struct MC_BR_EVINPUT_REF EventInput;
	float Distance;
	float Velocity;
	float Acceleration;
	float Deceleration;
	unsigned short Mode;
	unsigned short DistanceParID;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	/* VAR (analog) */
	unsigned long C_Axis;
	struct MC_BR_EVINPUT_REF C_EventInput;
	signed long C_Distance;
	float C_Velocity;
	float C_Acceleration;
	float C_Deceleration;
	unsigned short C_Mode;
	unsigned short C_DistanceParID;
	unsigned short C_ErrorID;
	signed long C_CommandedOffset;
	signed long C_CommandedPosition;
	unsigned short CmpIndex;
	unsigned short VarIndex;
	unsigned short EvMoveStatusOffset;
	unsigned char EvMoveStatusRecIndex;
	unsigned char Reserve;
	unsigned char state;
	unsigned char LockID;
	unsigned char LockIDPar;
	unsigned char MoveID;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit InPosition;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
	plcbit WaitingForEvent;
	/* VAR (digital) */
	plcbit C_Execute;
	plcbit C_InPosition;
	plcbit C_WaitingForEvent;
	plcbit C_Busy;
	plcbit C_CommandAborted;
	plcbit C_Error;
	plcbit StatusBitDisabled;
	plcbit C_MoveActive;
} MC_035BR_EventMoveAdditive_typ;

typedef struct MC_036BR_EventMoveVelocity
{
	/* VAR_INPUT (analog) */
	unsigned long Axis;
	struct MC_BR_EVINPUT_REF EventInput;
	float Velocity;
	float Acceleration;
	float Deceleration;
	unsigned char Direction;
	unsigned short Mode;
	unsigned short VelocityParID;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	/* VAR (analog) */
	unsigned long C_Axis;
	struct MC_BR_EVINPUT_REF C_EventInput;
	float C_Velocity;
	float C_Acceleration;
	float C_Deceleration;
	unsigned char C_Direction;
	unsigned char LockID;
	unsigned char LockIDPar;
	unsigned short C_Mode;
	unsigned short C_VelocityParID;
	unsigned short C_ErrorID;
	unsigned short CmpIndex;
	unsigned short VarIndex;
	unsigned short EvMoveStatusOffset;
	unsigned char EvMoveStatusRecIndex;
	unsigned char Reserve1;
	unsigned short VelocityOffset;
	unsigned char VelocityRecIndex;
	unsigned char Reserve2;
	unsigned char state;
	unsigned char MoveID;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit InVelocity;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
	plcbit WaitingForEvent;
	/* VAR (digital) */
	plcbit C_Execute;
	plcbit C_InVelocity;
	plcbit C_WaitingForEvent;
	plcbit C_Busy;
	plcbit C_CommandAborted;
	plcbit C_Error;
	plcbit StatusBitDisabled;
	plcbit C_MoveActive;
} MC_036BR_EventMoveVelocity_typ;

typedef struct MC_037BR_CamDwell
{
	/* VAR_INPUT (analog) */
	unsigned long Master;
	unsigned long Slave;
	float LeadInMasterDistance;
	float LeadInSlaveDistance;
	float LeadInMasterOffset;
	float LeadOutMasterDistance;
	float LeadOutSlaveDistance;
	float LeadOutMasterOffset;
	float MasterStartPosition;
	float MasterDwellDistance;
	float MasterScaling;
	float SlaveScaling;
	unsigned char CamTableID;
	unsigned short MasterParID;
	float MasterParIDMaxVelocity;
	unsigned short LeadInParID;
	unsigned short LeadOutParID;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	/* VAR (analog) */
	unsigned long C_Master;
	unsigned long C_Slave;
	signed long C_LeadInMasterDistance;
	signed long C_LeadInSlaveDistance;
	signed long C_LeadInMasterOffset;
	signed long C_LeadOutMasterDistance;
	signed long C_LeadOutSlaveDistance;
	signed long C_LeadOutMasterOffset;
	signed long C_MasterStartPosition;
	signed long C_MasterDwellDistance;
	signed long C_MasterScaling;
	signed long C_SlaveScaling;
	unsigned short C_CamTableID;
	unsigned short C_MasterParID;
	float C_MasterParIDMaxVelocity;
	unsigned short C_LeadInParID;
	unsigned short C_LeadOutParID;
	unsigned short C_ErrorID;
	unsigned short CC_ErrorID;
	signed long RunningMasterDwellDistance;
	unsigned short ArithIndex;
	unsigned short CmpIndex;
	unsigned short MuxIndex;
	unsigned short EvWrIndex;
	unsigned short VarIndex;
	unsigned short LogicIndex;
	unsigned short AutActualStateIndexOffset;
	unsigned char AutActualStateIndexRecIndex;
	unsigned char LockIDMa;
	unsigned short AutActualCamTypeOffset;
	unsigned char AutActualCamTypeRecIndex;
	unsigned char LockIDSend;
	unsigned char sendSlot;
	unsigned char readSlot;
	unsigned char state;
	unsigned char LockID;
	unsigned char LockIDPar;
	unsigned char MoveID;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit InitData;
	plcbit LeadInSignal;
	plcbit LeadOutSignal;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
	plcbit DataInitialized;
	plcbit InSync;
	plcbit InCam;
	plcbit InDwell;
	/* VAR (digital) */
	plcbit EdgeInitData;
	plcbit EdgeLeadInSignal;
	plcbit EdgeLeadOutSignal;
	plcbit LeadInSignalUsed;
	plcbit LeadOutSignalUsed;
	plcbit C_Active;
	plcbit C_Busy;
	plcbit C_CommandAborted;
	plcbit C_Error;
	plcbit C_InSync;
	plcbit C_InCam;
	plcbit C_InDwell;
	plcbit AutStatusValid;
} MC_037BR_CamDwell_typ;

typedef struct MC_038BR_AutoCamDwell
{
	/* VAR_INPUT (analog) */
	unsigned long Master;
	unsigned long Slave;
	float LeadInMasterDistance;
	float LeadInSlaveDistance;
	float LeadOutMasterDistance;
	float LeadOutSlaveDistance;
	float MasterStartPosition;
	float MasterDwellDistance;
	float MasterLength;
	float SlaveLength;
	unsigned short MasterParID;
	float MasterParIDMaxVelocity;
	unsigned short LeadInParID;
	unsigned short LeadOutParID;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	/* VAR (analog) */
	unsigned long C_Master;
	unsigned long C_Slave;
	signed long C_LeadInMasterDistance;
	signed long C_LeadInSlaveDistance;
	signed long C_LeadOutMasterDistance;
	signed long C_LeadOutSlaveDistance;
	signed long C_MasterStartPosition;
	signed long C_MasterDwellDistance;
	signed long C_MasterLength;
	signed long C_SlaveLength;
	unsigned short C_MasterParID;
	float C_MasterParIDMaxVelocity;
	unsigned short C_LeadInParID;
	unsigned short C_LeadOutParID;
	unsigned short C_ErrorID;
	unsigned short CC_ErrorID;
	signed long RunningMasterDwellDistance;
	unsigned short ArithIndex;
	unsigned short CmpIndex;
	unsigned short MuxIndex;
	unsigned short EvWrIndex;
	unsigned short VarIndex;
	unsigned short LogicIndex;
	unsigned short AutActualStateIndexOffset;
	unsigned char AutActualStateIndexRecIndex;
	unsigned char LockIDMa;
	unsigned char sendSlot;
	unsigned char readSlot;
	unsigned char state;
	unsigned char LockID;
	unsigned char LockIDPar;
	unsigned char LockIDSend;
	unsigned char MoveID;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit InitData;
	plcbit LeadInSignal;
	plcbit LeadOutSignal;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
	plcbit DataInitialized;
	plcbit InSync;
	plcbit InCam;
	plcbit InDwell;
	/* VAR (digital) */
	plcbit EdgeInitData;
	plcbit EdgeLeadInSignal;
	plcbit EdgeLeadOutSignal;
	plcbit LeadInSignalUsed;
	plcbit LeadOutSignalUsed;
	plcbit C_Active;
	plcbit C_Busy;
	plcbit C_CommandAborted;
	plcbit C_Error;
	plcbit C_InSync;
	plcbit C_InCam;
	plcbit C_InDwell;
	plcbit AutStatusValid;
} MC_038BR_AutoCamDwell_typ;

typedef struct MC_039BR_HomeAcpEncoder
{
	/* VAR_INPUT (analog) */
	struct MC_ACP_ENCOD_REF AcpEncoder;
	struct MC_ACP_ENCOD_PARAM_REF HomingParameters;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	signed long EncoderOffset;
	/* VAR (analog) */
	unsigned long C_Axis;
	struct MC_0068_IS_TYP IS;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
} MC_039BR_HomeAcpEncoder_typ;

typedef struct MC_040BR_CyclicRead
{
	/* VAR_INPUT (analog) */
	unsigned long Axis;
	unsigned short ParID;
	unsigned long DataAddress;
	unsigned short DataType;
	unsigned short Mode;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	/* VAR (analog) */
	unsigned long C_Axis;
	struct MC_0069_IS_TYP IS;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
	plcbit Busy;
	plcbit Error;
} MC_040BR_CyclicRead_typ;

typedef struct MC_041BR_CyclicWrite
{
	/* VAR_INPUT (analog) */
	unsigned long Axis;
	unsigned short ParID;
	unsigned long DataAddress;
	unsigned short DataType;
	unsigned short Mode;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	/* VAR (analog) */
	unsigned long C_Axis;
	struct MC_0070_IS_TYP IS;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
	plcbit Busy;
	plcbit Error;
} MC_041BR_CyclicWrite_typ;

typedef struct MC_042BR_Simulation
{
	/* VAR_INPUT (analog) */
	unsigned long Axis;
	unsigned short SimulationCommand;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	/* VAR (analog) */
	unsigned long C_Axis;
	struct MC_0071_IS_TYP IS;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} MC_042BR_Simulation_typ;

typedef struct MC_043BR_ReadDriveStatus
{
	/* VAR_INPUT (analog) */
	unsigned long Axis;
	unsigned long AdrDriveStatus;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	/* VAR (analog) */
	unsigned long C_Axis;
	unsigned char state;
	unsigned short C_ErrorID;
	unsigned long C_AdrDriveStatus;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
	plcbit Busy;
	plcbit Error;
	/* VAR (digital) */
	plcbit C_Error;
} MC_043BR_ReadDriveStatus_typ;

typedef struct MC_044BR_CalcCamFromSections
{
	/* VAR_INPUT (analog) */
	unsigned long DataAddress;
	unsigned long CamProfileAddress;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	unsigned short ErrorInSection;
	/* VAR (analog) */
	unsigned short C_ErrorID;
	unsigned short C_ErrorInSection;
	unsigned char state;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
	/* VAR (digital) */
	plcbit C_Error;
} MC_044BR_CalcCamFromSections_typ;

typedef struct MC_046BR_ReadAutPosition
{
	/* VAR_INPUT (analog) */
	unsigned long Axis;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	float AutPosition;
	/* VAR (analog) */
	unsigned long C_Axis;
	unsigned short C_ErrorID;
	unsigned char LockIDPar;
	signed long C_AutPosition;
	unsigned long C_DataAddress;
	unsigned char state;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
	/* VAR (digital) */
	plcbit C_Execute;
	plcbit C_Done;
	plcbit C_Error;
} MC_046BR_ReadAutPosition_typ;

typedef struct MC_047BR_InitAutData
{
	/* VAR_INPUT (analog) */
	unsigned long Slave;
	struct MC_AUTINITOPTIONS_REF InitOptions;
	unsigned long AdrAutData;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	/* VAR (analog) */
	unsigned long C_Master;
	unsigned long C_Slave;
	struct MC_0076_IS_TYP IS;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	plcbit Force;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} MC_047BR_InitAutData_typ;

typedef struct MC_048BR_GetErrorText
{
	/* VAR_INPUT (analog) */
	struct MC_ERRORTEXTCONFIG_REF Configuration;
	struct MC_ERRORRECORD_REF ErrorRecord;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	/* VAR (analog) */
	struct MC_0077_IS_TYP IS;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} MC_048BR_GetErrorText_typ;

typedef struct MC_049BR_NetTrace
{
	/* VAR_INPUT (analog) */
	unsigned short Command;
	struct MC_NETTRACECONFIG_REF Configuration;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	struct MC_ERRORRECORD_REF ErrorRecord;
	/* VAR (analog) */
	struct MC_0078_IS_TYP IS;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} MC_049BR_NetTrace_typ;

typedef struct MC_050BR_ReadNetTraceStatus
{
	/* VAR_INPUT (analog) */
	struct MC_NETTRACECONFIG_REF Configuration;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	unsigned short TraceState;
	/* VAR (analog) */
	unsigned short C_ErrorID;
	unsigned char state;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
	plcbit Busy;
	plcbit Error;
	/* VAR (digital) */
	plcbit C_Error;
} MC_050BR_ReadNetTraceStatus_typ;

typedef struct MC_051BR_ParTrace
{
	/* VAR_INPUT (analog) */
	unsigned short Command;
	struct MC_PARTRACECONFIG_REF Configuration;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	struct MC_ERRORRECORD_REF ErrorRecord;
	/* VAR (analog) */
	struct MC_0080_IS_TYP IS;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} MC_051BR_ParTrace_typ;

typedef struct MC_052BR_ReadParTraceStatus
{
	/* VAR_INPUT (analog) */
	struct MC_PARTRACECONFIG_REF Configuration;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	unsigned short TraceState;
	/* VAR (analog) */
	unsigned short C_ErrorID;
	unsigned char state;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
	plcbit Busy;
	plcbit Error;
	/* VAR (digital) */
	plcbit C_Error;
} MC_052BR_ReadParTraceStatus_typ;

typedef struct MC_053BR_InitEndlessPosition
{
	/* VAR_INPUT (analog) */
	unsigned long Axis;
	unsigned long DataAddress;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	/* VAR (analog) */
	unsigned long C_Axis;
	unsigned short C_ErrorID;
	unsigned char state;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
	/* VAR (digital) */
	plcbit C_Error;
} MC_053BR_InitEndlessPosition_typ;

typedef struct MC_056BR_GetCamSlavePosition
{
	/* VAR_INPUT (analog) */
	unsigned long Master;
	unsigned long Slave;
	plcstring DataObjectName[13];
	unsigned long DataAddress;
	float MasterPosition;
	unsigned long MasterFactor;
	signed long SlaveFactor;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	float SlavePosition;
	/* VAR (analog) */
	unsigned long C_Master;
	unsigned long C_Slave;
	struct MC_0083_IS_TYP IS;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} MC_056BR_GetCamSlavePosition_typ;

typedef struct MC_057BR_GetCamMasterPosition
{
	/* VAR_INPUT (analog) */
	unsigned long Master;
	unsigned long Slave;
	plcstring DataObjectName[13];
	unsigned long DataAddress;
	float MasterStartPosition;
	float SlavePosition;
	unsigned long MasterFactor;
	signed long SlaveFactor;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	float MasterPosition;
	/* VAR (analog) */
	unsigned long C_Master;
	unsigned long C_Slave;
	struct MC_0084_IS_TYP IS;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} MC_057BR_GetCamMasterPosition_typ;

typedef struct MC_058BR_SetupInductionMotor
{
	/* VAR_INPUT (analog) */
	unsigned long Axis;
	unsigned short Command;
	struct MC_SETUP_IND_MOTOR_CFG_REF Configuration;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	struct MC_SETUP_OUTPUT_REF SetupOutput;
	/* VAR (analog) */
	unsigned long C_Axis;
	struct MC_0088_IS_TYP IS;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
} MC_058BR_SetupInductionMotor_typ;

typedef struct MC_059BR_SetupController
{
	/* VAR_INPUT (analog) */
	unsigned long Axis;
	unsigned short Command;
	struct MC_SETUP_CONTROLLER_CFG_REF Configuration;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	struct MC_SETUP_OUTPUT_REF SetupOutput;
	/* VAR (analog) */
	unsigned long C_Axis;
	struct MC_0090_IS_TYP IS;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
} MC_059BR_SetupController_typ;

typedef struct MC_060BR_PowerMeter
{
	/* VAR_INPUT (analog) */
	unsigned long Axis;
	unsigned char Mode;
	unsigned short IntervalTime;
	struct MC_BR_EVINPUT_REF EventInput;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	struct MC_POWERDATA_REF PowerData;
	unsigned short MissedIntervals;
	/* VAR (analog) */
	unsigned long C_Axis;
	struct MC_0089_IS_TYP IS;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit RestartInterval;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
	plcbit Busy;
	plcbit Error;
} MC_060BR_PowerMeter_typ;

typedef struct MC_061BR_ReadParIDText
{
	/* VAR_INPUT (analog) */
	unsigned long Axis;
	unsigned short ParID;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	plcstring DataText[34];
	/* VAR (analog) */
	unsigned long C_Axis;
	unsigned short C_ParID;
	unsigned char LockIDPar;
	unsigned short C_ErrorID;
	unsigned char state;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
	/* VAR (digital) */
	plcbit C_Execute;
	plcbit C_Done;
	plcbit C_Error;
} MC_061BR_ReadParIDText_typ;

typedef struct MC_062BR_WriteParIDText
{
	/* VAR_INPUT (analog) */
	unsigned long Axis;
	unsigned short ParID;
	plcstring DataText[34];
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	/* VAR (analog) */
	unsigned long C_Axis;
	unsigned short C_ParID;
	unsigned char LockIDPar;
	unsigned short C_ErrorID;
	unsigned char state;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
	/* VAR (digital) */
	plcbit C_Execute;
	plcbit C_Done;
	plcbit C_Error;
} MC_062BR_WriteParIDText_typ;

typedef struct MC_064BR_SetupMotorPhasing
{
	/* VAR_INPUT (analog) */
	unsigned long Axis;
	unsigned short Command;
	struct MC_SETUP_MOTOR_PHA_CFG_REF Configuration;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	struct MC_SETUP_OUTPUT_REF SetupOutput;
	struct MC_SETUP_PHASING_RESULT_REF SetupResult;
	/* VAR (analog) */
	unsigned long C_Axis;
	struct MC_0097_IS_TYP IS;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
} MC_064BR_SetupMotorPhasing_typ;

typedef struct MC_065BR_CyclicReadDataInfo
{
	/* VAR_INPUT (analog) */
	unsigned long Axis;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	unsigned short RecordCount;
	unsigned short ParIDCount;
	signed long RecordUpdateTime;
	signed long TotalUpdateTime;
	unsigned short RecordIndex;
	struct MC_RECORD_INFO_REF RecordInfo;
	/* VAR (analog) */
	unsigned long C_Axis;
	struct MC_0098_IS_TYP IS;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
	plcbit Busy;
	plcbit Error;
} MC_065BR_CyclicReadDataInfo_typ;

typedef struct MC_066BR_AutCommand
{
	/* VAR_INPUT (analog) */
	unsigned long Slave;
	float Deceleration;
	unsigned char SelectParLock;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	unsigned char ActualStateIndex;
	unsigned short ActualStateCamIndex;
	/* VAR (analog) */
	unsigned long C_Slave;
	struct MC_0099_IS_TYP IS;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit Start;
	plcbit Stop;
	plcbit Restart;
	plcbit EndAutomat;
	plcbit SetSignal1;
	plcbit SetSignal2;
	plcbit SetSignal3;
	plcbit SetSignal4;
	plcbit ResetSignal1;
	plcbit ResetSignal2;
	plcbit ResetSignal3;
	plcbit ResetSignal4;
	plcbit TransferParLock;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
	plcbit Running;
	plcbit StandBy;
	plcbit ParLockTransferred;
	plcbit InCam;
	plcbit InCompensation;
} MC_066BR_AutCommand_typ;

typedef struct MC_068BR_SetupIsqRipple
{
	/* VAR_INPUT (analog) */
	unsigned long Axis;
	unsigned short Command;
	struct MC_SETUP_ISQ_RIPPLE_CFG_REF Configuration;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	struct MC_SETUP_OUTPUT_REF SetupOutput;
	/* VAR (analog) */
	unsigned long C_Axis;
	struct MC_0101_IS_TYP IS;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
} MC_068BR_SetupIsqRipple_typ;

typedef struct MC_069BR_ParTraceConfig
{
	/* VAR_INPUT (analog) */
	unsigned short Command;
	unsigned long AdrTraceConfig;
	struct MC_DATOBJ_REF DataObject;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	struct MC_ERRORRECORD_REF ErrorRecord;
	/* VAR (analog) */
	struct MC_0102_IS_TYP IS;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} MC_069BR_ParTraceConfig_typ;



/* Prototyping of functions and function blocks */
void MC_AbortTrigger(struct MC_AbortTrigger* inst);
void MC_CamIn(struct MC_CamIn* inst);
void MC_CamOut(struct MC_CamOut* inst);
void MC_CamTableSelect(struct MC_CamTableSelect* inst);
void MC_DigitalCamSwitch(struct MC_DigitalCamSwitch* inst);
void MC_GearIn(struct MC_GearIn* inst);
void MC_GearOut(struct MC_GearOut* inst);
void MC_Halt(struct MC_Halt* inst);
void MC_Home(struct MC_Home* inst);
void MC_MoveAbsolute(struct MC_MoveAbsolute* inst);
void MC_MoveAdditive(struct MC_MoveAdditive* inst);
void MC_MoveVelocity(struct MC_MoveVelocity* inst);
void MC_Phasing(struct MC_Phasing* inst);
void MC_Power(struct MC_Power* inst);
void MC_ReadActualPosition(struct MC_ReadActualPosition* inst);
void MC_ReadAxisError(struct MC_ReadAxisError* inst);
void MC_ReadBoolParameter(struct MC_ReadBoolParameter* inst);
void MC_ReadParameter(struct MC_ReadParameter* inst);
void MC_ReadStatus(struct MC_ReadStatus* inst);
void MC_Reset(struct MC_Reset* inst);
void MC_SetOverride(struct MC_SetOverride* inst);
void MC_Stop(struct MC_Stop* inst);
void MC_TouchProbe(struct MC_TouchProbe* inst);
void MC_WriteBoolParameter(struct MC_WriteBoolParameter* inst);
void MC_WriteParameter(struct MC_WriteParameter* inst);
void MC_001_ReadActualVelocity(struct MC_001_ReadActualVelocity* inst);
void MC_002_ReadActualTorque(struct MC_002_ReadActualTorque* inst);
void MC_003_GearInPos(struct MC_003_GearInPos* inst);
void MC_004BR_BrakeOperation(struct MC_004BR_BrakeOperation* inst);
void MC_005BR_MoveAbsoluteTriggSto(struct MC_005BR_MoveAbsoluteTriggSto* inst);
void MC_006BR_MoveAdditiveTriggSto(struct MC_006BR_MoveAdditiveTriggSto* inst);
void MC_007BR_MoveVelocityTriggSto(struct MC_007BR_MoveVelocityTriggSto* inst);
void MC_008BR_ReadParID(struct MC_008BR_ReadParID* inst);
void MC_009BR_WriteParID(struct MC_009BR_WriteParID* inst);
void MC_010BR_InitCyclicRead(struct MC_010BR_InitCyclicRead* inst);
void MC_011BR_InitCyclicWrite(struct MC_011BR_InitCyclicWrite* inst);
void MC_012BR_InitParList(struct MC_012BR_InitParList* inst);
void MC_013BR_InitParTabObj(struct MC_013BR_InitParTabObj* inst);
void MC_014BR_DownloadCamProfileOb(struct MC_014BR_DownloadCamProfileOb* inst);
void MC_015BR_DownloadParSequ(struct MC_015BR_DownloadParSequ* inst);
void MC_016BR_InitParSequ(struct MC_016BR_InitParSequ* inst);
void MC_017BR_InitAutPar(struct MC_017BR_InitAutPar* inst);
void MC_018BR_InitAutState(struct MC_018BR_InitAutState* inst);
void MC_019BR_InitAutEvent(struct MC_019BR_InitAutEvent* inst);
void MC_020BR_AutControl(struct MC_020BR_AutControl* inst);
void MC_021_ReadDigitalInput(struct MC_021_ReadDigitalInput* inst);
void MC_022_ReadDigitalOutput(struct MC_022_ReadDigitalOutput* inst);
void MC_023_WriteDigitalOutput(struct MC_023_WriteDigitalOutput* inst);
void MC_024BR_InitMasterParIDTrans(struct MC_024BR_InitMasterParIDTrans* inst);
void MC_025BR_InitModPos(struct MC_025BR_InitModPos* inst);
void MC_026BR_DownloadCamProfileDa(struct MC_026BR_DownloadCamProfileDa* inst);
void MC_027BR_InitAxisPar(struct MC_027BR_InitAxisPar* inst);
void MC_028BR_SaveAxisPar(struct MC_028BR_SaveAxisPar* inst);
void MC_029BR_LoadAxisPar(struct MC_029BR_LoadAxisPar* inst);
void MC_030BR_InitAxisSubjectPar(struct MC_030BR_InitAxisSubjectPar* inst);
void MC_031BR_TouchProbe(struct MC_031BR_TouchProbe* inst);
void MC_032BR_Offset(struct MC_032BR_Offset* inst);
void MC_033BR_Phasing(struct MC_033BR_Phasing* inst);
void MC_034BR_EventMoveAbsolute(struct MC_034BR_EventMoveAbsolute* inst);
void MC_035BR_EventMoveAdditive(struct MC_035BR_EventMoveAdditive* inst);
void MC_036BR_EventMoveVelocity(struct MC_036BR_EventMoveVelocity* inst);
void MC_037BR_CamDwell(struct MC_037BR_CamDwell* inst);
void MC_038BR_AutoCamDwell(struct MC_038BR_AutoCamDwell* inst);
void MC_039BR_HomeAcpEncoder(struct MC_039BR_HomeAcpEncoder* inst);
void MC_040BR_CyclicRead(struct MC_040BR_CyclicRead* inst);
void MC_041BR_CyclicWrite(struct MC_041BR_CyclicWrite* inst);
void MC_042BR_Simulation(struct MC_042BR_Simulation* inst);
void MC_043BR_ReadDriveStatus(struct MC_043BR_ReadDriveStatus* inst);
void MC_044BR_CalcCamFromSections(struct MC_044BR_CalcCamFromSections* inst);
void MC_046BR_ReadAutPosition(struct MC_046BR_ReadAutPosition* inst);
void MC_047BR_InitAutData(struct MC_047BR_InitAutData* inst);
void MC_048BR_GetErrorText(struct MC_048BR_GetErrorText* inst);
void MC_049BR_NetTrace(struct MC_049BR_NetTrace* inst);
void MC_050BR_ReadNetTraceStatus(struct MC_050BR_ReadNetTraceStatus* inst);
void MC_051BR_ParTrace(struct MC_051BR_ParTrace* inst);
void MC_052BR_ReadParTraceStatus(struct MC_052BR_ReadParTraceStatus* inst);
void MC_053BR_InitEndlessPosition(struct MC_053BR_InitEndlessPosition* inst);
void MC_056BR_GetCamSlavePosition(struct MC_056BR_GetCamSlavePosition* inst);
void MC_057BR_GetCamMasterPosition(struct MC_057BR_GetCamMasterPosition* inst);
void MC_058BR_SetupInductionMotor(struct MC_058BR_SetupInductionMotor* inst);
void MC_059BR_SetupController(struct MC_059BR_SetupController* inst);
void MC_060BR_PowerMeter(struct MC_060BR_PowerMeter* inst);
void MC_061BR_ReadParIDText(struct MC_061BR_ReadParIDText* inst);
void MC_062BR_WriteParIDText(struct MC_062BR_WriteParIDText* inst);
void MC_064BR_SetupMotorPhasing(struct MC_064BR_SetupMotorPhasing* inst);
void MC_065BR_CyclicReadDataInfo(struct MC_065BR_CyclicReadDataInfo* inst);
void MC_066BR_AutCommand(struct MC_066BR_AutCommand* inst);
void MC_068BR_SetupIsqRipple(struct MC_068BR_SetupIsqRipple* inst);
void MC_069BR_ParTraceConfig(struct MC_069BR_ParTraceConfig* inst);



#endif /* _ACP10_MC_ */

