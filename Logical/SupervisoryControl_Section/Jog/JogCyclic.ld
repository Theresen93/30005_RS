(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: Jog
 * File: JogCyclic.ld
 * Author: pkiel
 * Created: October 13, 2009
 ********************************************************************
 * Implementation of program Jog
 ********************************************************************)

PROGRAM _CYCLIC





















































<?xml version="1.0"?>
<?AutomationStudio Version=3.0.71?>
<!-- Automation Studio Generated XML Section -->
<networks maxcolumn="0">
	<network label="" comment="Jog Permissives" row="1" column="0">
		<row><contact type="open" name="gAlarmsOK"/><contact type="open" name="gServoAxesOK"/><contact type="open" name="gI_SafetyRelay_GuardOK"/><contact type="closed" name="gMachine_Run"/><contact type="closed" name="gNormalStopReq"/><contact type="closed" name="g_bCycManTimeSetOn"/><coil type="open" name="JogPermissives_OK"/></row>
	</network>
	<network label="" comment="Machine Any Jog" row="5" column="0">
		<row><contact type="open" name="gI_JogPB_1"/><line/><contact type="open" name="JogPermissives_OK"/><coil type="open" name="AnyJog"/></row>
		<row><contact type="open" name="gHMI_Jog_PB"/><line or="true"/><empty/><empty/></row>
		<row><contact type="open" name="gI_JogPB_2"/><line or="true"/><empty/><empty/></row>
		<row><contact type="open" name="gI_JogPB_3"/><line or="true"/><empty/><empty/></row>
		<row><contact type="open" name="gA[15].bInMach"/><contact type="open" name="gI_HMP_JogPB" or="true"/><empty/><empty/></row>
	</network>
	<network label="" comment="Two Step Move For Machine Jog Function" row="5" column="0">
		<row><empty/><functionblock position="header" name="HGW_2StepMove1_1" type="HGW_2StepMove1"/><empty/></row>
		<row><contact type="open" name="AnyJog"/><functionblock position="top" type="HGW_2StepMove1"><input name="IN_bMoveRequest"/><output name="OUT_bHorn"/></functionblock><coil type="open" name="gJog_Horn"/></row>
		<row><contact type="open" name="JogPermissives_OK"/><functionblock position="middle" type="HGW_2StepMove1"><input name="IN_bPermissive"/><output name="OUT_bStartMove"/></functionblock><coil type="open" name="JogRequest"/></row>
		<row><contact type="open" name="FALSE"/><functionblock position="middle" type="HGW_2StepMove1"><input name="IN_bCasRun"/></functionblock><empty/></row>
		<row><analog type="input" name="gr_tJogHornDur"/><functionblock position="bottom" type="HGW_2StepMove1"><input name="IN_tTpHorn"/></functionblock><empty/></row>
	</network>
	<network label="" comment="Machine Jog Logic" row="1" column="0">
		<row><contact type="open" name="JogRequest"/><contact type="open" name="JogPermissives_OK"/><coil type="open" name="gMachine_Jog"/></row>
	</network>
	<network label="" comment="Machine Jog To Zero Speed" row="2" column="0">
		<row><contact type="open" name="gMachine_Jog"/><line/><coil type="open" name="gJog_ToZeroSpeed"/></row>
		<row><contact type="open" name="gJog_ToZeroSpeed"/><contact type="open" name="gA[9].Ind_InMotion" or="true"/><empty/></row>
	</network>
	<network label="" comment="Memo machine Jog" row="2" column="0">
		<row><contact type="open" name="gMachine_Jog"/><line/><coil type="open" name="bMemoMachineJog"/></row>
		<row><contact type="open" name="bMemoMachineJog"/><contact type="open" name="gA[9].Ind_InMotion" or="true"/><empty/></row>
	</network>
	<network label="" comment="Machine Jog Stop" row="1" column="0">
		<row><contact type="open" name="bMemoMachineJog"/><contact type="closed" name="gMachine_Jog"/><contact type="open" name="gA[9].Ind_InMotion"/><coil type="open" name="gJog_Stop"/></row>
	</network>
</networks>
END_PROGRAM





















































