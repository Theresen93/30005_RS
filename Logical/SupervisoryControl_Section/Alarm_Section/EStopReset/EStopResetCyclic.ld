(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: EStopReset
 * File: EStopResetCyclic.ld
 * Author: pkiel
 * Created: October 12, 2009
 ********************************************************************
 * Implementation of program EStopReset
 ********************************************************************)

PROGRAM _CYCLIC














<?xml version="1.0"?>
<?AutomationStudio Version=3.0.71?>
<!-- Automation Studio Generated XML Section -->
<networks maxcolumn="0">
	<network label="" comment="" row="1" column="0">
		<row><contact type="open" name="gI_ResetPB_1"/><coil type="open" name="gCmd_ResetPBGen"/></row>
	</network>
	<network label="" comment="Emergency Stop Relay Reset" row="4" column="0">
		<row><contact type="open" name="gHMI_Reset_PB"/><contact type="closed" name="ESR_ResetTimer.Q"/><contact type="open" name="gPowerUp_Complete"/><line/><line/><contact type="open" name="gI_SafetyRelay_EStopOK"/><coil type="open" name="ESR_Reset"/></row>
		<row><empty or="true"/><empty/><functionblock position="header" name="ESR_ResetTimer" type="TON"/><empty or="true"/><empty or="true"/><empty/></row>
		<row><contact type="open" name="gI_ResetPB_1" or="true"/><line/><functionblock position="top" type="TON"><input name="IN"/><output name="Q"/></functionblock><empty or="true"/><contact type="closed" name="gA[1].Input_DriveEnable" or="true"/><coil type="open" name="gQ_CR_EstopReset"/></row>
		<row><contact type="open" name="ESR_Reset" or="true"/><analog type="input" name="T#1s"/><functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock><empty/><empty/><empty/></row>
	</network>
	<network label="" comment="Alarm Reset Control" row="3" column="0">
		<row><contact type="negative transition" name="ESR_Reset"/><coil type="open" name="gAlarmReset"/></row>
		<row><contact type="positive transition" name="gHMI_Reset_PB" or="true"/><empty/></row>
		<row><contact type="positive transition" name="gI_ResetPB_1" or="true"/><empty/></row>
	</network>
	<network label="" comment="Watch Dog Control Relay" row="1" column="0">
		<row><line/><coil type="open" name="gQ_CR_WatchDog"/></row>
	</network>
</networks>
END_PROGRAM














