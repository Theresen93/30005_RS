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


ACTION actIO_Ex_FailDetect_L15 : 
//ACTION for calculation failures of REM_IO_Ex modules                    
                    
  // ----------------------------------------------------------------------------------------------------------------------------------------------------------
  // Detection failures of REM_IO_L15 modules
  FOR iIndex := 1 TO C_iMaxAlmIO_L15 DO
    IF NOT(stModuleOK_IO_L15_Slot[iIndex].bStat) THEN 
      bAlarmIO_L15[iIndex] := g_bIndSelBundProd ;
    END_IF  
    IF ( stModuleOK_IO_L15_Slot[iIndex].bStat OR 
         NOT(gA[15].bInMach) )                AND 
       gAlarmReset                            THEN 
      bAlarmIO_L15[iIndex] := 0 ; 
    END_IF 
    IF iIndex>C_iNumBefFirstIO_L15+C_iNumDI_L15+C_iNumAI_L15+1+C_iNumDO_L15+C_iNumAO_L15+C_iX2XExt_L15 THEN  
      bAlarmIO_L15[iIndex] := 0 ; 
    END_IF  
  END_FOR ;
  // Module type REM_IO_L15 
  // PowerLink Head module
  //stModuleOK_IO_L15_Slot[1].strType := 'X20BC0083' ;
  // Alim module
  //stModuleOK_IO_L15_Slot[2].strType := 'X20PS9400' ;
  // Alim module + PowerLink network
  stModuleOK_IO_L15_Slot[1].strType := 'X20BR9300' ;
  // DI modules
  FOR iIndex := 1+C_iNumBefFirstIO_L15 TO C_iNumDI_L15 DO
    stModuleOK_IO_L15_Slot[iIndex].strType := 'X20DI4371' ;
  END_FOR ;
  // AI modules
  IF (C_iNumAI_L15>0) THEN 
    FOR iIndex := 1+C_iNumBefFirstIO_L15+C_iNumDI_L15 TO C_iNumBefFirstIO_L15+C_iNumDI_L15+C_iNumAI_L15 DO
      stModuleOK_IO_L15_Slot[iIndex].strType := 'X20AI2622' ;
    END_FOR ;
  END_IF 
  // Output alim module
  //stModuleOK_IO_L15_Slot[C_iNumBefFirstIO_L15+C_iNumDI_L15+C_iNumAI_L15+1].strType := 'X20PS3300' ;
  stModuleOK_IO_L15_Slot[C_iNumBefFirstIO_L15+C_iNumDI_L15+C_iNumAI_L15+1].strType := 'X20PS2100' ;
  // DO modules
  IF (C_iNumDO_L15>0) THEN 
    FOR iIndex := C_iNumBefFirstIO_L15+C_iNumDI_L15+C_iNumAI_L15+2 TO C_iNumBefFirstIO_L15+C_iNumDI_L15+C_iNumAI_L15+2+C_iNumDO_L15 DO // +2 because alim module
      stModuleOK_IO_L15_Slot[iIndex].strType := 'X20DO4322' ;
    END_FOR ;
  END_IF 
  // AO modules
  IF (C_iNumAO_L15>0) THEN 
    FOR iIndex := C_iNumBefFirstIO_L15+C_iNumDI_L15+C_iNumAI_L15+2+C_iNumDO_L15 TO C_iNumBefFirstIO_L15+C_iNumDI_L15+C_iNumAI_L15+2+C_iNumDO_L15+C_iNumAO_L15 DO
      stModuleOK_IO_L15_Slot[iIndex].strType := 'X20A02622' ;
    END_FOR ;
  END_IF 
  // General alarme calculation
  bAlarmGenIO_L15 := bAlarmIO_L15[1]  OR
                    bAlarmIO_L15[2]  OR
                    bAlarmIO_L15[3]  OR
                    bAlarmIO_L15[4]  OR
                    bAlarmIO_L15[5]  OR
                    bAlarmIO_L15[6]  OR
                    bAlarmIO_L15[7]  OR
                    bAlarmIO_L15[8]  OR
                    bAlarmIO_L15[9]  OR
                    bAlarmIO_L15[10] OR
                    bAlarmIO_L15[11] OR
                    bAlarmIO_L15[12] OR
                    bAlarmIO_L15[13] OR
                    bAlarmIO_L15[14] OR
                    bAlarmIO_L15[15] OR
                    bAlarmIO_L15[16] OR
                    bAlarmIO_L15[17] OR
                    bAlarmIO_L15[18] OR
                    bAlarmIO_L15[19] OR
                    bAlarmIO_L15[20] ; //OR
                    (*bAlarmIO_L15[21] OR
                    bAlarmIO_L15[22] OR
                    bAlarmIO_L15[23] OR
                    bAlarmIO_L15[24] OR
                    bAlarmIO_L15[25] OR
                    bAlarmIO_L15[26] OR
                    bAlarmIO_L15[27] OR
                    bAlarmIO_L15[28] OR
                    bAlarmIO_L15[29] OR
                    bAlarmIO_L15[30] OR
                    bAlarmIO_L15[31] OR
                    bAlarmIO_L15[32] OR
                    bAlarmIO_L15[33] OR
                    bAlarmIO_L15[34] OR
                    bAlarmIO_L15[35] OR
                    bAlarmIO_L15[36] OR
                    bAlarmIO_L15[37] OR
                    bAlarmIO_L15[38] OR
                    bAlarmIO_L15[39] OR
                    bAlarmIO_L15[40] ;*)  
  
END_ACTION
