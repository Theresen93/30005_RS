(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: Alarms1
 * File: Alarms1.typ
 * Author: pkiel
 * Created: September 22, 2009
 ********************************************************************
 * Local data types of program Alarms1
 ********************************************************************)

TYPE
  stIO_Alarm : STRUCT
      bStat   : BOOL := FALSE ;
      strType : STRING[15] := '' ;
    END_STRUCT;
END_TYPE

