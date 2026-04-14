(********************************************************************
 * COPYRIGHT -- Microsoft
 ********************************************************************
 * Program: A0_Basic
 * File: A0_BasicInit.st
 * Author: pkiel
 * Created: July 17, 2011
 ********************************************************************
 * Implementation of program A0_Basic
 ********************************************************************)

PROGRAM _INIT
	
	(* access master axis *)
		AxisErrorNcAccess := ncaccess(ncACP10MAN, ADR('Axis0'), ADR(gA[0].Ident));

END_PROGRAM

