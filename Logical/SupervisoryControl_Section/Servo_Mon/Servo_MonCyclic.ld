(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: Servo_Mon
 * File: Servo_MonCyclic.ld
 * Author: pkiel
 * Created: October 13, 2009
 ********************************************************************
 * Implementation of program Servo_Mon
 ********************************************************************)

PROGRAM _CYCLIC












<?xml version="1.0"?>
<?AutomationStudio Version=3.0.71?>
<!-- Automation Studio Generated XML Section -->
<networks maxcolumn="0">
	<network label="" comment="Bag Machine Servo Monitor" row="2" column="0">
		<row><contact type="open" name="gA[1].Ind_Ready"/><contact type="open" name="gA[2].Ind_Ready"/><contact type="open" name="gA[3].Ind_Ready"/><contact type="open" name="gA[4].Ind_Ready"/><contact type="open" name="gA[5].Ind_Ready"/><contact type="open" name="gA[6].Ind_Ready"/><contact type="open" name="gA[7].Ind_Ready"/><contact type="open" name="gA[8].Ind_Ready"/><contact type="open" name="gA[15].Ind_Ready"/><contact type="open" name="gA[12].Ind_Ready"/><contact type="open" name="gA[13].Ind_Ready"/><coil type="open" name="BagMachine_ServosOK"/></row>
		<row><empty or="true"/><contact type="closed" name="gRecipeActive.bSelFPProd" or="true"/><empty/><empty/><empty/><empty/><empty or="true"/><contact type="closed" name="gRecipeActive.bSelColdMicroPerfProd" or="true"/><contact type="closed" name="g_stHMPerfCyc.bSelProd" or="true"/><contact type="closed" name="gA[12].bActive" or="true"/><contact type="closed" name="gA[13].bActive" or="true"/><empty/></row>
	</network>
	<network label="" comment="Main Servo Monitor" row="1" column="0">
		<row><contact type="open" name="BagMachine_ServosOK"/><coil type="open" name="gServoAxesOK"/></row>
	</network>
</networks>
END_PROGRAM












