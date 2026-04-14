
TYPE
  PasswordLevel :   STRUCT 
    Operator : STRING[32];
    Supervisor : STRING[32];
    Maintenance : STRING[32];
    Technician : STRING[32];
END_STRUCT;
  Recipe : 	STRUCT 
    Name : STRING[32];
    Repeat : REAL;
    PackCount : DINT;
    HoldCount : DINT;
    Perf_Offset : REAL;
    Holding_Offset : REAL;
    Tearing_Offset : REAL;
    Drum_Offset : REAL;
    rPerf_PhasMasterDeg    : REAL;
    rHolding_PhasMasterDeg : REAL;
    rTearing_PhasMasterDeg : REAL;
    rDrum_PhasMasterDeg    : REAL;
    rCMPerf_OffsetIn       : REAL; (*Offset of the Cold Micro-Perf Axis, in Inch*)
    rCMPerf_PhasMasterDeg  : REAL; (*Phase of the Cold Micro-Perf Axis, in Deg*)
    rHMPerf_OffsetIn       : REAL; (*Offset of the Hot Micro-Perf Axis, in Inch*)
    rHMPerf_PhasMasterDeg  : REAL; (*Phase of the Hot Micro-Perf Axis, in Deg*)
    rEnvB_PhasMasterDeg    : REAL; (*Phase of the Envelope Bag Axis, in Deg*)
    rTearEB_PhasMasterDeg  : REAL; (*Phase of the Tearing Envelope Bag Axis, in Deg*)
    rEnvB_Offset           : REAL; (*Offset of the Envelope Bag Axis, in Deg*)
    rTearEB_Offset         : REAL; (*Offset of the Tearing Envelope Bag Axis, in Deg*)
    rEnvB_PerfSize_in      : REAL; (*Size = perimeter of the Envelope Bag Perforator, in Inch*) 
    Entry_Draw   : REAL;
    Exit_Draw    : REAL;
    rCMPerf_Draw : REAL; (*Cold Micro Perf draw setpoint, in %*)
    bCMPerf_Mode : BOOL; (*Mode operation Cold Micro Perf, =0:Continu, =1:Interrupt*)
    rHotMicroPerfSize_in : REAL ; (*Perimeter of the tool of the Hot Micro Perf, in in*)
    bHMPerf_Mode : BOOL; (*Mode operation Hot Micro Perf, =0:Continu, =1:Interrupt*)
    iHMPerf_Up   : INT;  (*In case interrupt = Number of repeat per round on Tool*)
    bSelFPProd   : BOOL ; 
    bSelHeaterProd : BOOL ; 
    rHeatSPDegF : REAL ; 
    bSelColdMicroPerfProd : BOOL ; 
    bSelEnvBProd : BOOL ; (*Activation Envelope Bag for production =0:Off, =1:On*)
    rSlopeExitTable : REAL ; 
    bSelTypeRSGlue : BOOL; (*Type RS glue selection, =0:Cold; =1:Hot*)
    bSelTypeOtherRSGlue : BOOL; (*Type Other RS glue selection, =0:Cold; =1:Hot*)
    iNumToothGearPrint : INT ; (*Number of tooth on the Gear printing repeat, in case Flexo Press*)
    iPrintUp : INT ; (*Number of picture per round on printing cylinder, in case Flexo Press*)
END_STRUCT;
  Registration : 	STRUCT 
    Enable : BOOL;
    Ind_General : UINT;
    Ind_Text : UINT;
    Ind_Color : UINT;
    SP_Repeat : REAL;
    SP_MaximumCorrection : REAL;
    SP_Format : REAL;
    SP_Tolerance : REAL;
    SP_Offset : REAL;
    SP_WeightingFactor : REAL;
    SP_MarkMissedCount : DINT;
    SP_OutOfToleranceCount : DINT;
    SP_PE_Distance : REAL;
    Pointer : USINT;
    LengthActual : REAL;
    LengthAverage : REAL;
    LengthCorrection : REAL;
    OffsetActive : BOOL;
    CorrectionMax : BOOL;
    CorrectionNew : BOOL;
    MarkFirst : BOOL;
    MarkGood : BOOL;
    MarkGoodNew : BOOL;
    MarkGoodCount : DINT;
    MarkMissed : BOOL;
    MarkMissedNew : BOOL;
    MarkMissedCount : DINT;
    ShutdownMissedMark : BOOL;
    ShutdownOutOfTolerance : BOOL;
END_STRUCT;
  Encoder : 	STRUCT 
    Ident : UDINT;
    Error : BOOL;
    ErrorID : UINT;
    ErrorCount : UINT;
    ErrrorText : ARRAY[0..3] OF STRING[79];
    ParID_1 : UINT;
    ParID_2 : UINT;
    ParID_1_Ready : BOOL;
    ParID_2_Ready : BOOL;
    Cmd_Reset : BOOL;
    SP_PPR : REAL;
    MachinePeriod : REAL;
    UnitsPerInch : REAL;
    UnitsPerDeg : REAL;
    PositionCount : REAL;
    PositionInch : REAL;
    PositionDeg : REAL;
END_STRUCT;
  AxisSP : 	STRUCT 
    HomeOffset : REAL;
    PhaseOffset : REAL;
    Diameter : REAL;
    ParkPosition : REAL;
    MatchedSpeed : REAL;
    AbsoluteOffset : REAL;
    rZoneBefPerf_in : REAL; (*Zone matched speed before Perf, in inch*)
    rZoneAftPerf_in : REAL; (*Zone matched speed after Perf, in inch*)
END_STRUCT;
  AxisBasic : 	STRUCT 
    Ident : UDINT;
    Error : BOOL;
    ErrorStop : BOOL;
    ErrorID : UINT;
    ErrorCount : UINT;
    ErrorAck : BOOL;
    ErrorText : ARRAY[0..3] OF STRING[79];
    Ind_Enabled : BOOL;
    Ind_Ready : BOOL;
    Ind_Stopping : BOOL;
    Ind_StandStill : BOOL;
    Ind_InMotion : BOOL;
    Ind_Homed : BOOL;
    Ind_Homing : BOOL;
    Ind_DiscreteMotion : BOOL;
    Ind_ContinuousMotion : BOOL;
    Ind_SynchronizedMotion : BOOL;
    Ind_AutomatEnabled : BOOL;
    Ind_CurrentAutomatState : USINT;
    Ind_Simulation : BOOL;
    Ind_NetworkInit : BOOL;
    Ind_ControllerReady : BOOL;
    Ind_ControllerStatus : BOOL;
    Ind_HomingOk : BOOL;
    Ind_LagWarning : BOOL;
    Ind_bInContactZone : BOOL; (*= 1 if Axis is in contact zone; =0 else*)
    Ind_bSynchroOK     : BOOL; (*= 1 When synchronisation with Master is finished; =0 else*)
    bSynchroReq        : BOOL; (*= 1 When synchronisation is required; =0 else*)
    Cmd_Enable : BOOL;
    Cmd_DiscreteMotion : BOOL;
    Cmd_ContinuousMotion : BOOL;
    Cmd_ContinuousMotionUpdate : BOOL;
    Cmd_SynchronizedMotion : BOOL;
    Cmd_SynchronizedMotionUpdate : BOOL;
    Cmd_PhaseOffset : BOOL;
    Cmd_Halt : BOOL;
    iPhasingState : INT ; (*Phasing command actual state : =0:rest; =1:busy; =2:Error*)
    Cmd_Home : BOOL;
    Cmd_Reset : BOOL;
    Cmd_ManuTimSetPlus : BOOL;
    Cmd_ManuTimSetMinus : BOOL;
    Cmd_Override : BOOL;        
    Cmd_CalcCameProf : BOOL; (*Came Profile calculation*)
    Cmd_GetMaPosProf : BOOL; (*Calculation master position in the Came Profile according to slave position*)
    Cmd_GetSlPosProf : BOOL; (*Calculation slave position in the Came Profile according to master position*)
    Cmd_EStopDisable : BOOL; (*Disable axe after EStop and machine at Standstill*)
    SP_Accel : REAL;
    SP_Decel : REAL;
    SP_EStopDecel : REAL;
    SP_GuardFaultDecel : REAL;
    SP_WebBreakDecel : REAL;
    SP_GenFaultDecel : REAL;
    SP_FStopDecel : REAL;
    SP_JogDecel : REAL;
    SP_Velocity : REAL;
    SP_Distance : REAL;
    SP_PhaseOffset : REAL;
    SP_GearBoxInput : REAL;
    SP_GearBoxOutput : REAL;
    SP_MotorPPR : REAL;
    rSP_OverrideV : REAL;
    rSP_OverrideA : REAL;
    rSP_CorPosVel : REAL ; (*Position correction according to the speed because of dead time and in order to match with the virtual master position, in °/rpm*)
    rSP_Pos_Deg : REAL ;   (*Input set point position of the position controller ParID 428, in deg*)
    rPerim_In   : REAL ;   (*Perimeter of the Axis, in inch*) 
    bActive     : BOOL ;   (*Axis activated*) 
    bInMach     : BOOL ;   (*Axis in machine, =0:NO, =1:YES*) 
    HomeVelocity : REAL;
    PositionCount : REAL;
    PositionInch : REAL;
    PositionDeg : REAL;
    rSetPosCount : REAL;
    rSetPosInch : REAL;
    rSetPosDeg : REAL;
    rActPhasDeg : REAL; (*Calculated actual Master/Slave Phase; PosSlave = RatioSynchro*PosMaster + Phase, in Deg*)
    rRSynNum : REAL; (*Sychro ratio numerator Master/Slave, PosSlave = RatioSynchro*PosMaster + Phase,  RatioSynchro = rRSynNum/rRSynDen*)
    rRSynDen : REAL; (*Sychro ratio denominator Master/Slave, PosSlave = RatioSynchro*PosMaster + Phase,  RatioSynchro = rRSynNum/rRSynDen*)
    uiiNumRev : UDINT ; (*Number of revolution*)
    AxisPeriod : REAL;
    ActualVelocity : REAL;
    ActualTorque : REAL;
    UnitsPerInch : REAL;
    UnitsPerDeg : REAL;
    InchPerDeg : REAL;
    Input_Home : BOOL;
    Input_PosHW : BOOL;
    Input_NegHW : BOOL;
    Input_Trigger1 : BOOL;
    Input_Trigger2 : BOOL;
    Input_DriveEnable : BOOL;
END_STRUCT;
  RECIPE_CNTL_typ : 	STRUCT 
    cmdDelete : BOOL;
    cmdLoad : BOOL;
    cmdSave : BOOL;
    currRecipe : STRING[20];
    description : STRING[80];
    driveSelect : USINT;
    newRecipe : STRING[20];
    opActive : BOOL;
    status : STRING[40];
END_STRUCT;
  RECIPE_typ : 	STRUCT 
    description : STRING[80];
    dataDINT : ARRAY[0..9] OF DINT;
    dataReal : ARRAY[0..9] OF REAL;
    dataCheck : DINT;
END_STRUCT;
  System : 	STRUCT 
    gSP_A : ARRAY[0..15] OF AxisSP;
    gReg : ARRAY[0..15] OF Registration;
    gPassword : PasswordLevel;
    gMachineTime : HourMeter;
    gSP_CmdSpeed : REAL;
    gSP_ColdGlue : Glue;
    gSP_HotGlue : Glue;
    gSP_GlueTrayAutoSpeed : REAL;
    gSP_PerfCylSelect : BOOL;
    gSP_PerfKnifeCount : REAL;
    gSP_TubeSelect : BOOL;
END_STRUCT;
  HourMeter : 	STRUCT 
    Seconds : INT;
    Minutes : INT;
    Hours : DINT;
END_STRUCT;
  Glue :   STRUCT 
    Start : ARRAY[0..15] OF REAL;
    Length : ARRAY[0..15] OF REAL;
    OnComp : UDINT;
    OffComp : UDINT;
    Hysteresis : REAL;
    MinPressure : REAL;
    MaxPressure : REAL;
    ManPressure : REAL;
    AutoOnSpeed : REAL;
END_STRUCT;
END_TYPE
