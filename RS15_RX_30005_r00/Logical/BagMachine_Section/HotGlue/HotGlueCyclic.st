(********************************************************************
 * COPYRIGHT -- Microsoft
 ********************************************************************
 * Program: HotGlue
 * File: HotGlueCyclic.st
 * Author: pkiel
 * Created: July 14, 2011
 ********************************************************************
 * Implementation of program HotGlue
 ********************************************************************)

PROGRAM _CYCLIC

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
	HGW_ScaleReal_0.ScaledMin := LIMIT (0,gSP_HotGlue.MinPressure,400);
	HGW_ScaleReal_0.ScaledMax := LIMIT (0,gSP_HotGlue.MaxPressure,400);
	PressureCmd := HGW_ScaleReal_0.ScaledOut;
	HGW_ScaleReal_0();

(* Glue Manual Pressure *)
	IF (NOT Glue_Auto) THEN
		PressureCmd := gSP_HotGlue.ManPressure;
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
	//gQ_CMD_HotGluePressure := REAL_TO_INT(HGW_ScaleReal_1.ScaledOut);
  gQ_CMD_UNW_GluePressure := REAL_TO_INT(HGW_ScaleReal_1.ScaledOut);
	HGW_ScaleReal_1();

(* Glue Auto On *)
	IF ((gActualMachineSpeed_BPM>=gSP_HotGlue.AutoOnSpeed) AND gA[9].Ind_InMotion AND Glue_On AND gBagMachine_WebBreakOK) THEN
		GlueAuto_On := 1;
	ELSE
		GlueAuto_On := 0;
	END_IF

(* Glue Gun Clean Control *)
	HGW_Toggle_0(In := GlueClean_PB , Time := T#12ms);

(* Glue Gun Control *)
	IF ((GlueAuto_On OR GluePurge_PB OR HGW_Toggle_0.Out) AND gAlarmsOK AND gI_SS_SeamGlueOnOff) THEN
		gQ_CR_HotGlue := 1;
	ELSE
		gQ_CR_HotGlue := 0;
	END_IF

(* Is 2nd Tube Selected *)
	IF (gSP_TubeSelect) THEN
		gQ_CR_HotGlueSelect := 1;
	ELSE
		gQ_CR_HotGlueSelect := 0;
  END_IF
  

END_PROGRAM
