(********************************************************************
 * COPYRIGHT -- Microsoft
 ********************************************************************
 * Program: GlueTray
 * File: GlueTrayCyclic.st
 * Author: pkiel
 * Created: July 19, 2011
 ********************************************************************
 * Implementation of program GlueTray
 ********************************************************************)

PROGRAM _CYCLIC
	
(* Glue Tray Man/Auto From HMI *)
	HGW_2StatePB_0.PB := EDGEPOS(GlueTray_PB);
	GlueTrayText_Ind := HGW_2StatePB_0.Text_Ind;
	GlueTrayColor_Ind := HGW_2StatePB_0.Color_Ind;
	GlueTray_Auto := HGW_2StatePB_0.State1;
	HGW_2StatePB_0();

(* Limit Glue Tray Auto On Speed *)
	gSP_GlueTrayAutoSpeed := LIMIT(12,gSP_GlueTrayAutoSpeed,500);

(* Glue Tray Man/Auto Control *)
	CASE (GlueTrayText_Ind) OF
		0: (* Manual Control *)
			IF (gI_SS_GluePanUpDown) THEN
				gQ_SOL_GluePan := 1;
			ELSE
				gQ_SOL_GluePan := 0;
			END_IF
		
		1: (* Auto Control *)
			IF (gI_SS_GluePanUpDown AND 
				gActualMachineSpeed_FPM>gSP_GlueTrayAutoSpeed) THEN
				gQ_SOL_GluePan := 1;
			ELSE
				gQ_SOL_GluePan := 0;
			END_IF
	END_CASE

(* Glue Tray Slow Rotation On/Off From HMI *)
	HGW_2StatePB_1.PB := EDGEPOS(GlueTraySR_PB);
	GlueTraySRText_Ind := HGW_2StatePB_1.Text_Ind;
	GlueTraySRColor_Ind := HGW_2StatePB_1.Color_Ind;
	GlueTraySR_On := HGW_2StatePB_1.State1;
	HGW_2StatePB_1();

(* Glue Tray Slow Rotation Control *)
	IF (GlueTraySR_On AND gI_SafetyRelay_EStopOK AND gQ_CR_MainPowerOn) THEN
		gQ_CON_GlueSlowRotation := 1;
	ELSE
		gQ_CON_GlueSlowRotation := 0;
	END_IF

END_PROGRAM
