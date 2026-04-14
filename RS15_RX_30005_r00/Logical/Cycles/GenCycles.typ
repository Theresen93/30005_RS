
TYPE
  MoveStat :
    ( 
    INACTIVE := 0 ,
    ACTIVE   := 1 , 
    FINISHED := 2 ,
    FAULT    := 3 
    ) ;
    
  CycManTimSet : STRUCT 
    bSCyc           : BOOL ; 
    bFCyc           : BOOL ;
    bCyc            : BOOL ;
    bCycFail        : BOOL ;
    bModTest        : BOOL ;
    bTestOn         : BOOL ; 
    CmdStart        : BOOL ; 
    CmdMov          : BOOL ; 
    CmdStop         : BOOL ; 
    enMoveStat      : MoveStat ; 
    rSP_Vel         : REAL ;  
    rSP_Acc         : REAL ;  
    rSP_Dec         : REAL ;  
    rSP_Distance    : REAL ; 
    CmdExeMov       : BOOL ; 
    CmdExeStop      : BOOL ; 
    CmdSynchroOff   : BOOL ;
    CmdSynchroOn    : BOOL ;
    iStep           : INT ;
    uiiMaster       : UDINT ; 
    uiMasterParID   : UINT ; 
    rOverrideAcc    : REAL ;
    bSynchroOkSlavA : ARRAY [0..15]OF BOOL ;
    bTest_          : ARRAY [0..9]OF BOOL ;
    iTest_          : ARRAY [0..9]OF INT ;
    rTest_          : ARRAY [0..9]OF REAL ;
  END_STRUCT;
  
  CycGen : STRUCT 
    bSCyc           : BOOL ; 
    bFCyc           : BOOL ;
    bCyc            : BOOL ;
    bCycFail        : BOOL ;
    iStep           : INT ;
    bModTest        : BOOL ;
    bTestOn         : BOOL ;     
    bTest_          : ARRAY [0..14]OF BOOL ;
    iTest_          : ARRAY [0..14]OF INT ;
    rTest_          : ARRAY [0..14]OF REAL ;
  END_STRUCT;
    
  CycHMPerf : STRUCT 
    bSCyc           : BOOL ; 
    bFCyc           : BOOL ;
    bCyc            : BOOL ;
    bCycFail        : BOOL ;
    iStep           : INT ;
    bModTest        : BOOL ;
    bTestOn         : BOOL ; 
    rSP_Vel         : REAL ;  
    rSP_Acc         : REAL ;  
    rSP_Dec         : REAL ; 
    bSlowRot_OK     : BOOL ;   
    bSynchro_OK     : BOOL ; 
    Cmd_SynchroOn   : BOOL ; 
    Cmd_SynchroOff  : BOOL ; 
    Cmd_SlowRot     : BOOL ; 
    Cmd_Stop        : BOOL ; 
    Cmd_EnableAxis  : BOOL ;
    bSelProd        : BOOL ;  
    bStopReq        : BOOL ; (*Stop Hot Micro Perfo unit request*)
    bFaultCond      : BOOL ; (*Fault condition*)  
    bStopCond       : BOOL ; (*Stop condition*)  
    bSlowRotCond    : BOOL ; 
    bTest_          : ARRAY [0..14]OF BOOL ;
    iTest_          : ARRAY [0..14]OF INT ;
    rTest_          : ARRAY [0..14]OF REAL ;
  END_STRUCT;
  
  stCycAxis : STRUCT 
    CycManTimSet : CycManTimSet ;    
  END_STRUCT;
END_TYPE
