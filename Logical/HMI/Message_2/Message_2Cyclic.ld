(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: Message_2
 * File: Message_2Cyclic.ld
 * Author: pkiel
 * Created: October 26, 2009
 ********************************************************************
 * Implementation of program Message_2
 ********************************************************************)

PROGRAM _CYCLIC









































































<?xml version="1.0"?>
<?AutomationStudio Version=3.0.71?>
<!-- Automation Studio Generated XML Section -->
<networks maxcolumn="0">
	<network label="" comment="Auto Reset Timer" row="3" column="0">
		<row><empty/><functionblock position="header" name="HGW_Toggle_0" type="HGW_Toggle"/><empty/></row>
		<row><line/><functionblock position="top" type="HGW_Toggle"><input name="In"/><output name="Out"/></functionblock><coil type="open" name="SelfReset"/></row>
		<row><analog type="input" name="t#500ms"/><functionblock position="bottom" type="HGW_Toggle"><input name="Time"/></functionblock><empty/></row>
	</network>
	<network label="" comment="Message Display Reset" row="7" column="0">
		<row><contact type="positive transition" name="gAlarmsOK"/><line/><line/><line/><coil type="open" name="MessageReset"/></row>
		<row><contact type="positive transition" name="gHMI_Reset_PB" or="true"/><line/><line/><line/><coil type="reset" name="FirstMessage_L1"/></row>
		<row><contact type="positive transition" name="gHMI_Run_PB" or="true"/><line/><line/><line/><coil type="reset" name="FirstMessage_L2"/></row>
		<row><contact type="positive transition" name="gHMI_Jog_PB" or="true"/><line/><function position="top" type="MOVE"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function><empty/></row>
		<row><contact type="positive transition" name="SelfReset" or="true"/><analog type="input" name="0"/><function position="bottom" type="MOVE"><input name="IN"/><output name="20"/></function><analog type="output" name="MessageDisplay"/></row>
		<row><contact type="positive transition" name="gI_PB_MachineStart" or="true"/><empty/><empty/><empty/><empty/></row>
		<row><contact type="positive transition" name="gAlarmReset" or="true"/><empty/><empty/><empty/><empty/></row>
	</network>
	<network label="" comment="********** LEVEL 1 MESSAGES **********

Axis Not Ready Permissive" row="3" column="0">
		<row><empty/><empty/><functionblock position="header" name="TON_0" type="TON"/><empty/></row>
		<row><contact type="open" name="gI_SafetyRelay_EStopOK"/><contact type="open" name="gQ_CR_MainPowerOn"/><functionblock position="top" type="TON"><input name="IN"/><output name="Q"/></functionblock><coil type="open" name="AxisReadyPermissive"/></row>
		<row><empty/><analog type="input" name="T#1s"/><functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock><empty/></row>
	</network>
	<network label="" comment="Message #1: Axis Not Ready, Perf Drive (A1)" row="4" column="0">
		<row><contact type="open" name="AxisReadyPermissive"/><contact type="closed" name="gA[1].Ind_Ready"/><contact type="closed" name="FirstMessage_L1"/><line/><line/><line/><coil type="open" name="Message[1]"/></row>
		<row><contact type="open" name="Message[1]"/><contact type="closed" name="MessageReset"/><line or="true"/><line/><line/><line/><coil type="set" name="FirstMessage_L1"/></row>
		<row><empty/><empty/><empty or="true"/><line/><function position="top" type="MOVE"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function><empty/></row>
		<row><empty/><empty/><empty/><analog type="input" name="1"/><function position="bottom" type="MOVE"><input name="IN"/><output name="20"/></function><analog type="output" name="MessageDisplay"/></row>
	</network>
	<network label="" comment="Message #2: Axis Not Ready, Printer Drive (A2)" row="4" column="0">
		<row><contact type="open" name="AxisReadyPermissive"/><contact type="open" name="gRecipeActive.bSelFPProd"/><contact type="closed" name="gA[2].Ind_Ready"/><contact type="closed" name="FirstMessage_L1"/><line/><line/><line/><coil type="open" name="Message[2]"/></row>
		<row><contact type="open" name="Message[2]"/><contact type="closed" name="MessageReset"/><line/><line or="true"/><line/><line/><line/><coil type="set" name="FirstMessage_L2"/></row>
		<row><empty/><empty/><empty/><empty or="true"/><line/><function position="top" type="MOVE"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function><empty/></row>
		<row><empty/><empty/><empty/><empty/><analog type="input" name="2"/><function position="bottom" type="MOVE"><input name="IN"/><output name="20"/></function><analog type="output" name="MessageDisplay"/></row>
	</network>
	<network label="" comment="Message #3: Axis Not Ready, Holding Drive (A3)" row="4" column="0">
		<row><contact type="open" name="AxisReadyPermissive"/><contact type="closed" name="gA[3].Ind_Ready"/><contact type="closed" name="FirstMessage_L1"/><line/><line/><line/><coil type="open" name="Message[3]"/></row>
		<row><contact type="open" name="Message[3]"/><contact type="closed" name="MessageReset"/><line or="true"/><line/><line/><line/><coil type="set" name="FirstMessage_L1"/></row>
		<row><empty/><empty/><empty or="true"/><line/><function position="top" type="MOVE"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function><empty/></row>
		<row><empty/><empty/><empty/><analog type="input" name="3"/><function position="bottom" type="MOVE"><input name="IN"/><output name="20"/></function><analog type="output" name="MessageDisplay"/></row>
	</network>
	<network label="" comment="Message #4: Axis Not Ready, Tearing Drive (A4)" row="4" column="0">
		<row><contact type="open" name="AxisReadyPermissive"/><contact type="closed" name="gA[4].Ind_Ready"/><contact type="closed" name="FirstMessage_L1"/><line/><line/><line/><coil type="open" name="Message[4]"/></row>
		<row><contact type="open" name="Message[4]"/><contact type="closed" name="MessageReset"/><line or="true"/><line/><line/><line/><coil type="set" name="FirstMessage_L1"/></row>
		<row><empty/><empty/><empty or="true"/><line/><function position="top" type="MOVE"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function><empty/></row>
		<row><empty/><empty/><empty/><analog type="input" name="4"/><function position="bottom" type="MOVE"><input name="IN"/><output name="20"/></function><analog type="output" name="MessageDisplay"/></row>
	</network>
	<network label="" comment="Message #5: Axis Not Ready, Entry Pull Drive (A5)" row="4" column="0">
		<row><contact type="open" name="AxisReadyPermissive"/><contact type="closed" name="gA[5].Ind_Ready"/><contact type="closed" name="FirstMessage_L1"/><line/><line/><line/><coil type="open" name="Message[5]"/></row>
		<row><contact type="open" name="Message[5]"/><contact type="closed" name="MessageReset"/><line or="true"/><line/><line/><line/><coil type="set" name="FirstMessage_L1"/></row>
		<row><empty/><empty/><empty or="true"/><line/><function position="top" type="MOVE"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function><empty/></row>
		<row><empty/><empty/><empty/><analog type="input" name="5"/><function position="bottom" type="MOVE"><input name="IN"/><output name="20"/></function><analog type="output" name="MessageDisplay"/></row>
	</network>
	<network label="" comment="Message #6: Axis Not Ready, Exit Pull Drive (A6)" row="4" column="0">
		<row><contact type="open" name="AxisReadyPermissive"/><contact type="closed" name="gA[6].Ind_Ready"/><contact type="closed" name="FirstMessage_L1"/><line/><line/><line/><coil type="open" name="Message[6]"/></row>
		<row><contact type="open" name="Message[6]"/><contact type="closed" name="MessageReset"/><line or="true"/><line/><line/><line/><coil type="set" name="FirstMessage_L1"/></row>
		<row><empty/><empty/><empty or="true"/><line/><function position="top" type="MOVE"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function><empty/></row>
		<row><empty/><empty/><empty/><analog type="input" name="6"/><function position="bottom" type="MOVE"><input name="IN"/><output name="20"/></function><analog type="output" name="MessageDisplay"/></row>
	</network>
	<network label="" comment="Message #7: Axis Not Ready, Drum Drive (A7)" row="4" column="0">
		<row><contact type="open" name="AxisReadyPermissive"/><contact type="closed" name="gA[7].Ind_Ready"/><contact type="closed" name="FirstMessage_L1"/><line/><line/><line/><coil type="open" name="Message[7]"/></row>
		<row><contact type="open" name="Message[7]"/><contact type="closed" name="MessageReset"/><line or="true"/><line/><line/><line/><coil type="set" name="FirstMessage_L1"/></row>
		<row><empty/><empty/><empty or="true"/><line/><function position="top" type="MOVE"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function><empty/></row>
		<row><empty/><empty/><empty/><analog type="input" name="7"/><function position="bottom" type="MOVE"><input name="IN"/><output name="20"/></function><analog type="output" name="MessageDisplay"/></row>
	</network>
	<network label="" comment="Message #8: Axis Not Ready, ColdMicroPerf Drive (A8)" row="4" column="0">
		<row><contact type="open" name="AxisReadyPermissive"/><contact type="closed" name="gA[8].Ind_Ready"/><contact type="open" name="gA[8].bActive"/><contact type="closed" name="FirstMessage_L1"/><line/><line/><line/><coil type="open" name="Message[8]"/></row>
		<row><contact type="open" name="Message[8]"/><contact type="closed" name="MessageReset"/><line/><line or="true"/><line/><line/><line/><coil type="set" name="FirstMessage_L1"/></row>
		<row><empty/><empty/><empty/><empty or="true"/><line/><function position="top" type="MOVE"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function><empty/></row>
		<row><empty/><empty/><empty/><empty/><analog type="input" name="8"/><function position="bottom" type="MOVE"><input name="IN"/><output name="20"/></function><analog type="output" name="MessageDisplay"/></row>
	</network>
	<network label="" comment="Message #12: Axis Not Ready, Envelope Bag Drive (A12)" row="4" column="0">
		<row><contact type="open" name="AxisReadyPermissive"/><contact type="closed" name="gA[12].Ind_Ready"/><contact type="open" name="gA[12].bActive"/><contact type="closed" name="FirstMessage_L1"/><line/><line/><line/><coil type="open" name="Message[12]"/></row>
		<row><contact type="open" name="Message[12]"/><contact type="closed" name="MessageReset"/><line/><line or="true"/><line/><line/><line/><coil type="set" name="FirstMessage_L1"/></row>
		<row><empty/><empty/><empty/><empty or="true"/><line/><function position="top" type="MOVE"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function><empty/></row>
		<row><empty/><empty/><empty/><empty/><analog type="input" name="12"/><function position="bottom" type="MOVE"><input name="IN"/><output name="20"/></function><analog type="output" name="MessageDisplay"/></row>
	</network>
	<network label="" comment="Message #13: Axis Not Ready, Tearing Envelope Bag Drive (A13)" row="4" column="0">
		<row><contact type="open" name="AxisReadyPermissive"/><contact type="closed" name="gA[13].Ind_Ready"/><contact type="open" name="gA[13].bActive"/><contact type="closed" name="FirstMessage_L1"/><line/><line/><line/><coil type="open" name="Message[13]"/></row>
		<row><contact type="open" name="Message[13]"/><contact type="closed" name="MessageReset"/><line/><line or="true"/><line/><line/><line/><coil type="set" name="FirstMessage_L1"/></row>
		<row><empty/><empty/><empty/><empty or="true"/><line/><function position="top" type="MOVE"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function><empty/></row>
		<row><empty/><empty/><empty/><empty/><analog type="input" name="13"/><function position="bottom" type="MOVE"><input name="IN"/><output name="20"/></function><analog type="output" name="MessageDisplay"/></row>
	</network>
	<network label="" comment="Message #15: Axis Not Ready, HotMicroPerf Drive (A15)" row="4" column="0">
		<row><contact type="open" name="AxisReadyPermissive"/><contact type="closed" name="gA[15].Ind_Ready"/><contact type="open" name="gA[15].bActive"/><contact type="closed" name="FirstMessage_L1"/><line/><line/><line/><coil type="open" name="Message[15]"/></row>
		<row><contact type="open" name="Message[15]"/><contact type="closed" name="MessageReset"/><line/><line or="true"/><line/><line/><line/><coil type="set" name="FirstMessage_L1"/></row>
		<row><empty/><empty/><empty/><empty or="true"/><line/><function position="top" type="MOVE"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function><empty/></row>
		<row><empty/><empty/><empty/><empty/><analog type="input" name="15"/><function position="bottom" type="MOVE"><input name="IN"/><output name="20"/></function><analog type="output" name="MessageDisplay"/></row>
	</network>
	<network label="" comment="Message #18: Bundler Not Ready" row="4" column="0">
		<row><contact type="closed" name="g_bIndBundReady"/><contact type="closed" name="FirstMessage_L1"/><line/><line/><line/><coil type="open" name="Message[18]"/></row>
		<row><contact type="open" name="Message[8]"/><contact type="closed" name="MessageReset" or="true"/><line/><line/><line/><coil type="set" name="FirstMessage_L1"/></row>
		<row><empty/><empty or="true"/><line/><function position="top" type="MOVE"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function><empty/></row>
		<row><empty/><empty/><analog type="input" name="8"/><function position="bottom" type="MOVE"><input name="IN"/><output name="20"/></function><analog type="output" name="MessageDisplay"/></row>
	</network>
	<network label="" comment="Message #19: Perf Park Required" row="4" column="0">
		<row><contact type="open" name="gPerf_ParkRequired"/><contact type="closed" name="FirstMessage_L1"/><line/><line/><line/><coil type="open" name="Message[19]"/></row>
		<row><contact type="open" name="Message[9]"/><contact type="closed" name="MessageReset" or="true"/><line/><line/><line/><coil type="set" name="FirstMessage_L1"/></row>
		<row><empty/><empty or="true"/><line/><function position="top" type="MOVE"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function><empty/></row>
		<row><empty/><empty/><analog type="input" name="9"/><function position="bottom" type="MOVE"><input name="IN"/><output name="20"/></function><analog type="output" name="MessageDisplay"/></row>
	</network>
	<network label="" comment="********** LEVEL 2 MESSAGES **********

Level 2 Message Permissives" row="1" column="0">
		<row><contact type="closed" name="FirstMessage_L1"/><coil type="open" name="Permissive_L2"/></row>
	</network>
	<network label="" comment="Message #21: Guard Open, Door 1" row="4" column="0">
		<row><contact type="open" name="gI_GSW_Door1"/><contact type="closed" name="FirstMessage_L2"/><contact type="open" name="Permissive_L2"/><line/><line/><coil type="open" name="Message[21]"/></row>
		<row><contact type="open" name="Message[21]"/><contact type="closed" name="MessageReset" or="true"/><empty or="true"/><line/><line/><coil type="set" name="FirstMessage_L2"/></row>
		<row><empty/><empty/><empty or="true"/><function position="top" type="MOVE"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function><empty/></row>
		<row><empty/><empty/><analog type="input" name="21"/><function position="bottom" type="MOVE"><input name="IN"/><output name="20"/></function><analog type="output" name="MessageDisplay"/></row>
	</network>
	<network label="" comment="Message #20: Guard Safety Relay Fault" row="4" column="0">
		<row><contact type="closed" name="gI_SafetyRelay_GuardOK"/><contact type="closed" name="FirstMessage_L2"/><contact type="open" name="Permissive_L2"/><line/><line/><coil type="open" name="Message[20]"/></row>
		<row><contact type="open" name="Message[29]"/><contact type="closed" name="MessageReset" or="true"/><empty or="true"/><line/><line/><coil type="set" name="FirstMessage_L2"/></row>
		<row><empty/><empty/><empty or="true"/><function position="top" type="MOVE"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function><empty/></row>
		<row><empty/><empty/><analog type="input" name="20"/><function position="bottom" type="MOVE"><input name="IN"/><output name="20"/></function><analog type="output" name="MessageDisplay"/></row>
	</network>
	<network label="" comment="Message #21: Guard Open, Door 2" row="4" column="0">
		<row><contact type="open" name="gI_GSW_Door2"/><contact type="closed" name="FirstMessage_L2"/><contact type="open" name="Permissive_L2"/><line/><line/><coil type="open" name="Message[22]"/></row>
		<row><contact type="open" name="Message[22]"/><contact type="closed" name="MessageReset" or="true"/><empty or="true"/><line/><line/><coil type="set" name="FirstMessage_L2"/></row>
		<row><empty/><empty/><empty or="true"/><function position="top" type="MOVE"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function><empty/></row>
		<row><empty/><empty/><analog type="input" name="22"/><function position="bottom" type="MOVE"><input name="IN"/><output name="20"/></function><analog type="output" name="MessageDisplay"/></row>
	</network>
	<network label="" comment="Message #23: Guard Open, Drum Door" row="4" column="0">
		<row><contact type="open" name="gI_GSW_Drum"/><contact type="closed" name="gSetupMode_On"/><contact type="closed" name="FirstMessage_L2"/><contact type="open" name="Permissive_L2"/><line/><line/><coil type="open" name="Message[23]"/></row>
		<row><contact type="open" name="Message[23]"/><contact type="closed" name="MessageReset"/><line or="true"/><empty or="true"/><line/><line/><coil type="set" name="FirstMessage_L2"/></row>
		<row><empty/><empty/><empty/><empty or="true"/><function position="top" type="MOVE"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function><empty/></row>
		<row><empty/><empty/><empty/><analog type="input" name="23"/><function position="bottom" type="MOVE"><input name="IN"/><output name="20"/></function><analog type="output" name="MessageDisplay"/></row>
	</network>
	<network label="" comment="Message #24: Guard Open, Perf Doors" row="4" column="0">
		<row><contact type="open" name="gI_GSW_PerfDoors"/><contact type="closed" name="gSetupMode_On"/><contact type="closed" name="FirstMessage_L2"/><contact type="open" name="Permissive_L2"/><line/><line/><coil type="open" name="Message[24]"/></row>
		<row><contact type="open" name="Message[24]"/><contact type="closed" name="MessageReset"/><line or="true"/><empty or="true"/><line/><line/><coil type="set" name="FirstMessage_L2"/></row>
		<row><empty/><empty/><empty/><empty or="true"/><function position="top" type="MOVE"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function><empty/></row>
		<row><empty/><empty/><empty/><analog type="input" name="24"/><function position="bottom" type="MOVE"><input name="IN"/><output name="20"/></function><analog type="output" name="MessageDisplay"/></row>
	</network>
	<network label="" comment="Message #25: Guard Open, Slitting Door" row="4" column="0">
		<row><contact type="open" name="gI_GSW_SlittingDoor"/><contact type="closed" name="gSetupMode_On"/><contact type="closed" name="FirstMessage_L2"/><contact type="open" name="Permissive_L2"/><line/><line/><coil type="open" name="Message[25]"/></row>
		<row><contact type="open" name="Message[25]"/><contact type="closed" name="MessageReset"/><line or="true"/><empty or="true"/><line/><line/><coil type="set" name="FirstMessage_L2"/></row>
		<row><empty/><empty/><empty/><empty or="true"/><function position="top" type="MOVE"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function><empty/></row>
		<row><empty/><empty/><empty/><analog type="input" name="25"/><function position="bottom" type="MOVE"><input name="IN"/><output name="20"/></function><analog type="output" name="MessageDisplay"/></row>
	</network>
	<network label="" comment="Message #26: Guard Open, RS Entry Door" row="4" column="0">
		<row><contact type="open" name="gI_GSW_RSEntry"/><contact type="closed" name="FirstMessage_L2"/><contact type="open" name="Permissive_L2"/><line/><line/><coil type="open" name="Message[26]"/></row>
		<row><contact type="open" name="Message[26]"/><contact type="closed" name="MessageReset" or="true"/><empty or="true"/><line/><line/><coil type="set" name="FirstMessage_L2"/></row>
		<row><empty/><empty/><empty or="true"/><function position="top" type="MOVE"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function><empty/></row>
		<row><empty/><empty/><analog type="input" name="26"/><function position="bottom" type="MOVE"><input name="IN"/><output name="20"/></function><analog type="output" name="MessageDisplay"/></row>
	</network>
	<network label="" comment="Message #27: Guard Open, Tearing Door" row="4" column="0">
		<row><contact type="open" name="gI_GSW_Tearing"/><contact type="closed" name="gSetupMode_On"/><contact type="closed" name="FirstMessage_L2"/><contact type="open" name="Permissive_L2"/><line/><line/><coil type="open" name="Message[27]"/></row>
		<row><contact type="open" name="Message[27]"/><contact type="closed" name="MessageReset"/><line or="true"/><empty or="true"/><line/><line/><coil type="set" name="FirstMessage_L2"/></row>
		<row><empty/><empty/><empty/><empty or="true"/><function position="top" type="MOVE"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function><empty/></row>
		<row><empty/><empty/><empty/><analog type="input" name="27"/><function position="bottom" type="MOVE"><input name="IN"/><output name="20"/></function><analog type="output" name="MessageDisplay"/></row>
	</network>
	<network label="" comment="Message #28: Guard Open Bundler" row="4" column="0">
		<row><contact type="closed" name="g_bBundGuard_OK"/><contact type="closed" name="gSetupMode_On"/><contact type="closed" name="FirstMessage_L2"/><contact type="open" name="Permissive_L2"/><line/><line/><coil type="open" name="Message[28]"/></row>
		<row><contact type="open" name="Message[28]"/><contact type="closed" name="MessageReset"/><line or="true"/><empty or="true"/><line/><line/><coil type="set" name="FirstMessage_L2"/></row>
		<row><empty/><empty/><empty/><empty or="true"/><function position="top" type="MOVE"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function><empty/></row>
		<row><empty/><empty/><empty/><analog type="input" name="28"/><function position="bottom" type="MOVE"><input name="IN"/><output name="20"/></function><analog type="output" name="MessageDisplay"/></row>
	</network>
	<network label="" comment="Message #29: Doors Open Flexo Press" row="4" column="0">
		<row><contact type="closed" name="TRUE"/><contact type="closed" name="FirstMessage_L2"/><contact type="open" name="gA[2].bActive"/><contact type="open" name="Permissive_L2"/><line/><line/><coil type="open" name="Message[29]"/></row>
		<row><contact type="open" name="Message[29]"/><contact type="closed" name="MessageReset" or="true"/><empty/><empty or="true"/><line/><line/><coil type="set" name="FirstMessage_L2"/></row>
		<row><empty/><empty/><empty/><empty or="true"/><function position="top" type="MOVE"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function><empty/></row>
		<row><empty/><empty/><empty/><analog type="input" name="29"/><function position="bottom" type="MOVE"><input name="IN"/><output name="20"/></function><analog type="output" name="MessageDisplay"/></row>
	</network>
	<network label="" comment="Message #30: Gates Open Flexo Press" row="4" column="0">
		<row><contact type="closed" name="TRUE"/><contact type="closed" name="gSetupMode_On"/><contact type="closed" name="FirstMessage_L2"/><contact type="open" name="gA[2].bActive"/><contact type="open" name="Permissive_L2"/><line/><line/><coil type="open" name="Message[30]"/></row>
		<row><contact type="open" name="Message[30]"/><contact type="closed" name="MessageReset"/><line or="true"/><empty/><empty or="true"/><line/><line/><coil type="set" name="FirstMessage_L2"/></row>
		<row><empty/><empty/><empty/><empty/><empty or="true"/><function position="top" type="MOVE"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function><empty/></row>
		<row><empty/><empty/><empty/><empty/><analog type="input" name="30"/><function position="bottom" type="MOVE"><input name="IN"/><output name="20"/></function><analog type="output" name="MessageDisplay"/></row>
	</network>
	<network label="" comment="Message #31: Gates Open Cold MicroPerforator " row="4" column="0">
		<row><contact type="closed" name="TRUE"/><contact type="closed" name="gSetupMode_On"/><contact type="closed" name="FirstMessage_L2"/><contact type="open" name="gA[8].bActive"/><contact type="open" name="Permissive_L2"/><line/><line/><coil type="open" name="Message[31]"/></row>
		<row><contact type="open" name="Message[31]"/><contact type="closed" name="MessageReset"/><line or="true"/><empty/><empty or="true"/><line/><line/><coil type="set" name="FirstMessage_L2"/></row>
		<row><empty/><empty/><empty/><empty/><empty or="true"/><function position="top" type="MOVE"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function><empty/></row>
		<row><empty/><empty/><empty/><empty/><analog type="input" name="31"/><function position="bottom" type="MOVE"><input name="IN"/><output name="20"/></function><analog type="output" name="MessageDisplay"/></row>
	</network>
	<network label="" comment="Message #32: Door Open Cold MicroPerforator " row="4" column="0">
		<row><contact type="closed" name="TRUE"/><contact type="closed" name="FirstMessage_L2"/><contact type="open" name="gA[8].bActive"/><contact type="open" name="Permissive_L2"/><line/><line/><coil type="open" name="Message[32]"/></row>
		<row><contact type="open" name="Message[32]"/><contact type="closed" name="MessageReset" or="true"/><empty/><empty or="true"/><line/><line/><coil type="set" name="FirstMessage_L2"/></row>
		<row><empty/><empty/><empty/><empty or="true"/><function position="top" type="MOVE"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function><empty/></row>
		<row><empty/><empty/><empty/><analog type="input" name="32"/><function position="bottom" type="MOVE"><input name="IN"/><output name="20"/></function><analog type="output" name="MessageDisplay"/></row>
	</network>
	<network label="" comment="Message #33: Hood Open Hot MicroPerforator " row="4" column="0">
		<row><contact type="closed" name="TRUE"/><contact type="closed" name="gSetupMode_On"/><contact type="closed" name="FirstMessage_L2"/><contact type="open" name="Permissive_L2"/><line/><line/><coil type="open" name="Message[33]"/></row>
		<row><contact type="open" name="Message[33]"/><contact type="closed" name="MessageReset"/><line or="true"/><empty or="true"/><line/><line/><coil type="set" name="FirstMessage_L2"/></row>
		<row><empty/><empty/><empty/><empty or="true"/><function position="top" type="MOVE"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function><empty/></row>
		<row><empty/><empty/><empty/><analog type="input" name="33"/><function position="bottom" type="MOVE"><input name="IN"/><output name="20"/></function><analog type="output" name="MessageDisplay"/></row>
	</network>
	<network label="" comment="********** LEVEL 3 MESSAGES **********

Level 3 Messge Permissives" row="1" column="0">
		<row><contact type="closed" name="FirstMessage_L1"/><contact type="closed" name="FirstMessage_L2"/><coil type="open" name="Permissive_L3"/></row>
	</network>
	<network label="" comment="Message #51: Web Break Detection Off" row="3" column="0">
		<row><contact type="open" name="gWebBreakBypass_On"/><line/><contact type="open" name="Permissive_L3"/><line/><line/><coil type="open" name="Message[51]"/></row>
		<row><contact type="open" name="Message[51]"/><contact type="closed" name="MessageReset" or="true"/><empty or="true"/><function position="top" type="MOVE"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function><empty/></row>
		<row><empty/><empty/><analog type="input" name="51"/><function position="bottom" type="MOVE"><input name="IN"/><output name="20"/></function><analog type="output" name="MessageDisplay"/></row>
	</network>
	<network label="" comment="Message #52: Nip rolle on web draw entry is Off " row="3" column="0">
		<row><contact type="closed" name="gQ_SOL_WebEntryNip"/><line/><contact type="open" name="Permissive_L3"/><line/><line/><coil type="open" name="Message[52]"/></row>
		<row><contact type="open" name="Message[52]"/><contact type="closed" name="MessageReset" or="true"/><empty or="true"/><function position="top" type="MOVE"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function><empty/></row>
		<row><empty/><empty/><analog type="input" name="52"/><function position="bottom" type="MOVE"><input name="IN"/><output name="20"/></function><analog type="output" name="MessageDisplay"/></row>
	</network>
	<network label="" comment="Message #53: Tearing axis in contact zone not possible to move Drum" row="3" column="0">
		<row><contact type="open" name="gA[4].Ind_bInContactZone"/><contact type="closed" name="gA[9].Ind_InMotion"/><contact type="open" name="gManualMode_On"/><contact type="open" name="Permissive_L3"/><line/><line/><function position="top" type="AND"><input name="" extensible="true"/><output name="20"/></function><line/><line/><coil type="open" name="Message[53]"/></row>
		<row><contact type="open" name="Message[53]"/><contact type="closed" name="MessageReset"/><line or="true"/><analog type="input" name="g_iMachType"/><function position="top" type="EQ"><input name="IN1"/><output name="1"/></function><function position="bottom" type="AND" or="true"><input name="" extensible="true"/></function><function position="top" type="MOVE"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function><empty/></row>
		<row><empty/><empty/><empty/><analog type="input" name="C_iRS15"/><function position="bottom" type="EQ"><input name="IN2"/></function><empty/><analog type="input" name="53"/><function position="bottom" type="MOVE"><input name="IN"/><output name="20"/></function><analog type="output" name="MessageDisplay"/></row>
	</network>
	<network label="" comment="Message #54: End reel paper on unwinder detection Off" row="3" column="0">
		<row><contact type="open" name="g_bEndReelPapBypass_On"/><line/><contact type="open" name="g_bUnwindInMach"/><contact type="open" name="Permissive_L3"/><line/><line/><coil type="open" name="Message[54]"/></row>
		<row><contact type="open" name="Message[54]"/><contact type="closed" name="MessageReset" or="true"/><empty/><empty or="true"/><function position="top" type="MOVE"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function><empty/></row>
		<row><empty/><empty/><empty/><analog type="input" name="54"/><function position="bottom" type="MOVE"><input name="IN"/><output name="20"/></function><analog type="output" name="MessageDisplay"/></row>
	</network>
	<network label="" comment="Message #55: End reel poly on unwinder detection Off" row="3" column="0">
		<row><contact type="open" name="g_bEndReelPolyBypass_On"/><line/><contact type="open" name="g_bUnwindInMach"/><contact type="open" name="Permissive_L3"/><line/><line/><coil type="open" name="Message[55]"/></row>
		<row><contact type="open" name="Message[55]"/><contact type="closed" name="MessageReset" or="true"/><empty/><empty or="true"/><function position="top" type="MOVE"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function><empty/></row>
		<row><empty/><empty/><empty/><analog type="input" name="55"/><function position="bottom" type="MOVE"><input name="IN"/><output name="20"/></function><analog type="output" name="MessageDisplay"/></row>
	</network>
	<network label="" comment="Message #56: Nip rolle on Flexo Press is Off" row="3" column="0">
		<row><contact type="closed" name="gQ_CR_FP_NipRol"/><contact type="open" name="gRecipeActive.bSelFPProd"/><contact type="open" name="Permissive_L3"/><line/><line/><coil type="open" name="Message[56]"/></row>
		<row><contact type="open" name="Message[56]"/><contact type="closed" name="MessageReset" or="true"/><empty or="true"/><function position="top" type="MOVE"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function><empty/></row>
		<row><empty/><empty/><analog type="input" name="56"/><function position="bottom" type="MOVE"><input name="IN"/><output name="20"/></function><analog type="output" name="MessageDisplay"/></row>
	</network>
	<network label="" comment="Message #57: Nip rolle on web draw exit is Off " row="3" column="0">
		<row><contact type="closed" name="gQ_SOL_WebExitNip"/><line/><contact type="open" name="Permissive_L3"/><line/><line/><coil type="open" name="Message[57]"/></row>
		<row><contact type="open" name="Message[57]"/><contact type="closed" name="MessageReset" or="true"/><empty or="true"/><function position="top" type="MOVE"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function><empty/></row>
		<row><empty/><empty/><analog type="input" name="57"/><function position="bottom" type="MOVE"><input name="IN"/><output name="20"/></function><analog type="output" name="MessageDisplay"/></row>
	</network>
	<network label="" comment="Send Message Display Value to HMI
     This is done to prevent the &quot;flashing&quot; effect when a message reset is attempted" row="2" column="0">
		<row><line/><function position="top" type="MOVE"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function><empty/></row>
		<row><analog type="input" name="MessageDisplay"/><function position="bottom" type="MOVE"><input name="IN"/><output name="20"/></function><analog type="output" name="HMI_MessageDisplay"/></row>
	</network>
	<network label="" comment="Determine If A Message Is Active" row="3" column="0">
		<row><line/><function position="top" type="NE"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function><empty/></row>
		<row><analog type="input" name="HMI_MessageDisplay"/><function position="middle" type="NE"><input name="IN1"/><output name="1"/></function><analog type="output" name="MessageActive"/></row>
		<row><analog type="input" name="0"/><function position="bottom" type="NE"><input name="IN2"/></function><empty/></row>
	</network>
	<network label="" comment="Message Display Is Only Visible When A Message Is Active" row="3" column="0">
		<row><contact type="open" name="MessageActive"/><function position="top" type="SEL"><input name="G"/><output name="20"/></function><analog type="output" name="MessageStatus"/></row>
		<row><analog type="input" name="1"/><function position="middle" type="SEL"><input name="IN0"/></function><empty/></row>
		<row><analog type="input" name="0"/><function position="bottom" type="SEL"><input name="IN1"/></function><empty/></row>
	</network>
</networks>
END_PROGRAM









































































