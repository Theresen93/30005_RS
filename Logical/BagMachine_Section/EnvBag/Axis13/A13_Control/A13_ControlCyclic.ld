(********************************************************************
 * COPYRIGHT -- Microsoft
 ********************************************************************
 * Program: A4_Control
 * File: A4_ControlCyclic.ld
 * Author: pkiel
 * Created: July 13, 2011
 ********************************************************************
 * Implementation of program A4_Control
 ********************************************************************)

PROGRAM _CYCLIC











































































<?xml version="1.0"?>
<?AutomationStudio Version=3.0.71?>
<!-- Automation Studio Generated XML Section -->
<networks maxcolumn="0">
	<network label="" comment="Enable Axis Request" row="2" column="0">
		<row><contact type="closed" name="gA[13].Ind_Enabled"/><contact type="open" name="gDriveSupply_Ready"/><contact type="closed" name="gA[13].Error"/><contact type="open" name="gA[13].Input_DriveEnable"/><contact type="closed" name="gA[13].Cmd_EStopDisable"/><coil type="open" name="gA[13].Cmd_Enable"/></row>
		<row><contact type="open" name="gA[13].Cmd_Enable" or="true"/><empty/><empty/><empty/><empty/><empty/></row>
	</network>
	<network label="" comment="Axis Ready For Operation" row="1" column="0">
		<row><contact type="open" name="gA[13].Ind_NetworkInit"/><contact type="open" name="gA[13].Ind_ControllerReady"/><contact type="open" name="gA[13].Ind_SynchronizedMotion"/><coil type="open" name="gA[13].Ind_Ready"/></row>
	</network>
	<network label="" comment="Axis Error Reset Request" row="4" column="0">
		<row><empty/><empty/><functionblock position="header" name="TOF_0" type="TOF"/><empty/></row>
		<row><contact type="positive transition" name="gHMI_Reset_PB"/><line/><functionblock position="top" type="TOF"><input name="IN"/><output name="Q"/></functionblock><coil type="open" name="gA[13].Cmd_Reset"/></row>
		<row><contact type="positive transition" name="gA[13].Input_DriveEnable" or="true"/><analog type="input" name="T#20ms"/><functionblock position="bottom" type="TOF"><input name="PT"/><output name="ET"/></functionblock><empty/></row>
		<row><contact type="positive transition" name="gCmd_ResetPBGen" or="true"/><empty/><empty/><empty/><empty/></row>
	</network>
	<network label="" comment="Cam Automat Synchronization Permissive" row="1" column="0">
		<row><contact type="closed" name="gA[13].Error"/><contact type="open" name="gA[13].Ind_Homed"/><contact type="open" name="gA[13].Ind_Enabled"/><contact type="open" name="gA[9].Ind_Homed"/><contact type="closed" name="gA[13].Ind_Homing"/><contact type="closed" name="gA[7].Ind_Homing"/><coil type="open" name="Synch_Permissive"/></row>
	</network>
	<network label="" comment="Cam Automat Synchronization Request" row="2" column="0">
		<row><contact type="closed" name="gA[13].Ind_AutomatEnabled"/><contact type="open" name="Synch_Permissive"/><contact type="closed" name="gRepeatChange"/><contact type="closed" name="g_bChangeModTearingReq"/><contact type="closed" name="g_bNumPliersChange4to2[2]"/><contact type="closed" name="g_bNumPliersChange2to4[2]"/><coil type="open" name="gA[13].Cmd_SynchronizedMotion"/></row>
		<row><contact type="open" name="gA[13].Cmd_SynchronizedMotion" or="true"/><empty/><empty/><empty/><empty/><empty/><empty/></row>
	</network>
	<network label="" comment="Conversion offset increment from mm/bag to inch/bag" row="2" column="0">
		<row><analog type="input" name="gr_rIncrOffsetAxeRun"/><function position="top" type="DIV"><input name="IN1"/><output name="22"/></function><analog type="output" name="rIncrOffsetAxeRun_Inch"/></row>
		<row><analog type="input" name="25.4"/><function position="bottom" type="DIV"><input name="IN2"/></function><empty/></row>
	</network>
	<network label="" comment="Advance Offset (+)" row="3" column="0">
		<row><contact type="open" name="gNever"/><contact type="open" name="g_bMachineRun"/><contact type="open" name="gManualMode_On"/><contact type="open" name="gA[13].Ind_SynchronizedMotion"/><contact type="open" name="gI_SS_TearEBPos"/><contact type="closed" name="gI_SS_TearEBNeg"/><contact type="negative transition" name="gA[13].Ind_bInContactZone"/><function position="top" type="ADD"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function><empty/></row>
		<row><empty/><empty/><empty/><empty/><empty/><empty/><analog type="input" name="gRecipeActive.Tearing_Offset"/><function position="middle" type="ADD"><input name="" extensible="true"/><output name="20"/></function><analog type="output" name="gRecipeActive.Tearing_Offset"/></row>
		<row><empty/><empty/><empty/><empty/><empty/><empty/><analog type="input" name="rIncrOffsetAxeRun_Inch"/><function position="bottom" type="ADD"><input name="" extensible="true"/></function><empty/></row>
	</network>
	<network label="" comment="Offset Retard (-)" row="4" column="0">
		<row><contact type="open" name="gNever"/><contact type="open" name="g_bMachineRun"/><contact type="open" name="gManualMode_On"/><contact type="open" name="gA[13].Ind_SynchronizedMotion"/><contact type="open" name="gI_SS_TearEBNeg"/><contact type="closed" name="gI_SS_TearEBPos"/><contact type="negative transition" name="gA[13].Ind_bInContactZone"/><function position="top" type="ADD"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function><empty/></row>
		<row><empty/><empty/><empty/><empty/><empty/><empty/><analog type="input" name="gRecipeActive.Tearing_Offset"/><function position="middle" type="ADD"><input name="" extensible="true"/><output name="20"/></function><analog type="output" name="gRecipeActive.Tearing_Offset"/></row>
		<row><empty/><empty/><empty/><empty/><analog type="input" name="rIncrOffsetAxeRun_Inch"/><function position="top" type="MUL"><input name="" extensible="true"/><output name="22"/></function><function position="bottom" type="ADD"><input name="" extensible="true"/></function><empty/></row>
		<row><empty/><empty/><empty/><empty/><analog type="input" name="-1.0"/><function position="bottom" type="MUL"><input name="" extensible="true"/></function><empty/><empty/><empty/></row>
	</network>
	<network label="" comment="Limit The Offset To +/- The Active Repeat" row="3" column="0">
		<row><analog type="input" name="gRecipeActive.Repeat"/><function position="top" type="MUL"><input name="" extensible="true"/><output name="22"/></function><line/><function position="top" type="LIMIT"><input name="MN"/><output name="20"/></function><analog type="output" name="gRecipeActive.Tearing_Offset"/></row>
		<row><analog type="input" name="-1.0"/><function position="bottom" type="MUL"><input name="" extensible="true"/></function><analog type="input" name="gRecipeActive.Tearing_Offset"/><function position="middle" type="LIMIT"><input name="IN"/></function><empty/></row>
		<row><empty/><empty/><empty/><analog type="input" name="gRecipeActive.Repeat"/><function position="bottom" type="LIMIT"><input name="MX"/></function><empty/></row>
	</network>
	<network label="" comment="Detect A Change In Offset And Trigger A Relative Change In Phase Offset" row="7" column="0">
		<row><empty/><empty/><empty/><empty/><empty/><empty/><empty/><functionblock position="header" name="HGW_RelativeChangeReal1_0" type="H_FB_RelativeChangeLimitReal1"/><empty/><empty/></row>
		<row><contact type="open" name="g_bMachineRun"/><line/><line/><line/><line/><line/><line/><functionblock position="top" type="H_FB_RelativeChangeLimitReal1"><input name="IN_bEnable"/><output name="OUT_bOK"/></functionblock><empty/><empty/></row>
		<row><empty/><empty/><empty/><empty/><empty/><empty/><analog type="input" name="gr_rLimOffsetRunVal"/><functionblock position="middle" type="H_FB_RelativeChangeLimitReal1"><input name="IN_rMax"/><output name="OUT_bChange"/></functionblock><contact type="open" name="gA[13].Ind_SynchronizedMotion"/><coil type="set" name="gA[13].Cmd_PhaseOffset"/></row>
		<row><analog type="input" name="gr_rLimOffsetRunVal"/><function position="top" type="MUL"><input name="" extensible="true"/><output name="22"/></function><line/><line/><line/><line/><functionblock position="middle" type="H_FB_RelativeChangeLimitReal1"><input name="IN_rMin"/><output name="OUT_rDiff"/></functionblock><analog type="output" name="gA[13].SP_PhaseOffset"/><empty/></row>
		<row><analog type="input" name="-1.0"/><function position="bottom" type="MUL"><input name="" extensible="true"/></function><analog type="input" name="gRecipeActive.Holding_Offset"/><function position="top" type="ADD"><input name="" extensible="true"/><output name="20"/></function><line/><functionblock position="middle" type="H_FB_RelativeChangeLimitReal1"><input name="IN_rInput"/><output name="OUT_rLimitIn"/></functionblock><analog type="output" name="gRecipeActive.rTearEB_Offset"/><empty/></row>
		<row><empty/><empty/><empty/><analog type="input" name="gRecipeActive.Tearing_Offset"/><function position="middle" type="ADD"><input name="" extensible="true"/></function><analog type="input" name="gRecipeActive.Repeat"/><functionblock position="middle" type="H_FB_RelativeChangeLimitReal1"><input name="IN_rRepeat"/></functionblock><empty/><empty/></row>
		<row><empty/><empty/><empty/><analog type="input" name="gRecipeActive.rEnvB_Offset"/><function position="bottom" type="ADD"><input name="" extensible="true"/></function><analog type="input" name="gRecipeActive.rTearEB_Offset"/><functionblock position="bottom" type="H_FB_RelativeChangeLimitReal1"><input name="IN_rLimitIn"/></functionblock><empty/><empty/></row>
	</network>
	<network label="" comment="Manu Axis motion timing setting (+)" row="1" column="0">
		<row><contact type="open" name="gManualMode_On"/><contact type="closed" name="gA[9].Ind_InMotion"/><contact type="closed" name="gMachine_Run"/><contact type="closed" name="gMachine_Jog"/><contact type="open" name="gI_SS_TearEBPos"/><contact type="closed" name="gI_SS_TearEBNeg"/><coil type="open" name="gA[13].Cmd_ManuTimSetPlus"/></row>
	</network>
	<network label="" comment="Manu Axis motion timing setting (-)" row="1" column="0">
		<row><contact type="open" name="gManualMode_On"/><contact type="closed" name="gA[9].Ind_InMotion"/><contact type="closed" name="gMachine_Run"/><contact type="closed" name="gMachine_Jog"/><contact type="open" name="gI_SS_TearEBNeg"/><contact type="closed" name="gI_SS_TearEBPos"/><coil type="open" name="gA[13].Cmd_ManuTimSetMinus"/></row>
	</network>
	<network label="" comment="Axis inside contact zone" row="2" column="0">
		<row><analog type="input" name="gA[13].PositionDeg"/><function position="top" type="LE"><input name="IN1"/><output name="1"/></function><coil type="open" name="gA[13].Ind_bInContactZone"/></row>
		<row><analog type="input" name="gr_rTearEBAxContactZone"/><function position="bottom" type="LE"><input name="IN2"/></function><empty/></row>
	</network>
</networks>
END_PROGRAM











































































