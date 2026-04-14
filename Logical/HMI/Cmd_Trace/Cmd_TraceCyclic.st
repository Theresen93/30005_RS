(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: Cmd_Trace
 * File: Cmd_TraceCyclic.st
 * Author: pkiel
 * Created: October 13, 2009
 ********************************************************************
 * Implementation of program Cmd_Trace
 ********************************************************************)

PROGRAM _CYCLIC

(* This program transfers the network command trace to a file named "Trace+Date" on a USB memory stick placed in the "USB1" location *)
	TON_0(IN:=Trace_PB,PT:=T#5s);

	IF (EDGEPOS(TON_0.Q)) THEN
		MC_BR_NetTrace_0.Execute:=TRUE;
		TraceStatus:=1;	(* Network Trace Transfer Started *)
	END_IF

	MC_BR_NetTrace_0.Command:=mcSAVE;
    MC_BR_NetTrace_0.Configuration.NetTrace.Type:=mcNET_TRACE_GLOBAL;
    strcpy(ADR(MC_BR_NetTrace_0.Configuration.DatObj.Name), ADR('Trace'));
    MC_BR_NetTrace_0.Configuration.DatObj.Type:=mcFILE + mcADD_DATE_TIME;
    strcpy(ADR(MC_BR_NetTrace_0.Configuration.DatObj.Device), ADR('USB1'));

    IF (MC_BR_NetTrace_0.Done) THEN
      MC_BR_NetTrace_0.Execute:=FALSE;
      TraceStatus:=2;	(* Network Trace Transfer Completed *)
    ELSIF (MC_BR_NetTrace_0.Error) THEN
      TraceErrorID:=MC_BR_NetTrace_0.ErrorID;
      ErrorRecord:=MC_BR_NetTrace_0.ErrorRecord;
      MC_BR_NetTrace_0.Execute:=FALSE;
      TraceStatus:=3;	(* Network Trace Transfer Error *)
    END_IF

    IF (TraceStatus=2 OR TraceStatus=3) THEN
    	MessageTimer:=1;
    ELSE
    	MessageTimer:=0;
    END_IF

    TON_1(IN:=MessageTimer,PT:=T#3s);
    IF EDGEPOS(TON_1.Q) THEN
    	TraceStatus:=0;
    END_IF

MC_BR_NetTrace_0();

END_PROGRAM
