(********************************************************************
 * COPYRIGHT -- Microsoft
 ********************************************************************
 * Program: ExitNip
 * File: NipCyclic.ld
 * Author: pkiel
 * Created: July 20, 2011
 ********************************************************************
 * Implementation of program ExitNip
 ********************************************************************)

PROGRAM _CYCLIC







<?xml version="1.0"?>
<?AutomationStudio Version=3.0.71?>
<!-- Automation Studio Generated XML Section -->
<networks maxcolumn="0">
	<network label="" comment="Exit Pull Roll Web Nip On" row="1" column="0">
		<row><contact type="positive transition" name="gI_SS_WebExitNip"/><line/><line/><coil type="set" name="gQ_SOL_WebExitNip"/></row>
	</network>
	<network label="" comment="Exit Pull Roll Web Nip Off" row="3" column="0">
		<row><contact type="closed" name="gI_SS_WebExitNip"/><line/><line/><coil type="reset" name="gQ_SOL_WebExitNip"/></row>
		<row><contact type="closed" name="g_bMainPower_On" or="true"/><empty/><empty/><empty/></row>
		<row><contact type="open" name="g_bIndEStop" or="true"/><empty/><empty/><empty/></row>
	</network>
</networks>
END_PROGRAM







