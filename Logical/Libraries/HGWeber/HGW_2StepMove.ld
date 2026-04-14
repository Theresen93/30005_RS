
FUNCTION_BLOCK HGW_2StepMove






<?xml version="1.0"?>
<?ladder Version = 3.0.71?>
<!-- Automation Studio Generated XML Section -->
<networks maxcolumn="0">
	<network label="" comment="Warning Horn Control" row="1" column="0">
		<row><contact type="open" name="MoveRequest"/><contact type="open" name="Permissive"/><contact type="closed" name="HornDone"/><coil type="open" name="Horn"/></row>
	</network>
	<network label="" comment="Horn Timer.....2 seconds" row="3" column="0">
		<row><empty/><functionblock position="header" name="TON_0" type="TON"/><empty/></row>
		<row><contact type="open" name="Horn"/><functionblock position="top" type="TON"><input name="IN"/><output name="Q"/></functionblock><coil type="set" name="HornDone"/></row>
		<row><analog type="input" name="T#500ms"/><functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock><empty/></row>
	</network>
	<network label="" comment="Release PB for 0.250 s &amp; Start Window" row="3" column="0">
		<row><empty/><empty/><functionblock position="header" name="TON_1" type="TON"/><empty/></row>
		<row><contact type="open" name="HornDone"/><contact type="closed" name="MoveRequest"/><functionblock position="top" type="TON"><input name="IN"/><output name="Q"/></functionblock><coil type="set" name="StartWindow"/></row>
		<row><empty/><analog type="input" name="T#250ms"/><functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock><empty/></row>
	</network>
	<network label="" comment="Reset Start Window" row="3" column="0">
		<row><empty/><empty/><functionblock position="header" name="TON_2" type="TON"/><empty/><empty/></row>
		<row><contact type="open" name="HornDone"/><contact type="closed" name="MoveRequest"/><functionblock position="top" type="TON"><input name="IN"/><output name="Q"/></functionblock><line/><coil type="reset" name="StartWindow"/></row>
		<row><empty/><analog type="input" name="T#4s"/><functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock><empty or="true"/><coil type="reset" name="HornDone"/></row>
	</network>
	<network label="" comment="Start Move Control" row="1" column="0">
		<row><contact type="open" name="StartWindow"/><contact type="open" name="Permissive"/><contact type="open" name="MoveRequest"/><coil type="open" name="StartMove"/></row>
	</network>
</networks>
END_FUNCTION_BLOCK






