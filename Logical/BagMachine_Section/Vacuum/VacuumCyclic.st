(********************************************************************
 * COPYRIGHT -- Microsoft
 ********************************************************************
 * Program: Vacuum
 * File: VacuumCyclic.st
 * Author: pkiel
 * Created: July 19, 2011
 ********************************************************************
 * Implementation of program Vacuum
 ********************************************************************)

PROGRAM _CYCLIC

(* Vacuum Off/On From HMI *)
  HGW_2StatePB_0.PB := EDGEPOS(Vacuum_PB);
  VacuumText_Ind := HGW_2StatePB_0.Text_Ind;
  VacuumColor_Ind := HGW_2StatePB_0.Color_Ind;
  Vacuum_On := HGW_2StatePB_0.State1;
  HGW_2StatePB_0();

  (* Vacuum Control *)
  IF (Vacuum_On AND gI_SafetyRelay_EStopOK AND gQ_CR_MainPowerOn) THEN
    gQ_CON_Vacuum := 1;
  ELSE
    gQ_CON_Vacuum := 0;
  END_IF

END_PROGRAM
