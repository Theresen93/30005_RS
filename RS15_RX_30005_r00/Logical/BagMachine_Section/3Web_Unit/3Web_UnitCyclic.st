(********************************************************************
 * COPYRIGHT -- .
 ********************************************************************
 * Program: 3Web_Unit
 * File: 3Web_UnitCyclic.st
 * Author: dominique
 * Created: November 05, 2011
 ********************************************************************
 * Implementation of program 3Web_Unit
 ********************************************************************)

PROGRAM _CYCLIC


// 3Web_Unit Fan On/Off 
  gQ_CR_3W_Fan := gI_SS_3W_FanOnOff AND 
                  NOT(g_bIndEStop)  AND                               
                  1                 ;             


END_PROGRAM
