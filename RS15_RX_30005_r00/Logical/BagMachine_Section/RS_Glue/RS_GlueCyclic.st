(********************************************************************
 * COPYRIGHT -- Microsoft
 ********************************************************************
 * Program: RS_Glue
 * File: RS_GlueCyclic.st
 * Author: dominique
 * Created: October 26, 2011
 ********************************************************************
 * Implementation of program ColdGlue
 ********************************************************************)

PROGRAM _CYCLIC
  // Limit operator setpoint
  gSP_RSGlue.MinPressure := LIMIT (0,gSP_RSGlue.MinPressure,399) ;
  gSP_RSGlue.MaxPressure := LIMIT (0,gSP_RSGlue.MaxPressure,400) ;
  
  // Type RS glue selection (Cold/Hot)
  gQ_CR_HotColdRSGlueSelect := gRecipeActive.bSelTypeRSGlue ;
  IF EDGEPOS(gRecipeActive.bSelTypeRSGlue) THEN 
    // Switch set points on screen from Cold to Hot
    stSP_ColdGlue.MinPressure := gSP_RSGlue.MinPressure ;
    stSP_ColdGlue.MaxPressure := gSP_RSGlue.MaxPressure ;
    stSP_ColdGlue.ManPressure := gSP_RSGlue.ManPressure ;
    stSP_ColdGlue.AutoOnSpeed := gSP_RSGlue.AutoOnSpeed ;
    
    gSP_RSGlue.MinPressure := stSP_HotGlue.MinPressure ; 
    gSP_RSGlue.MaxPressure := stSP_HotGlue.MaxPressure ; 
    gSP_RSGlue.ManPressure := stSP_HotGlue.ManPressure ; 
    gSP_RSGlue.AutoOnSpeed := stSP_HotGlue.AutoOnSpeed ;  
  END_IF ;
  IF EDGENEG(gRecipeActive.bSelTypeRSGlue) THEN 
    // Switch set points on screen from Hot to Cold
    stSP_HotGlue.MinPressure := gSP_RSGlue.MinPressure ;
    stSP_HotGlue.MaxPressure := gSP_RSGlue.MaxPressure ;
    stSP_HotGlue.ManPressure := gSP_RSGlue.ManPressure ;
    stSP_HotGlue.AutoOnSpeed := gSP_RSGlue.AutoOnSpeed ;
    
    gSP_RSGlue.MinPressure := stSP_ColdGlue.MinPressure ; 
    gSP_RSGlue.MaxPressure := stSP_ColdGlue.MaxPressure ; 
    gSP_RSGlue.ManPressure := stSP_ColdGlue.ManPressure ; 
    gSP_RSGlue.AutoOnSpeed := stSP_ColdGlue.AutoOnSpeed ;  
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
	HGW_ScaleReal_0.ScaledMin := gSP_RSGlue.MinPressure ;
	HGW_ScaleReal_0.ScaledMax := gSP_RSGlue.MaxPressure ;
	PressureCmd := HGW_ScaleReal_0.ScaledOut;
	HGW_ScaleReal_0();

(* Glue Manual Pressure *)
	IF (NOT Glue_Auto) THEN
		PressureCmd := gSP_RSGlue.ManPressure;
	END_IF

(* Glue Pressure Command Limit 0-100% *)
	PressureCmd := LIMIT (0,PressureCmd, 100);

(* If Disabled, Reduce Pressure To Zero  *)
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
  gQ_CMD_RS_GluePressure  := REAL_TO_INT(HGW_ScaleReal_1.ScaledOut);
	HGW_ScaleReal_1();

(* Glue Auto On *)
  IF ((gActualMachineSpeed_FPM>=gSP_RSGlue.AutoOnSpeed) AND gA[9].Ind_InMotion AND Glue_On AND gBagMachine_WebBreakOK AND NOT(g_bIndEStop) ) THEN
		GlueAuto_On := 1;
	ELSE
		GlueAuto_On := 0;
	END_IF

(* Glue Gun Clean Control *)
	HGW_Toggle_0(In := GlueClean_PB , Time := T#12ms);

(* Glue Gun Control *)
	IF ( (GlueAuto_On OR GluePurge_PB OR HGW_Toggle_0.Out) AND gBagMachine_WebBreakOK AND gI_SS_SeamGlueOnOff AND NOT(g_bIndEStop) ) THEN
		gQ_CR_RS_Glue := 1;
	ELSE
		gQ_CR_RS_Glue := bTest1;
	END_IF
	
(* Is 2nd Tube Selected *)
	IF (gSP_TubeSelect) THEN
		gQ_CR_ColdGlueSelect := 1;
	ELSE
		gQ_CR_ColdGlueSelect := bTest2;
	END_IF

END_PROGRAM
