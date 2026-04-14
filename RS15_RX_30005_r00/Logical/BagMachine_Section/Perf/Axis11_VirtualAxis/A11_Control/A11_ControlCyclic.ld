(********************************************************************
 * COPYRIGHT -- Microsoft
 ********************************************************************
 * Program: A11_Control
 * File: A11_ControlCyclic.ld
 * Author: pkiel
 * Created: July 22, 2011
 ********************************************************************
 * Implementation of program A11_Control
 ********************************************************************)

PROGRAM _CYCLIC




































<?xml version="1.0"?>
<?AutomationStudio Version=3.0.71?>
<!-- Automation Studio Generated XML Section -->
<networks maxcolumn="0">
	<network label="" comment="Axis Error Reset Request" row="3" column="0">
		<row><empty/><empty/><functionblock position="header" name="TOF_0" type="TOF"/><empty/></row>
		<row><contact type="positive transition" name="gHMI_Reset_PB"/><line/><functionblock position="top" type="TOF"><input name="IN"/><output name="Q"/></functionblock><coil type="open" name="gA[11].Cmd_Reset"/></row>
		<row><contact type="positive transition" name="gCmd_ResetPBGen" or="true"/><analog type="input" name="T#50ms"/><functionblock position="bottom" type="TOF"><input name="PT"/><output name="ET"/></functionblock><empty/></row>
	</network>
	<network label="" comment="Axis Continuous Motion Request" row="2" column="0">
		<row><contact type="open" name="gMachine_Jog"/><contact type="open" name="gNever"/><line/><coil type="open" name="gA[11].Cmd_ContinuousMotion"/></row>
		<row><contact type="open" name="gMachine_Run" or="true"/><empty/><empty/><empty/></row>
	</network>
	<network label="" comment="Commanded Speed Limit" row="4" column="0">
		<row><line/><function position="top" type="LIMIT"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function><empty/></row>
		<row><analog type="input" name="12"/><function position="middle" type="LIMIT"><input name="MN"/><output name="20"/></function><analog type="output" name="gSP_CmdSpeed"/></row>
		<row><analog type="input" name="gSP_CmdSpeed"/><function position="middle" type="LIMIT"><input name="IN"/></function><empty/></row>
		<row><analog type="input" name="gMachineMaxSpeedLimit"/><function position="bottom" type="LIMIT"><input name="MX"/></function><empty/></row>
	</network>
	<network label="" comment="Axis Velocity Command Select (NOTE: Velocity is in loadrevs/min)" row="3" column="0">
		<row><contact type="open" name="gMachine_Run"/><function position="top" type="SEL"><input name="G"/><output name="20"/></function><analog type="output" name="gA[11].SP_Velocity"/></row>
		<row><analog type="input" name="12"/><function position="middle" type="SEL"><input name="IN0"/></function><empty/></row>
		<row><analog type="input" name="gSP_CmdSpeed"/><function position="bottom" type="SEL"><input name="IN1"/></function><empty/></row>
	</network>
	<network label="" comment="Axis Velocity Update Request" row="3" column="0">
		<row><empty/><functionblock position="header" name="HGW_ChangeReal_0" type="HGW_ChangeReal"/><empty/><empty/></row>
		<row><line/><functionblock position="top" type="HGW_ChangeReal"><input name="Enable"/><output name="OK"/></functionblock><empty/><empty/></row>
		<row><analog type="input" name="gA[11].SP_Velocity"/><functionblock position="bottom" type="HGW_ChangeReal"><input name="Input"/><output name="Change"/></functionblock><contact type="open" name="gA[11].Cmd_ContinuousMotion"/><coil type="open" name="gA[11].Cmd_ContinuousMotionUpdate"/></row>
	</network>
	<network label="" comment="Axis Ready For Operation" row="1" column="0">
		<row><contact type="open" name="gA[11].Ind_SynchronizedMotion"/><line/><line/><coil type="open" name="gA[11].Ind_Ready"/></row>
	</network>
	<network label="" comment="Cam Automat Synchronization Permissive" row="1" column="0">
		<row><contact type="closed" name="gA[11].Error"/><contact type="open" name="gA[11].Ind_Homed"/><contact type="open" name="gA[11].Ind_Enabled"/><contact type="open" name="gA[9].Ind_Homed"/><contact type="closed" name="gA[11].Ind_Homing"/><contact type="open" name="gA[1].Ind_SynchronizedMotion"/><coil type="open" name="Synch_Permissive"/></row>
	</network>
	<network label="" comment="Cam Automat Synchronization Request" row="2" column="0">
		<row><contact type="closed" name="gA[11].Ind_AutomatEnabled"/><contact type="open" name="Synch_Permissive"/><contact type="closed" name="gRepeatChange"/><coil type="open" name="gA[11].Cmd_SynchronizedMotion"/></row>
		<row><contact type="open" name="gA[11].Cmd_SynchronizedMotion" or="true"/><empty/><empty/><empty/></row>
	</network>
</networks>
END_PROGRAM




































