(********************************************************************
 * COPYRIGHT -- Microsoft
 ********************************************************************
 * Program: A6_Control
 * File: A6_ControlCyclic.ld
 * Author: pkiel
 * Created: July 13, 2011
 ********************************************************************
 * Implementation of program A6_Control
 ********************************************************************)

PROGRAM _CYCLIC








<?xml version="1.0"?>
<?AutomationStudio Version=3.0.71?>
<!-- Automation Studio Generated XML Section -->
<networks maxcolumn="0">
	<network label="" comment="Enable Axis Request" row="2" column="0">
		<row><contact type="closed" name="gA[8].Ind_Enabled"/><contact type="open" name="gDriveSupply_Ready"/><contact type="closed" name="gA[8].Error"/><contact type="open" name="gA[8].Input_DriveEnable"/><contact type="open" name="gRecipeActive.bSelColdMicroPerfProd"/><contact type="closed" name="gA[8].Cmd_EStopDisable"/><coil type="open" name="gA[8].Cmd_Enable"/></row>
		<row><contact type="open" name="gA[8].Cmd_Enable" or="true"/><empty/><empty/><empty/><empty/><empty/><empty/></row>
	</network>
	<network label="" comment="Axis Ready For Operation" row="1" column="0">
		<row><contact type="open" name="gA[8].Ind_NetworkInit"/><contact type="open" name="gA[8].Ind_ControllerReady"/><contact type="open" name="gA[8].Ind_SynchronizedMotion"/><coil type="open" name="gA[8].Ind_Ready"/></row>
	</network>
	<network label="" comment="Axis Error Reset Request" row="4" column="0">
		<row><empty/><empty/><functionblock position="header" name="TOF_0" type="TOF"/><empty/></row>
		<row><contact type="positive transition" name="gHMI_Reset_PB"/><line/><functionblock position="top" type="TOF"><input name="IN"/><output name="Q"/></functionblock><coil type="open" name="gA[8].Cmd_Reset"/></row>
		<row><contact type="positive transition" name="gA[8].Input_DriveEnable" or="true"/><analog type="input" name="T#20ms"/><functionblock position="bottom" type="TOF"><input name="PT"/><output name="ET"/></functionblock><empty/></row>
		<row><contact type="positive transition" name="gCmd_ResetPBGen" or="true"/><empty/><empty/><empty/><empty/></row>
	</network>
	<network label="" comment="Cam Automat Synchronization Permissive" row="1" column="0">
		<row><contact type="closed" name="gA[8].Error"/><contact type="open" name="gA[8].Ind_Enabled"/><contact type="open" name="gA[8].Ind_Homed"/><contact type="open" name="gA[9].Ind_Homed"/><coil type="open" name="Synch_Permissive"/></row>
	</network>
	<network label="" comment="Cam Automat Synchronization Request" row="2" column="0">
		<row><contact type="closed" name="gA[8].Ind_AutomatEnabled"/><contact type="open" name="Synch_Permissive"/><contact type="closed" name="gRepeatChange"/><coil type="open" name="gA[8].Cmd_SynchronizedMotion"/></row>
		<row><contact type="open" name="gA[8].Cmd_SynchronizedMotion" or="true"/><empty/><empty/><empty/></row>
	</network>
</networks>
END_PROGRAM








