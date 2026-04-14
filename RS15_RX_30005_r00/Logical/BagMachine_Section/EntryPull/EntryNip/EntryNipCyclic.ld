(********************************************************************
 * COPYRIGHT -- Microsoft
 ********************************************************************
 * Program: EntryNip
 * File: EntryNipCyclic.ld
 * Author: pkiel
 * Created: July 20, 2011
 ********************************************************************
 * Implementation of program EntryNip
 ********************************************************************)

PROGRAM _CYCLIC






<?xml version="1.0"?>
<?AutomationStudio Version=3.0.71?>
<!-- Automation Studio Generated XML Section -->
<networks maxcolumn="0">
	<network label="" comment="Entry Pull Roll Web Nip &quot;ON&quot; Control" row="2" column="0">
		<row><contact type="positive transition" name="gI_SS_WebEntryNipOn_1"/><contact type="open" name="gI_SS_WebEntryNipOff_1"/><contact type="open" name="gI_SafetyRelay_EStopOK"/><contact type="open" name="g_bMainPower_On"/><coil type="set" name="gQ_SOL_WebEntryNip"/></row>
		<row><contact type="positive transition" name="gI_SS_WebEntryNipOn_2"/><contact type="open" name="gI_SS_WebEntryNipOff_2" or="true"/><empty/><empty/><empty/></row>
	</network>
	<network label="" comment="Entry Pull Roll Web Nip &quot;OFF&quot; Control" row="4" column="0">
		<row><contact type="negative transition" name="gI_SS_WebEntryNipOff_1"/><coil type="reset" name="gQ_SOL_WebEntryNip"/></row>
		<row><contact type="negative transition" name="gI_SS_WebEntryNipOff_2" or="true"/><empty/></row>
		<row><contact type="closed" name="gI_SafetyRelay_EStopOK" or="true"/><empty/></row>
		<row><contact type="closed" name="g_bMainPower_On" or="true"/><empty/></row>
	</network>
</networks>
END_PROGRAM






