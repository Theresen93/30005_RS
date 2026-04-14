(********************************************************************
 * COPYRIGHT -- Microsoft
 ********************************************************************
 * Program: A7_Ref
 * File: A7_RefCyclic.ld
 * Author: pkiel
 * Created: July 19, 2011
 ********************************************************************
 * Implementation of program A7_Ref
 ********************************************************************)

PROGRAM _CYCLIC








<?xml version="1.0"?>
<?AutomationStudio Version=3.0.71?>
<!-- Automation Studio Generated XML Section -->
<networks maxcolumn="0">
	<network label="" comment="*********** ABSOLUTE REFERENCE SECTION **********

Axis Reference Sequence Reset" row="7" column="0">
		<row><contact type="open" name="Ref_Seq[5]"/><coil type="reset" name="Ref_Seq[1]"/></row>
		<row><contact type="closed" name="gAlarmsOK" or="true"/><coil type="reset" name="Ref_Seq[2]"/></row>
		<row><empty or="true"/><coil type="reset" name="Ref_Seq[3]"/></row>
		<row><empty or="true"/><coil type="reset" name="Ref_Seq[4]"/></row>
		<row><empty or="true"/><coil type="reset" name="Ref_Seq[5]"/></row>
		<row><empty or="true"/><coil type="reset" name="Ref_Seq[6]"/></row>
		<row><empty or="true"/><coil type="reset" name="gA[15].Ind_Homing"/></row>
	</network>
	<network label="" comment="Axis Reference Sequence Step #1 Permissive: Is A Reference Being Requested?" row="4" column="0">
		<row><empty/><empty/><empty/><empty/><functionblock position="header" name="HGW_2StepMove_0" type="HGW_2StepMove"/><empty/></row>
		<row><contact type="open" name="gA15Ref_PB"/><contact type="closed" name="Ref_Seq[1]"/><line/><line/><functionblock position="top" type="HGW_2StepMove"><input name="MoveRequest"/><output name="Horn"/></functionblock><coil type="open" name="gA15Ref_Horn"/></row>
		<row><contact type="closed" name="Ref_Seq[1]"/><contact type="closed" name="gMachine_Run"/><contact type="closed" name="gMachine_Jog"/><contact type="open" name="gAlarmsOK"/><functionblock position="bottom" type="HGW_2StepMove"><input name="Permissive"/><output name="StartMove"/></functionblock><coil type="set" name="Ref_Seq[1]"/></row>
		<row><empty/><empty/><empty/><empty/><empty/><empty or="true"/><coil type="set" name="gA[15].Ind_Homing"/></row>
	</network>
	<network label="" comment="Axis Reference Sequence Step #2 Permissive: Is Axis In A Standstill State?" row="1" column="0">
		<row><contact type="open" name="Ref_Seq[1]"/><contact type="closed" name="Ref_Seq[2]"/><contact type="open" name="gA[15].Ind_StandStill"/><coil type="set" name="Ref_Seq[2]"/></row>
	</network>
	<network label="" comment="Axis Reference Sequence Step 2: Home Axis To Reference Switch" row="1" column="0">
		<row><contact type="open" name="Ref_Seq[2]"/><contact type="closed" name="Ref_Seq[3]"/><coil type="reset" name="gA[15].Ind_Homed"/></row>
	</network>
	<network label="" comment="Axis Reference Sequence Step 2: Home Axis To Reference Switch" row="6" column="0">
		<row><empty/><empty/><functionblock position="header" name="MC_Home_0" type="MC_Home"/><empty/></row>
		<row><empty/><analog type="input" name="gA[15].Ident"/><functionblock position="top" type="MC_Home"><input name="Axis"/><output name="Done"/></functionblock><empty/></row>
		<row><contact type="open" name="Ref_Seq[2]"/><contact type="closed" name="Ref_Seq[3]"/><functionblock position="middle" type="MC_Home"><input name="Execute"/><output name="Busy"/></functionblock><empty/></row>
		<row><empty/><analog type="input" name="0"/><functionblock position="middle" type="MC_Home"><input name="Position"/><output name="CommandAborted"/></functionblock><empty/></row>
		<row><empty/><analog type="input" name="mcHOME_ABS_SWITCH"/><functionblock position="middle" type="MC_Home"><input name="HomingMode"/><output name="Error"/></functionblock><empty/></row>
		<row><empty/><empty/><functionblock position="bottom" type="MC_Home"><output name="ErrorID"/></functionblock><empty/></row>
	</network>
	<network label="" comment="Axis Reference Sequence Step #3 Permissive: Is Axis Referenced To Switch?" row="1" column="0">
		<row><contact type="open" name="Ref_Seq[2]"/><contact type="closed" name="Ref_Seq[3]"/><contact type="open" name="MC_Home_0.Done"/><contact type="open" name="gA[15].Ind_StandStill"/><coil type="set" name="Ref_Seq[3]"/></row>
	</network>
	<network label="" comment="Axis Reference Sequence Step 3: Impliment Home Offset With A Move Additive Block" row="7" column="0">
		<row><empty/><empty/><empty/><empty/><functionblock position="header" name="MC_MoveAdditive_0" type="MC_MoveAdditive"/><empty/></row>
		<row><empty/><empty/><empty/><analog type="input" name="gA[15].Ident"/><functionblock position="top" type="MC_MoveAdditive"><input name="Axis"/><output name="Done"/></functionblock><empty/></row>
		<row><contact type="open" name="gA[15].Ind_StandStill"/><contact type="open" name="Ref_Seq[3]"/><contact type="closed" name="Ref_Seq[4]"/><line/><functionblock position="middle" type="MC_MoveAdditive"><input name="Execute"/><output name="Busy"/></functionblock><empty/></row>
		<row><analog type="input" name="gSP_A[7].HomeOffset"/><function position="top" type="MUL"><input name="" extensible="true"/><output name="22"/></function><line/><functionblock position="middle" type="MC_MoveAdditive"><input name="Distance"/><output name="CommandAborted"/></functionblock><empty/></row>
		<row><analog type="input" name="gA[15].UnitsPerDeg"/><function position="bottom" type="MUL"><input name="" extensible="true"/></function><analog type="input" name="gA[15].HomeVelocity"/><functionblock position="middle" type="MC_MoveAdditive"><input name="Velocity"/><output name="Error"/></functionblock><empty/></row>
		<row><empty/><empty/><empty/><analog type="input" name="gA[15].SP_Accel"/><functionblock position="middle" type="MC_MoveAdditive"><input name="Acceleration"/><output name="ErrorID"/></functionblock><empty/></row>
		<row><empty/><empty/><empty/><analog type="input" name="gA[15].SP_Decel"/><functionblock position="bottom" type="MC_MoveAdditive"><input name="Deceleration"/></functionblock><empty/></row>
	</network>
	<network label="" comment="Axis Reference Sequence Step #4 Permissive: Is Home Offset Complete?" row="1" column="0">
		<row><contact type="open" name="Ref_Seq[3]"/><contact type="closed" name="Ref_Seq[4]"/><contact type="open" name="MC_MoveAdditive_0.Done"/><coil type="set" name="Ref_Seq[4]"/></row>
	</network>
	<network label="" comment="Axis Reference Sequence Step 4: Home Axis Direct" row="6" column="0">
		<row><empty/><empty/><empty/><functionblock position="header" name="MC_Home_1" type="MC_Home"/><empty/></row>
		<row><empty/><empty/><analog type="input" name="gA[15].Ident"/><functionblock position="top" type="MC_Home"><input name="Axis"/><output name="Done"/></functionblock><empty/></row>
		<row><contact type="open" name="gA[15].Ind_StandStill"/><contact type="open" name="Ref_Seq[4]"/><contact type="closed" name="Ref_Seq[5]"/><functionblock position="middle" type="MC_Home"><input name="Execute"/><output name="Busy"/></functionblock><empty/></row>
		<row><empty/><empty/><analog type="input" name="0.0"/><functionblock position="middle" type="MC_Home"><input name="Position"/><output name="CommandAborted"/></functionblock><empty/></row>
		<row><empty/><empty/><analog type="input" name="mcHOME_DIRECT"/><functionblock position="middle" type="MC_Home"><input name="HomingMode"/><output name="Error"/></functionblock><empty/></row>
		<row><empty/><empty/><empty/><functionblock position="bottom" type="MC_Home"><output name="ErrorID"/></functionblock><empty/></row>
	</network>
	<network label="" comment="Axis Reference Sequence Step #5 Permissive: Is  Homing Complete?" row="2" column="0">
		<row><contact type="open" name="Ref_Seq[4]"/><contact type="closed" name="Ref_Seq[5]"/><contact type="open" name="MC_Home_1.Done"/><coil type="set" name="Ref_Seq[5]"/></row>
		<row><empty/><empty/><empty or="true"/><coil type="set" name="gA[15].Ind_Homed"/></row>
	</network>
</networks>
END_PROGRAM








