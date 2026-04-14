(********************************************************************
 * COPYRIGHT -- Microsoft
 ********************************************************************
 * Program: A7_Control
 * File: A7_ControlCyclic.ld
 * Author: pkiel
 * Created: July 13, 2011
 ********************************************************************
 * Implementation of program A7_Control
 ********************************************************************)

PROGRAM _CYCLIC




























































<?xml version="1.0"?>
<?AutomationStudio Version=3.0.71?>
<!-- Automation Studio Generated XML Section -->
<networks maxcolumn="0">
	<network label="" comment="Enable Axis Request" row="6" column="0">
		<row><contact type="closed" name="gA[7].Ind_Enabled"/><contact type="open" name="gDriveSupply_Ready"/><contact type="closed" name="gA[7].Error"/><contact type="open" name="gA[7].Input_DriveEnable"/><contact type="closed" name="gA[7].Cmd_EStopDisable"/><contact type="closed" name="gA[4].Ind_Homing"/><line/><line/><function position="top" type="AND"><input name="" extensible="true"/><output name="40"/></function><coil type="open" name="gA[7].Cmd_Enable"/></row>
		<row><contact type="open" name="gA[7].Cmd_Enable" or="true"/><empty/><empty/><empty/><empty or="true"/><analog type="input" name="g_iMachType"/><function position="top" type="EQ"><input name="IN1" extensible="true"/><output name="1"/></function><function position="bottom" type="AND" or="true"><input name="" extensible="true"/></function><empty/></row>
		<row><empty/><empty/><empty/><empty/><empty or="true"/><analog type="input" name="C_iRS15"/><function position="bottom" type="EQ"><input name="IN2" extensible="true"/></function><empty/><empty or="true"/><empty/></row>
		<row><empty/><empty/><empty/><empty/><empty or="true"/><function position="top" type="AND"><input name="" extensible="true"/><output name="40"/></function><line/><line/><line or="true"/><empty/></row>
		<row><empty/><empty/><analog type="input" name="g_iMachType"/><function position="top" type="EQ"><input name="IN1" extensible="true"/><output name="1"/></function><function position="bottom" type="AND"><input name="" extensible="true"/></function><empty/><empty/><empty/><empty/></row>
		<row><empty/><empty/><analog type="input" name="C_iRS26"/><function position="bottom" type="EQ"><input name="IN2" extensible="true"/></function><empty/><empty/><empty/><empty/><empty/><empty/></row>
	</network>
	<network label="" comment="Axis Ready For Operation" row="1" column="0">
		<row><contact type="open" name="gA[7].Ind_NetworkInit"/><contact type="open" name="gA[7].Ind_ControllerReady"/><contact type="open" name="gA[7].Ind_SynchronizedMotion"/><line/><line/><coil type="open" name="gA[7].Ind_Ready"/></row>
	</network>
	<network label="" comment="Axis Error Reset Request" row="4" column="0">
		<row><empty/><empty/><functionblock position="header" name="TOF_0" type="TOF"/><empty/><empty/></row>
		<row><contact type="positive transition" name="gHMI_Reset_PB"/><line/><functionblock position="top" type="TOF"><input name="IN"/><output name="Q"/></functionblock><line/><coil type="open" name="gA[7].Cmd_Reset"/></row>
		<row><contact type="positive transition" name="gA[7].Input_DriveEnable" or="true"/><analog type="input" name="T#20ms"/><functionblock position="bottom" type="TOF"><input name="PT"/><output name="ET"/></functionblock><empty/><empty/></row>
		<row><contact type="positive transition" name="gCmd_ResetPBGen" or="true"/><empty/><empty/><empty/><empty/><empty/></row>
	</network>
	<network label="" comment="Cam Automat Synchronization Permissive" row="1" column="0">
		<row><contact type="closed" name="gA[7].Error"/><contact type="open" name="gA[7].Ind_Homed"/><contact type="open" name="gA[7].Ind_Enabled"/><contact type="open" name="gA[9].Ind_Homed"/><contact type="closed" name="gA[7].Ind_Homing"/><contact type="closed" name="gA[4].Ind_Homing"/><coil type="open" name="Synch_Permissive"/></row>
	</network>
	<network label="" comment="Cam Automat Synchronization Request" row="2" column="0">
		<row><contact type="closed" name="gA[7].Ind_AutomatEnabled"/><contact type="open" name="Synch_Permissive"/><contact type="closed" name="gRepeatChange"/><contact type="closed" name="g_bChangeModDrumReq"/><line/><coil type="open" name="gA[7].Cmd_SynchronizedMotion"/></row>
		<row><contact type="open" name="gA[7].Cmd_SynchronizedMotion" or="true"/><empty/><empty/><empty/><empty/><empty/></row>
	</network>
	<network label="" comment="Advance/Retard Offset Trigger" row="3" column="0">
		<row><empty/><empty/><functionblock position="header" name="TON_0" type="TON"/><empty/><functionblock position="header" name="HGW_Toggle_0" type="HGW_Toggle"/><empty/></row>
		<row><contact type="open" name="gI_SS_DrumPos"/><line/><functionblock position="top" type="TON"><input name="IN"/><output name="Q"/></functionblock><line/><functionblock position="top" type="HGW_Toggle"><input name="In"/><output name="Out"/></functionblock><empty/></row>
		<row><contact type="open" name="gI_SS_DrumNeg" or="true"/><analog type="input" name="T#12ms"/><functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock><analog type="input" name="T#12ms"/><functionblock position="bottom" type="HGW_Toggle"><input name="Time"/></functionblock><empty/></row>
	</network>
	<network label="" comment="Conversion offset increment from mm/bag to inch/bag" row="2" column="0">
		<row><analog type="input" name="gr_rIncrOffsetAxeRun"/><function position="top" type="DIV"><input name="IN1" extensible="true"/><output name="42"/></function><line/><function position="top" type="DIV"><input name="IN1" extensible="true"/><output name="42"/></function><line/><function position="top" type="MUL"><input name="" extensible="true"/><output name="42"/></function><analog type="output" name="rIncrOffsetAxeRun_Inch"/></row>
		<row><analog type="input" name="25.4"/><function position="bottom" type="DIV"><input name="IN2" extensible="true"/></function><analog type="input" name="gA[7].rPerim_In"/><function position="bottom" type="DIV"><input name="IN2" extensible="true"/></function><analog type="input" name="gRecipeActive.Repeat"/><function position="bottom" type="MUL"><input name="" extensible="true"/></function><empty/></row>
	</network>
	<network label="" comment="Advance Offset (+)" row="6" column="0">
		<row><contact type="open" name="gManualMode_On"/><contact type="open" name="g_bMachineRun"/><contact type="open" name="gA[7].Ind_SynchronizedMotion"/><contact type="open" name="gI_SS_DrumPos"/><contact type="closed" name="gI_SS_DrumNeg"/><contact type="negative transition" name="gA[4].Ind_bInContactZone"/><line/><line/><function position="top" type="AND"><input name="" extensible="true"/><output name="40"/></function><line/><function position="top" type="ADD"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function><empty/></row>
		<row><empty/><empty/><empty/><empty/><empty or="true"/><analog type="input" name="g_iMachType"/><function position="top" type="EQ"><input name="IN1" extensible="true"/><output name="1"/></function><function position="bottom" type="AND" or="true"><input name="" extensible="true"/></function><analog type="input" name="gRecipeActive.Drum_Offset"/><function position="middle" type="ADD"><input name="" extensible="true"/><output name="40"/></function><analog type="output" name="gRecipeActive.Drum_Offset"/></row>
		<row><empty/><empty/><empty/><empty/><empty or="true"/><analog type="input" name="C_iRS15"/><function position="bottom" type="EQ"><input name="IN2" extensible="true"/></function><empty/><empty or="true"/><analog type="input" name="rIncrOffsetAxeRun_Inch"/><function position="bottom" type="ADD"><input name="" extensible="true"/></function><empty/></row>
		<row><empty/><empty/><empty/><empty/><empty or="true"/><contact type="negative transition" name="gA[7].Ind_bInContactZone"/><function position="top" type="AND"><input name="" extensible="true"/><output name="40"/></function><line/><line or="true"/><empty/><empty/><empty/><empty/></row>
		<row><empty/><empty/><empty/><analog type="input" name="g_iMachType"/><function position="top" type="EQ"><input name="IN1" extensible="true"/><output name="1"/></function><function position="bottom" type="AND"><input name="" extensible="true"/></function><empty/><empty/><empty/><empty/><empty/><empty/></row>
		<row><empty/><empty/><empty/><analog type="input" name="C_iRS26"/><function position="bottom" type="EQ"><input name="IN2" extensible="true"/></function><empty/><empty/><empty/><empty/><empty/><empty/><empty/><empty/></row>
	</network>
	<network label="" comment="Offset Retard (-)" row="6" column="0">
		<row><contact type="open" name="gManualMode_On"/><contact type="open" name="g_bMachineRun"/><contact type="open" name="gA[7].Ind_SynchronizedMotion"/><contact type="open" name="gI_SS_DrumNeg"/><contact type="closed" name="gI_SS_DrumPos"/><contact type="negative transition" name="gA[4].Ind_bInContactZone"/><line/><line/><function position="top" type="AND"><input name="" extensible="true"/><output name="40"/></function><line/><line/><line/><function position="top" type="ADD"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function><empty/></row>
		<row><empty/><empty/><empty/><empty/><empty or="true"/><analog type="input" name="g_iMachType"/><function position="top" type="EQ"><input name="IN1" extensible="true"/><output name="1"/></function><function position="bottom" type="AND" or="true"><input name="" extensible="true"/></function><empty/><empty/><analog type="input" name="gRecipeActive.Drum_Offset"/><function position="middle" type="ADD"><input name="" extensible="true"/><output name="40"/></function><analog type="output" name="gRecipeActive.Drum_Offset"/></row>
		<row><empty/><empty/><empty/><empty/><empty or="true"/><analog type="input" name="C_iRS15"/><function position="bottom" type="EQ"><input name="IN2" extensible="true"/></function><empty/><empty or="true"/><analog type="input" name="rIncrOffsetAxeRun_Inch"/><function position="top" type="MUL"><input name="" extensible="true"/><output name="42"/></function><function position="bottom" type="ADD"><input name="" extensible="true"/></function><empty/></row>
		<row><empty/><empty/><empty/><empty/><empty or="true"/><contact type="negative transition" name="gA[7].Ind_bInContactZone"/><function position="top" type="AND"><input name="" extensible="true"/><output name="40"/></function><line/><line or="true"/><analog type="input" name="-1.0"/><function position="bottom" type="MUL"><input name="" extensible="true"/></function><empty/><empty/><empty/></row>
		<row><empty/><empty/><empty/><analog type="input" name="g_iMachType"/><function position="top" type="EQ"><input name="IN1" extensible="true"/><output name="1"/></function><function position="bottom" type="AND"><input name="" extensible="true"/></function><empty/><empty/><empty/><empty/><empty/><empty/><empty/><empty/></row>
		<row><empty/><empty/><empty/><analog type="input" name="C_iRS26"/><function position="bottom" type="EQ"><input name="IN2" extensible="true"/></function><empty/><empty/><empty/><empty/><empty/><empty/><empty/><empty/><empty/><empty/></row>
	</network>
	<network label="" comment="Limit The Offset To +/- The Active Repeat" row="3" column="0">
		<row><analog type="input" name="gRecipeActive.Repeat"/><function position="top" type="MUL"><input name="" extensible="true"/><output name="42"/></function><line/><function position="top" type="LIMIT"><input name="MN"/><output name="40"/></function><analog type="output" name="gRecipeActive.Drum_Offset"/></row>
		<row><analog type="input" name="-1.0"/><function position="bottom" type="MUL"><input name="" extensible="true"/></function><analog type="input" name="gRecipeActive.Drum_Offset"/><function position="middle" type="LIMIT"><input name="IN"/></function><empty/></row>
		<row><empty/><empty/><empty/><analog type="input" name="gRecipeActive.Repeat"/><function position="bottom" type="LIMIT"><input name="MX"/></function><empty/></row>
	</network>
	<network label="" comment="Detect A Change In Offset And Trigger A Relative Change In Phase Offset" row="8" column="0">
		<row><empty/><empty/><empty/><empty/><empty/><empty/><empty/><functionblock position="header" name="HGW_RelativeChangeReal_0" type="H_FB_RelativeChangeLimitReal1"/><empty/><empty/></row>
		<row><contact type="open" name="g_bMachineRun"/><line/><line/><line/><line/><line/><line/><functionblock position="top" type="H_FB_RelativeChangeLimitReal1"><input name="IN_bEnable"/><output name="OUT_bOK"/></functionblock><empty/><empty/></row>
		<row><empty/><empty/><empty/><empty/><empty/><empty/><analog type="input" name="1.0"/><functionblock position="middle" type="H_FB_RelativeChangeLimitReal1"><input name="IN_rMax"/><output name="OUT_bChange"/></functionblock><contact type="open" name="gA[7].Ind_SynchronizedMotion"/><coil type="set" name="gA[7].Cmd_PhaseOffset"/></row>
		<row><analog type="input" name="1.0"/><function position="top" type="MUL"><input name="" extensible="true"/><output name="42"/></function><line/><line/><line/><line/><functionblock position="middle" type="H_FB_RelativeChangeLimitReal1"><input name="IN_rMin"/><output name="OUT_rDiff"/></functionblock><analog type="output" name="gA[7].SP_PhaseOffset"/><empty/></row>
		<row><analog type="input" name="-1.0"/><function position="bottom" type="MUL"><input name="" extensible="true"/></function><analog type="input" name="gRecipeActive.Holding_Offset"/><function position="top" type="ADD"><input name="" extensible="true"/><output name="40"/></function><line/><functionblock position="middle" type="H_FB_RelativeChangeLimitReal1"><input name="IN_rInput"/><output name="OUT_rLimitIn"/></functionblock><analog type="output" name="gRecipeActive.Drum_Offset"/><empty/></row>
		<row><empty/><empty/><empty/><analog type="input" name="gRecipeActive.Tearing_Offset"/><function position="middle" type="ADD"><input name="" extensible="true"/></function><analog type="input" name="gRecipeActive.Repeat"/><functionblock position="middle" type="H_FB_RelativeChangeLimitReal1"><input name="IN_rRepeat"/></functionblock><empty/><empty/></row>
		<row><empty/><empty/><empty/><analog type="input" name="gRecipeActive.rEnvB_Offset"/><function position="middle" type="ADD"><input name="" extensible="true"/></function><analog type="input" name="gRecipeActive.Drum_Offset"/><functionblock position="bottom" type="H_FB_RelativeChangeLimitReal1"><input name="IN_rLimitIn"/></functionblock><empty/><empty/></row>
		<row><empty/><empty/><empty/><analog type="input" name="gRecipeActive.Tearing_Offset"/><function position="bottom" type="ADD"><input name="" extensible="true"/></function><empty/><empty/><empty/><empty/><empty/></row>
	</network>
	<network label="" comment="Manu Axis motion timing setting (+)" row="3" column="0">
		<row><contact type="closed" name="gA[4].Ind_bInContactZone"/><line/><line/><function position="top" type="OR"><input name="" extensible="true"/><output name="40"/></function><contact type="open" name="gManualMode_On"/><contact type="closed" name="gA[9].Ind_InMotion"/><contact type="closed" name="gMachine_Run"/><contact type="closed" name="gMachine_Jog"/><contact type="open" name="gI_SS_DrumPos"/><contact type="closed" name="gI_SS_DrumNeg"/><coil type="open" name="gA[7].Cmd_ManuTimSetPlus"/></row>
		<row><analog type="input" name="g_iMachType"/><function position="top" type="NE"><input name="IN1"/><output name="1"/></function><function position="bottom" type="OR"><input name="" extensible="true"/></function><empty/><empty/><empty/><empty/><empty/><empty/><empty/></row>
		<row><analog type="input" name="C_iRS15"/><function position="bottom" type="NE"><input name="IN2"/></function><empty/><empty/><empty/><empty/><empty/><empty/><empty/><empty/><empty/></row>
	</network>
	<network label="" comment="Manu Axis motion timing setting (-)" row="3" column="0">
		<row><contact type="closed" name="gA[4].Ind_bInContactZone"/><line/><line/><function position="top" type="OR"><input name="" extensible="true"/><output name="40"/></function><contact type="open" name="gManualMode_On"/><contact type="closed" name="gA[9].Ind_InMotion"/><contact type="closed" name="gMachine_Run"/><contact type="closed" name="gMachine_Jog"/><contact type="open" name="gI_SS_DrumNeg"/><contact type="closed" name="gI_SS_DrumPos"/><coil type="open" name="gA[7].Cmd_ManuTimSetMinus"/></row>
		<row><analog type="input" name="g_iMachType"/><function position="top" type="NE"><input name="IN1"/><output name="1"/></function><function position="bottom" type="OR"><input name="" extensible="true"/></function><empty/><empty/><empty/><empty/><empty/><empty/><empty/></row>
		<row><analog type="input" name="C_iRS15"/><function position="bottom" type="NE"><input name="IN2"/></function><empty/><empty/><empty/><empty/><empty/><empty/><empty/><empty/><empty/></row>
	</network>
	<network label="" comment="Axis inside contact zone" row="2" column="0">
		<row><analog type="input" name="gA[7].PositionDeg"/><function position="top" type="LE"><input name="IN1" extensible="true"/><output name="1"/></function><line/><line/><coil type="open" name="gA[7].Ind_bInContactZone"/></row>
		<row><analog type="input" name="gr_rDrumAxContactZone"/><function position="bottom" type="LE"><input name="IN2" extensible="true"/></function><empty/><empty/><empty/></row>
	</network>
</networks>
END_PROGRAM




























































