(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: Guard_Mon
 * File: Guard_MonCyclic.ld
 * Author: pkiel
 * Created: October 13, 2009
 ********************************************************************
 * Implementation of program Guard_Mon
 ********************************************************************)

PROGRAM _CYCLIC






















<?xml version="1.0"?>
<?AutomationStudio Version=3.0.71?>
<!-- Automation Studio Generated XML Section -->
<networks maxcolumn="0">
	<network label="" comment="Bag Machine Guard Monitor" row="1" column="0">
		<row><contact type="closed" name="gI_GSW_Door1"/><contact type="closed" name="gI_GSW_Door2"/><contact type="closed" name="gI_GSW_Drum"/><contact type="closed" name="gI_GSW_PerfDoors"/><contact type="closed" name="gI_GSW_SlittingDoor"/><contact type="closed" name="gI_GSW_RSEntry"/><contact type="closed" name="gI_GSW_Tearing"/><contact type="closed" name="gI_GSW_FP_Doors"/><contact type="closed" name="gI_GSW_FP_Gates"/><contact type="closed" name="gI_GSW_3W"/><contact type="closed" name="gI_GSW_HMPerf"/><contact type="closed" name="gI_GSW_CMPerfGates"/><contact type="closed" name="gI_GSW_CMPerfDoor"/><coil type="open" name="BagMachine_GuardsOK"/></row>
	</network>
	<network label="" comment="Guards OK To Jog Main Monitor" row="1" column="0">
		<row><contact type="open" name="BagMachine_GuardsOK"/><contact type="open" name="g_bBundGuard_OK"/><coil type="open" name="gGuardsOK"/></row>
	</network>
</networks>
END_PROGRAM






















