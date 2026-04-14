(********************************************************************
 * COPYRIGHT -- Microsoft
 ********************************************************************
 * Program: A1_Ref
 * File: A1_RefCyclic.ld
 * Author: pkiel
 * Created: July 13, 2011
 ********************************************************************
 * Implementation of program A1_Ref
 ********************************************************************)

PROGRAM _CYCLIC













<?xml version="1.0"?>
<?AutomationStudio Version=3.0.71?>
<!-- Automation Studio Generated XML Section -->
<networks maxcolumn="0">
	<network label="" comment="Two Step Process For Initiating Home Reference" row="8" column="0">
		<row><empty/><empty/><empty/><functionblock position="header" name="HGW_2StepMove_0" type="HGW_2StepMove"/><empty/><functionblock position="header" name="HGW_2StateIND_0" type="HGW_2StateIND"/><empty/></row>
		<row><contact type="open" name="gA1Ref_PB"/><line/><line/><functionblock position="top" type="HGW_2StepMove"><input name="MoveRequest"/><output name="Horn"/></functionblock><line/><functionblock position="top" type="HGW_2StateIND"><input name="In_State"/><output name="Text_Ind"/></functionblock><empty/></row>
		<row><contact type="closed" name="gA[9].Ind_InMotion"/><contact type="closed" name="gA[1].Ind_Enabled"/><contact type="closed" name="gA[1].Error"/><functionblock position="middle" type="HGW_2StepMove"><input name="Permissive"/></functionblock><analog type="input" name="gBlue"/><functionblock position="middle" type="HGW_2StateIND"><input name="BackColor_State0"/><output name="Color_Ind"/></functionblock><analog type="output" name="RefPBColor_Ind"/></row>
		<row><empty/><empty/><empty/><functionblock position="middle" type="HGW_2StepMove"/><analog type="input" name="gWhite"/><functionblock position="middle" type="HGW_2StateIND"><input name="ForeColor_State0"/><output name="State0"/></functionblock><empty/></row>
		<row><empty/><empty/><empty/><functionblock position="middle" type="HGW_2StepMove"/><analog type="input" name="gGreen"/><functionblock position="middle" type="HGW_2StateIND"><input name="BackColor_State1"/><output name="State1"/></functionblock><empty/></row>
		<row><empty/><empty/><empty/><functionblock position="middle" type="HGW_2StepMove"/><analog type="input" name="gBlack"/><functionblock position="bottom" type="HGW_2StateIND"><input name="ForeColor_State1"/></functionblock><empty/></row>
		<row><empty/><empty/><empty/><functionblock position="bottom" type="HGW_2StepMove"><output name="StartMove"/></functionblock><line/><line/><line/><coil type="set" name="gA[1].Ind_Homing"/></row>
		<row><empty/><empty/><empty/><empty/><empty or="true"/><line/><line/><line/><coil type="reset" name="gA[1].Ind_Homed"/></row>
	</network>
	<network label="" comment="Reference Servo Axis Direct" row="6" column="0">
		<row><empty/><empty/><empty/><empty/><empty/><empty/><empty/><functionblock position="header" name="MC_Home_0" type="MC_Home"/><empty/><empty/></row>
		<row><empty/><empty/><empty/><empty/><empty/><empty/><analog type="input" name="gA[1].Ident"/><functionblock position="top" type="MC_Home"><input name="Axis"/><output name="Done"/></functionblock><line/><coil type="reset" name="gA[1].Ind_Homing"/></row>
		<row><contact type="open" name="gA[1].Ind_Homing"/><contact type="closed" name="gA[1].Ind_Enabled"/><contact type="closed" name="gA[1].Error"/><line/><line/><line/><line/><functionblock position="middle" type="MC_Home"><input name="Execute"/><output name="Busy"/></functionblock><empty or="true"/><coil type="set" name="gA[1].Ind_Homed"/></row>
		<row><empty or="true"/><contact type="open" name="gA[1].Ind_StandStill"/><line or="true"/><analog type="input" name="gSP_A[1].HomeOffset"/><function position="top" type="MUL"><input name="" extensible="true"/><output name="22"/></function><line/><functionblock position="middle" type="MC_Home"><input name="Position"/><output name="CommandAborted"/></functionblock><empty/><empty/></row>
		<row><empty/><empty/><empty/><analog type="input" name="gA[1].UnitsPerDeg"/><function position="bottom" type="MUL"><input name="" extensible="true"/></function><analog type="input" name="mcHOME_DIRECT"/><functionblock position="middle" type="MC_Home"><input name="HomingMode"/><output name="Error"/></functionblock><empty/><empty/></row>
		<row><empty/><empty/><empty/><empty/><empty/><empty/><empty/><functionblock position="bottom" type="MC_Home"><output name="ErrorID"/></functionblock><empty/><empty/></row>
	</network>
	<network label="" comment="Reset Referencing In the Event Of A Positive Or Negative Transition Of the Main Alarm Contact" row="2" column="0">
		<row><contact type="positive transition" name="gAlarmsOK"/><coil type="reset" name="gA[1].Ind_Homing"/></row>
		<row><contact type="negative transition" name="gAlarmsOK" or="true"/><empty/></row>
	</network>
</networks>
END_PROGRAM













