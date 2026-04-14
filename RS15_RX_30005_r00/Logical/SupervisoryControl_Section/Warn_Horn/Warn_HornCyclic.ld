(********************************************************************
 * COPYRIGHT -- .
 ********************************************************************
 * Program: Warn_Horn
 * File: Warn_HornCyclic.ld
 * Author: dominique
 * Created: August 27, 2011
 ********************************************************************
 * Implementation of program Warn_Horn
 ********************************************************************)

PROGRAM _CYCLIC





<?xml version="1.0"?>
<?AutomationStudio Version=3.0.71?>
<!-- Automation Studio Generated XML Section -->
<networks maxcolumn="0">
	<network label="" comment="Machine Movement Warning Horn" row="10" column="0">
		<row><contact type="open" name="gJog_Horn"/><contact type="closed" name="bTempHornOff"/><coil type="open" name="gQ_CR_WarningHorn"/></row>
		<row><contact type="open" name="gRun_Horn" or="true"/><empty/><empty/></row>
		<row><contact type="open" name="gA3Ref_Horn" or="true"/><empty/><empty/></row>
		<row><contact type="open" name="gA4Ref_Horn" or="true"/><empty/><empty/></row>
		<row><contact type="open" name="gA7Ref_Horn" or="true"/><empty/><empty/></row>
		<row><contact type="open" name="g_bBund_InitHorn" or="true"/><empty/><empty/></row>
		<row><contact type="open" name="gA2Ref_Horn" or="true"/><empty/><empty/></row>
		<row><contact type="open" name="gA12Ref_Horn" or="true"/><empty/><empty/></row>
		<row><contact type="open" name="gA13Ref_Horn" or="true"/><empty/><empty/></row>
		<row><contact type="open" name="gA15Ref_Horn" or="true"/><empty/><empty/></row>
	</network>
</networks>
END_PROGRAM





