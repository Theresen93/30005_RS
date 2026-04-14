(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: PowerTimer
 * File: PowerTimerCyclic.ld
 * Author: pkiel
 * Created: November 04, 2009
 ********************************************************************
 * Implementation of program PowerTimer
 ********************************************************************)

PROGRAM _CYCLIC






















<?xml version="1.0"?>
<?AutomationStudio Version=3.0.71?>
<!-- Automation Studio Generated XML Section -->
<networks maxcolumn="0">
	<network label="" comment="Startup Timer" row="3" column="0">
		<row><empty/><functionblock position="header" name="TON_0" type="TON"/><empty/></row>
		<row><line/><functionblock position="top" type="TON"><input name="IN"/><output name="Q"/></functionblock><coil type="open" name="gPowerUp_Complete"/></row>
		<row><analog type="input" name="T#20s"/><functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock><empty/></row>
	</network>
	<network label="" comment="Main Power On/Off from Selector Switch On Main Operator Panel" row="7" column="0">
		<row><contact type="open" name="gPowerUp_Complete"/><contact type="closed" name="gA[9].Ind_InMotion"/><contact type="positive transition" name="gI_SS_MainPowerOn"/><contact type="closed" name="g_DRY_bMemPowerOff"/><coil type="reset" name="stPowOn"/></row>
		<row><empty/><empty or="true"/><contact type="positive transition" name="stPowOn" or="true"/><empty or="true"/><coil type="set" name="gQ_CR_MainPowerOn"/></row>
		<row><empty/><empty or="true"/><empty/><empty or="true"/><coil type="set" name="bQ_PL_MainPower"/></row>
		<row><empty/><empty or="true"/><empty/><empty or="true"/><coil type="set" name="g_bMainPower_On"/></row>
		<row><empty/><empty or="true"/><contact type="negative transition" name="gI_SS_MainPowerOff"/><contact type="closed" name="g_DRY_bIndCooling"/><coil type="reset" name="gQ_CR_MainPowerOn"/></row>
		<row><empty/><empty or="true"/><contact type="negative transition" name="g_DRY_bMemPowerOff" or="true"/><empty or="true"/><coil type="reset" name="bQ_PL_MainPower"/></row>
		<row><empty/><empty/><empty/><empty or="true"/><coil type="reset" name="g_bMainPower_On"/></row>
	</network>
	<network label="" comment="" row="1" column="0">
		<row><contact type="open" name="bQ_PL_MainPower"/><contact type="closed" name="g_DRY_bFlash"/><coil type="open" name="gQ_PL_MainPower"/></row>
	</network>
	<network label="" comment="" row="2" column="0">
		<row><contact type="open" name="stPowOff"/><coil type="reset" name="gQ_CR_MainPowerOn"/></row>
		<row><empty or="true"/><coil type="reset" name="stPowOff"/></row>
	</network>
	<network label="" comment="" row="3" column="0">
		<row><empty/><functionblock position="header" name="stTON_1" type="TON"/><empty/></row>
		<row><contact type="open" name="g_bMainPower_On"/><functionblock position="top" type="TON"><input name="IN"/><output name="Q"/></functionblock><analog type="output" name="g_bMainPower_OnDelay"/></row>
		<row><analog type="input" name="T#1s"/><functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock><empty/></row>
	</network>
</networks>
END_PROGRAM






















