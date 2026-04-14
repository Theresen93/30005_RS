(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: MainAlarms
 * File: MainAlarmsCyclic.ld
 * Author: pkiel
 * Created: October 13, 2009
 ********************************************************************
 * Implementation of program MainAlarms
 ********************************************************************)

PROGRAM _CYCLIC












































<?xml version="1.0"?>
<?AutomationStudio Version=3.0.71?>
<!-- Automation Studio Generated XML Section -->
<networks maxcolumn="0">
	<network label="" comment="***** E-STOP ALARM SECTION *****

Main E-Stop Monitor" row="6" column="0">
		<row><empty/><functionblock position="header" name="HGW_2StateIND_0" type="HGW_2StateIND"/><empty/></row>
		<row><contact type="open" name="gBagMachine_EstopAlarmsOK"/><functionblock position="top" type="HGW_2StateIND"><input name="In_State"/><output name="Text_Ind"/></functionblock><empty/></row>
		<row><analog type="input" name="gRed"/><functionblock position="middle" type="HGW_2StateIND"><input name="BackColor_State0"/><output name="Color_Ind"/></functionblock><analog type="output" name="EStopAlarmColor_Ind"/></row>
		<row><analog type="input" name="gBlack"/><functionblock position="middle" type="HGW_2StateIND"><input name="ForeColor_State0"/><output name="State0"/></functionblock><empty/></row>
		<row><analog type="input" name="gGreen"/><functionblock position="middle" type="HGW_2StateIND"><input name="BackColor_State1"/><output name="State1"/></functionblock><coil type="open" name="gEStopAlarmsOK"/></row>
		<row><analog type="input" name="gBlack"/><functionblock position="bottom" type="HGW_2StateIND"><input name="ForeColor_State1"/></functionblock><empty/></row>
	</network>
	<network label="" comment="***** GUARD ALARM SECTION *****

Main Guard Monitor" row="6" column="0">
		<row><empty/><functionblock position="header" name="HGW_2StateIND_1" type="HGW_2StateIND"/><empty/></row>
		<row><contact type="open" name="gBagMachine_GuardAlarmsOK"/><functionblock position="top" type="HGW_2StateIND"><input name="In_State"/><output name="Text_Ind"/></functionblock><empty/></row>
		<row><analog type="input" name="gRed"/><functionblock position="middle" type="HGW_2StateIND"><input name="BackColor_State0"/><output name="Color_Ind"/></functionblock><analog type="output" name="GuardAlarmColor_Ind"/></row>
		<row><analog type="input" name="gBlack"/><functionblock position="middle" type="HGW_2StateIND"><input name="ForeColor_State0"/><output name="State0"/></functionblock><empty/></row>
		<row><analog type="input" name="gGreen"/><functionblock position="middle" type="HGW_2StateIND"><input name="BackColor_State1"/><output name="State1"/></functionblock><coil type="open" name="gGuardAlarmsOK"/></row>
		<row><analog type="input" name="gBlack"/><functionblock position="bottom" type="HGW_2StateIND"><input name="ForeColor_State1"/></functionblock><empty/></row>
	</network>
	<network label="" comment="***** MOTOR ALARM SECTION *****

Main Motor Monitor" row="6" column="0">
		<row><empty/><functionblock position="header" name="HGW_2StateIND_2" type="HGW_2StateIND"/><empty/></row>
		<row><contact type="open" name="gBagMachine_MotorAlarmsOK"/><functionblock position="top" type="HGW_2StateIND"><input name="In_State"/><output name="Text_Ind"/></functionblock><empty/></row>
		<row><analog type="input" name="gRed"/><functionblock position="middle" type="HGW_2StateIND"><input name="BackColor_State0"/><output name="Color_Ind"/></functionblock><analog type="output" name="MotorAlarmColor_Ind"/></row>
		<row><analog type="input" name="gBlack"/><functionblock position="middle" type="HGW_2StateIND"><input name="ForeColor_State0"/><output name="State0"/></functionblock><empty/></row>
		<row><analog type="input" name="gGreen"/><functionblock position="middle" type="HGW_2StateIND"><input name="BackColor_State1"/><output name="State1"/></functionblock><coil type="open" name="gMotorAlarmsOK"/></row>
		<row><analog type="input" name="gBlack"/><functionblock position="bottom" type="HGW_2StateIND"><input name="ForeColor_State1"/></functionblock><empty/></row>
	</network>
	<network label="" comment="***** JAM ALARM SECTION *****

Main Jam Monitor" row="6" column="0">
		<row><empty/><functionblock position="header" name="HGW_2StateIND_3" type="HGW_2StateIND"/><empty/></row>
		<row><contact type="open" name="gBagMachine_JamAlarmsOK"/><functionblock position="top" type="HGW_2StateIND"><input name="In_State"/><output name="Text_Ind"/></functionblock><empty/></row>
		<row><analog type="input" name="gRed"/><functionblock position="middle" type="HGW_2StateIND"><input name="BackColor_State0"/><output name="Color_Ind"/></functionblock><analog type="output" name="JamAlarmColor_Ind"/></row>
		<row><analog type="input" name="gBlack"/><functionblock position="middle" type="HGW_2StateIND"><input name="ForeColor_State0"/><output name="State0"/></functionblock><empty/></row>
		<row><analog type="input" name="gGreen"/><functionblock position="middle" type="HGW_2StateIND"><input name="BackColor_State1"/><output name="State1"/></functionblock><coil type="open" name="gJamAlarmsOK"/></row>
		<row><analog type="input" name="gBlack"/><functionblock position="bottom" type="HGW_2StateIND"><input name="ForeColor_State1"/></functionblock><empty/></row>
	</network>
	<network label="" comment="***** I/O ALARM SECTION *****

Main I/O Monitor" row="6" column="0">
		<row><empty/><functionblock position="header" name="HGW_2StateIND_4" type="HGW_2StateIND"/><empty/></row>
		<row><contact type="open" name="gBagMachine_IOAlarmsOK"/><functionblock position="top" type="HGW_2StateIND"><input name="In_State"/><output name="Text_Ind"/></functionblock><empty/></row>
		<row><analog type="input" name="gRed"/><functionblock position="middle" type="HGW_2StateIND"><input name="BackColor_State0"/><output name="Color_Ind"/></functionblock><analog type="output" name="IOAlarmColor_Ind"/></row>
		<row><analog type="input" name="gBlack"/><functionblock position="middle" type="HGW_2StateIND"><input name="ForeColor_State0"/><output name="State0"/></functionblock><empty/></row>
		<row><analog type="input" name="gGreen"/><functionblock position="middle" type="HGW_2StateIND"><input name="BackColor_State1"/><output name="State1"/></functionblock><coil type="open" name="gIOAlarmsOK"/></row>
		<row><analog type="input" name="gBlack"/><functionblock position="bottom" type="HGW_2StateIND"><input name="ForeColor_State1"/></functionblock><empty/></row>
	</network>
	<network label="" comment="***** WEB BRAKE ALARM SECTION *****

Main Web Brake Monitor" row="6" column="0">
		<row><empty/><functionblock position="header" name="HGW_2StateIND_5" type="HGW_2StateIND"/><empty/></row>
		<row><contact type="open" name="gBagMachine_WebBreakOK"/><functionblock position="top" type="HGW_2StateIND"><input name="In_State"/><output name="Text_Ind"/></functionblock><empty/></row>
		<row><analog type="input" name="gRed"/><functionblock position="middle" type="HGW_2StateIND"><input name="BackColor_State0"/><output name="Color_Ind"/></functionblock><analog type="output" name="IOAlarmColor_Ind"/></row>
		<row><analog type="input" name="gBlack"/><functionblock position="middle" type="HGW_2StateIND"><input name="ForeColor_State0"/><output name="State0"/></functionblock><empty/></row>
		<row><analog type="input" name="gGreen"/><functionblock position="middle" type="HGW_2StateIND"><input name="BackColor_State1"/><output name="State1"/></functionblock><coil type="open" name="gWebBreakAlarmsOK"/></row>
		<row><analog type="input" name="gBlack"/><functionblock position="bottom" type="HGW_2StateIND"><input name="ForeColor_State1"/></functionblock><empty/></row>
	</network>
	<network label="" comment="***** GENERAL RS ALARM SECTION *****

Alarm Monitor" row="6" column="0">
		<row><empty/><functionblock position="header" name="HGW_2StateIND_5" type="HGW_2StateIND"/><empty/></row>
		<row><contact type="open" name="g_bBagMachine_GenAlarmsOK"/><functionblock position="top" type="HGW_2StateIND"><input name="In_State"/><output name="Text_Ind"/></functionblock><empty/></row>
		<row><analog type="input" name="gRed"/><functionblock position="middle" type="HGW_2StateIND"><input name="BackColor_State0"/><output name="Color_Ind"/></functionblock><analog type="output" name="IOAlarmColor_Ind"/></row>
		<row><analog type="input" name="gBlack"/><functionblock position="middle" type="HGW_2StateIND"><input name="ForeColor_State0"/><output name="State0"/></functionblock><empty/></row>
		<row><analog type="input" name="gGreen"/><functionblock position="middle" type="HGW_2StateIND"><input name="BackColor_State1"/><output name="State1"/></functionblock><coil type="open" name="g_bGenAlarmsOK"/></row>
		<row><analog type="input" name="gBlack"/><functionblock position="bottom" type="HGW_2StateIND"><input name="ForeColor_State1"/></functionblock><empty/></row>
	</network>
	<network label="" comment="Main Alarm String" row="2" column="0">
		<row><contact type="open" name="gEStopAlarmsOK"/><contact type="open" name="gGuardAlarmsOK"/><contact type="open" name="gMotorAlarmsOK"/><contact type="open" name="g_bGenAlarmsOK"/><contact type="open" name="gWebBreakAlarmsOK"/><contact type="open" name="gJamAlarmsOK"/><contact type="open" name="g_bBundAlarm_OK"/><contact type="open" name="g_bBagMachine_EndReelAlarmsOK"/><contact type="open" name="g_bBagMachine_DryerAlarmsOK"/><contact type="open" name="g_bBagMachine_CamProfCalcOK"/><contact type="open" name="gIOAlarmsOK"/><coil type="open" name="gAlarmsOK"/></row>
		<row><empty/><empty/><empty/><empty/><empty/><empty/><empty/><empty/><empty/><empty/><empty or="true"/><coil type="negated" name="gQ_PL_GenFailure"/></row>
	</network>
	<network label="" comment="General Faults OK (Used for machine stop decel)" row="1" column="0">
		<row><contact type="open" name="gMotorAlarmsOK"/><contact type="open" name="g_bGenAlarmsOK"/><contact type="open" name="gJamAlarmsOK"/><contact type="open" name="gIOAlarmsOK"/><coil type="open" name="gGeneralFaults_OK"/></row>
	</network>
	<network label="" comment="Alarm Indicator For HMI
Note: Alarm Button Flashes Yellow/Red When Any Alarm Is Active." row="8" column="0">
		<row><empty/><functionblock position="header" name="HGW_2StateIND1_0" type="HGW_2StateIND1"/><empty/></row>
		<row><contact type="open" name="gAlarmsOK"/><functionblock position="top" type="HGW_2StateIND1"><input name="In_State"/><output name="Text_Ind"/></functionblock><analog type="output" name="AlarmVisibility_Ind"/></row>
		<row><analog type="input" name="gYellow"/><functionblock position="middle" type="HGW_2StateIND1"><input name="BackColorFlash_Off"/><output name="Color_Ind"/></functionblock><analog type="output" name="AlarmColor_Ind"/></row>
		<row><analog type="input" name="gBlack"/><functionblock position="middle" type="HGW_2StateIND1"><input name="ForeColorFlash_Off"/><output name="State0"/></functionblock><empty/></row>
		<row><analog type="input" name="gRed"/><functionblock position="middle" type="HGW_2StateIND1"><input name="BackColorFlash_On"/><output name="State1"/></functionblock><empty/></row>
		<row><analog type="input" name="gBlack"/><functionblock position="middle" type="HGW_2StateIND1"><input name="ForeColorFlash_On"/></functionblock><empty/></row>
		<row><analog type="input" name="gPurple"/><functionblock position="middle" type="HGW_2StateIND1"><input name="BackColor_State1"/></functionblock><empty/></row>
		<row><analog type="input" name="gBlack"/><functionblock position="bottom" type="HGW_2StateIND1"><input name="ForeColor_State1"/></functionblock><empty/></row>
	</network>
	<network label="" comment="Force HMI to Alarm Screen When An Alarm Occurs" row="3" column="0">
		<row><contact type="negative transition" name="gAlarmsOK"/><line/><line/><coil type="set" name="gHMI_GoToAlarm_PB"/></row>
		<row><empty or="true"/><function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function><empty/></row>
		<row><analog type="input" name="gCurrentScreen"/><function position="bottom" type="MOVE"><input name="IN" extensible="true"/><output name="40"/></function><analog type="output" name="LastScreen"/></row>
	</network>
	<network label="" comment="Is Alarm Screen Active?" row="2" column="0">
		<row><analog type="input" name="gCurrentScreen"/><function position="top" type="EQ"><input name="IN1" extensible="true"/><output name="1"/></function><coil type="open" name="AlarmScreenActive"/></row>
		<row><analog type="input" name="30"/><function position="bottom" type="EQ"><input name="IN2" extensible="true"/></function><empty/></row>
	</network>
	<network label="" comment="Is Last Screen Data For Bag Machine HMI OK?" row="3" column="0">
		<row><line/><function position="top" type="GT"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function><empty/></row>
		<row><analog type="input" name="LastScreen"/><function position="middle" type="GT"><input name="IN1" extensible="true"/><output name="1"/></function><analog type="output" name="LastScreenOK"/></row>
		<row><analog type="input" name="0"/><function position="bottom" type="GT"><input name="IN2" extensible="true"/></function><empty/></row>
	</network>
	<network label="" comment="If Still on Alarm Screen, Force Screen Back To Last Screen" row="2" column="0">
		<row><contact type="open" name="AlarmScreenActive"/><contact type="open" name="LastScreenOK"/><contact type="positive transition" name="gAlarmsOK"/><function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function><empty/></row>
		<row><empty/><empty/><analog type="input" name="LastScreen"/><function position="bottom" type="MOVE"><input name="IN" extensible="true"/><output name="40"/></function><analog type="output" name="gScreenControl"/></row>
	</network>
</networks>
END_PROGRAM












































