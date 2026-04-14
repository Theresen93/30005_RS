(********************************************************************
 * COPYRIGHT -- Microsoft
 ********************************************************************
 * Program: Unw_3W_Glue
 * File: Unw_3W_Glue.st
 * Author: dominique
 * Created: October 26, 2011
 ********************************************************************
 * Implementation of program Unw_3W_Glue
 ********************************************************************)

PROGRAM _CYCLIC

  // Limit operator setpoint
  gSP_OtherRSGlue.MinPressure := LIMIT (0,gSP_OtherRSGlue.MinPressure,399) ;
  gSP_OtherRSGlue.MaxPressure := LIMIT (0,gSP_OtherRSGlue.MaxPressure,400) ;
    
  // Type glue selection (Cold/Hot)
  
  gRecipeActive.bSelTypeOtherRSGlue := 1 ; // D.M. Le 09/12/2011 Pyrollpack_14661 sur DHS uniquement colle chaude, pas de colle froide
  
  gQ_CR_HotColdOtherRSGlueSelect := gRecipeActive.bSelTypeOtherRSGlue ;
  IF EDGEPOS(gRecipeActive.bSelTypeOtherRSGlue) THEN  
    // Switch set points on screen from Cold to Hot
    stSP_ColdGlue.MinPressure := gSP_OtherRSGlue.MinPressure ;
    stSP_ColdGlue.MaxPressure := gSP_OtherRSGlue.MaxPressure ;
    stSP_ColdGlue.ManPressure := gSP_OtherRSGlue.ManPressure ;
    stSP_ColdGlue.AutoOnSpeed := gSP_OtherRSGlue.AutoOnSpeed ;
    
    gSP_OtherRSGlue.MinPressure := stSP_HotGlue.MinPressure ; 
    gSP_OtherRSGlue.MaxPressure := stSP_HotGlue.MaxPressure ; 
    gSP_OtherRSGlue.ManPressure := stSP_HotGlue.ManPressure ; 
    gSP_OtherRSGlue.AutoOnSpeed := stSP_HotGlue.AutoOnSpeed ;  
  END_IF ;
  IF EDGENEG(gRecipeActive.bSelTypeOtherRSGlue) THEN 
    // Switch set points on screen from Hot to Cold
    stSP_HotGlue.MinPressure := gSP_OtherRSGlue.MinPressure ;
    stSP_HotGlue.MaxPressure := gSP_OtherRSGlue.MaxPressure ;
    stSP_HotGlue.ManPressure := gSP_OtherRSGlue.ManPressure ;
    stSP_HotGlue.AutoOnSpeed := gSP_OtherRSGlue.AutoOnSpeed ;
    
    gSP_OtherRSGlue.MinPressure := stSP_ColdGlue.MinPressure ; 
    gSP_OtherRSGlue.MaxPressure := stSP_ColdGlue.MaxPressure ; 
    gSP_OtherRSGlue.ManPressure := stSP_ColdGlue.ManPressure ; 
    gSP_OtherRSGlue.AutoOnSpeed := stSP_ColdGlue.AutoOnSpeed ;  
  END_IF ;
  
(* Glue Off/On From HMI *)
  HGW_2StatePB_0.PB := EDGEPOS(Glue_PB);
  GlueText_Ind := HGW_2StatePB_0.Text_Ind;
  GlueColor_Ind := HGW_2StatePB_0.Color_Ind;
  Glue_On := HGW_2StatePB_0.State1;
  HGW_2StatePB_0();

(* Glue Manual/Auto From HMI *)
	HGW_2StatePB_1.PB := (EDGEPOS(GlueAuto_PB) OR (NOT Glue_Auto AND gA[9].Ind_InMotion));
	GlueAutoText_Ind := HGW_2StatePB_1.Text_Ind;
	GlueAutoColor_Ind := HGW_2StatePB_1.Color_Ind;
	Glue_Auto := HGW_2StatePB_1.State1;
	HGW_2StatePB_1();

(* Glue Auto Pressure Based On Machine Speed *)
	HGW_ScaleReal_0.Enable := Glue_Auto;
	HGW_ScaleReal_0.InputMin := 0.0;
	HGW_ScaleReal_0.InputMax := gr_rMaxLSFlexoP_mmin/3.2808;
	HGW_ScaleReal_0.InputRaw := gActualMachineSpeed_FPM;
	HGW_ScaleReal_0.ScaledMin := gSP_OtherRSGlue.MinPressure ;
	HGW_ScaleReal_0.ScaledMax := gSP_OtherRSGlue.MaxPressure ;
	PressureCmd := HGW_ScaleReal_0.ScaledOut;
	HGW_ScaleReal_0();

(* Glue Manual Pressure *)
	IF (NOT Glue_Auto) THEN
		PressureCmd := gSP_OtherRSGlue.ManPressure;
	END_IF

(* Glue Pressure Command Limit 0-100% *)
	PressureCmd := LIMIT (0,PressureCmd, 100);

(* If Disabled, Reduce Pressure To Zero *)
	IF (NOT Glue_On) THEN
		PressureCmd := 0;
	END_IF

(* Generate Analog Command To Seam Paste System Pressure *)
	HGW_ScaleReal_1.Enable := 1;
	HGW_ScaleReal_1.InputMin := 0.0;
	HGW_ScaleReal_1.InputMax := 100.0;
	HGW_ScaleReal_1.InputRaw := PressureCmd;
	HGW_ScaleReal_1.ScaledMin := 0.0;
	HGW_ScaleReal_1.ScaledMax := 32767.0;
  HMI_rOtherRSGlueActPress := REAL_TO_INT(HGW_ScaleReal_1.ScaledOut)/32767.0*100.0;
  
  gQ_CMD_UNW_GluePressure := REAL_TO_INT(HGW_ScaleReal_1.ScaledOut);
  gQ_CMD_3W_GluePressure  := REAL_TO_INT(HGW_ScaleReal_1.ScaledOut);
  gQ_CMD_OtherRS_GluePressure := REAL_TO_INT(HGW_ScaleReal_1.ScaledOut);
	HGW_ScaleReal_1();

  // Delay activation glue
    // Limit operator value
    HMI_rSPDelayActGlue := LIMIT(0,HMI_rSPDelayActGlue,10) ;
    // Conversion from s --> ms in time format
    iiSPDelayActGlue := REAL_TO_DINT(HMI_rSPDelayActGlue*1000) ;
    tSPDelayActGlue := DINT_TO_TIME(iiSPDelayActGlue) ;
    // Delay calculation
    stTON_DelayActGlue(IN:=(gA[9].Ind_InMotion AND gA[5].Ind_bSynchroOK), PT:=tSPDelayActGlue);
    
    // Glue activation/deactivation
    GlueAuto_On := gI_SS_UNW_HotGlue    AND 
                   stTON_DelayActGlue.Q ;    
                        
  (* Glue Gun Clean Control *)
  	HGW_Toggle_0(In := GlueClean_PB , Time := T#12ms);

  (* Glue Gun Control *)
  	IF (GlueAuto_On OR GluePurge_PB OR HGW_Toggle_0.Out) THEN
  		bImQ_CR_UNW_Glue := 1;
  	ELSE
  		bImQ_CR_UNW_Glue := 0;
  	END_IF

    // Output activation
    // Glue on unwinder
    gQ_CR_UNW_Glue := bImQ_CR_UNW_Glue AND 
                      NOT(g_bIndEStop) ;
                      
                      
  
    // Glue on 3Web unit
    Glue3WAuto_On := stTON_DelayActGlue.Q   AND
                     gBagMachine_WebBreakOK AND 
                     g_bSynchroAxisOK       ;

    bQ_CR_3W_GlueOn := ( Glue3WAuto_On      OR  
                         GluePurge_PB       OR   
                         HGW_Toggle_0.Out ) AND                          
                       gI_SS_3W_GlueOn      ;

    
    bQ_CR_3W_Glue2 := gI_SS_3W_Glue2  AND 
                      bQ_CR_3W_GlueOn ;

    // Outputs activation
    gQ_CR_3W_GlueOn := bQ_CR_3W_GlueOn AND 
                       NOT(g_bIndEStop) ;
    gQ_CR_3W_Glue2 := bQ_CR_3W_Glue2 AND 
                      NOT(g_bIndEStop) ;
END_PROGRAM
