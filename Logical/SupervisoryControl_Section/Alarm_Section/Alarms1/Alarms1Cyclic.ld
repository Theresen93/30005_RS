(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: Alarms1
 * File: Alarms1Cyclic.ld
 * Author: pkiel
 * Created: September 22, 2009
 ********************************************************************
 * Implementation of program Alarms1
 ********************************************************************)

PROGRAM _CYCLIC



















































































































































































































































































































































































































<?xml version="1.0"?>
<?AutomationStudio Version=3.0.71?>
<!-- Automation Studio Generated XML Section -->
<networks maxcolumn="0">
	<network label="" comment="***** E-STOP ALARM SECTION *****

Alarm #1:  E-Stop PB" row="2" column="0">
		<row><contact type="open" name="gI_EstopPB_1"/><line/><coil type="open" name="Alarm1[1]"/></row>
		<row><contact type="open" name="Alarm1[1]"/><contact type="closed" name="gAlarmReset" or="true"/><empty/></row>
	</network>
	<network label="" comment="Alarm #2: Unwind E-Stop PB" row="2" column="0">
		<row><contact type="open" name="gI_EstopPB_Unwind"/><line/><coil type="open" name="Alarm1[2]"/></row>
		<row><contact type="open" name="Alarm1[2]"/><contact type="closed" name="gAlarmReset" or="true"/><empty/></row>
	</network>
	<network label="" comment="Alarm #3: E-Stop PB" row="2" column="0">
		<row><contact type="open" name="gI_EstopPB_2"/><line/><coil type="open" name="Alarm1[3]"/></row>
		<row><contact type="open" name="Alarm1[3]"/><contact type="closed" name="gAlarmReset" or="true"/><empty/></row>
	</network>
	<network label="" comment="Alarm #4: E-Stop PB" row="2" column="0">
		<row><contact type="open" name="gI_EstopPB_3"/><line/><coil type="open" name="Alarm1[4]"/></row>
		<row><contact type="open" name="Alarm1[4]"/><contact type="closed" name="gAlarmReset" or="true"/><empty/></row>
	</network>
	<network label="" comment="Alarm #5: E-Stop PB" row="2" column="0">
		<row><contact type="open" name="gI_EstopPB_4"/><line/><coil type="open" name="Alarm1[5]"/></row>
		<row><contact type="open" name="Alarm1[5]"/><contact type="closed" name="gAlarmReset" or="true"/><empty/></row>
	</network>
	<network label="" comment="Alarm #6: E-Stop PB" row="2" column="0">
		<row><contact type="open" name="gI_EstopPB_5"/><line/><coil type="open" name="Alarm1[6]"/></row>
		<row><contact type="open" name="Alarm1[6]"/><contact type="closed" name="gAlarmReset" or="true"/><empty/></row>
	</network>
	<network label="" comment="Alarm #7: Safety E-Stop Relay Fault" row="2" column="0">
		<row><contact type="closed" name="gI_SafetyRelay_EStopOK"/><line/><coil type="open" name="Alarm1[7]"/></row>
		<row><contact type="open" name="Alarm1[7]"/><contact type="closed" name="gAlarmReset" or="true"/><coil type="open" name="g_bIndEStop"/></row>
	</network>
	<network label="" comment="Alarm #20: E-Stop on FootSwitch Jog" row="2" column="0">
		<row><contact type="open" name="gI_JogPB_1"/><contact type="closed" name="gI_SafetyRelay_EStopOK"/><coil type="open" name="Alarm1[20]"/></row>
		<row><contact type="open" name="Alarm1[20]"/><contact type="closed" name="gAlarmReset" or="true"/><empty/></row>
	</network>
	<network label="" comment="Alarm #10: EStop PB Bundler " row="2" column="0">
		<row><contact type="open" name="gI_Bund_EStopPB"/><line/><coil type="open" name="Alarm1[10]"/></row>
		<row><contact type="open" name="Alarm1[10]"/><contact type="closed" name="gAlarmReset" or="true"/><empty/></row>
	</network>
	<network label="" comment="" row="2" column="0">
		<row><contact type="closed" name="gI_SafetyRelay_EStopOK"/><contact type="closed" name="gA[9].Ind_InMotion"/><line/><line/><line/><line/><line/><line/><line/><line/><line/><line/><line/><line/><coil type="open" name="g_bIndEStopStandstill"/></row>
		<row><contact type="open" name="g_bIndEStopStandstill"/><contact type="closed" name="gAlarmReset"/><contact type="closed" name="gA[1].Ind_Enabled"/><contact type="closed" name="gA[11].Ind_Enabled"/><contact type="closed" name="gA[2].Ind_Enabled"/><contact type="closed" name="gA[3].Ind_Enabled"/><contact type="closed" name="gA[4].Ind_Enabled"/><contact type="closed" name="gA[5].Ind_Enabled"/><contact type="closed" name="gA[6].Ind_Enabled"/><contact type="closed" name="gA[7].Ind_Enabled"/><contact type="closed" name="gA[8].Ind_Enabled"/><contact type="closed" name="gA[12].Ind_Enabled"/><contact type="closed" name="gA[13].Ind_Enabled"/><contact type="closed" name="gA[15].Ind_Enabled" or="true"/><empty/></row>
	</network>
	<network label="" comment="Alarm #80: EStop PB on Flexo Press" row="2" column="0">
		<row><contact type="open" name="FALSE"/><line/><coil type="open" name="Alarm1[80]"/></row>
		<row><contact type="open" name="Alarm1[80]"/><contact type="closed" name="gAlarmReset" or="true"/><empty/></row>
	</network>
	<network label="" comment="Alarm #81: EStop PB on 3-Web Unit" row="2" column="0">
		<row><contact type="open" name="gI_3W_EStopPB"/><contact type="open" name="g_b3WebUnitInMach"/><coil type="open" name="Alarm1[81]"/></row>
		<row><contact type="open" name="Alarm1[81]"/><contact type="closed" name="gAlarmReset" or="true"/><empty/></row>
	</network>
	<network label="" comment="Alarm #82: EStop PB on Hot Micro Perf" row="2" column="0">
		<row><contact type="open" name="gI_HMP_EStopPB"/><line/><coil type="open" name="Alarm1[82]"/></row>
		<row><contact type="open" name="Alarm1[82]"/><contact type="closed" name="gAlarmReset" or="true"/><empty/></row>
	</network>
	<network label="" comment="E-Stop Alarm String 1" row="1" column="0">
		<row><contact type="closed" name="Alarm1[1]"/><contact type="closed" name="Alarm1[2]"/><contact type="closed" name="Alarm1[3]"/><contact type="closed" name="Alarm1[4]"/><contact type="closed" name="Alarm1[5]"/><contact type="closed" name="Alarm1[6]"/><contact type="closed" name="Alarm1[7]"/><coil type="open" name="EstopString1"/></row>
	</network>
	<network label="" comment="Main E-Stop Alarm String" row="1" column="0">
		<row><contact type="open" name="EstopString1"/><contact type="closed" name="Alarm1[10]"/><contact type="closed" name="g_bIndEStop"/><contact type="closed" name="Alarm1[80]"/><contact type="closed" name="Alarm1[81]"/><coil type="open" name="EstopString2"/></row>
	</network>
	<network label="" comment="Main E-Stop Alarm String" row="1" column="0">
		<row><contact type="open" name="EstopString2"/><contact type="closed" name="Alarm1[82]"/><contact type="closed" name="Alarm1[83]"/><contact type="closed" name="Alarm1[84]"/><contact type="closed" name="Alarm1[85]"/><contact type="closed" name="Alarm1[86]"/><contact type="closed" name="Alarm1[87]"/><coil type="open" name="gBagMachine_EstopAlarmsOK"/></row>
	</network>
	<network label="" comment="***** GUARD ALARM SECTION *****

Guard Alarm Enable Run" row="2" column="0">
		<row><contact type="open" name="gRun_ToZeroSpeed"/><coil type="open" name="GuardAlarmEnable"/></row>
		<row><contact type="closed" name="gNever" or="true"/><empty/></row>
	</network>
	<network label="" comment="Guard Alarm Enable Jog" row="2" column="0">
		<row><contact type="open" name="gJog_ToZeroSpeed"/><coil type="open" name="GuardAlarmEnable1"/></row>
		<row><contact type="closed" name="gNever" or="true"/><empty/></row>
	</network>
	<network label="" comment="Alarm #11: Guard Open" row="3" column="0">
		<row><contact type="open" name="gI_GSW_Door1"/><contact type="open" name="GuardAlarmEnable"/><coil type="open" name="Alarm1[11]"/></row>
		<row><empty or="true"/><contact type="open" name="GuardAlarmEnable1" or="true"/><empty/></row>
		<row><contact type="open" name="Alarm1[11]"/><contact type="closed" name="gAlarmReset" or="true"/><empty/></row>
	</network>
	<network label="" comment="Alarm #12: Guard Open" row="3" column="0">
		<row><contact type="open" name="gI_GSW_Door2"/><contact type="open" name="GuardAlarmEnable"/><coil type="open" name="Alarm1[12]"/></row>
		<row><empty or="true"/><contact type="open" name="GuardAlarmEnable1" or="true"/><empty/></row>
		<row><contact type="open" name="Alarm1[12]"/><contact type="closed" name="gAlarmReset" or="true"/><empty/></row>
	</network>
	<network label="" comment="Alarm #13: Drum Guard Open" row="2" column="0">
		<row><contact type="open" name="gI_GSW_Drum"/><contact type="open" name="GuardAlarmEnable"/><contact type="closed" name="gSetupMode_On"/><coil type="open" name="Alarm1[13]"/></row>
		<row><contact type="open" name="Alarm1[13]"/><contact type="closed" name="gAlarmReset"/><line or="true"/><empty/></row>
	</network>
	<network label="" comment="Alarm #14: Perf Doors Guard Open" row="3" column="0">
		<row><contact type="open" name="gI_GSW_PerfDoors"/><contact type="open" name="GuardAlarmEnable"/><contact type="closed" name="gSetupMode_On"/><coil type="open" name="Alarm1[14]"/></row>
		<row><contact type="open" name="gI_GSW_PerfDoor2" or="true"/><empty/><empty or="true"/><empty/></row>
		<row><contact type="open" name="Alarm1[14]"/><contact type="closed" name="gAlarmReset"/><line or="true"/><empty/></row>
	</network>
	<network label="" comment="Alarm #15: Slitting Door Guard Open" row="2" column="0">
		<row><contact type="open" name="gI_GSW_SlittingDoor"/><contact type="open" name="GuardAlarmEnable"/><contact type="closed" name="gSetupMode_On"/><coil type="open" name="Alarm1[15]"/></row>
		<row><contact type="open" name="Alarm1[15]"/><contact type="closed" name="gAlarmReset"/><line or="true"/><empty/></row>
	</network>
	<network label="" comment="Alarm #16: RS Entry Guard Open" row="3" column="0">
		<row><contact type="open" name="gI_GSW_RSEntry"/><contact type="open" name="GuardAlarmEnable"/><coil type="open" name="Alarm1[16]"/></row>
		<row><empty or="true"/><contact type="open" name="GuardAlarmEnable1" or="true"/><empty/></row>
		<row><contact type="open" name="Alarm1[16]"/><contact type="closed" name="gAlarmReset" or="true"/><empty/></row>
	</network>
	<network label="" comment="Alarm #17: Tearing Guard Open" row="2" column="0">
		<row><contact type="open" name="gI_GSW_Tearing"/><contact type="open" name="GuardAlarmEnable"/><contact type="closed" name="gSetupMode_On"/><coil type="open" name="Alarm1[17]"/></row>
		<row><contact type="open" name="Alarm1[17]"/><contact type="closed" name="gAlarmReset"/><line or="true"/><empty/></row>
	</network>
	<network label="" comment="Alarm #18: Guard Safety Relay Fault" row="3" column="0">
		<row><contact type="closed" name="gI_SafetyRelay_GuardOK"/><contact type="open" name="GuardAlarmEnable"/><coil type="open" name="Alarm1[18]"/></row>
		<row><empty or="true"/><contact type="open" name="GuardAlarmEnable1" or="true"/><empty/></row>
		<row><contact type="open" name="Alarm1[18]"/><contact type="closed" name="gAlarmReset" or="true"/><empty/></row>
	</network>
	<network label="" comment="Alarm #19: Bundler Guard Open" row="3" column="0">
		<row><contact type="closed" name="g_bBundGuard_OK"/><contact type="open" name="GuardAlarmEnable"/><contact type="open" name="g_bIndSelBundProd"/><coil type="open" name="Alarm1[19]"/></row>
		<row><empty or="true"/><contact type="open" name="GuardAlarmEnable1" or="true"/><empty or="true"/><empty/></row>
		<row><contact type="open" name="Alarm1[19]"/><contact type="closed" name="gAlarmReset"/><line or="true"/><empty/></row>
	</network>
	<network label="" comment="Alarm #70: Flexo Press Doors Open" row="3" column="0">
		<row><contact type="open" name="gI_GSW_FP_Doors"/><contact type="open" name="GuardAlarmEnable"/><contact type="open" name="gA[2].bInMach"/><coil type="open" name="Alarm1[70]"/></row>
		<row><empty or="true"/><contact type="open" name="GuardAlarmEnable1" or="true"/><empty or="true"/><empty/></row>
		<row><contact type="open" name="Alarm1[70]"/><contact type="closed" name="gAlarmReset"/><line or="true"/><empty/></row>
	</network>
	<network label="" comment="Alarm #71: Flexo Press Gates Open" row="3" column="0">
		<row><contact type="open" name="gI_GSW_FP_Gates"/><contact type="open" name="GuardAlarmEnable"/><contact type="open" name="gA[2].bInMach"/><contact type="closed" name="gSetupMode_On"/><coil type="open" name="Alarm1[71]"/></row>
		<row><empty or="true"/><contact type="open" name="GuardAlarmEnable1" or="true"/><empty/><empty or="true"/><empty/></row>
		<row><contact type="open" name="Alarm1[71]"/><contact type="closed" name="gAlarmReset"/><line/><line or="true"/><empty/></row>
	</network>
	<network label="" comment="Guard Flexo" row="2" column="0">
		<row><contact type="open" name="Alarm1[70]"/><coil type="open" name="g_bFP_GuardFault"/></row>
		<row><contact type="open" name="Alarm1[71]" or="true"/><empty/></row>
	</network>
	<network label="" comment="Alarm #72: 3-Web Unit Guard Open" row="3" column="0">
		<row><contact type="open" name="gI_GSW_3W"/><contact type="open" name="GuardAlarmEnable"/><contact type="open" name="g_b3WebUnitInMach"/><coil type="open" name="Alarm1[72]"/></row>
		<row><empty or="true"/><contact type="open" name="GuardAlarmEnable1" or="true"/><empty or="true"/><empty/></row>
		<row><contact type="open" name="Alarm1[72]"/><contact type="closed" name="gAlarmReset"/><line or="true"/><empty/></row>
	</network>
	<network label="" comment="Alarm #73: Hot Micro Perforator Guard Open" row="3" column="0">
		<row><contact type="open" name="gI_GSW_HMPerf"/><contact type="open" name="GuardAlarmEnable"/><contact type="open" name="gA[15].bInMach"/><contact type="closed" name="gSetupMode_On"/><coil type="open" name="Alarm1[73]"/></row>
		<row><empty or="true"/><contact type="open" name="GuardAlarmEnable1" or="true"/><empty/><empty or="true"/><empty/></row>
		<row><contact type="open" name="Alarm1[73]"/><contact type="closed" name="gAlarmReset"/><line/><line or="true"/><empty/></row>
	</network>
	<network label="" comment="Alarm #74: Cold Micro Perforator Gates Open" row="3" column="0">
		<row><contact type="open" name="gI_GSW_CMPerfGates"/><contact type="open" name="GuardAlarmEnable"/><contact type="open" name="gA[8].bInMach"/><contact type="closed" name="gSetupMode_On"/><coil type="open" name="Alarm1[74]"/></row>
		<row><empty or="true"/><contact type="open" name="GuardAlarmEnable1" or="true"/><empty/><empty or="true"/><empty/></row>
		<row><contact type="open" name="Alarm1[74]"/><contact type="closed" name="gAlarmReset"/><line/><line or="true"/><empty/></row>
	</network>
	<network label="" comment="Alarm #75: Cold Micro Perforator Gear Door Open" row="3" column="0">
		<row><contact type="open" name="gI_GSW_CMPerfDoor"/><contact type="open" name="GuardAlarmEnable"/><contact type="open" name="gA[8].bInMach"/><coil type="open" name="Alarm1[75]"/></row>
		<row><empty or="true"/><contact type="open" name="GuardAlarmEnable1" or="true"/><empty or="true"/><empty/></row>
		<row><contact type="open" name="Alarm1[75]"/><contact type="closed" name="gAlarmReset"/><line or="true"/><empty/></row>
	</network>
	<network label="" comment="Main Guard Alarm String 1" row="1" column="0">
		<row><contact type="closed" name="Alarm1[11]"/><contact type="closed" name="Alarm1[12]"/><contact type="closed" name="Alarm1[13]"/><contact type="closed" name="Alarm1[14]"/><contact type="closed" name="Alarm1[15]"/><contact type="closed" name="Alarm1[16]"/><contact type="closed" name="Alarm1[17]"/><contact type="closed" name="Alarm1[18]"/><contact type="closed" name="Alarm1[19]"/><coil type="open" name="bGuardString1"/></row>
	</network>
	<network label="" comment="Main Guard Alarm String 2" row="2" column="0">
		<row><contact type="open" name="bGuardString1"/><contact type="closed" name="Alarm1[70]"/><contact type="closed" name="Alarm1[71]"/><contact type="closed" name="Alarm1[72]"/><contact type="closed" name="Alarm1[73]"/><contact type="closed" name="Alarm1[74]"/><contact type="closed" name="Alarm1[75]"/><contact type="closed" name="Alarm1[76]"/><contact type="closed" name="Alarm1[77]"/><coil type="open" name="gBagMachine_GuardAlarmsOK"/></row>
		<row><contact type="open" name="g_bBypassGuard"/><line/><line/><line/><line/><line/><line/><line/><line or="true"/><empty/></row>
	</network>
	<network label="" comment="*****MOTOR ALARM SECTION *****

Alarm #21: Servo Power Supply Fault" row="2" column="0">
		<row><contact type="open" name="gA[0].Error"/><line/><coil type="open" name="Alarm1[21]"/></row>
		<row><contact type="open" name="Alarm1[21]"/><contact type="closed" name="gAlarmReset" or="true"/><empty/></row>
	</network>
	<network label="" comment="Alarm #22: Servo Drive Power Supply Network Initialization Failure" row="2" column="0">
		<row><contact type="open" name="gPowerUp_Complete"/><contact type="closed" name="gA[0].Ind_NetworkInit"/><coil type="open" name="Alarm1[22]"/></row>
		<row><contact type="open" name="Alarm1[22]"/><contact type="closed" name="gAlarmReset" or="true"/><empty/></row>
	</network>
	<network label="" comment="Alarm #23: Perf Servo Fault" row="4" column="0">
		<row><empty/><functionblock position="header" name="TON_1" type="TON"/><empty/><empty/></row>
		<row><contact type="open" name="gA[1].Input_DriveEnable"/><functionblock position="top" type="TON"><input name="IN"/><output name="Q"/></functionblock><contact type="open" name="gA[1].Error"/><coil type="open" name="Alarm1[23]"/></row>
		<row><analog type="input" name="t#1s"/><functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock><empty or="true"/><empty/></row>
		<row><contact type="open" name="Alarm1[23]"/><contact type="closed" name="gAlarmReset"/><line/><line or="true"/><empty/></row>
	</network>
	<network label="" comment="Alarm #24: Perf Drive Network Initialization Failure" row="2" column="0">
		<row><contact type="open" name="gPowerUp_Complete"/><contact type="closed" name="gA[1].Ind_NetworkInit"/><coil type="open" name="Alarm1[24]"/></row>
		<row><contact type="open" name="Alarm1[24]"/><contact type="closed" name="gAlarmReset" or="true"/><empty/></row>
	</network>
	<network label="" comment="Alarm #25: Printer Servo Fault" row="4" column="0">
		<row><empty/><functionblock position="header" name="TON_2" type="TON"/><empty/><empty/></row>
		<row><contact type="open" name="gA[2].Input_DriveEnable"/><functionblock position="top" type="TON"><input name="IN"/><output name="Q"/></functionblock><contact type="open" name="gA[2].Error"/><coil type="open" name="Alarm1[25]"/></row>
		<row><analog type="input" name="t#1s"/><functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock><empty or="true"/><empty/></row>
		<row><contact type="open" name="Alarm1[25]"/><contact type="closed" name="gAlarmReset"/><line/><line or="true"/><empty/></row>
	</network>
	<network label="" comment="Alarm #26: Printer Drive Network Initialization Failure" row="2" column="0">
		<row><contact type="open" name="gPowerUp_Complete"/><contact type="closed" name="gA[2].Ind_NetworkInit"/><contact type="open" name="gNever"/><coil type="open" name="Alarm1[26]"/></row>
		<row><contact type="open" name="Alarm1[26]"/><contact type="closed" name="gAlarmReset" or="true"/><empty/><empty/></row>
	</network>
	<network label="" comment="Alarm #27: Holding (Maintaining) Servo Fault" row="4" column="0">
		<row><empty/><functionblock position="header" name="TON_3" type="TON"/><empty/><empty/></row>
		<row><contact type="open" name="gA[3].Input_DriveEnable"/><functionblock position="top" type="TON"><input name="IN"/><output name="Q"/></functionblock><contact type="open" name="gA[3].Error"/><coil type="open" name="Alarm1[27]"/></row>
		<row><analog type="input" name="t#1s"/><functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock><empty or="true"/><empty/></row>
		<row><contact type="open" name="Alarm1[27]"/><contact type="closed" name="gAlarmReset"/><line/><line or="true"/><empty/></row>
	</network>
	<network label="" comment="Alarm #28: Holding (Maintaining) Drive Network Initialization Failure" row="2" column="0">
		<row><contact type="open" name="gPowerUp_Complete"/><contact type="closed" name="gA[3].Ind_NetworkInit"/><coil type="open" name="Alarm1[28]"/></row>
		<row><contact type="open" name="Alarm1[28]"/><contact type="closed" name="gAlarmReset" or="true"/><empty/></row>
	</network>
	<network label="" comment="Alarm #29: Tearing Servo Fault" row="4" column="0">
		<row><empty/><functionblock position="header" name="TON_4" type="TON"/><empty/><empty/></row>
		<row><contact type="open" name="gA[4].Input_DriveEnable"/><functionblock position="top" type="TON"><input name="IN"/><output name="Q"/></functionblock><contact type="open" name="gA[4].Error"/><coil type="open" name="Alarm1[29]"/></row>
		<row><analog type="input" name="t#1s"/><functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock><empty or="true"/><empty/></row>
		<row><contact type="open" name="Alarm1[29]"/><contact type="closed" name="gAlarmReset"/><line/><line or="true"/><empty/></row>
	</network>
	<network label="" comment="Alarm #30: TearingDrive Network Initialization Failure" row="2" column="0">
		<row><contact type="open" name="gPowerUp_Complete"/><contact type="closed" name="gA[4].Ind_NetworkInit"/><coil type="open" name="Alarm1[30]"/></row>
		<row><contact type="open" name="Alarm1[30]"/><contact type="closed" name="gAlarmReset" or="true"/><empty/></row>
	</network>
	<network label="" comment="Alarm #31: Entry Pull Roll Servo Fault" row="4" column="0">
		<row><empty/><functionblock position="header" name="TON_5" type="TON"/><empty/><empty/></row>
		<row><contact type="open" name="gA[5].Input_DriveEnable"/><functionblock position="top" type="TON"><input name="IN"/><output name="Q"/></functionblock><contact type="open" name="gA[5].Error"/><coil type="open" name="Alarm1[31]"/></row>
		<row><analog type="input" name="t#1s"/><functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock><empty or="true"/><empty/></row>
		<row><contact type="open" name="Alarm1[31]"/><contact type="closed" name="gAlarmReset"/><line/><line or="true"/><empty/></row>
	</network>
	<network label="" comment="Alarm #32: Entry Pull Roll Drive Network Initialization Failure" row="2" column="0">
		<row><contact type="open" name="gPowerUp_Complete"/><contact type="closed" name="gA[5].Ind_NetworkInit"/><coil type="open" name="Alarm1[32]"/></row>
		<row><contact type="open" name="Alarm1[32]"/><contact type="closed" name="gAlarmReset" or="true"/><empty/></row>
	</network>
	<network label="" comment="Alarm #33: Exit Pull Roll Servo Fault" row="4" column="0">
		<row><empty/><functionblock position="header" name="TON_6" type="TON"/><empty/><empty/></row>
		<row><contact type="open" name="gA[6].Input_DriveEnable"/><functionblock position="top" type="TON"><input name="IN"/><output name="Q"/></functionblock><contact type="open" name="gA[6].Error"/><coil type="open" name="Alarm1[33]"/></row>
		<row><analog type="input" name="t#1s"/><functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock><empty or="true"/><empty/></row>
		<row><contact type="open" name="Alarm1[33]"/><contact type="closed" name="gAlarmReset"/><line/><line or="true"/><empty/></row>
	</network>
	<network label="" comment="Alarm #34: Exit Pull Roll Drive Network Initialization Failure" row="2" column="0">
		<row><contact type="open" name="gPowerUp_Complete"/><contact type="closed" name="gA[6].Ind_NetworkInit"/><coil type="open" name="Alarm1[34]"/></row>
		<row><contact type="open" name="Alarm1[34]"/><contact type="closed" name="gAlarmReset" or="true"/><empty/></row>
	</network>
	<network label="" comment="Alarm #35: Drum Servo Fault" row="4" column="0">
		<row><empty/><functionblock position="header" name="TON_7" type="TON"/><empty/><empty/></row>
		<row><contact type="open" name="gA[7].Input_DriveEnable"/><functionblock position="top" type="TON"><input name="IN"/><output name="Q"/></functionblock><contact type="open" name="gA[7].Error"/><coil type="open" name="Alarm1[35]"/></row>
		<row><analog type="input" name="t#1s"/><functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock><empty or="true"/><empty/></row>
		<row><contact type="open" name="Alarm1[35]"/><contact type="closed" name="gAlarmReset"/><line/><line or="true"/><empty/></row>
	</network>
	<network label="" comment="Alarm #36: Drum Drive Network Initialization Failure" row="2" column="0">
		<row><contact type="open" name="gPowerUp_Complete"/><contact type="closed" name="gA[7].Ind_NetworkInit"/><coil type="open" name="Alarm1[36]"/></row>
		<row><contact type="open" name="Alarm1[36]"/><contact type="closed" name="gAlarmReset" or="true"/><empty/></row>
	</network>
	<network label="" comment="Alarm #90: ColdMicroPerf Servo Fault" row="4" column="0">
		<row><empty/><functionblock position="header" name="TON_8" type="TON"/><empty/><empty/><empty/></row>
		<row><contact type="open" name="gA[8].Input_DriveEnable"/><functionblock position="top" type="TON"><input name="IN"/><output name="Q"/></functionblock><contact type="open" name="gA[8].Error"/><contact type="open" name="gA[8].bActive"/><coil type="open" name="Alarm1[90]"/></row>
		<row><analog type="input" name="t#1s"/><functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock><empty/><empty or="true"/><empty/></row>
		<row><contact type="open" name="Alarm1[90]"/><contact type="closed" name="gAlarmReset"/><line/><line/><line or="true"/><empty/></row>
	</network>
	<network label="" comment="Alarm #91: ColdMicroPerf Drive Network Initialization Failure" row="2" column="0">
		<row><contact type="open" name="gPowerUp_Complete"/><contact type="closed" name="gA[8].Ind_NetworkInit"/><contact type="open" name="gA[8].bActive"/><coil type="open" name="Alarm1[91]"/></row>
		<row><contact type="open" name="Alarm1[91]"/><contact type="closed" name="gAlarmReset"/><line or="true"/><empty/></row>
	</network>
	<network label="" comment="Alarm #98: Envelope Bag Servo1 Fault" row="4" column="0">
		<row><empty/><functionblock position="header" name="TON_12" type="TON"/><empty/><empty/><empty/></row>
		<row><contact type="open" name="gA[12].Input_DriveEnable"/><functionblock position="top" type="TON"><input name="IN"/><output name="Q"/></functionblock><contact type="open" name="gA[12].Error"/><contact type="open" name="gA[12].bInMach"/><coil type="open" name="Alarm1[98]"/></row>
		<row><analog type="input" name="t#1s"/><functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock><empty/><empty or="true"/><empty/></row>
		<row><contact type="open" name="Alarm1[98]"/><contact type="closed" name="gAlarmReset"/><line/><line/><line or="true"/><empty/></row>
	</network>
	<network label="" comment="Alarm #99: Envelope Bag Drive1 Network Initialization Failure" row="2" column="0">
		<row><contact type="open" name="gPowerUp_Complete"/><contact type="closed" name="gA[12].Ind_NetworkInit"/><contact type="open" name="gA[12].bInMach"/><coil type="open" name="Alarm1[101]"/></row>
		<row><contact type="open" name="Alarm1[101]"/><contact type="closed" name="gAlarmReset"/><line or="true"/><empty/></row>
	</network>
	<network label="" comment="Alarm #100: Envelope Bag Servo2 Fault" row="4" column="0">
		<row><empty/><functionblock position="header" name="TON_13" type="TON"/><empty/><empty/><empty/></row>
		<row><contact type="open" name="gA[13].Input_DriveEnable"/><functionblock position="top" type="TON"><input name="IN"/><output name="Q"/></functionblock><contact type="open" name="gA[13].Error"/><contact type="open" name="gA[13].bInMach"/><coil type="open" name="Alarm1[100]"/></row>
		<row><analog type="input" name="t#1s"/><functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock><empty/><empty or="true"/><empty/></row>
		<row><contact type="open" name="Alarm1[100]"/><contact type="closed" name="gAlarmReset"/><line/><line/><line or="true"/><empty/></row>
	</network>
	<network label="" comment="Alarm #101: Envelope Bag Drive2 Network Initialization Failure" row="2" column="0">
		<row><contact type="open" name="gPowerUp_Complete"/><contact type="closed" name="gA[13].Ind_NetworkInit"/><contact type="open" name="gA[13].bInMach"/><coil type="open" name="Alarm1[101]"/></row>
		<row><contact type="open" name="Alarm1[101]"/><contact type="closed" name="gAlarmReset"/><line or="true"/><empty/></row>
	</network>
	<network label="" comment="Alarm #104: HotMicroPerf Servo Fault" row="4" column="0">
		<row><empty/><functionblock position="header" name="TON_15" type="TON"/><empty/><empty/><empty/></row>
		<row><contact type="open" name="gA[15].Input_DriveEnable"/><functionblock position="top" type="TON"><input name="IN"/><output name="Q"/></functionblock><contact type="open" name="gA[15].Error"/><contact type="open" name="gA[15].bActive"/><coil type="open" name="Alarm1[104]"/></row>
		<row><analog type="input" name="t#1s"/><functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock><empty/><empty or="true"/><empty/></row>
		<row><contact type="open" name="Alarm1[104]"/><contact type="closed" name="gAlarmReset"/><line/><line/><line or="true"/><empty/></row>
	</network>
	<network label="" comment="Alarm #105: HotMicroPerf Drive Network Initialization Failure" row="2" column="0">
		<row><contact type="open" name="gPowerUp_Complete"/><contact type="closed" name="gA[15].Ind_NetworkInit"/><contact type="open" name="gA[15].bActive"/><coil type="open" name="Alarm1[105]"/></row>
		<row><contact type="open" name="Alarm1[105]"/><contact type="closed" name="gAlarmReset"/><line or="true"/><empty/></row>
	</network>
	<network label="" comment="Alarm #37: Drum Fan Motor Protector Fault" row="2" column="0">
		<row><contact type="closed" name="gI_MP_DrumFan"/><line/><contact type="open" name="gNever"/><coil type="open" name="Alarm1[37]"/></row>
		<row><contact type="open" name="Alarm1[37]"/><contact type="closed" name="gAlarmReset" or="true"/><empty/><empty/></row>
	</network>
	<network label="" comment="Alarm #38: Glue Slow Rotation Motor Protector Fault" row="2" column="0">
		<row><contact type="closed" name="gI_MP_GlueSlowRotation"/><line/><coil type="open" name="Alarm1[38]"/></row>
		<row><contact type="open" name="Alarm1[38]"/><contact type="closed" name="gAlarmReset" or="true"/><empty/></row>
	</network>
	<network label="" comment="Alarm #39: Perf Fan Motor Protector Fault" row="2" column="0">
		<row><contact type="closed" name="gI_MP_PerfFan"/><line/><contact type="open" name="g_bMainPower_OnDelay"/><contact type="open" name="gI_SafetyRelay_EStopOK"/><contact type="open" name="gI_SafetyRelay_GuardOK"/><coil type="open" name="Alarm1[39]"/></row>
		<row><contact type="open" name="Alarm1[39]"/><contact type="closed" name="gAlarmReset" or="true"/><empty/><empty/><empty/><empty/></row>
	</network>
	<network label="" comment="Alarm #40: Vacuum Motor Protector Fault" row="2" column="0">
		<row><contact type="closed" name="gI_MP_Vacuum"/><line/><coil type="open" name="Alarm1[40]"/></row>
		<row><contact type="open" name="Alarm1[40]"/><contact type="closed" name="gAlarmReset" or="true"/><empty/></row>
	</network>
	<network label="" comment="Alarm #41: Drive Motor Bundler" row="4" column="0">
		<row><empty/><functionblock position="header" name="TON_30" type="TON"/><empty/><empty/><empty/></row>
		<row><contact type="closed" name="gI_Bund_DriveFault"/><functionblock position="top" type="TON"><input name="IN"/><output name="Q"/></functionblock><contact type="open" name="g_bIndSelBundProd"/><contact type="open" name="gQ_CR_MainPowerOn"/><coil type="open" name="Alarm1[41]"/></row>
		<row><analog type="input" name="T#3s"/><functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock><empty or="true"/><empty or="true"/><coil type="open" name="g_bBundDriveFault"/></row>
		<row><contact type="open" name="Alarm1[41]"/><contact type="closed" name="gAlarmReset"/><line/><line or="true"/><empty/><empty/></row>
	</network>
	<network label="" comment="Alarm #42: Came profile Perf calculation fault " row="2" column="0">
		<row><contact type="open" name="g_bCamPerfCalc_Error"/><line/><coil type="open" name="Alarm1[42]"/></row>
		<row><contact type="open" name="Alarm1[42]"/><contact type="closed" name="gAlarmReset" or="true"/><empty/></row>
	</network>
	<network label="" comment="Alarm #43: Unwinder Hydrulic Pump Motor Protector Fault         not stop machine only display fault

D.M. Le 09/12/2011 Pyrollpack_14661 Inhibe cause ce defaut n existe pas sur cette machine." row="2" column="0">
		<row><contact type="closed" name="gI_MP_UNW_HydroPump"/><contact type="open" name="gNever"/><contact type="open" name="g_bUnwindInMach"/><coil type="open" name="Alarm1[43]"/></row>
		<row><contact type="open" name="Alarm1[43]"/><contact type="closed" name="gAlarmReset"/><line or="true"/><empty/></row>
	</network>
	<network label="" comment="Alarm #44: Slow Rotation Unit1 Flexo Press Motor Protector Fault" row="2" column="0">
		<row><contact type="closed" name="gI_MP_FP_SlowRot1"/><contact type="open" name="gRecipeActive.bSelFPProd"/><coil type="open" name="Alarm1[44]"/></row>
		<row><contact type="open" name="Alarm1[44]"/><contact type="closed" name="gAlarmReset" or="true"/><empty/></row>
	</network>
	<network label="" comment="Alarm #45: Slow Rotation Unit2 Flexo Press Motor Protector Fault" row="2" column="0">
		<row><contact type="closed" name="gI_MP_FP_SlowRot2"/><contact type="open" name="gRecipeActive.bSelFPProd"/><coil type="open" name="Alarm1[45]"/></row>
		<row><contact type="open" name="Alarm1[45]"/><contact type="closed" name="gAlarmReset" or="true"/><empty/></row>
	</network>
	<network label="" comment="Alarm #46: Slow Rotation Unit3 Flexo Press Motor Protector Fault" row="2" column="0">
		<row><contact type="closed" name="gI_MP_FP_SlowRot3"/><contact type="open" name="gRecipeActive.bSelFPProd"/><coil type="open" name="Alarm1[46]"/></row>
		<row><contact type="open" name="Alarm1[46]"/><contact type="closed" name="gAlarmReset" or="true"/><empty/></row>
	</network>
	<network label="" comment="Alarm #47: Slow Rotation Unit4 Flexo Press Motor Protector Fault" row="2" column="0">
		<row><contact type="closed" name="gI_MP_FP_SlowRot4"/><contact type="open" name="gRecipeActive.bSelFPProd"/><coil type="open" name="Alarm1[47]"/></row>
		<row><contact type="open" name="Alarm1[47]"/><contact type="closed" name="gAlarmReset" or="true"/><empty/></row>
	</network>
	<network label="" comment="Alarm #48: Slow Rotation Unit5 Flexo Press Motor Protector Fault
D.M. 23/08/2012 RS15_RX_30005 Only 4 printing units on this machine " row="2" column="0">
		<row><contact type="closed" name="gI_MP_FP_SlowRot5"/><contact type="open" name="gRecipeActive.bSelFPProd"/><contact type="open" name="gNever"/><coil type="open" name="Alarm1[48]"/></row>
		<row><contact type="open" name="Alarm1[48]"/><contact type="closed" name="gAlarmReset" or="true"/><empty/><empty/></row>
	</network>
	<network label="" comment="Alarm #49: Slow Rotation Unit6 Flexo Press Motor Protector Fault
D.M. 23/08/2012 RS15_RX_30005 Only 4 printing units on this machine " row="2" column="0">
		<row><contact type="closed" name="gI_MP_FP_SlowRot6"/><contact type="open" name="gRecipeActive.bSelFPProd"/><contact type="open" name="gNever"/><coil type="open" name="Alarm1[49]"/></row>
		<row><contact type="open" name="Alarm1[49]"/><contact type="closed" name="gAlarmReset" or="true"/><empty/><empty/></row>
	</network>
	<network label="" comment="Alarm #50: Flexo Press Fan Motor Protector Fault" row="2" column="0">
		<row><contact type="closed" name="gI_MP_FP_MotorFan"/><contact type="open" name="gRecipeActive.bSelFPProd"/><coil type="open" name="Alarm1[50]"/></row>
		<row><contact type="open" name="Alarm1[50]"/><contact type="closed" name="gAlarmReset" or="true"/><empty/></row>
	</network>
	<network label="" comment="Alarm #130: 3-Web unit Fan Motor Protector Fault" row="2" column="0">
		<row><contact type="closed" name="gI_MP_3W_Fan"/><contact type="open" name="g_b3WebUnitInMach"/><coil type="open" name="Alarm1[130]"/></row>
		<row><contact type="open" name="Alarm1[130]"/><contact type="closed" name="gAlarmReset" or="true"/><empty/></row>
	</network>
	<network label="" comment="Alarm #131: Dryer Blower Motor Protector Fault" row="2" column="0">
		<row><contact type="closed" name="gI_MP_DRY_Blower"/><contact type="open" name="g_bDryerInMach"/><coil type="open" name="Alarm1[131]"/></row>
		<row><contact type="open" name="Alarm1[131]"/><contact type="closed" name="gAlarmReset" or="true"/><coil type="open" name="g_DRY_bBlowerAlarm"/></row>
	</network>
	<network label="" comment="Alarm #132: Cold Micro Perforator Waste Suction Motor Protector Fault" row="2" column="0">
		<row><contact type="closed" name="gI_MP_HP_WasteSuction"/><contact type="open" name="gA[8].bInMach"/><coil type="open" name="Alarm1[132]"/></row>
		<row><contact type="open" name="Alarm1[132]"/><contact type="closed" name="gAlarmReset" or="true"/><empty/></row>
	</network>
	<network label="" comment="Alarm #133: Envelope Bag Waste Suction Motor Protector Fault" row="2" column="0">
		<row><contact type="closed" name="gI_MP_EB_WasteSuction"/><contact type="open" name="gA[12].bInMach"/><coil type="open" name="Alarm1[133]"/></row>
		<row><contact type="open" name="Alarm1[133]"/><contact type="closed" name="gAlarmReset" or="true"/><coil type="open" name="g_EnvB_bWasteSucMPAlarm"/></row>
	</network>
	<network label="" comment="Motor Alarm String #1" row="1" column="0">
		<row><contact type="closed" name="Alarm1[21]"/><contact type="closed" name="Alarm1[22]"/><contact type="closed" name="Alarm1[23]"/><contact type="closed" name="Alarm1[24]"/><contact type="closed" name="Alarm1[25]"/><contact type="closed" name="Alarm1[26]"/><contact type="closed" name="Alarm1[27]"/><coil type="open" name="MotorString1"/></row>
	</network>
	<network label="" comment="Motor Alarm String #2" row="1" column="0">
		<row><contact type="closed" name="Alarm1[28]"/><contact type="closed" name="Alarm1[29]"/><contact type="closed" name="Alarm1[30]"/><contact type="closed" name="Alarm1[31]"/><contact type="closed" name="Alarm1[32]"/><contact type="closed" name="Alarm1[33]"/><contact type="closed" name="Alarm1[34]"/><coil type="open" name="MotorString2"/></row>
	</network>
	<network label="" comment="Motor Alarm String #3" row="1" column="0">
		<row><contact type="closed" name="Alarm1[35]"/><contact type="closed" name="Alarm1[36]"/><contact type="closed" name="Alarm1[37]"/><contact type="closed" name="Alarm1[38]"/><contact type="closed" name="Alarm1[39]"/><contact type="closed" name="Alarm1[40]"/><contact type="closed" name="Alarm1[41]"/><coil type="open" name="MotorString3"/></row>
	</network>
	<network label="" comment="Motor Alarm String #4" row="1" column="0">
		<row><contact type="closed" name="Alarm1[42]"/><contact type="closed" name="Alarm1[44]"/><contact type="closed" name="Alarm1[45]"/><contact type="closed" name="Alarm1[46]"/><contact type="closed" name="Alarm1[47]"/><contact type="closed" name="Alarm1[48]"/><contact type="closed" name="Alarm1[49]"/><coil type="open" name="MotorString4"/></row>
	</network>
	<network label="" comment="Motor Alarm String #5" row="1" column="0">
		<row><contact type="closed" name="Alarm1[50]"/><contact type="closed" name="Alarm1[90]"/><contact type="closed" name="Alarm1[91]"/><contact type="closed" name="Alarm1[92]"/><contact type="closed" name="Alarm1[93]"/><contact type="closed" name="Alarm1[94]"/><contact type="closed" name="Alarm1[95]"/><coil type="open" name="MotorString5"/></row>
	</network>
	<network label="" comment="Motor Alarm String #6" row="1" column="0">
		<row><contact type="closed" name="Alarm1[96]"/><contact type="closed" name="Alarm1[97]"/><contact type="closed" name="Alarm1[98]"/><contact type="closed" name="Alarm1[99]"/><contact type="closed" name="Alarm1[100]"/><contact type="closed" name="Alarm1[101]"/><contact type="closed" name="Alarm1[102]"/><coil type="open" name="MotorString6"/></row>
	</network>
	<network label="" comment="Motor Alarm String #7" row="1" column="0">
		<row><contact type="closed" name="Alarm1[103]"/><contact type="closed" name="Alarm1[104]"/><contact type="closed" name="Alarm1[105]"/><contact type="closed" name="Alarm1[106]"/><contact type="closed" name="Alarm1[107]"/><contact type="closed" name="Alarm1[130]"/><contact type="closed" name="Alarm1[131]"/><coil type="open" name="MotorString7"/></row>
	</network>
	<network label="" comment="Motor Alarm String #8" row="1" column="0">
		<row><contact type="closed" name="Alarm1[132]"/><contact type="closed" name="Alarm1[133]"/><contact type="closed" name="Alarm1[134]"/><contact type="closed" name="Alarm1[135]"/><contact type="closed" name="Alarm1[136]"/><contact type="closed" name="Alarm1[137]"/><contact type="closed" name="Alarm1[138]"/><coil type="open" name="MotorString8"/></row>
	</network>
	<network label="" comment="Main Motor Alarm String" row="1" column="0">
		<row><contact type="open" name="MotorString1"/><contact type="open" name="MotorString2"/><contact type="open" name="MotorString3"/><contact type="open" name="MotorString4"/><contact type="open" name="MotorString5"/><contact type="open" name="MotorString6"/><contact type="open" name="MotorString7"/><contact type="open" name="MotorString8"/><coil type="open" name="gBagMachine_MotorAlarmsOK"/></row>
	</network>
	<network label="" comment="***** JAM ALARM SECTION *****

Alarm #51: RS Jam Fault" row="4" column="0">
		<row><empty/><empty/><empty/><functionblock position="header" name="TON_31" type="TON"/><empty/><empty/></row>
		<row><contact type="open" name="gI_JamPE_RS"/><contact type="open" name="gJog_ToZeroSpeed"/><line/><functionblock position="top" type="TON"><input name="IN"/><output name="Q"/></functionblock><line/><coil type="open" name="Alarm1[51]"/></row>
		<row><empty or="true"/><contact type="open" name="gRun_ToZeroSpeed" or="true"/><analog type="input" name="T#1s"/><functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock><empty or="true"/><empty/></row>
		<row><contact type="open" name="Alarm1[51]"/><contact type="closed" name="gAlarmReset"/><line/><line/><line/><line or="true"/><empty/></row>
	</network>
	<network label="" comment="Alarm #54: Bundler Jam Fault" row="4" column="0">
		<row><empty/><empty/><empty/><functionblock position="header" name="TON_32" type="TON"/><empty/><empty/><empty/></row>
		<row><contact type="open" name="gI_Bund_S109"/><contact type="open" name="gJog_ToZeroSpeed"/><line/><functionblock position="top" type="TON"><input name="IN"/><output name="Q"/></functionblock><line/><contact type="open" name="g_bIndSelBundProd"/><coil type="open" name="Alarm1[54]"/></row>
		<row><empty or="true"/><contact type="open" name="gRun_ToZeroSpeed" or="true"/><analog type="input" name="T#1s"/><functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock><empty or="true"/><empty or="true"/><coil type="open" name="g_bBundJamFault"/></row>
		<row><contact type="open" name="Alarm1[54]"/><contact type="closed" name="gAlarmReset"/><line/><line/><line/><line or="true"/><empty/><empty/></row>
	</network>
	<network label="" comment="Jam Alarm String" row="1" column="0">
		<row><contact type="closed" name="Alarm1[51]"/><contact type="closed" name="Alarm1[54]"/><coil type="open" name="gBagMachine_JamAlarmsOK"/></row>
	</network>
	<network label="" comment="************* WEB BREAK SECTION ************

Alarm #52: Web Break Tube 1 (Operator Side)" row="2" column="0">
		<row><contact type="closed" name="gI_WebBreakPE_1"/><contact type="open" name="gRun_ToZeroSpeed"/><contact type="closed" name="gWebBreakBypass_On"/><coil type="open" name="Alarm1[52]"/></row>
		<row><contact type="open" name="Alarm1[52]"/><contact type="closed" name="gAlarmReset"/><line or="true"/><empty/></row>
	</network>
	<network label="" comment="Alarm #53: Web Break Tube 2 (Drive Side)" row="2" column="0">
		<row><contact type="closed" name="gI_WebBreakPE_2"/><contact type="open" name="gSP_TubeSelect"/><contact type="open" name="gRun_ToZeroSpeed"/><contact type="closed" name="gWebBreakBypass_On"/><coil type="open" name="Alarm1[53]"/></row>
		<row><contact type="open" name="Alarm1[53]"/><contact type="closed" name="gAlarmReset"/><line/><line or="true"/><empty/></row>
	</network>
	<network label="" comment="Alarm #57: Web Break on Hot Micro Perforator unit " row="2" column="0">
		<row><contact type="closed" name="gI_HMP_WebBreakPE"/><contact type="open" name="gRun_ToZeroSpeed"/><contact type="closed" name="gWebBreakBypass_On"/><contact type="open" name="g_stHMPerfCyc.bSelProd"/><coil type="open" name="Alarm1[57]"/></row>
		<row><contact type="open" name="Alarm1[57]"/><contact type="closed" name="gAlarmReset"/><line or="true"/><empty/><empty/></row>
	</network>
	<network label="" comment="Web Break OK (Used for machine stop decel)" row="1" column="0">
		<row><contact type="closed" name="Alarm1[52]"/><contact type="closed" name="Alarm1[53]"/><contact type="closed" name="Alarm1[57]"/><coil type="open" name="gBagMachine_WebBreakOK"/></row>
	</network>
	<network label="" comment="*********** BUNDLER SECTION **********

Alarm #55: Bundler cycle Time Out" row="2" column="0">
		<row><contact type="open" name="g_bBund_TimOutFault"/><line/><contact type="open" name="g_bIndSelBundProd"/><coil type="open" name="Alarm1[55]"/></row>
		<row><contact type="open" name="Alarm1[55]"/><contact type="closed" name="gAlarmReset" or="true"/><empty/><empty/></row>
	</network>
	<network label="" comment="Alarm #56: Bundler cycle sensor fault" row="2" column="0">
		<row><contact type="open" name="g_bBund_SensorFault"/><line/><contact type="open" name="g_bIndSelBundProd"/><coil type="open" name="Alarm1[56]"/></row>
		<row><contact type="open" name="Alarm1[56]"/><contact type="closed" name="gAlarmReset" or="true"/><empty/><empty/></row>
	</network>
	<network label="" comment="********** I/O FAULT SECTION **********

Alarm : Bag Machine Enclosures I/O Modules Fault " row="1" column="0">
		<row><actionblock position="topbottom"><input qualifier="N"/><output name="actIO_Ex_FailDetect_E1_L3"/></actionblock><coil type="open" name="bActOut"/></row>
	</network>
	<network label="" comment="Alarm : Bundler Enclosures I/O Modules Fault " row="1" column="0">
		<row><actionblock position="topbottom"><input qualifier="N"/><output name="actIO_Ex_FailDetect_L9"/></actionblock><coil type="open" name="bActOut"/></row>
	</network>
	<network label="" comment="Alarm : Hot Micro Perf Enclosures I/O Modules Fault " row="1" column="0">
		<row><actionblock position="topbottom"><input qualifier="N"/><output name="actIO_Ex_FailDetect_L15"/></actionblock><coil type="open" name="bActOut"/></row>
	</network>
	<network label="" comment="Main I/O Alarm String" row="1" column="0">
		<row><contact type="closed" name="bAlarmGenIO_E1"/><contact type="closed" name="bAlarmGenIO_L3"/><contact type="closed" name="bAlarmGenIO_L9"/><contact type="closed" name="bAlarmGenIO_L15"/><coil type="open" name="gBagMachine_IOAlarmsOK"/></row>
	</network>
	<network label="" comment="*********** END REEL SECTION **********

Alarm #60: Unwinder paper end reel fault" row="2" column="0">
		<row><contact type="closed" name="gI_UNW_EndReelPapPE"/><contact type="open" name="gRun_ToZeroSpeed"/><contact type="closed" name="g_bEndReelPapBypass_On"/><contact type="open" name="g_bUnwindEndRelPapInMach"/><contact type="open" name="g_bUnwindInMach"/><coil type="open" name="Alarm1[60]"/></row>
		<row><contact type="open" name="Alarm1[60]"/><contact type="closed" name="gAlarmReset"/><line/><line/><line or="true"/><empty/></row>
	</network>
	<network label="" comment="Alarm #61: Unwinder poly end reel fault" row="2" column="0">
		<row><contact type="closed" name="gI_UNW_EndReelPolyPE"/><contact type="open" name="gRun_ToZeroSpeed"/><contact type="closed" name="g_bEndReelPolyBypass_On"/><contact type="open" name="g_bUnwindEndRelPolyInMach"/><contact type="open" name="g_bUnwindInMach"/><coil type="open" name="Alarm1[61]"/></row>
		<row><contact type="open" name="Alarm1[61]"/><contact type="closed" name="gAlarmReset"/><line/><line/><line or="true"/><empty/></row>
	</network>
	<network label="" comment="Alarm #62: 3-Web poly end reel fault" row="2" column="0">
		<row><contact type="closed" name="gI_3W_EndReelPolyPE"/><contact type="open" name="gRun_ToZeroSpeed"/><contact type="closed" name="g_bEndReelPolyBypass_On"/><contact type="open" name="g_b3WebUnitInMach"/><coil type="open" name="Alarm1[62]"/></row>
		<row><contact type="open" name="Alarm1[62]"/><contact type="closed" name="gAlarmReset"/><line/><line or="true"/><empty/></row>
	</network>
	<network label="" comment="" row="1" column="0">
		<row><contact type="closed" name="Alarm1[60]"/><contact type="closed" name="Alarm1[61]"/><contact type="closed" name="Alarm1[62]"/><coil type="open" name="g_bBagMachine_EndReelAlarmsOK"/></row>
	</network>
	<network label="" comment="*********** DRYER SECTION **********

Alarm #150: Circuit Braker Fault on Dryer Heater" row="2" column="0">
		<row><contact type="closed" name="gI_MP_DRY_Heater"/><contact type="open" name="g_bHeatDryInMach"/><contact type="open" name="g_bSelDryerProd"/><contact type="open" name="g_bDryerInMach"/><coil type="open" name="Alarm1[150]"/></row>
		<row><contact type="open" name="Alarm1[150]"/><contact type="closed" name="gAlarmReset"/><line/><line or="true"/><empty/></row>
	</network>
	<network label="" comment="Alarm #151: Safety Thermostat Fault on Dryer Heater" row="2" column="0">
		<row><contact type="closed" name="gI_DRY_Thermostat"/><contact type="open" name="g_bHeatDryInMach"/><contact type="open" name="g_bSelDryerProd"/><contact type="open" name="g_bDryerInMach"/><coil type="open" name="Alarm1[151]"/></row>
		<row><contact type="open" name="Alarm1[151]"/><contact type="closed" name="gAlarmReset"/><line/><line or="true"/><empty/></row>
	</network>
	<network label="" comment="Alarm #152: Temperature Sensor Fault on Dryer Heater" row="2" column="0">
		<row><contact type="open" name="g_DRY_bTempSensorAlarm"/><contact type="open" name="g_bHeatDryInMach"/><contact type="open" name="g_bSelDryerProd"/><contact type="open" name="g_bDryerInMach"/><coil type="open" name="Alarm1[152]"/></row>
		<row><contact type="open" name="Alarm1[152]"/><contact type="closed" name="gAlarmReset"/><line/><line or="true"/><empty/></row>
	</network>
	<network label="" comment="Hearter Alarm" row="3" column="0">
		<row><contact type="open" name="Alarm1[150]"/><coil type="open" name="g_DRY_bHeaterAlarm"/></row>
		<row><contact type="open" name="Alarm1[151]" or="true"/><empty/></row>
		<row><contact type="open" name="Alarm1[152]" or="true"/><empty/></row>
	</network>
	<network label="" comment="" row="1" column="0">
		<row><contact type="closed" name="Alarm1[150]"/><contact type="closed" name="Alarm1[151]"/><contact type="closed" name="Alarm1[152]"/><contact type="closed" name="Alarm1[131]"/><coil type="open" name="g_bBagMachine_DryerAlarmsOK"/></row>
	</network>
	<network label="" comment="Alarm #160: Came profile Perf calculation fault " row="2" column="0">
		<row><contact type="open" name="g_bCamPerfCalc_Error"/><line/><coil type="open" name="Alarm1[160]"/></row>
		<row><contact type="open" name="Alarm1[160]"/><contact type="closed" name="gAlarmReset" or="true"/><empty/></row>
	</network>
	<network label="" comment="Alarm #161: Get master came actual Perf position calculation fault " row="2" column="0">
		<row><contact type="open" name="g_bGetMaPosCamProfError_1"/><line/><coil type="open" name="Alarm1[161]"/></row>
		<row><contact type="open" name="Alarm1[161]"/><contact type="closed" name="gAlarmReset" or="true"/><empty/></row>
	</network>
	<network label="" comment="Alarm #162: Get master came park Perf position calculation fault " row="2" column="0">
		<row><contact type="open" name="g_bGetMaPosCamProfError_2"/><line/><coil type="open" name="Alarm1[162]"/></row>
		<row><contact type="open" name="Alarm1[162]"/><contact type="closed" name="gAlarmReset" or="true"/><empty/></row>
	</network>
	<network label="" comment="Alarm #163: Home master came on actual Perf position fault " row="2" column="0">
		<row><contact type="open" name="g_bHomeCamProfError"/><line/><coil type="open" name="Alarm1[163]"/></row>
		<row><contact type="open" name="Alarm1[163]"/><contact type="closed" name="gAlarmReset" or="true"/><empty/></row>
	</network>
	<network label="" comment="" row="1" column="0">
		<row><contact type="closed" name="Alarm1[160]"/><contact type="closed" name="Alarm1[161]"/><contact type="closed" name="Alarm1[162]"/><contact type="closed" name="Alarm1[163]"/><coil type="open" name="g_bBagMachine_CamProfCalcOK"/></row>
	</network>
	<network label="" comment="Alarm #8: Air Pressure OK Fault" row="2" column="0">
		<row><contact type="closed" name="gI_AirPressureOK"/><contact type="closed" name="bTest"/><coil type="open" name="Alarm1[8]"/></row>
		<row><contact type="open" name="Alarm1[8]"/><contact type="closed" name="gAlarmReset" or="true"/><empty/></row>
	</network>
	<network label="" comment="Alarm #9: 230Vac Fault" row="2" column="0">
		<row><contact type="closed" name="gI_230Vac_OK"/><line/><contact type="open" name="g_bMainPower_OnDelay"/><coil type="open" name="Alarm1[9]"/></row>
		<row><contact type="open" name="Alarm1[9]"/><contact type="closed" name="gAlarmReset" or="true"/><empty/><empty/></row>
	</network>
	<network label="" comment="" row="1" column="0">
		<row><contact type="closed" name="Alarm1[8]"/><contact type="closed" name="Alarm1[9]"/><coil type="open" name="g_bBagMachine_GenAlarmsOK"/></row>
	</network>
	<network label="" comment="Main Alarm String" row="1" column="0">
		<row><contact type="open" name="gBagMachine_EstopAlarmsOK"/><contact type="open" name="gBagMachine_GuardAlarmsOK"/><contact type="open" name="gBagMachine_MotorAlarmsOK"/><contact type="open" name="g_bBagMachine_GenAlarmsOK"/><contact type="open" name="gBagMachine_JamAlarmsOK"/><contact type="open" name="g_bBundAlarm_OK"/><contact type="open" name="gBagMachine_IOAlarmsOK"/><contact type="open" name="g_bBagMachine_EndReelAlarmsOK"/><contact type="open" name="g_bBagMachine_DryerAlarmsOK"/><contact type="open" name="g_bBagMachine_CamProfCalcOK"/><coil type="open" name="gBagMachine_AlarmsOK"/></row>
	</network>
	<network label="" comment="Bag Machine Main Alarm Indicator For HMI" row="8" column="0">
		<row><empty/><functionblock position="header" name="HGW_2StateIND1_0" type="HGW_2StateIND1"/><empty/></row>
		<row><contact type="open" name="gBagMachine_AlarmsOK"/><functionblock position="top" type="HGW_2StateIND1"><input name="In_State"/><output name="Text_Ind"/></functionblock><analog type="output" name="BagMachineBitmap1_Ind"/></row>
		<row><analog type="input" name="0"/><functionblock position="middle" type="HGW_2StateIND1"><input name="BackColorFlash_Off"/><output name="Color_Ind"/></functionblock><analog type="output" name="BagMachineVisibility1_Ind"/></row>
		<row><empty/><functionblock position="middle" type="HGW_2StateIND1"><input name="ForeColorFlash_Off"/><output name="State0"/></functionblock><empty/></row>
		<row><analog type="input" name="1"/><functionblock position="middle" type="HGW_2StateIND1"><input name="BackColorFlash_On"/><output name="State1"/></functionblock><empty/></row>
		<row><empty/><functionblock position="middle" type="HGW_2StateIND1"><input name="ForeColorFlash_On"/></functionblock><empty/></row>
		<row><analog type="input" name="0"/><functionblock position="middle" type="HGW_2StateIND1"><input name="BackColor_State1"/></functionblock><empty/></row>
		<row><empty/><functionblock position="bottom" type="HGW_2StateIND1"><input name="ForeColor_State1"/></functionblock><empty/></row>
	</network>
	<network label="" comment="" row="1" column="0">
		<row><actionblock position="topbottom"><input qualifier="N"/><output name="actAnimAlarmVisu"/></actionblock><coil type="open" name="bActOut"/></row>
	</network>
</networks>
END_PROGRAM



















































































































































































































































































































































































































