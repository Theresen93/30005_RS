(********************************************************************
 * COPYRIGHT -- Microsoft
 ********************************************************************
 * Program: RS_Glue
 * File: RS_GlueeCyclic.st
 * Author: dominique
 * Created: October 26, 2011
 ********************************************************************
 * Implementation of program ColdGlue
 ********************************************************************)

PROGRAM _CYCLIC
  // Limit operator setpoint
  gSP_ColdGlue.MinPressure := LIMIT (0,gSP_ColdGlue.MinPressure,99) ;
  gSP_ColdGlue.MaxPressure := LIMIT (0,gSP_ColdGlue.MaxPressure,100) ;
  
  // Type RS glue selection (Cold/Hot)
  gQ_CR_HotColdGlueSelect := gRecipeActive.bSelTypeRSGlue ;
  IF EDGEPOS(gRecipeActive.bSelTypeRSGlue) THEN     
    rRS_ColdGlueMinPress := gSP_ColdGlue.MinPressure ;
    gSP_ColdGlue.MinPressure := rRS_HotGlueMinPress ;  
  END_IF ;
  IF EDGENEG(gRecipeActive.bSelTypeRSGlue) THEN 
    rRS_HotGlueMinPress := gSP_ColdGlue.MinPressure ;
    gSP_ColdGlue.MinPressure := rRS_ColdGlueMinPress ;  
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
	HGW_ScaleReal_0.InputMax := 1000.0;
	HGW_ScaleReal_0.InputRaw := gActualMachineSpeed_FPM;
	HGW_ScaleReal_0.ScaledMin := gSP_ColdGlue.MinPressure ;
	HGW_ScaleReal_0.ScaledMax := gSP_ColdGlue.MaxPressure ;
	PressureCmd := HGW_ScaleReal_0.ScaledOut;
	HGW_ScaleReal_0();

(* Glue Manual Pressure *)
	IF (NOT Glue_Auto) THEN
		PressureCmd := gSP_ColdGlue.ManPressure;
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
	//gQ_CMD_ColdGluePressure := REAL_TO_INT(HGW_ScaleReal_1.ScaledOut);
  gQ_CMD_RS_GluePressure  := REAL_TO_INT(HGW_ScaleReal_1.ScaledOut);
	HGW_ScaleReal_1();

(* Glue Auto On *)
  IF ((gActualMachineSpeed_FPM>=gSP_ColdGlue.AutoOnSpeed) AND gA[9].Ind_InMotion AND Glue_On AND gBagMachine_WebBreakOK) THEN
		GlueAuto_On := 1;
	ELSE
		GlueAuto_On := 0;
	END_IF

(* Glue Gun Clean Control *)
	HGW_Toggle_0(In := GlueClean_PB , Time := T#12ms);

(* Glue Gun Control *)
	IF ((GlueAuto_On OR GluePurge_PB OR HGW_Toggle_0.Out) AND gBagMachine_WebBreakOK AND gI_SS_SeamGlueOnOff) THEN
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
