
FUNCTION_BLOCK HGW_Toggle

<?xml version="1.0"?>
<?ladder Version = 3.0.71?>
<!-- Automation Studio Generated XML Section -->
<networks maxcolumn="0">
	<network label="" comment="" row="3" column="0">
		<row><empty/><empty/><functionblock position="header" name="TON_0" type="TON"/><empty/><empty/><empty/><empty/></row>
		<row><contact type="open" name="In"/><contact type="closed" name="TON_1.Q"/><functionblock position="top" type="TON"><input name="IN"/><output name="Q"/></functionblock><empty/><empty/><empty/><empty/></row>
		<row><empty/><analog type="input" name="Time"/><functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock><empty/><empty/><empty/><empty/></row>
	</network>
	<network label="" comment="" row="3" column="0">
		<row><empty/><functionblock position="header" name="TON_1" type="TON"/><empty/><empty/><empty/><empty/><empty/></row>
		<row><contact type="open" name="TON_0.Q"/><functionblock position="top" type="TON"><input name="IN"/><output name="Q"/></functionblock><empty/><empty/><empty/><empty/><empty/></row>
		<row><analog type="input" name="Time"/><functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock><empty/><empty/><empty/><empty/><empty/></row>
	</network>
	<network label="" comment="" row="1" column="0">
		<row><contact type="open" name="In"/><contact type="closed" name="TON_0.Q"/><line/><line/><line/><line/><line/><coil type="open" name="Out"/></row>
	</network>
	<network label="" comment="" row="1" column="0">
		<row><empty/><empty/><empty/><empty/><empty/><empty/><empty/><empty/></row>
	</network>
</networks>
END_FUNCTION_BLOCK

