(********************************************************************
 * COPYRIGHT -- Microsoft
 ********************************************************************
 * Program: A5_Reg1
 * File: A5_Reg1Init.st
 * Author: pkiel
 * Created: July 19, 2011
 ********************************************************************
 * Implementation of program A5_Reg1
 ********************************************************************)

PROGRAM _INIT

(*Set MC_BR_TouchProbe_0 Block to Capture Virtual Master Commanded Position (Par ID 412) *)
	TriggerRef_0.ProbeParID:=412;

(*Set MC_BR_TouchProbe_0 Block to Hardwired Trigger #1*)
	TriggerRef_0.EventSourceParID:=ACP10PAR_STAT_TRIGGER1;

(*Set MC_BR_TouchProbe_0 Block Trigger For Positive Edge *)
	TriggerRef_0.Edge:=0;

(*Set MC_BR_TouchProbe_1 Block to Capture Encoder #1 Actual Position (Par ID 91) *)
	TriggerRef_1.ProbeParID:=91;

(*Set MC_BR_TouchProbe_1 Block to Hardwired Trigger #1*)
	TriggerRef_1.EventSourceParID:=ACP10PAR_STAT_TRIGGER1;

(*Set MC_BR_TouchProbe_1 Block Trigger For Positive Edge *)
	TriggerRef_1.Edge:=0;

END_PROGRAM

