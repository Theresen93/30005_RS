(********************************************************************
 * COPYRIGHT -- Microsoft
 ********************************************************************
 * Program: A9_Control
 * File: A9_ControlCyclic.ld
 * Author: pkiel
 * Created: July 12, 2011
 ********************************************************************
 * Implementation of program A9_Control
 ********************************************************************)

PROGRAM _CYCLIC




































<?xml version="1.0"?>
<?AutomationStudio Version=3.0.71?>
<!-- Automation Studio Generated XML Section -->
<networks maxcolumn="0">
	<network label="" comment="Axis Error Reset Request" row="3" column="0">
		<row><empty/><empty/><functionblock position="header" name="TOF_0" type="TOF"/><empty/><empty/><empty/><empty/></row>
		<row><contact type="positive transition" name="gHMI_Reset_PB"/><line/><functionblock position="top" type="TOF"><input name="IN"/><output name="Q"/></functionblock><line/><line/><line/><coil type="open" name="gA[9].Cmd_Reset"/></row>
		<row><contact type="positive transition" name="gCmd_ResetPBGen" or="true"/><analog type="input" name="T#50ms"/><functionblock position="bottom" type="TOF"><input name="PT"/><output name="ET"/></functionblock><empty/><empty/><empty/><empty/></row>
	</network>
	<network label="" comment="Axis Continuous Motion Request" row="2" column="0">
		<row><contact type="open" name="gMachine_Jog"/><line/><line/><line/><line/><line/><line/><coil type="open" name="gA[9].Cmd_ContinuousMotion"/></row>
		<row><contact type="open" name="gMachine_Run" or="true"/><empty/><empty/><empty/><empty/><empty/><empty/><empty/></row>
	</network>
	<network label="" comment="Toggle Out For Faster" row="3" column="0">
		<row><empty/><empty/><functionblock position="header" name="HGW_Toggle_0" type="HGW_Toggle"/><empty/><empty/><empty/><empty/></row>
		<row><contact type="open" name="HMI_FasterPB"/><line/><functionblock position="top" type="HGW_Toggle"><input name="In"/><output name="Out"/></functionblock><empty/><empty/><empty/><empty/></row>
		<row><contact type="open" name="gI_FasterPB_1" or="true"/><analog type="input" name="T#100ms"/><functionblock position="bottom" type="HGW_Toggle"><input name="Time"/></functionblock><empty/><empty/><empty/><empty/></row>
	</network>
	<network label="" comment="Toggle Out For Slower" row="4" column="0">
		<row><empty/><empty/><functionblock position="header" name="HGW_Toggle_1" type="HGW_Toggle"/><empty/><empty/><empty/><empty/></row>
		<row><contact type="open" name="HMI_SlowerPB"/><line/><functionblock position="top" type="HGW_Toggle"><input name="In"/><output name="Out"/></functionblock><empty/><empty/><empty/><empty/></row>
		<row><contact type="open" name="gI_SlowerPB_1" or="true"/><analog type="input" name="T#100ms"/><functionblock position="bottom" type="HGW_Toggle"><input name="Time"/></functionblock><empty/><empty/><empty/><empty/></row>
		<row><contact type="open" name="gI_SlowerPB_2" or="true"/><empty/><empty/><empty/><empty/><empty/><empty/><empty/></row>
	</network>
	<network label="" comment="Machine Speed Faster Control" row="3" column="0">
		<row><contact type="positive transition" name="HMI_FasterPB"/><contact type="open" name="gMachine_Run"/><function position="top" type="ADD"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function><empty/><empty/><empty/><empty/></row>
		<row><contact type="positive transition" name="HGW_Toggle_0.Out" or="true"/><analog type="input" name="gSP_CmdSpeed"/><function position="middle" type="ADD"><input name="" extensible="true"/><output name="40"/></function><analog type="output" name="gSP_CmdSpeed"/><empty/><empty/><empty/></row>
		<row><contact type="positive transition" name="gI_FasterPB_1" or="true"/><analog type="input" name="4"/><function position="bottom" type="ADD"><input name="" extensible="true"/></function><empty/><empty/><empty/><empty/></row>
	</network>
	<network label="" comment="Machine Speed Slower Control" row="4" column="0">
		<row><contact type="positive transition" name="HMI_SlowerPB"/><contact type="open" name="gMachine_Run"/><function position="top" type="ADD"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function><empty/><empty/><empty/><empty/></row>
		<row><contact type="positive transition" name="HGW_Toggle_1.Out" or="true"/><analog type="input" name="gSP_CmdSpeed"/><function position="middle" type="ADD"><input name="" extensible="true"/><output name="40"/></function><analog type="output" name="gSP_CmdSpeed"/><empty/><empty/><empty/></row>
		<row><contact type="positive transition" name="gI_SlowerPB_1" or="true"/><analog type="input" name="-4"/><function position="bottom" type="ADD"><input name="" extensible="true"/></function><empty/><empty/><empty/><empty/></row>
		<row><contact type="positive transition" name="gI_SlowerPB_2" or="true"/><empty/><empty/><empty/><empty/><empty/><empty/><empty/></row>
	</network>
	<network label="" comment="Commanded Speed Limit" row="4" column="0">
		<row><line/><function position="top" type="LIMIT"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function><empty/><empty/><empty/><empty/><empty/></row>
		<row><analog type="input" name="gMachineMinSpeedLimit"/><function position="middle" type="LIMIT"><input name="MN"/><output name="40"/></function><analog type="output" name="gSP_CmdSpeed"/><empty/><empty/><empty/><empty/></row>
		<row><analog type="input" name="gSP_CmdSpeed"/><function position="middle" type="LIMIT"><input name="IN"/></function><empty/><empty/><empty/><empty/><empty/></row>
		<row><analog type="input" name="gMachineMaxSpeedLimit"/><function position="bottom" type="LIMIT"><input name="MX"/></function><empty/><empty/><empty/><empty/><empty/></row>
	</network>
	<network label="" comment="Axis Velocity Command Select (NOTE: Velocity is in loadrevs/min)" row="3" column="0">
		<row><contact type="open" name="gMachine_Run"/><function position="top" type="SEL"><input name="G"/><output name="40"/></function><analog type="output" name="gA[9].SP_Velocity"/><empty/><empty/><empty/><empty/></row>
		<row><analog type="input" name="gMachineMinSpeedLimit"/><function position="middle" type="SEL"><input name="IN0"/></function><empty/><empty/><empty/><empty/><empty/></row>
		<row><analog type="input" name="gSP_CmdSpeed"/><function position="bottom" type="SEL"><input name="IN1"/></function><empty/><empty/><empty/><empty/><empty/></row>
	</network>
	<network label="" comment="Axis Velocity Update Request" row="3" column="0">
		<row><empty/><functionblock position="header" name="HGW_ChangeReal_0" type="HGW_ChangeReal"/><empty/><empty/><empty/><empty/><empty/></row>
		<row><line/><functionblock position="top" type="HGW_ChangeReal"><input name="Enable"/><output name="OK"/></functionblock><empty/><empty/><empty/><empty/><empty/></row>
		<row><analog type="input" name="gA[9].SP_Velocity"/><functionblock position="bottom" type="HGW_ChangeReal"><input name="Input"/><output name="Change"/></functionblock><contact type="open" name="gA[9].Cmd_ContinuousMotion"/><line/><line/><line/><coil type="open" name="gA[9].Cmd_ContinuousMotionUpdate"/></row>
	</network>
	<network label="" comment="Set speed Auto/Manu" row="2" column="0">
		<row><contact type="negative transition" name="gA[9].Ind_InMotion"/><contact type="open" name="gr_bSetSpeedMode"/><function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function><empty/><empty/><empty/><empty/></row>
		<row><empty/><analog type="input" name="0.0"/><function position="bottom" type="MOVE"><input name="IN" extensible="true"/><output name="40"/></function><analog type="output" name="gSP_CmdSpeed"/><empty/><empty/><empty/></row>
	</network>
</networks>
END_PROGRAM




































