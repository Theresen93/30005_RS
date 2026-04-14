(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: Stop_Mon
 * File: Stop_MonCyclic.ld
 * Author: pkiel
 * Created: October 13, 2009
 ********************************************************************
 * Implementation of program Stop_Mon
 ********************************************************************)

PROGRAM _CYCLIC


















<?xml version="1.0"?>
<?AutomationStudio Version=3.0.71?>
<!-- Automation Studio Generated XML Section -->
<networks maxcolumn="0">
	<network label="" comment="Bag Machine Stop String Monitor" row="1" column="0">
		<row><contact type="open" name="gI_StopPB_1"/><contact type="open" name="gI_StopPB_2"/><contact type="open" name="gI_StopPB_3"/><contact type="open" name="gI_FstopPB_1"/><contact type="closed" name="gHMI_Stop_PB"/><coil type="open" name="BagMachine_StopStringOK"/></row>
	</network>
	<network label="" comment="Main Stop String Monitor" row="1" column="0">
		<row><contact type="open" name="BagMachine_StopStringOK"/><line/><line/><coil type="open" name="gStopStringOK"/></row>
	</network>
	<network label="" comment="Memo normal stop requested" row="2" column="0">
		<row><contact type="closed" name="gStopStringOK"/><line/><line/><coil type="open" name="gNormalStopReq"/></row>
		<row><contact type="open" name="gA[9].Ind_InMotion"/><contact type="open" name="gNormalStopReq" or="true"/><empty/><empty/></row>
	</network>
	<network label="" comment="Fast Stop OK Monitor (Used For machine stop decel)" row="1" column="0">
		<row><contact type="open" name="gI_FstopPB_1"/><line/><line/><coil type="open" name="gFastStop_OK"/></row>
	</network>
</networks>
END_PROGRAM


















