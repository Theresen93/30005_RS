(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: Message_1
 * File: Message_1Cyclic.ld
 * Author: pkiel
 * Created: October 16, 2009
 ********************************************************************
 * Implementation of program Message_1
 ********************************************************************)

PROGRAM _CYCLIC































































































<?xml version="1.0"?>
<?AutomationStudio Version=3.0.71?>
<!-- Automation Studio Generated XML Section -->
<networks maxcolumn="0">
	<network label="" comment="Self Reset Timer" row="3" column="0">
		<row><empty/><functionblock position="header" name="TON_0" type="TON"/><empty/></row>
		<row><contact type="open" name="SelfReset"/><functionblock position="top" type="TON"><input name="IN"/><output name="Q"/></functionblock><coil type="reset" name="SelfReset"/></row>
		<row><analog type="input" name="t#3s"/><functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock><empty/></row>
	</network>
	<network label="" comment="Message Display Reset" row="8" column="0">
		<row><contact type="positive transition" name="gAlarmsOK"/><line/><line/><line/><coil type="open" name="MessageReset"/></row>
		<row><contact type="positive transition" name="gMachine_Run" or="true"/><line/><line/><line/><coil type="reset" name="FirstMessage_L1"/></row>
		<row><contact type="positive transition" name="gHMI_Jog_PB" or="true"/><line/><line/><line/><coil type="reset" name="FirstMessage_L2"/></row>
		<row><contact type="negative transition" name="SelfReset" or="true"/><line/><function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function><empty/></row>
		<row><contact type="positive transition" name="gQ_CR_MainPowerOn" or="true"/><analog type="input" name="0"/><function position="bottom" type="MOVE"><input name="IN" extensible="true"/><output name="40"/></function><analog type="output" name="MessageDisplay"/></row>
		<row><contact type="positive transition" name="gAlarmReset" or="true"/><empty/><empty/><empty/><empty/></row>
		<row><contact type="positive transition" name="g_bBundInit_OK" or="true"/><empty/><empty/><empty/><empty/></row>
		<row><contact type="positive transition" name="gMachine_Jog" or="true"/><empty/><empty/><empty/><empty/></row>
	</network>
	<network label="" comment="********** LEVEL 1 MESSAGES **********
(Used For Displaying Alarms)

Message #1: Machine Stop, E-Stop Alarm" row="4" column="0">
		<row><contact type="closed" name="gEStopAlarmsOK"/><contact type="open" name="gQ_CR_MainPowerOn"/><contact type="closed" name="FirstMessage_L1"/><line/><line/><line/><coil type="open" name="Message[1]"/></row>
		<row><contact type="open" name="Message[1]"/><contact type="closed" name="MessageReset"/><line or="true"/><line/><line/><line/><coil type="set" name="FirstMessage_L1"/></row>
		<row><empty/><empty/><empty or="true"/><line/><function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function><empty/></row>
		<row><empty/><empty/><empty/><analog type="input" name="1"/><function position="bottom" type="MOVE"><input name="IN" extensible="true"/><output name="40"/></function><analog type="output" name="MessageDisplay"/></row>
	</network>
	<network label="" comment="Message #2: Machine Stop, Guard Alarm" row="4" column="0">
		<row><contact type="closed" name="gGuardAlarmsOK"/><contact type="open" name="gQ_CR_MainPowerOn"/><contact type="closed" name="FirstMessage_L1"/><line/><line/><line/><coil type="open" name="Message[2]"/></row>
		<row><contact type="open" name="Message[2]"/><contact type="closed" name="MessageReset"/><line or="true"/><line/><line/><line/><coil type="set" name="FirstMessage_L1"/></row>
		<row><empty/><empty/><empty or="true"/><line/><function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function><empty/></row>
		<row><empty/><empty/><empty/><analog type="input" name="2"/><function position="bottom" type="MOVE"><input name="IN" extensible="true"/><output name="40"/></function><analog type="output" name="MessageDisplay"/></row>
	</network>
	<network label="" comment="Message #3: Machine Stop, Motor Alarm" row="4" column="0">
		<row><contact type="closed" name="gMotorAlarmsOK"/><contact type="open" name="gQ_CR_MainPowerOn"/><contact type="closed" name="FirstMessage_L1"/><line/><line/><line/><coil type="open" name="Message[3]"/></row>
		<row><contact type="open" name="Message[3]"/><contact type="closed" name="MessageReset"/><line or="true"/><line/><line/><line/><coil type="set" name="FirstMessage_L1"/></row>
		<row><empty/><empty/><empty or="true"/><line/><function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function><empty/></row>
		<row><empty/><empty/><empty/><analog type="input" name="3"/><function position="bottom" type="MOVE"><input name="IN" extensible="true"/><output name="40"/></function><analog type="output" name="MessageDisplay"/></row>
	</network>
	<network label="" comment="Message #4: Machine Stop, Jam Alarm" row="4" column="0">
		<row><contact type="closed" name="gJamAlarmsOK"/><contact type="open" name="gQ_CR_MainPowerOn"/><contact type="closed" name="FirstMessage_L1"/><line/><line/><line/><coil type="open" name="Message[4]"/></row>
		<row><contact type="open" name="Message[4]"/><contact type="closed" name="MessageReset"/><line or="true"/><line/><line/><line/><coil type="set" name="FirstMessage_L1"/></row>
		<row><empty/><empty/><empty or="true"/><line/><function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function><empty/></row>
		<row><empty/><empty/><empty/><analog type="input" name="4"/><function position="bottom" type="MOVE"><input name="IN" extensible="true"/><output name="40"/></function><analog type="output" name="MessageDisplay"/></row>
	</network>
	<network label="" comment="Message #5: Machine Stop, I/O Alarm" row="4" column="0">
		<row><contact type="closed" name="gIOAlarmsOK"/><contact type="open" name="gQ_CR_MainPowerOn"/><contact type="closed" name="FirstMessage_L1"/><line/><line/><line/><coil type="open" name="Message[5]"/></row>
		<row><contact type="open" name="Message[5]"/><contact type="closed" name="MessageReset"/><line or="true"/><line/><line/><line/><coil type="set" name="FirstMessage_L1"/></row>
		<row><empty/><empty/><empty or="true"/><line/><function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function><empty/></row>
		<row><empty/><empty/><empty/><analog type="input" name="5"/><function position="bottom" type="MOVE"><input name="IN" extensible="true"/><output name="40"/></function><analog type="output" name="MessageDisplay"/></row>
	</network>
	<network label="" comment="Message #6: Machine Stop, Web Break" row="4" column="0">
		<row><contact type="closed" name="gWebBreakAlarmsOK"/><contact type="open" name="gQ_CR_MainPowerOn"/><contact type="closed" name="FirstMessage_L1"/><line/><line/><line/><coil type="open" name="Message[6]"/></row>
		<row><contact type="open" name="Message[6]"/><contact type="closed" name="MessageReset"/><line or="true"/><line/><line/><line/><coil type="set" name="FirstMessage_L1"/></row>
		<row><empty/><empty/><empty or="true"/><line/><function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function><empty/></row>
		<row><empty/><empty/><empty/><analog type="input" name="6"/><function position="bottom" type="MOVE"><input name="IN" extensible="true"/><output name="40"/></function><analog type="output" name="MessageDisplay"/></row>
	</network>
	<network label="" comment="Message #30: Machine Stop, General alarm (230V Supply, Air, ...)" row="4" column="0">
		<row><contact type="closed" name="g_bGenAlarmsOK"/><contact type="open" name="gQ_CR_MainPowerOn"/><contact type="closed" name="FirstMessage_L1"/><line/><line/><line/><coil type="open" name="Message[30]"/></row>
		<row><contact type="open" name="Message[30]"/><contact type="closed" name="MessageReset"/><line or="true"/><line/><line/><line/><coil type="set" name="FirstMessage_L1"/></row>
		<row><empty/><empty/><empty or="true"/><line/><function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function><empty/></row>
		<row><empty/><empty/><empty/><analog type="input" name="30"/><function position="bottom" type="MOVE"><input name="IN" extensible="true"/><output name="40"/></function><analog type="output" name="MessageDisplay"/></row>
	</network>
	<network label="" comment="********** LEVEL 2 MESSAGES **********
(Used For Displaying Machine Stops/Shutdowns)

Level 2 Permissives" row="1" column="0">
		<row><contact type="closed" name="FirstMessage_L1"/><contact type="open" name="gAlarmsOK"/><coil type="open" name="Permissive_L2"/></row>
	</network>
	<network label="" comment="Message #21: Machine Stop, Unwind + Flexo Stop PB" row="4" column="0">
		<row><contact type="closed" name="gI_StopPB_1"/><contact type="closed" name="FirstMessage_L2"/><contact type="open" name="Permissive_L2"/><line/><line/><coil type="open" name="Message[21]"/></row>
		<row><contact type="open" name="Message[21]"/><contact type="closed" name="MessageReset" or="true"/><empty or="true"/><line/><line/><coil type="set" name="FirstMessage_L2"/></row>
		<row><empty/><empty/><empty or="true"/><function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function><empty/></row>
		<row><empty/><empty/><analog type="input" name="21"/><function position="bottom" type="MOVE"><input name="IN" extensible="true"/><output name="40"/></function><analog type="output" name="MessageDisplay"/></row>
	</network>
	<network label="" comment="Message #22: Machine Stop, RS Stop PB" row="4" column="0">
		<row><contact type="closed" name="gI_StopPB_2"/><contact type="closed" name="FirstMessage_L2"/><contact type="open" name="Permissive_L2"/><line/><line/><coil type="open" name="Message[22]"/></row>
		<row><contact type="open" name="Message[22]"/><contact type="closed" name="MessageReset" or="true"/><empty or="true"/><line/><line/><coil type="set" name="FirstMessage_L2"/></row>
		<row><empty/><empty/><empty or="true"/><function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function><empty/></row>
		<row><empty/><empty/><analog type="input" name="22"/><function position="bottom" type="MOVE"><input name="IN" extensible="true"/><output name="40"/></function><analog type="output" name="MessageDisplay"/></row>
	</network>
	<network label="" comment="Message #23: Machine Stop, Main Operator Station Stop PB" row="4" column="0">
		<row><contact type="closed" name="gI_StopPB_3"/><contact type="closed" name="FirstMessage_L2"/><contact type="open" name="Permissive_L2"/><line/><line/><coil type="open" name="Message[23]"/></row>
		<row><contact type="open" name="Message[23]"/><contact type="closed" name="MessageReset" or="true"/><empty or="true"/><line/><line/><coil type="set" name="FirstMessage_L2"/></row>
		<row><empty/><empty/><empty or="true"/><function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function><empty/></row>
		<row><empty/><empty/><analog type="input" name="23"/><function position="bottom" type="MOVE"><input name="IN" extensible="true"/><output name="40"/></function><analog type="output" name="MessageDisplay"/></row>
	</network>
	<network label="" comment="Message #24: Machine Stop, Main Operator Station HMI Stop PB" row="4" column="0">
		<row><contact type="open" name="gHMI_Stop_PB"/><contact type="closed" name="FirstMessage_L2"/><contact type="open" name="Permissive_L2"/><line/><line/><coil type="open" name="Message[24]"/></row>
		<row><contact type="open" name="Message[24]"/><contact type="closed" name="MessageReset" or="true"/><empty or="true"/><line/><line/><coil type="set" name="FirstMessage_L2"/></row>
		<row><empty/><empty/><empty or="true"/><function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function><empty/></row>
		<row><empty/><empty/><analog type="input" name="24"/><function position="bottom" type="MOVE"><input name="IN" extensible="true"/><output name="40"/></function><analog type="output" name="MessageDisplay"/></row>
	</network>
	<network label="" comment="Message #25: Machine Stop, Unwind Low Roll Stop" row="4" column="0">
		<row><contact type="open" name="gUnwindLowRoll_Stop"/><contact type="closed" name="FirstMessage_L2"/><contact type="open" name="Permissive_L2"/><line/><line/><coil type="open" name="Message[25]"/></row>
		<row><contact type="open" name="Message[25]"/><contact type="closed" name="MessageReset" or="true"/><empty or="true"/><line/><line/><coil type="set" name="FirstMessage_L2"/></row>
		<row><empty/><empty/><empty or="true"/><function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function><empty/></row>
		<row><empty/><empty/><analog type="input" name="25"/><function position="bottom" type="MOVE"><input name="IN" extensible="true"/><output name="40"/></function><analog type="output" name="MessageDisplay"/></row>
	</network>
	<network label="" comment="Message #26: Machine Stop, Registration Missed Mark Shutdown" row="4" column="0">
		<row><contact type="open" name="gReg[5].ShutdownMissedMark"/><contact type="closed" name="FirstMessage_L2"/><contact type="open" name="Permissive_L2"/><line/><line/><coil type="open" name="Message[26]"/></row>
		<row><contact type="open" name="Message[26]"/><contact type="closed" name="MessageReset" or="true"/><empty or="true"/><line/><line/><coil type="set" name="FirstMessage_L2"/></row>
		<row><empty/><empty/><empty or="true"/><function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function><empty/></row>
		<row><empty/><empty/><analog type="input" name="26"/><function position="bottom" type="MOVE"><input name="IN" extensible="true"/><output name="40"/></function><analog type="output" name="MessageDisplay"/></row>
	</network>
	<network label="" comment="Message #27: Machine Stop, Registration Out Of Tolerance Shutdown" row="4" column="0">
		<row><contact type="open" name="gReg[5].ShutdownOutOfTolerance"/><contact type="closed" name="FirstMessage_L2"/><contact type="open" name="Permissive_L2"/><line/><line/><coil type="open" name="Message[27]"/></row>
		<row><contact type="open" name="Message[27]"/><contact type="closed" name="MessageReset" or="true"/><empty or="true"/><line/><line/><coil type="set" name="FirstMessage_L2"/></row>
		<row><empty/><empty/><empty or="true"/><function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function><empty/></row>
		<row><empty/><empty/><analog type="input" name="27"/><function position="bottom" type="MOVE"><input name="IN" extensible="true"/><output name="40"/></function><analog type="output" name="MessageDisplay"/></row>
	</network>
	<network label="" comment="Message #28: Machine Stop, Fast Stop PB" row="4" column="0">
		<row><contact type="closed" name="gI_FstopPB_1"/><contact type="closed" name="FirstMessage_L2"/><contact type="open" name="Permissive_L2"/><line/><line/><coil type="open" name="Message[28]"/></row>
		<row><contact type="open" name="Message[28]"/><contact type="closed" name="MessageReset" or="true"/><empty or="true"/><line/><line/><coil type="set" name="FirstMessage_L2"/></row>
		<row><empty/><empty/><empty or="true"/><function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function><empty/></row>
		<row><empty/><empty/><analog type="input" name="28"/><function position="bottom" type="MOVE"><input name="IN" extensible="true"/><output name="40"/></function><analog type="output" name="MessageDisplay"/></row>
	</network>
	<network label="" comment="Message #29: Machine Stop, Bundler Stop PB" row="4" column="0">
		<row><contact type="closed" name="gI_Bund_Stop"/><contact type="closed" name="FirstMessage_L2"/><contact type="open" name="Permissive_L2"/><contact type="open" name="g_bIndSelBundProd"/><line/><line/><coil type="open" name="Message[29]"/></row>
		<row><contact type="open" name="Message[29]"/><contact type="closed" name="MessageReset" or="true"/><empty/><empty or="true"/><line/><line/><coil type="set" name="FirstMessage_L2"/></row>
		<row><empty/><empty/><empty/><empty or="true"/><function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function><empty/></row>
		<row><empty/><empty/><empty/><analog type="input" name="29"/><function position="bottom" type="MOVE"><input name="IN" extensible="true"/><output name="40"/></function><analog type="output" name="MessageDisplay"/></row>
	</network>
	<network label="" comment="********** LEVEL 3 MESSAGES **********
(Used For Displaying General Warning Messages That Are Automatically Reset After 3 Seconds)

Level 3 Permissives" row="1" column="0">
		<row><contact type="closed" name="FirstMessage_L1"/><contact type="closed" name="FirstMessage_L2"/><contact type="open" name="gAlarmsOK"/><coil type="open" name="Permissive_L3"/></row>
	</network>
	<network label="" comment="Message #51: Permissive Failure, " row="4" column="0">
		<row><contact type="open" name="gHMI_Run_PB"/><contact type="open" name="SparePermissive"/><contact type="open" name="Permissive_L3"/><line/><line/><coil type="open" name="Message[51]"/></row>
		<row><contact type="open" name="gI_PB_MachineStart" or="true"/><empty or="true"/><empty or="true"/><line/><line/><coil type="set" name="SelfReset"/></row>
		<row><contact type="open" name="Message[51]"/><contact type="closed" name="MessageReset" or="true"/><empty or="true"/><function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function><empty/></row>
		<row><empty/><empty/><analog type="input" name="51"/><function position="bottom" type="MOVE"><input name="IN" extensible="true"/><output name="40"/></function><analog type="output" name="MessageDisplay"/></row>
	</network>
	<network label="" comment="Message #98: System Drive Power Off" row="3" column="0">
		<row><contact type="closed" name="g_bBundInit_OK"/><line/><line/><coil type="open" name="Message[98]"/></row>
		<row><empty or="true"/><function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function><empty/></row>
		<row><analog type="input" name="98"/><function position="bottom" type="MOVE"><input name="IN" extensible="true"/><output name="40"/></function><analog type="output" name="MessageDisplay"/></row>
	</network>
	<network label="" comment="Message #99: System Drive Power Off" row="3" column="0">
		<row><contact type="open" name="gPowerUp_Complete"/><contact type="closed" name="gQ_CR_MainPowerOn"/><line/><line/><coil type="open" name="Message[99]"/></row>
		<row><empty/><empty or="true"/><function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function><empty/></row>
		<row><empty/><analog type="input" name="99"/><function position="bottom" type="MOVE"><input name="IN" extensible="true"/><output name="40"/></function><analog type="output" name="MessageDisplay"/></row>
	</network>
	<network label="" comment="Message #100: Power Up Sequence Active" row="3" column="0">
		<row><contact type="closed" name="gPowerUp_Complete"/><line/><line/><coil type="open" name="Message[100]"/></row>
		<row><empty or="true"/><function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function><empty/></row>
		<row><analog type="input" name="100"/><function position="bottom" type="MOVE"><input name="IN" extensible="true"/><output name="40"/></function><analog type="output" name="MessageDisplay"/></row>
	</network>
	<network label="" comment="Send Message Display Value to HMI
     This is done to prevent the &quot;flashing&quot; effect when a message reset is attempted" row="2" column="0">
		<row><line/><function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function><empty/></row>
		<row><analog type="input" name="MessageDisplay"/><function position="bottom" type="MOVE"><input name="IN" extensible="true"/><output name="40"/></function><analog type="output" name="HMI_MessageDisplay"/></row>
	</network>
	<network label="" comment="Determine If A Message Is Active" row="3" column="0">
		<row><line/><function position="top" type="NE"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function><empty/></row>
		<row><analog type="input" name="HMI_MessageDisplay"/><function position="middle" type="NE"><input name="IN1"/><output name="1"/></function><analog type="output" name="MessageActive"/></row>
		<row><analog type="input" name="0"/><function position="bottom" type="NE"><input name="IN2"/></function><empty/></row>
	</network>
	<network label="" comment="Message Display Is Only Visible When A Message Is Active" row="3" column="0">
		<row><contact type="open" name="MessageActive"/><function position="top" type="SEL"><input name="G"/><output name="40"/></function><analog type="output" name="MessageStatus"/></row>
		<row><analog type="input" name="1"/><function position="middle" type="SEL"><input name="IN0"/></function><empty/></row>
		<row><analog type="input" name="0"/><function position="bottom" type="SEL"><input name="IN1"/></function><empty/></row>
	</network>
	<network label="" comment="Message Display Color Indicator For HMI" row="6" column="0">
		<row><empty/><empty/><functionblock position="header" name="HGW_2StateIND_0" type="HGW_2StateIND"/><empty/></row>
		<row><contact type="open" name="gAlarmsOK"/><line/><functionblock position="top" type="HGW_2StateIND"><input name="In_State"/><output name="Text_Ind"/></functionblock><empty/></row>
		<row><contact type="closed" name="gPowerUp_Complete" or="true"/><analog type="input" name="gRed"/><functionblock position="middle" type="HGW_2StateIND"><input name="BackColor_State0"/><output name="Color_Ind"/></functionblock><analog type="output" name="MessageColor_Ind"/></row>
		<row><empty/><analog type="input" name="gBlack"/><functionblock position="middle" type="HGW_2StateIND"><input name="ForeColor_State0"/><output name="State0"/></functionblock><empty/></row>
		<row><empty/><analog type="input" name="gYellow"/><functionblock position="middle" type="HGW_2StateIND"><input name="BackColor_State1"/><output name="State1"/></functionblock><empty/></row>
		<row><empty/><analog type="input" name="gBlack"/><functionblock position="bottom" type="HGW_2StateIND"><input name="ForeColor_State1"/></functionblock><empty/></row>
	</network>
</networks>
END_PROGRAM































































































