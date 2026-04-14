(********************************************************************
 * COPYRIGHT -- .
 ********************************************************************
 * Program: Alarms1
 * File: actIO_Ex_FailDetect.st
 * Author: dominique
 * Created: October 16, 2011
 ********************************************************************
 * Implementation of program Alarms1
 ********************************************************************) 


ACTION actIO_Ex_FailDetect_E1_L3 : 
//ACTION for calculation failures of REM_IO_Ex modules
  
  // ----------------------------------------------------------------------------------------------------------------------------------------------------------
  // Detection failures of REM_IO_E1 modules
  FOR iIndex := 1 TO C_iMaxAlmIO_E1 DO
    IF NOT(stModuleOK_IO_E1_Slot[iIndex].bStat) THEN 
      bAlarmIO_E1[iIndex] := 1 ; 
    END_IF 
    IF stModuleOK_IO_E1_Slot[iIndex].bStat AND 
       gAlarmReset                         THEN 
      bAlarmIO_E1[iIndex] := 0 ; 
    END_IF 
    IF iIndex>C_iNumBefFirstIO_E1+C_iNumDI_E1+C_iNumAI_E1+1+C_iNumDO_E1+C_iNumAO_E1 THEN  
      bAlarmIO_E1[iIndex] := 0 ; 
    END_IF  
  END_FOR ;
  
  
  
  // Module type REM_IO_E1 
  // PowerLink Head module
  stModuleOK_IO_E1_Slot[1].strType := 'X20BC0083' ;
  // Alim module
  stModuleOK_IO_E1_Slot[2].strType := 'X20PS9400' ;
  // DI modules
  FOR iIndex := 1+C_iNumBefFirstIO_E1 TO C_iNumDI_E1+C_iNumBefFirstIO_E1 DO
    stModuleOK_IO_E1_Slot[iIndex].strType := 'X20DI9371' ;
  END_FOR ;
  // AI modules
  IF (C_iNumAI_E1>0) THEN 
    FOR iIndex := 1+C_iNumBefFirstIO_E1+C_iNumDI_E1 TO C_iNumBefFirstIO_E1+C_iNumDI_E1+C_iNumAI_E1 DO
      //stModuleOK_IO_E1_Slot[iIndex].strType := 'X20AI2622' ;
      stModuleOK_IO_E1_Slot[iIndex].strType := 'X20AT2222' ;
    END_FOR ;
  END_IF   
  // Output alim module
  stModuleOK_IO_E1_Slot[C_iNumBefFirstIO_E1+C_iNumDI_E1+C_iNumAI_E1+1].strType := 'X20PS3300' ;
  // DO modules
  IF (C_iNumDO_E1>0) THEN 
    FOR iIndex := C_iNumBefFirstIO_E1+C_iNumDI_E1+C_iNumAI_E1+2 TO C_iNumBefFirstIO_E1+C_iNumDI_E1+C_iNumAI_E1+1+C_iNumDO_E1 DO // +1 et +2 because alim module
      stModuleOK_IO_E1_Slot[iIndex].strType := 'X20DO9322' ;
    END_FOR ;
  END_IF   
  // AO modules
  IF (C_iNumAO_E1>0) THEN 
    FOR iIndex := C_iNumBefFirstIO_E1+C_iNumDI_E1+C_iNumAI_E1+2+C_iNumDO_E1 TO C_iNumBefFirstIO_E1+C_iNumDI_E1+C_iNumAI_E1+1+C_iNumDO_E1+C_iNumAO_E1 DO
      stModuleOK_IO_E1_Slot[iIndex].strType := 'X20A02622' ;
    END_FOR ;
  END_IF   
  // General alarme calculation
  bAlarmGenIO_E1 := bAlarmIO_E1[1]  OR
                    bAlarmIO_E1[2]  OR
                    bAlarmIO_E1[3]  OR
                    bAlarmIO_E1[4]  OR
                    bAlarmIO_E1[5]  OR
                    bAlarmIO_E1[6]  OR
                    bAlarmIO_E1[7]  OR
                    bAlarmIO_E1[8]  OR
                    bAlarmIO_E1[9]  OR
                    bAlarmIO_E1[10] OR
                    bAlarmIO_E1[11] OR
                    bAlarmIO_E1[12] OR
                    bAlarmIO_E1[13] OR
                    bAlarmIO_E1[14] OR
                    bAlarmIO_E1[15] OR
                    bAlarmIO_E1[16] OR
                    bAlarmIO_E1[17] OR 
                    bAlarmIO_E1[18] OR
                    bAlarmIO_E1[19] OR
                    bAlarmIO_E1[20] ; //OR
                    (*bAlarmIO_E1[21] OR
                    bAlarmIO_E1[22] OR
                    bAlarmIO_E1[23] OR
                    bAlarmIO_E1[24] OR
                    bAlarmIO_E1[25] OR
                    bAlarmIO_E1[26] OR
                    bAlarmIO_E1[27] OR
                    bAlarmIO_E1[28] OR
                    bAlarmIO_E1[29] OR
                    bAlarmIO_E1[30] OR
                    bAlarmIO_E1[31] OR
                    bAlarmIO_E1[32] OR
                    bAlarmIO_E1[33] OR
                    bAlarmIO_E1[34] OR
                    bAlarmIO_E1[35] OR
                    bAlarmIO_E1[36] OR
                    bAlarmIO_E1[37] OR
                    bAlarmIO_E1[38] OR
                    bAlarmIO_E1[39] OR
                    bAlarmIO_E1[40] ;*)  
                    
                    
  // ----------------------------------------------------------------------------------------------------------------------------------------------------------
  // Detection failures of REM_IO_L3 modules
  FOR iIndex := 1 TO C_iMaxAlmIO_L3 DO
    IF NOT(stModuleOK_IO_L3_Slot[iIndex].bStat) THEN 
      bAlarmIO_L3[iIndex] := 1 ; 
    END_IF 
    IF stModuleOK_IO_L3_Slot[iIndex].bStat AND 
       gAlarmReset                         THEN 
      bAlarmIO_L3[iIndex] := 0 ; 
    END_IF 
    IF iIndex>C_iNumBefFirstIO_L3+C_iNumDI_L3+C_iNumAI_L3+1+C_iNumDO_L3+C_iNumAO_L3+C_iX2XExt_L3 THEN  
      bAlarmIO_L3[iIndex] := 0 ; 
    END_IF  
  END_FOR ;
  // Module type REM_IO_L3 
  // PowerLink Head module
  //stModuleOK_IO_L3_Slot[1].strType := 'X20BC0083' ;
  // Alim module
  //stModuleOK_IO_L3_Slot[2].strType := 'X20PS9400' ;
  // Alim module + PowerLink network
  stModuleOK_IO_L3_Slot[1].strType := 'X20BR9300' ;
  // DI modules
  FOR iIndex := 1+C_iNumBefFirstIO_L3 TO C_iNumBefFirstIO_L3+C_iNumDI_L3 DO
    stModuleOK_IO_L3_Slot[iIndex].strType := 'X20DI9371' ;
  END_FOR ;
  // AI modules
  IF (C_iNumAI_L3>0) THEN 
    FOR iIndex := 1+C_iNumBefFirstIO_L3+C_iNumDI_L3 TO C_iNumBefFirstIO_L3+C_iNumDI_L3+C_iNumAI_L3 DO
      stModuleOK_IO_L3_Slot[iIndex].strType := 'X20AI2622' ;
    END_FOR ;
  END_IF 
  // Output alim module
  stModuleOK_IO_L3_Slot[C_iNumBefFirstIO_L3+C_iNumDI_L3+C_iNumAI_L3+1].strType := 'X20PS3300' ;
  // DO modules
  IF (C_iNumDO_L3>0) THEN 
    FOR iIndex := C_iNumBefFirstIO_L3+C_iNumDI_L3+C_iNumAI_L3+2 TO C_iNumBefFirstIO_L3+C_iNumDI_L3+C_iNumAI_L3+1+C_iNumDO_L3 DO // +2 et +1 because alim module
      stModuleOK_IO_L3_Slot[iIndex].strType := 'X20DO9322' ;
    END_FOR ;
  END_IF 
  // AO modules
  IF (C_iNumAO_L3>0) THEN 
    FOR iIndex := C_iNumBefFirstIO_L3+C_iNumDI_L3+C_iNumAI_L3+2+C_iNumDO_L3 TO C_iNumBefFirstIO_L3+C_iNumDI_L3+C_iNumAI_L3+1+C_iNumDO_L3+C_iNumAO_L3 DO
      stModuleOK_IO_L3_Slot[iIndex].strType := 'X20A02622' ;
    END_FOR ;
  END_IF 
  // Bus X2X Output module 
  stModuleOK_IO_L3_Slot[C_iNumBefFirstIO_L3+C_iNumDI_L3+C_iNumAI_L3+1+C_iNumDO_L3+C_iNumAO_L3+1].strType := 'X20BT9100' ;
  
  // General alarme calculation
  bAlarmGenIO_L3 := bAlarmIO_L3[1]  OR
                    bAlarmIO_L3[2]  OR
                    bAlarmIO_L3[3]  OR
                    bAlarmIO_L3[4]  OR
                    bAlarmIO_L3[5]  OR
                    bAlarmIO_L3[6]  OR
                    bAlarmIO_L3[7]  OR
                    bAlarmIO_L3[8]  OR
                    bAlarmIO_L3[9]  OR
                    bAlarmIO_L3[10] OR
                    bAlarmIO_L3[11] OR
                    bAlarmIO_L3[12] OR
                    bAlarmIO_L3[13] OR
                    bAlarmIO_L3[14] OR
                    bAlarmIO_L3[15] OR
                    bAlarmIO_L3[16] OR
                    bAlarmIO_L3[17] OR
                    bAlarmIO_L3[18] OR
                    bAlarmIO_L3[19] OR
                    bAlarmIO_L3[20] ; //OR
                    (*bAlarmIO_L3[21] OR
                    bAlarmIO_L3[22] OR
                    bAlarmIO_L3[23] OR
                    bAlarmIO_L3[24] OR
                    bAlarmIO_L3[25] OR
                    bAlarmIO_L3[26] OR
                    bAlarmIO_L3[27] OR
                    bAlarmIO_L3[28] OR
                    bAlarmIO_L3[29] OR
                    bAlarmIO_L3[30] OR
                    bAlarmIO_L3[31] OR
                    bAlarmIO_L3[32] OR
                    bAlarmIO_L3[33] OR
                    bAlarmIO_L3[34] OR
                    bAlarmIO_L3[35] OR
                    bAlarmIO_L3[36] OR
                    bAlarmIO_L3[37] OR
                    bAlarmIO_L3[38] OR
                    bAlarmIO_L3[39] OR
                    bAlarmIO_L3[40] ;*)  
                    
  
END_ACTION
