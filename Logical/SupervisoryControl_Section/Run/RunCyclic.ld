(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: Run
 * File: RunCyclic.ld
 * Author: pkiel
 * Created: October 13, 2009
 ********************************************************************
 * Implementation of program Run
 ********************************************************************)

PROGRAM _CYCLIC






























































<?xml version="1.0"?>
<?AutomationStudio Version=3.0.71?>
<!-- Automation Studio Generated XML Section -->
<networks maxcolumn="0">
	<network label="" comment="Run Permissive String #1" row="1" column="0">
		<row><contact type="open" name="gAlarmsOK"/><contact type="open" name="gI_SafetyRelay_GuardOK"/><contact type="open" name="gStopStringOK"/><contact type="open" name="gServoAxesOK"/><contact type="open" name="g_bIndBundReady"/><coil type="open" name="RunPermissive1"/></row>
	</network>
	<network label="" comment="Run Permissive String #2" row="4" column="0">
		<row><contact type="closed" name="gReg[5].ShutdownMissedMark"/><contact type="closed" name="gReg[5].ShutdownOutOfTolerance"/><contact type="closed" name="gMachine_Jog"/><contact type="open" name="gQ_SOL_WebEntryNip"/><contact type="open" name="gQ_SOL_WebExitNip"/><contact type="open" name="gQ_CR_FP_NipRol"/><contact type="closed" name="gNormalStopReq"/><contact type="closed" name="g_bCycManTimeSetOn"/><coil type="open" name="RunPermissive2"/></row>
		<row><empty/><empty/><empty or="true"/><empty/><empty or="true"/><contact type="closed" name="gRecipeActive.bSelFPProd" or="true"/><empty/><empty/><empty/></row>
		<row><empty/><empty/><empty or="true"/><empty/><empty or="true"/><contact type="closed" name="gNever" or="true"/><empty/><empty/><empty/></row>
		<row><empty/><empty/><empty or="true"/><contact type="open" name="bMemoMachineRun"/><line/><line or="true"/><empty/><empty/><empty/></row>
	</network>
	<network label="" comment="Main Run Permissive String" row="1" column="0">
		<row><contact type="open" name="RunPermissive1"/><contact type="open" name="RunPermissive2"/><coil type="open" name="RunPermissives_OK"/></row>
	</network>
	<network label="" comment="Two Step Move For Machine Jog Function" row="6" column="0">
		<row><empty/><empty/><functionblock position="header" name="HGW_2StepMove1_0" type="HGW_2StepMove1"/><empty/></row>
		<row><contact type="open" name="gHMI_Run_PB"/><contact type="closed" name="g_bMachineRun"/><functionblock position="top" type="HGW_2StepMove1"><input name="IN_bMoveRequest"/><output name="OUT_bHorn"/></functionblock><coil type="open" name="gRun_Horn"/></row>
		<row><contact type="open" name="gI_PB_MachineStart" or="true"/><empty/><functionblock position="middle" type="HGW_2StepMove1"><output name="OUT_bStartMove"/></functionblock><coil type="open" name="RunRequest"/></row>
		<row><contact type="open" name="RunPermissives_OK"/><line/><functionblock position="middle" type="HGW_2StepMove1"><input name="IN_bPermissive"/></functionblock><empty/></row>
		<row><contact type="open" name="TRUE"/><line/><functionblock position="middle" type="HGW_2StepMove1"><input name="IN_bCasRun"/></functionblock><empty/></row>
		<row><empty/><analog type="input" name="gr_tRunHornDur"/><functionblock position="bottom" type="HGW_2StepMove1"><input name="IN_tTpHorn"/></functionblock><empty/></row>
	</network>
	<network label="" comment="Machine Run" row="2" column="0">
		<row><contact type="open" name="RunRequest"/><contact type="open" name="RunPermissives_OK"/><coil type="open" name="gMachine_Run"/></row>
		<row><contact type="open" name="gMachine_Run" or="true"/><empty/><empty/></row>
	</network>
	<network label="" comment="Machine Run To Zero Speed" row="2" column="0">
		<row><contact type="open" name="gMachine_Run"/><line/><coil type="open" name="gRun_ToZeroSpeed"/></row>
		<row><contact type="open" name="gRun_ToZeroSpeed"/><contact type="open" name="gA[9].Ind_InMotion" or="true"/><empty/></row>
	</network>
	<network label="" comment="Memo machine Run" row="2" column="0">
		<row><contact type="open" name="gMachine_Run"/><line/><coil type="open" name="bMemoMachineRun"/></row>
		<row><contact type="open" name="bMemoMachineRun"/><contact type="open" name="gA[9].Ind_InMotion" or="true"/><coil type="open" name="g_bMachineRun"/></row>
	</network>
	<network label="" comment="Machine Run Stop" row="1" column="0">
		<row><contact type="open" name="bMemoMachineRun"/><contact type="closed" name="gMachine_Run"/><contact type="open" name="gA[9].Ind_InMotion"/><coil type="open" name="gRun_Stop"/></row>
	</network>
</networks>
END_PROGRAM






























































