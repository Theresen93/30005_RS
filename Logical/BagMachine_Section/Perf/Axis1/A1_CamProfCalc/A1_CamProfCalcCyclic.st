(********************************************************************
 * COPYRIGHT -- .
 ********************************************************************
 * Program: A1_CamProfCalc
 * File: A1_CamProfCalcCyclic.st
 * Author: dominique
 * Created: August 24, 2011
 ********************************************************************
 * Implementation of program A1_CamProfCalc
 ********************************************************************)

PROGRAM _CYCLIC 
  
    IF ( gA[1].Cmd_CalcCameProf OR
         0                      OR  
         bCmd_CalcCam_Test )    AND 
       (iStepCalPerfCam = 0)    AND
       (iStepPosPerfCam = 0)    AND 
       //0                        AND 
       1                        THEN 
      iStepCalPerfCam := 2 ;
    END_IF ;
       
    CASE iStepCalPerfCam OF 
        
      // -------------------------------------------------------------------------------   
      1 : ; // Waiting Error Reset   
        IF EDGEPOS(gAlarmReset OR gA[1].Cmd_Reset) THEN 
          g_bCamPerfCalcReset    := 0 ;
          g_bCamPerfCalc_Error   := 0 ;
          g_uiCalcCamPerfErrorID := 0 ;
          iStepCalPerfCam := 0 ;
        END_IF
        
      // -------------------------------------------------------------------------------    
      2 : ; // Came profile calculation 
      
        // Came profile calculation just for pos park on master side calculation
        // Synchro zone de 0° --> End Point of synchro zone 
        // Compensation zone End Point of synchro zone --> Axis Periode
         
        // Calculation of Came section 
        // Slave interval 
        rSlInterval := gSP_A[1].MatchedSpeed * gA[1].UnitsPerDeg ;
        // Master interval 
        rMaInterval := g_rActualSizePerf_in / gRecipeActive.Repeat * rSlInterval ;           
        // Speed inteval 
        rSpeedInterval := rSlInterval / rMaInterval ;   
        // Slave Periode 
        rSlPeriod := gA[1].AxisPeriod / gSP_PerfKnifeCount ;
        // Slave end point 
        iiSlEndPoint := REAL_TO_DINT(rSlPeriod) ;
        // Master matched speed zone 
        rMastMatchedSpeed := g_rActualSizePerf_in / gRecipeActive.Repeat * gSP_A[1].MatchedSpeed ;  
    
        // First point of the Came Profile
        stPerfCamSect.Section[0].MasterPosition   := 0.0 ;
        stPerfCamSect.Section[0].SlavePosition    := 0.0 ;
        stPerfCamSect.Section[0].FirstDerivative  := rSpeedInterval ;
        stPerfCamSect.Section[0].SecondDerivative := 0.0 ;
        stPerfCamSect.Section[0].Mode             := mcABSOLUTE ; 
        stPerfCamSect.Section[0].Type             := mcSTRAIGHT_LINE ;   

        // Second point of the Came Profile
        stPerfCamSect.Section[1].MasterPosition   := rMaInterval ;
        stPerfCamSect.Section[1].SlavePosition    := rSlInterval ;
        stPerfCamSect.Section[1].FirstDerivative  := rSpeedInterval ;
        stPerfCamSect.Section[1].SecondDerivative := 0.0 ;
        stPerfCamSect.Section[1].Mode             := mcABSOLUTE ; 
        stPerfCamSect.Section[1].Type             := mc5TH_ORDER_POLYNOMIAL ; 

        // Third point of the Came Profile
        stPerfCamSect.Section[2].MasterPosition   := REAL_TO_DINT(gA[11].AxisPeriod) ;
        stPerfCamSect.Section[2].SlavePosition    := iiSlEndPoint ;
        stPerfCamSect.Section[2].FirstDerivative  := rSpeedInterval ;
        stPerfCamSect.Section[2].SecondDerivative := 0.0 ;
        stPerfCamSect.Section[2].Mode             := mcABSOLUTE ; 
        stPerfCamSect.Section[2].Type             := mcLAST_POINT ;  

        MC_BR_CalcCamFromSections_0.Execute           := 1 ;
        MC_BR_CalcCamFromSections_0.DataAddress       := ADR(stPerfCamSect) ;
        MC_BR_CalcCamFromSections_0.CamProfileAddress := ADR(stPerfCamProf) ;

        iStepCalPerfCam := 3 ;
        
      // -------------------------------------------------------------------------------   
      3 : ; // Waiting result of the function 
        IF MC_BR_CalcCamFromSections_0.Done AND 
           ( bNextStep OR NOT(bTestMode) )  THEN
          MC_BR_CalcCamFromSections_0.Execute := 0 ;
          iStepCalPerfCam := 4 ;
          bNextStep := 0 ;
        ELSIF MC_BR_CalcCamFromSections_0.Error THEN
          g_uiCalcCamPerfErrorID := MC_BR_CalcCamFromSections_0.ErrorID;
          IF ( bNextStep OR NOT(bTestMode) ) THEN  
            MC_BR_CalcCamFromSections_0.Execute :=0 ;
            g_bCamPerfCalc_Error := 1 ;
            bNextStep := 0 ;
            iStepCalPerfCam := 1 ;
          END_IF
        END_IF
        
      // -------------------------------------------------------------------------------   
      4 : ; // Transfer Came to the Drive   
        MC_BR_DownloadCamProfileData_0.Axis        := gA[1].Ident ;   
        MC_BR_DownloadCamProfileData_0.DataAddress := ADR(stPerfCamProf) ;
        MC_BR_DownloadCamProfileData_0.Index       := g_uiIndexCamProfPerf ;
        MC_BR_DownloadCamProfileData_0.Periodic    := mcPERIODIC ;
        MC_BR_DownloadCamProfileData_0.Execute     := 1 ;
        
        iStepCalPerfCam := 5 ;
        
      // -------------------------------------------------------------------------------   
      5 : ; // Waiting result of the function 
        IF MC_BR_DownloadCamProfileData_0.Done AND 
           ( bNextStep OR NOT(bTestMode) )     THEN
          MC_BR_DownloadCamProfileData_0.Execute:=FALSE;
          gA[1].Cmd_GetMaPosProf := 1 ;
          gA[1].Cmd_CalcCameProf := 0 ;  
          bCmd_CalcCam_Test := 0 ;   
          bNextStep := 0 ;
          iStepCalPerfCam := 0 ;
        ELSIF MC_BR_DownloadCamProfileData_0.Error THEN
          g_uiCalcCamPerfErrorID := MC_BR_DownloadCamProfileData_0.ErrorID;
          IF ( bNextStep OR NOT(bTestMode) ) THEN  
            MC_BR_DownloadCamProfileData_0.Execute := 0 ;
            g_bCamPerfCalc_Error := 1 ;
            bNextStep := 0 ;
            iStepCalPerfCam := 1 ;
          END_IF 
        END_IF 
    END_CASE 

    MC_BR_CalcCamFromSections_0() ;
    MC_BR_DownloadCamProfileData_0() ; 
    

    
    // In Came Profile master position calculation according to the slave position 
    IF ( gA[1].Cmd_GetMaPosProf   OR 
         gA[1].Cmd_GetSlPosProf ) AND  
       (iStepPosPerfCam = 0)      AND
       //0                          AND 
       1                          THEN 
      iStepPosPerfCam := 2 ;
      
      g_uiGetPosCamProfErrorID_1 := 0 ;
      g_uiGetPosCamProfErrorID_2 := 0 ;
      g_uiGetPosCamProfErrorID_3 := 0 ;
      g_uiHomCamProfErrorID      := 0 ;
    END_IF ;      
    
    CASE iStepPosPerfCam OF 
      // -------------------------------------------------------------------------------    
      1 : ;// Waiting Error Reset
        IF EDGEPOS(gAlarmReset OR gA[1].Cmd_Reset) THEN 
          iStepPosPerfCam := 0 ;
          g_bGetMaPosCamProfError_1 := 0 ;
          g_bGetMaPosCamProfError_2 := 0 ;
          g_bGetSlPosCamProfError   := 0 ;
          g_bHomeCamProfError       := 0 ;
        END_IF 
        
      // -------------------------------------------------------------------------------    
      2 : ; // Task selection
          IF gA[1].Cmd_GetMaPosProf THEN 
            iStepPosPerfCam := 3 ;
          ELSIF gA[1].Cmd_GetSlPosProf THEN  
            iStepPosPerfCam := 10 ;
          ELSE
            iStepPosPerfCam := 0 ;
          END_IF 
          
      // -------------------------------------------------------------------------------    
      3 : ; // Get Came master position command activation 
        MC_BR_GetCamMasterPosition_1.Master := gA[11].Ident ;
        MC_BR_GetCamMasterPosition_1.Slave  := gA[1].Ident ;

        rCamSlPosCalc := H_FC_Modulus(IN_rMod:=rSlPeriod, IN_rVar:=gA[1].PositionCount) ;

        MC_BR_GetCamMasterPosition_1.Execute             := 1 ;
        MC_BR_GetCamMasterPosition_1.SlavePosition       := rCamSlPosCalc ; 
        MC_BR_GetCamMasterPosition_1.MasterStartPosition := rCamMaStartPos ;
        MC_BR_GetCamMasterPosition_1.DataAddress         := ADR(stPerfCamProf) ;
        MC_BR_GetCamMasterPosition_1.MasterFactor        := 1 ;
        MC_BR_GetCamMasterPosition_1.SlaveFactor         := 1 ;
        IF MC_BR_GetCamMasterPosition_1.Done THEN
          rCamMaPosition := MC_BR_GetCamMasterPosition_1.MasterPosition ;
          MC_BR_GetCamMasterPosition_1.Execute := 0 ;
        ELSIF MC_BR_GetCamMasterPosition_1.Error THEN
          g_uiGetPosCamProfErrorID_1 := MC_BR_GetCamMasterPosition_1.ErrorID ;
          MC_BR_GetCamMasterPosition_1.Execute := 0 ;
          g_bGetMaPosCamProfError_1 := 1 ;
        END_IF
        
        
        MC_BR_GetCamMasterPosition_2.Master := gA[11].Ident ;
        MC_BR_GetCamMasterPosition_2.Slave  := gA[1].Ident ;
        
        rTempPosParkSlaveCam := gSP_A[1].ParkPosition * gA[1].UnitsPerDeg ;

        MC_BR_GetCamMasterPosition_2.Execute             := 1 ;
        MC_BR_GetCamMasterPosition_2.SlavePosition       := rTempPosParkSlaveCam ; 
        MC_BR_GetCamMasterPosition_2.MasterStartPosition := rCamMaStartPos ;
        MC_BR_GetCamMasterPosition_2.DataAddress         := ADR(stPerfCamProf) ;
        MC_BR_GetCamMasterPosition_2.MasterFactor        := 1 ;
        MC_BR_GetCamMasterPosition_2.SlaveFactor         := 1 ;
        IF MC_BR_GetCamMasterPosition_2.Done AND 
           NOT ( g_bGetMaPosCamProfError_1 ) THEN
          g_rPosParkMasterCam := MC_BR_GetCamMasterPosition_2.MasterPosition / gA[1].UnitsPerDeg ;
          MC_BR_GetCamMasterPosition_2.Execute := 0 ;
          iStepPosPerfCam := 4 ;
        ELSIF MC_BR_GetCamMasterPosition_2.Error THEN
          g_uiGetPosCamProfErrorID_2 := MC_BR_GetCamMasterPosition_2.ErrorID ;
          MC_BR_GetCamMasterPosition_2.Execute := 0 ;
          g_bGetMaPosCamProfError_2 := 1 ;
        END_IF
        
        IF g_bGetMaPosCamProfError_1 OR 
           g_bGetMaPosCamProfError_2 THEN 
          iStepPosPerfCam := 1 ;       
        END_IF 
 
      // -------------------------------------------------------------------------------    
      4 : ; // Positionning Master on Synchro position 
        MC_Home_0.Axis       := gA[11].Ident;
        IF gA[11].Ind_StandStill THEN   
          MC_Home_0.Execute := 1 ;
        END_IF
        MC_Home_0.Position   := rCamMaPosition ;
        MC_Home_0.HomingMode := mcHOME_DIRECT;
        IF MC_Home_0.Done THEN
          MC_Home_0.Execute := 0 ;
          iStepPosPerfCam := 0 ;
          gA[1].Cmd_GetMaPosProf := 0 ;
          gA[1].Cmd_CalcCameProf := 0 ;  
          g_bCameProf_OK := 1 ;
        ELSIF MC_Home_0.Error THEN
          g_uiHomCamProfErrorID := MC_Home_0.ErrorID ;
          MC_Home_0.Execute := 0 ;
          g_bHomeCamProfError := 1 ;
          iStepPosPerfCam := 1 ;
        END_IF
   
      // -------------------------------------------------------------------------------    
      10 : ; // Get Came slave position command activation 
        MC_BR_GetCamSlavePosition_0.Master := gA[11].Ident ;
        MC_BR_GetCamSlavePosition_0.Slave  := gA[1].Ident ;

        MC_BR_GetCamSlavePosition_0.Execute        := 1 ;
        MC_BR_GetCamSlavePosition_0.MasterPosition := rCamMaPos ;
        MC_BR_GetCamSlavePosition_0.DataAddress    := ADR(stPerfCamProf) ;
        MC_BR_GetCamSlavePosition_0.MasterFactor   := 1 ;
        MC_BR_GetCamSlavePosition_0.SlaveFactor    := 1 ;
        IF MC_BR_GetCamSlavePosition_0.Done THEN
          rCamSlPosition := MC_BR_GetCamSlavePosition_0.SlavePosition ;
          MC_BR_GetCamSlavePosition_0.Execute := 0 ;
          iStepPosPerfCam := 11 ;
        ELSIF MC_BR_GetCamSlavePosition_0.Error THEN
          g_uiGetPosCamProfErrorID_3 := MC_BR_GetCamSlavePosition_0.ErrorID ;
          MC_BR_GetCamSlavePosition_0.Execute := 0 ;
          g_bGetSlPosCamProfError := 1 ;
          iStepPosPerfCam := 1 ;
        END_IF
          
      // -------------------------------------------------------------------------------    
      11 : ; // 
        gA[1].Cmd_GetSlPosProf := 0 ;
        iStepPosPerfCam := 0 ;
      END_CASE 
         
    MC_Home_0();
    MC_BR_GetCamMasterPosition_1() ;
    MC_BR_GetCamMasterPosition_2() ;
    MC_BR_GetCamSlavePosition_0() ;  
END_PROGRAM
