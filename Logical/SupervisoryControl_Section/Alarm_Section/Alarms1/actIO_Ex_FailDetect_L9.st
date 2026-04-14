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


ACTION actIO_Ex_FailDetect_L9 : 
//ACTION for calculation failures of REM_IO_Ex modules
                   
  // ----------------------------------------------------------------------------------------------------------------------------------------------------------
  // Detection failures of REM_IO_L9 modules
  FOR iIndex := 1 TO C_iMaxAlmIO_L9 DO
    IF NOT(stModuleOK_IO_L9_Slot[iIndex].bStat) THEN 
      bAlarmIO_L9[iIndex] := g_bIndSelBundProd ;
    END_IF  
    IF (stModuleOK_IO_L9_Slot[iIndex].bStat OR 
        NOT(g_bIndSelBundProd))             AND 
       gAlarmReset                          THEN 
      bAlarmIO_L9[iIndex] := 0 ; 
    END_IF 
    IF iIndex>C_iNumBefFirstIO_L9+C_iNumDI_L9+C_iNumAI_L9+1+C_iNumDO_L9+C_iNumAO_L9+C_iX2XExt_L9 THEN    
      bAlarmIO_L9[iIndex] := 0 ; 
    END_IF  
  END_FOR ;
  
  
  // Module type REM_IO_L9 
  // PowerLink Head module
  //stModuleOK_IO_L9_Slot[1].strType := 'X20BC0083' ;
  // Alim module
  //stModuleOK_IO_L9_Slot[2].strType := 'X20PS9400' ;
  // Alim module + PowerLink network
  stModuleOK_IO_L9_Slot[1].strType := 'X20BR9300' ;
  // DI modules
  FOR iIndex := 1+C_iNumBefFirstIO_L9 TO C_iNumBefFirstIO_L9+C_iNumDI_L9 DO
    stModuleOK_IO_L9_Slot[iIndex].strType := 'X20DI4371' ;
  END_FOR ;
  // AI modules
  IF (C_iNumAI_L9>0) THEN 
    FOR iIndex := 1+C_iNumBefFirstIO_L9+C_iNumDI_L9 TO C_iNumBefFirstIO_L9+C_iNumDI_L9+C_iNumAI_L9 DO
      stModuleOK_IO_L9_Slot[iIndex].strType := 'X20AI2622' ;
    END_FOR ;
  END_IF 
  // Output alim module
  stModuleOK_IO_L9_Slot[C_iNumBefFirstIO_L9+C_iNumDI_L9+C_iNumAI_L9+1].strType := 'X20PS3300' ;
  // DO modules
  IF (C_iNumDO_L9>0) THEN 
    FOR iIndex := C_iNumBefFirstIO_L9+C_iNumDI_L9+C_iNumAI_L9+2 TO C_iNumBefFirstIO_L9+C_iNumDI_L9+C_iNumAI_L9+1+C_iNumDO_L9 DO // +1 et +2 because alim module
      stModuleOK_IO_L9_Slot[iIndex].strType := 'X20DO4322' ;
    END_FOR ;
  END_IF 
  // AO modules
  IF (C_iNumAO_L9>0) THEN 
    FOR iIndex := C_iNumBefFirstIO_L9+C_iNumDI_L9+C_iNumAI_L9+2+C_iNumDO_L9 TO C_iNumBefFirstIO_L9+C_iNumDI_L9+C_iNumAI_L9+1+C_iNumDO_L9+C_iNumAO_L9 DO
      stModuleOK_IO_L9_Slot[iIndex].strType := 'X20A02622' ;
    END_FOR ;
  END_IF 
  // General alarme calculation
  bAlarmGenIO_L9 := bAlarmIO_L9[1]  OR
                    bAlarmIO_L9[2]  OR
                    bAlarmIO_L9[3]  OR
                    bAlarmIO_L9[4]  OR
                    bAlarmIO_L9[5]  OR
                    bAlarmIO_L9[6]  OR
                    bAlarmIO_L9[7]  OR
                    bAlarmIO_L9[8]  OR
                    bAlarmIO_L9[9]  OR
                    bAlarmIO_L9[10] OR
                    bAlarmIO_L9[11] OR
                    bAlarmIO_L9[12] OR
                    bAlarmIO_L9[13] OR
                    bAlarmIO_L9[14] OR
                    bAlarmIO_L9[15] OR
                    bAlarmIO_L9[16] OR
                    bAlarmIO_L9[17] OR
                    bAlarmIO_L9[18] OR
                    bAlarmIO_L9[19] OR
                    bAlarmIO_L9[20] ; //OR
                    (*bAlarmIO_L9[21] OR
                    bAlarmIO_L9[22] OR
                    bAlarmIO_L9[23] OR
                    bAlarmIO_L9[24] OR
                    bAlarmIO_L9[25] OR
                    bAlarmIO_L9[26] OR
                    bAlarmIO_L9[27] OR
                    bAlarmIO_L9[28] OR
                    bAlarmIO_L9[29] OR
                    bAlarmIO_L9[30] OR
                    bAlarmIO_L9[31] OR
                    bAlarmIO_L9[32] OR
                    bAlarmIO_L9[33] OR
                    bAlarmIO_L9[34] OR
                    bAlarmIO_L9[35] OR
                    bAlarmIO_L9[36] OR
                    bAlarmIO_L9[37] OR
                    bAlarmIO_L9[38] OR
                    bAlarmIO_L9[39] OR
                    bAlarmIO_L9[40] ;*)  
  
END_ACTION
