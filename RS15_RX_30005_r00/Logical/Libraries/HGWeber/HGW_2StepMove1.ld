
FUNCTION_BLOCK HGW_2StepMove1









<?xml version="1.0"?>
<?ladder Version = 3.0.71?>
<!-- Automation Studio Generated XML Section -->
<networks maxcolumn="0">
	<network label="" comment="In case of used for Run " row="1" column="0">
		<row><contact type="closed" name="IN_bCasRun"/><line/><line/><coil type="jump" name="Else_Case"/></row>
	</network>
	<network label="Case_Run" comment="In case of used for Run " row="1" column="0">
		<row><analog type="input" name="T#750ms"/><function position="topbottom" type="MOVE"><input name="IN"/><output name="20"/></function><analog type="output" name="tTimReset"/></row>
	</network>
	<network label="" comment="" row="1" column="0">
		<row><contact type="open" name="TRUE"/><line/><line/><coil type="jump" name="Next"/></row>
	</network>
	<network label="Else_Case" comment="" row="1" column="0">
		<row><analog type="input" name="T#4s"/><function position="topbottom" type="MOVE"><input name="IN"/><output name="20"/></function><analog type="output" name="tTimReset"/></row>
	</network>
	<network label="Next" comment="Warning Horn Control" row="1" column="0">
		<row><contact type="open" name="IN_bMoveRequest"/><contact type="open" name="IN_bPermissive"/><contact type="closed" name="bHornDone"/><coil type="open" name="OUT_bHorn"/></row>
	</network>
	<network label="" comment="Horn Timer.....2 seconds" row="3" column="0">
		<row><empty/><functionblock position="header" name="stTON_0" type="TON"/><empty/></row>
		<row><contact type="open" name="OUT_bHorn"/><functionblock position="top" type="TON"><input name="IN"/><output name="Q"/></functionblock><coil type="set" name="bHornDone"/></row>
		<row><analog type="input" name="IN_tTpHorn"/><functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock><empty/></row>
	</network>
	<network label="" comment="Release PB for 0.250 s &amp; Start Window" row="3" column="0">
		<row><empty/><empty/><functionblock position="header" name="stTON_1" type="TON"/><empty/></row>
		<row><contact type="open" name="bHornDone"/><contact type="closed" name="IN_bMoveRequest"/><functionblock position="top" type="TON"><input name="IN"/><output name="Q"/></functionblock><coil type="set" name="bStartWindow"/></row>
		<row><empty/><analog type="input" name="T#250ms"/><functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock><empty/></row>
	</network>
	<network label="" comment="Reset Start Window" row="3" column="0">
		<row><empty/><empty/><functionblock position="header" name="stTON_2" type="TON"/><empty/><empty/></row>
		<row><contact type="open" name="bStartWindow"/><contact type="closed" name="IN_bMoveRequest"/><functionblock position="top" type="TON"><input name="IN"/><output name="Q"/></functionblock><line/><coil type="reset" name="bStartWindow"/></row>
		<row><empty/><analog type="input" name="tTimReset"/><functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock><empty or="true"/><coil type="reset" name="bHornDone"/></row>
	</network>
	<network label="" comment="Start Move Control" row="1" column="0">
		<row><contact type="open" name="bStartWindow"/><contact type="open" name="IN_bPermissive"/><contact type="open" name="IN_bMoveRequest"/><coil type="open" name="OUT_bStartMove"/></row>
	</network>
</networks>
END_FUNCTION_BLOCK









