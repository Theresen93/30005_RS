(********************************************************************
 * COPYRIGHT -- .
 ********************************************************************
 * Program: Tilter
 * File: TilterCyclic.st
 * Author: dominique
 * Created: August 16, 2011
 ********************************************************************
 * Implementation of program Tilter
 ********************************************************************)

PROGRAM _CYCLIC
    
    
    
    // End travel Tilter 
    g_bBund_EndTravUp   := gI_Bund_S108 AND bQ_Bund_DriveDirection AND bQ_Bund_DriveStart ;
    g_bBund_EndTravDown := gI_Bund_S106 AND NOT(bQ_Bund_DriveDirection) AND bQ_Bund_DriveStart ;

    // Output assignments
    gQ_Bund_SOL_14C3Out := bQ_Bund_SOL_14C3Out AND gBagMachine_EstopAlarmsOK ;  
    gQ_Bund_SOL_14C4Out := bQ_Bund_SOL_14C4Out AND gBagMachine_EstopAlarmsOK ; 
    gQ_Bund_SOL_14C5Out := bQ_Bund_SOL_14C5Out AND gBagMachine_EstopAlarmsOK ; 
    
    // Drive Tilter
    gQ_Bund_DriveStart := bQ_Bund_DriveStart AND gBagMachine_EstopAlarmsOK    AND 
                          NOT(g_bBund_EndTravUp) AND NOT(g_bBund_EndTravDown) ;                  
    gQ_Bund_DriveDirection := bQ_Bund_DriveDirection AND gBagMachine_EstopAlarmsOK AND 
                              NOT(g_bBund_EndTravUp) AND NOT(g_bBund_EndTravDown)  ; 
    gQ_Bund_DriveFastSpeed := bQ_Bund_DriveFastSpeed AND gBagMachine_EstopAlarmsOK AND 
                              NOT(g_bBund_EndTravUp) AND NOT(g_bBund_EndTravDown)  ; 
    gQ_Bund_DriveFailReset := gAlarmReset ;
    
    gQ_Bund_MotorBrake := gQ_Bund_DriveStart OR gQ_Bund_DriveFastSpeed ;
    
    
    
    
    //---------------------------------------------------------------------------------------------------------------------
    // Sensor watching
    
    H_FB_Flash_0(IN_bEnable:=1, IN_rNumFlashPerSec:=2) ;
    bFlash := H_FB_Flash_0.OUT_bFlash ;
    
    // S104 on 14C3 In
    H_FB_WS_14C3.IN_bSensorIn   := gI_Bund_S104 ;
    H_FB_WS_14C3.IN_bSOL_In     := NOT(gQ_Bund_SOL_14C3Out) ;    
    H_FB_WS_14C3.IN_bSOL_Out    := gQ_Bund_SOL_14C3Out ;
    H_FB_WS_14C3.IN_bActSensIn  := 1 ;
    H_FB_WS_14C3.IN_bActSensOut := 0 ;
    H_FB_WS_14C3.IN_tTpWatchIn  := g_tBund_TpWatchSens ;
    H_FB_WS_14C3.IN_tTpWatchOut := g_tBund_TpWatchSens ;
    H_FB_WS_14C3.IN_bReset      := gAlarmReset ;
    H_FB_WS_14C3();
    bS104_FaultOut := H_FB_WS_14C3.OUT_bSensIn_FaultOut ;
    bS104_FaultIn  := H_FB_WS_14C3.OUT_bSensIn_FaultIn ;
    bS104_Fault    := H_FB_WS_14C3.OUT_bSensIn_Fault ;

    // S110 on 14C4 In
    H_FB_WS_14C4.IN_bSensorIn   := gI_Bund_S110 ;
    H_FB_WS_14C4.IN_bSOL_In     := NOT(gQ_Bund_SOL_14C4Out) ;    
    H_FB_WS_14C4.IN_bSOL_Out    := gQ_Bund_SOL_14C4Out ;
    H_FB_WS_14C4.IN_bActSensIn  := 1 ;
    H_FB_WS_14C4.IN_bActSensOut := 0 ;
    H_FB_WS_14C4.IN_tTpWatchIn  := g_tBund_TpWatchSens ;
    H_FB_WS_14C4.IN_tTpWatchOut := g_tBund_TpWatchSens ;
    H_FB_WS_14C4.IN_bReset      := gAlarmReset ;
    H_FB_WS_14C4();
    bS110_FaultOut := H_FB_WS_14C4.OUT_bSensIn_FaultOut ;
    bS110_FaultIn  := H_FB_WS_14C4.OUT_bSensIn_FaultIn ;
    bS110_Fault    := H_FB_WS_14C4.OUT_bSensIn_Fault ;
    
    // S111 and S112 on 14C5 In and Out
    H_FB_WS_14C5.IN_bSensorIn   := gI_Bund_S111 ;
    H_FB_WS_14C5.IN_bSensorOut  := gI_Bund_S112 ;
    H_FB_WS_14C5.IN_bSOL_In     := NOT(gQ_Bund_SOL_14C5Out) ;    
    H_FB_WS_14C5.IN_bSOL_Out    := gQ_Bund_SOL_14C5Out ;
    H_FB_WS_14C5.IN_bActSensIn  := 1 ;
    H_FB_WS_14C5.IN_bActSensOut := 1 ;
    H_FB_WS_14C5.IN_tTpWatchIn  := g_tBund_TpWatchSens ;
    H_FB_WS_14C5.IN_tTpWatchOut := g_tBund_TpWatchSens ;
    H_FB_WS_14C5.IN_bReset      := gAlarmReset ;
    H_FB_WS_14C5();
    bS111_FaultOut := H_FB_WS_14C5.OUT_bSensIn_FaultOut ;
    bS111_FaultIn  := H_FB_WS_14C5.OUT_bSensIn_FaultIn ;
    bS111_Fault    := H_FB_WS_14C5.OUT_bSensIn_Fault ;
    bS112_FaultOut := H_FB_WS_14C5.OUT_bSensOut_FaultOut ;
    bS112_FaultIn  := H_FB_WS_14C5.OUT_bSensOut_FaultIn ;
    bS112_Fault    := H_FB_WS_14C5.OUT_bSensOut_Fault ;
    
    // HMI Sensors states display
    IF gI_Bund_S104 THEN 
      iHMI_Bund_S104 := 1 ;
    ELSE
      iHMI_Bund_S104 := 0 ;
    END_IF 
    IF bS104_Fault AND 
       bFlash      THEN 
      iHMI_Bund_S104 := 2 ;
    END_IF         
    
    IF gI_Bund_S106 THEN 
      iHMI_Bund_S106 := 1 ;
      IF g_bBund_EndTravDown AND 
         bFlash              THEN 
        iHMI_Bund_S106 := 2 ;
      END_IF   
    ELSE
      iHMI_Bund_S106 := 0 ;
    END_IF   
    
    IF gI_Bund_S108 THEN 
      iHMI_Bund_S108 := 1 ;
      IF g_bBund_EndTravUp AND 
         bFlash            THEN 
        iHMI_Bund_S108 := 2 ;
      END_IF   
    ELSE
      iHMI_Bund_S108 := 0 ;
    END_IF    
    
    IF gI_Bund_S110 THEN 
      iHMI_Bund_S110 := 1 ;
    ELSE
      iHMI_Bund_S110:= 0 ;
    END_IF    
    IF bS110_Fault AND 
       bFlash      THEN 
      iHMI_Bund_S110 := 2 ;
    END_IF         
    
    IF gI_Bund_S111 THEN 
      iHMI_Bund_S111 := 1 ;
    ELSE
      iHMI_Bund_S111 := 0 ;
    END_IF   
    IF bS111_Fault AND 
       bFlash      THEN 
      iHMI_Bund_S111 := 2 ;
    END_IF     
    
    IF gI_Bund_S112 THEN 
      iHMI_Bund_S112 := 1 ;
    ELSE
      iHMI_Bund_S112 := 0 ;
    END_IF   
    IF bS112_Fault AND 
       bFlash      THEN 
      iHMI_Bund_S112 := 2 ;
    END_IF   
    
    g_bBund_SensFaultCycTilt := bS104_Fault OR bS110_Fault OR bS111_Fault OR bS112_Fault ;
    
    
    // HMI Cylinders states display   
    // Cylinder 14C3
    // Case Out
    IF gQ_Bund_SOL_14C3Out THEN       
      iHMI_Bund_14C3Out_State := 1 ;
      iHMI_Bund_14C3In_State  := 0 ;
    END_IF   
    IF bS104_FaultOut THEN 
      IF bFlash THEN 
        iHMI_Bund_14C3Out_State := 2 ;
      ELSE  
        iHMI_Bund_14C3Out_State := 3 ;
      END_IF     
    END_IF   
    // Case In
    IF NOT(gQ_Bund_SOL_14C3Out) THEN       
      iHMI_Bund_14C3In_State  := 4 ;
      iHMI_Bund_14C3Out_State := 0 ;
    END_IF   
    IF bS104_FaultIn THEN 
      IF bFlash THEN 
        iHMI_Bund_14C3In_State := 5 ;
      ELSE  
        iHMI_Bund_14C3In_State := 6 ;
      END_IF          
    END_IF       
       
    // Cylinder 14C4
    // Case Out
    IF gQ_Bund_SOL_14C4Out THEN       
      iHMI_Bund_14C4Out_State := 4 ;
      iHMI_Bund_14C4In_State  := 0 ;
    END_IF   
    IF bS110_FaultOut THEN 
      IF bFlash THEN 
        iHMI_Bund_14C4Out_State := 5 ;
      ELSE  
        iHMI_Bund_14C4Out_State := 6 ;
      END_IF     
    END_IF   
    // Case In
    IF NOT(gQ_Bund_SOL_14C4Out) THEN       
      iHMI_Bund_14C4In_State  := 1 ;
      iHMI_Bund_14C4Out_State := 0 ;
    END_IF   
    IF bS110_FaultIn THEN 
      IF bFlash THEN 
        iHMI_Bund_14C4In_State := 2 ;
      ELSE  
        iHMI_Bund_14C4In_State := 3 ;
      END_IF      
    END_IF             
       
    // Cylinder 14C5
    // Case Out
    IF gQ_Bund_SOL_14C5Out THEN       
      iHMI_Bund_14C5Out_State := 1 ;
      iHMI_Bund_14C5In_State  := 0 ;
    END_IF   
    IF bS111_FaultOut OR bS112_FaultOut THEN 
      IF bFlash THEN 
        iHMI_Bund_14C5Out_State := 2 ;
      ELSE  
        iHMI_Bund_14C5Out_State := 3 ;
      END_IF   
    END_IF   
    // Case In
    IF NOT(gQ_Bund_SOL_14C5Out) THEN       
      iHMI_Bund_14C5In_State  := 4 ;
      iHMI_Bund_14C5Out_State := 0 ;
    END_IF   
    IF bS111_FaultIn OR bS112_FaultIn THEN 
      IF bFlash THEN 
        iHMI_Bund_14C5In_State := 5 ;
      ELSE  
        iHMI_Bund_14C5In_State := 6 ;
      END_IF 
    END_IF            
  
  
  
  
  
     // --------------------------------------------------
     // HIM Tilter postion setup 
     IF EDGEPOS(bHMI_Cmd_RecPosIn14C1) AND 
        NOT(bQ_Bund_DriveStart)        THEN 
       gr_rPosTilt14C4In := rPosTiltAct ;
     END_IF 
     
     
     

     // --------------------------------------------------
     // Calculations 
     rPosTiltUpLSpeed   := gr_rPosTiltTravel - gr_rPosTiltZLSpeed ;
     rPosTiltDownLSpeed := gr_rPosTiltZLSpeed ;
     rPosTiltUpStop     := gr_rPosTiltStopUp ;
     rPosTiltDownStop   := gr_rPosTiltStopDown ;
     
     
     
     // Tilter  actual position mesured
     rPosTiltActTemp1 := INT_TO_REAL(gAI_Bund_TiltPos) * rPosTiltDegPts + gr_rPosTiltOffset0 ;
     rPosTiltActTemp4 := gr_rPosTiltTravel - rPosTiltActTemp1 ;
     // Filtering mesured position (Lowpass PT1)
     rPosTiltActTemp2 := ( rPosTiltActTemp1 + rK * rPosTiltActTemp2 ) / ( rK + 1 ) ;
     rPosTiltActTemp3 := gr_rPosTiltTravel - rPosTiltActTemp2 ;
     
     
     IF (( rPosTiltActTemp4 - rMemoPosTiltAct ) < -10) AND 
        bQ_Bund_DriveDirection                         THEN 
       rNumRoundTilt := 1 ;
     END_IF 
     IF (( rPosTiltActTemp4 - rMemoPosTiltAct ) > 10) AND 
        NOT(bQ_Bund_DriveDirection)                   THEN 
       rNumRoundTilt := 0 ;
     END_IF 
     IF iCmpt > 10 THEN  
       iCmpt := 0 ;  
       rMemoPosTiltAct := rPosTiltActTemp4 ;
     END_IF 
     iCmpt := iCmpt + 1 ;
     
     rPosTiltAct := rPosTiltActTemp3 + rNumRoundTilt * gr_rPosTiltTravel ;
     IF rPosTiltAct < 0.0 THEN 
       rPosTiltAct := 0.0 ;
     END_IF 
     
     // HMI display filtering
     rHMI_PosTiltAct := ( rPosTiltAct + rK_HMI * rHMI_PosTiltAct ) / ( rK_HMI + 1 )  ; 
     IF rHMI_PosTiltAct < 0.0 THEN 
       rHMI_PosTiltAct := 0.0 ;
     END_IF 
     
     // Pos init Tilter OK
     IF rPosTiltAct <= rPosTiltInit_OK THEN  
       bPosTiltInit_OK := 1 ;
     END_IF 
     IF rPosTiltAct > (rPosTiltInit_OK + rPosTiltInitHyst) THEN  
       bPosTiltInit_OK := 0 ;
     END_IF 
     
     // Position Tilter for move out cylinder 14C4
     rPosTilt14C4Out := gr_rPosTilt14C4In + gr_rPosTiltTrav14C4Out ;
     
     // Tilter position indicator
     rPosTiltUpLSpeed   := rPosTiltUpStop - gr_rPosTiltZLSpeed ;
     rPosTiltDownLSpeed := rPosTiltDownStop + gr_rPosTiltZLSpeed ;
     // Low speed selection
     bIndLSpeed := ( rPosTiltAct >= rPosTiltUpLSpeed )   AND 
                   bQ_Bund_DriveDirection                OR 
                   ( rPosTiltAct <= rPosTiltDownLSpeed ) AND
                   NOT(bQ_Bund_DriveDirection)           OR 
                   g_bIndBundManu                        ; 
                    
                    
    IF ( rPosTiltAct >= rPosTiltUpStop ) OR 
       gI_Bund_S108                      THEN 
      bIndPosUpStop := 1 ;
    END_IF 
    IF ( rPosTiltAct >= 20.0 )          AND 
       ( rPosTiltAct < rPosTiltUpStop ) AND 
       NOT(gI_Bund_S108)                THEN 
      bIndPosUpStop := 0 ;
    END_IF 
    IF ( rPosTiltAct <= rPosTiltDownStop ) OR 
       gI_Bund_S106                        THEN  
      bIndPosDownStop := 1 ;
    END_IF 
    IF ( rPosTiltAct <= 40.0 )            AND 
       ( rPosTiltAct > rPosTiltDownStop ) AND 
       NOT(gI_Bund_S106)                  THEN  
      bIndPosDownStop := 0 ;
    END_IF 














    //---------------------------------------------------------------------------------------------------------------------
    // Tilter cycle 
    //---------------------------------------------------------------------------------------------------------------------    

    // Start cycle         
    IF g_bIndSelBundProd               AND 
       gBagMachine_EstopAlarmsOK       AND 
       NOT(bInitTiltCycl)              AND
       NOT(g_bBund_SensFaultCycTilt)   AND
       NOT(g_bBund_TimOutFaultCycTilt) AND   
       1                               THEN                   
      stCycBundTilt.bSCyc := 1 ;
    END_IF ;
    
    //----------------------------------------------------------------------
    // Cycle at rest  
    IF NOT(stCycBundTilt.bSCyc) AND 
       1                       THEN
      IF NOT( stCycBundTilt.bFCyc ) THEN  
        // Init after cycle unpropaly ended    
        stCycBundTilt.bFCyc := 1 ;
        stCycBundTilt.bCyc  := 0 ; 
        stCycBundTilt.bCycFail := 1 ;
        
        bInitTiltCycl          := 0 ;
        g_bBund_InitTilt       := 0 ;
        bQ_Bund_DriveStart     := 0 ;
        bQ_Bund_DriveFastSpeed := 0 ;
        bQ_Bund_DriveDirection := 0 ;
      END_IF  
      stCycBundTilt.iStep := 0 ;   
      RETURN ;
    ELSE
    //----------------------------------------------------------------------
    // Cycle running     
    
     
    // Manu mode 
      IF g_bIndBundManu THEN 
        stCycBundTilt.iStep := C_iSTEP_25 ;
        // In manu mode cycle is frozen in Step 25
        IF bHMI_BundMan_14C3P_PB THEN 
          bQ_Bund_SOL_14C3Out := 1 ;
        END_IF 
        IF bHMI_BundMan_14C3M_PB THEN 
          bQ_Bund_SOL_14C3Out := 0 ;
        END_IF 
        IF bHMI_BundMan_14C4P_PB THEN 
          bQ_Bund_SOL_14C4Out := 1 ;
        END_IF 
        IF bHMI_BundMan_14C4M_PB THEN 
          bQ_Bund_SOL_14C4Out := 0 ;
        END_IF 
        IF bHMI_BundMan_14C5P_PB THEN 
          bQ_Bund_SOL_14C5Out := 1 ;
        END_IF 
        IF bHMI_BundMan_14C5M_PB THEN 
          bQ_Bund_SOL_14C5Out := 0 ;
        END_IF 
        bQ_Bund_DriveStart     := bHMI_BundMan_TiltUp_PB OR bHMI_BundMan_TiltDown_PB ;
        bQ_Bund_DriveDirection := bHMI_BundMan_TiltUp_PB ;
      END_IF 
      IF NOT(g_bIndBundManu) THEN      
        bHMI_BundMan_14C3P_PB := 0 ;
        bHMI_BundMan_14C4P_PB := 0 ;
        bHMI_BundMan_14C5P_PB := 0 ;
        bHMI_BundMan_TiltUp_PB   := 0 ;
        bHMI_BundMan_TiltDown_PB := 0 ;
      END_IF 
      
    // Permanent conditions   
      IF NOT(gBagMachine_EstopAlarmsOK) OR 
         g_bBund_SensFaultCycTilt       THEN 
        stCycBundTilt.bSCyc := 0 ;  
        bHMI_BundMan_14C3P_PB := 0 ;
        bHMI_BundMan_14C4P_PB := 0 ;
        bHMI_BundMan_14C5P_PB := 0 ;
        bHMI_BundMan_TiltUp_PB   := 0 ;
        bHMI_BundMan_TiltDown_PB := 0 ;
        bQ_Bund_DriveStart     := 0 ;
        bQ_Bund_DriveFastSpeed := 0 ;
        bQ_Bund_DriveDirection := 0 ;
      END_IF 
      
      // Init cycle 
      // Start init
      IF g_bBund_InitTilt   AND
         NOT(bInitTiltCycl) THEN 
        bInitTiltCycl       := 1 ;
        g_bBundInitTilt_OK  := 0 ; 
        // Put cycle in Step
        IF (rPosTiltAct >= rPosTilt14C4Out) THEN 
          stCycBundTilt.iStep := C_iSTEP_15 ;
          // Action Step 15  
          bQ_Bund_SOL_14C3Out := 1 ; 
          bQ_Bund_SOL_14C4Out := 1 ; 
        ELSE
          stCycBundTilt.iStep := C_iSTEP_4 ;  
        // Action Step 4  
          bQ_Bund_SOL_14C3Out    := 0 ; 
          bQ_Bund_SOL_14C4Out    := 0 ; 
          bQ_Bund_DriveStart     := 1 ;
          bQ_Bund_DriveDirection := 1 ; 
          g_bBund_StartTilt      := 0 ; 
          iMemoStepCyc           := C_iSTEP_99 ;    
        END_IF    
        // Init cycle 
        stCycBundTilt.bFCyc := 0 ;
        stCycBundTilt.bCyc  := 1 ;  
        stCycBundTilt.bCycFail := 0 ;  
        g_bBund_MoveInSep_OK   := 0 ;  
      END_IF 
      // Stop init
      IF g_bBundStopInitTilt THEN 
        g_bBund_InitTilt    := 0 ;
        g_bBundInitTilt_OK  := 0 ; 
        g_bBundStopInitTilt := 0 ;
        stCycBundTilt.bSCyc := 0 ;  
      END_IF  
         
      // Watching Step time out
      IF g_bIndBundManu                      OR 
         ( stCycBundTilt.iStep < C_iSTEP_4 ) THEN

        iMemoStepCyc := C_iSTEP_99 ;    
        stTON_WatchCyc(IN:=(iMemoStepCyc=stCycBundTilt.iStep), PT:=tTpWatchCyc);   
      ELSE
        stTON_WatchCyc(IN:=(iMemoStepCyc=stCycBundTilt.iStep), PT:=tTpWatchCyc);   
        iMemoStepCyc := stCycBundTilt.iStep ;    
      END_IF  
      IF stTON_WatchCyc.Q THEN     
        g_bBund_TimOutFaultCycTilt := 1 ; 
        //stCycBundTilt.bSCyc := 0 ;  
      END_IF  
         
         
    // Permanent actions 
      bTON_StopTilt_IN := ( (stCycBundTilt.iStep = C_iSTEP_7)  AND bIndPosUpStop     OR 
                            (stCycBundTilt.iStep = C_iSTEP_11) AND bIndPosDownStop ) ;
      stTON_StopTilt (
            IN := bTON_StopTilt_IN ,
            PT := tTpStopTilt
                     ) ;
      
      // Tilter speed 
      bQ_Bund_DriveFastSpeed := NOT(bIndLSpeed) AND bQ_Bund_DriveStart ;
      
      // Cylinder 14C5
      stTON_Out14C5(IN:=gI_Bund_S112 AND NOT(g_bIndBundManu), PT:=tTpOut14C5) ;
      IF stTON_Out14C5.Q THEN 
        bQ_Bund_SOL_14C5Out := 0 ;
      END_IF      
       
      // Cylinder 14C3
      stTON_Out14C3(IN:=bQ_Bund_SOL_14C3Out AND NOT(g_bIndBundManu), PT:=tTpOut14C3) ;
      
      
    END_IF  
    //----------------------------------------------------------------------
    // Cycle steps     
      
        CASE stCycBundTilt.iStep OF 

        C_iSTEP_0 :    
         //----------------------------------------------      
         // Etape 1 : Initialisation cycle   
         //----------------------------------------------
          IF TRUE THEN 
            stCycBundTilt.iStep := C_iSTEP_1 ;  
            
            // Action Step 1  
            stCycBundTilt.bFCyc := 0 ;
            stCycBundTilt.bCyc  := 1 ;  
            stCycBundTilt.bCycFail := 0 ;  
            
            g_bBund_MoveInSep_OK := 0 ;
          END_IF          
                      
        C_iSTEP_1 :    
         //----------------------------------------------      
         // Etape 2 : Waiting for start cycle     
         //----------------------------------------------      
          IF TRUE                            AND 
             ( stCycBundTilt.bTestOn         OR
               NOT(stCycBundTilt.bModTest) ) THEN 
            stCycBundTilt.iStep := C_iSTEP_2 ;    
            
            // Action Step 2  
            stCycBundTilt.bTestOn := 0 ;
            
            //Waiting for start cycle  
          END_IF   
          
        C_iSTEP_2 : 
         //----------------------------------------------      
         // Etape 4 : Rising Tilter 
         //----------------------------------------------    
          IF g_bBund_StartTilt              AND 
             g_bBundInitTilt_OK             AND 
             ( stCycBundTilt.bTestOn        OR
              NOT(stCycBundTilt.bModTest) ) THEN 
            stCycBundTilt.iStep := C_iSTEP_4 ;    
            
            // Action Step 4  
            stCycBundTilt.bTestOn := 0 ;
            
            bQ_Bund_DriveStart     := 1 ;
            bQ_Bund_DriveDirection := 1 ; 
            g_bBund_StartTilt      := 0 ;   
          END_IF   
              
        C_iSTEP_4 :  
         //----------------------------------------------    
         // Step 5 : Move in cylinder 14C4 and 14C3  
         //----------------------------------------------      
          IF ( rPosTiltAct >= gr_rPosTilt14C4In ) AND    
             ( stCycBundTilt.bTestOn              OR
               NOT(stCycBundTilt.bModTest) )      THEN 
            stCycBundTilt.iStep := C_iSTEP_5 ;   
               
            // Action Step 5      
            stCycBundTilt.bTestOn := 0 ;
            
            bQ_Bund_SOL_14C3Out := 0; //;;;;;;;;;;;;modif 12092011 input also 14C3 
            bQ_Bund_SOL_14C4Out := 0 ;  
          END_IF    
          
        C_iSTEP_5 :  
         //---------------------------------------------- 
         // Step 6 : Output cylinder 14C4    
         //          and waiting for Stop position
         //----------------------------------------------      
          IF gI_Bund_S110                       AND    
             ( rPosTiltAct >= rPosTilt14C4Out ) AND    
             ( stCycBundTilt.bTestOn            OR
               NOT(stCycBundTilt.bModTest) )    THEN 
            stCycBundTilt.iStep := C_iSTEP_6 ;  
            
            // Action Step 6  
            stCycBundTilt.bTestOn := 0 ;
            
            bQ_Bund_SOL_14C3Out  := 1;//;;;;;;;;;;;;modif 12092011
            bQ_Bund_SOL_14C4Out  := 1 ;  
            g_bBund_MoveInSep_OK := NOT(bInitTiltCycl) ;
            // Waiting for Stop position
          END_IF     
          
        C_iSTEP_6 :  
         //----------------------------------------------      
         // Etape 7 : Stop Tilter and waiting stop   
         //---------------------------------------------- 
          IF NOT(gI_Bund_S110)               AND    
             ( bIndPosUpStop                 OR   
               g_bBund_EndTravUp )           AND   
             ( stCycBundTilt.bTestOn         OR
               NOT(stCycBundTilt.bModTest) ) THEN 
            stCycBundTilt.iStep := C_iSTEP_7 ;  
            
            // Action Step 7    
            stCycBundTilt.bTestOn := 0 ;
            
            bQ_Bund_DriveStart := 0 ;
            // Waiting stop
          END_IF    
          
        C_iSTEP_7 :  
         //----------------------------------------------      
         // Etape 8 : Move down Tilter    
         //---------------------------------------------- 
          IF stTON_StopTilt.Q                AND    
             ( stCycBundTilt.bTestOn         OR
               NOT(stCycBundTilt.bModTest) ) THEN 
            stCycBundTilt.iStep := C_iSTEP_8 ;  
            
            // Action Step 8    
            stCycBundTilt.bTestOn := 0 ;
            
            bQ_Bund_DriveStart     := 1 ;
            bQ_Bund_DriveDirection := 0 ; 
          END_IF      
          
        C_iSTEP_8 :  
         //----------------------------------------------      
         // Etape 9 : Move in cylinder 14C3 and 14C4    
         //           Out cylinder 14C5 
         //---------------------------------------------- 
          IF ( rPosTiltAct <= 59.0 )             AND    
             ( stCycBundTilt.bTestOn             OR
               NOT(stCycBundTilt.bModTest) )     THEN 
            stCycBundTilt.iStep := C_iSTEP_9 ;  
            
            // Action Step 9    
            stCycBundTilt.bTestOn := 0 ;
            
            bQ_Bund_SOL_14C3Out := 0 ;
            //bQ_Bund_SOL_14C4Out := 0 ; 
            bQ_Bund_SOL_14C5Out := 1 ; 
          END_IF       
          
        C_iSTEP_9 :  
         //----------------------------------------------      
         // Etape 10 : Waiting for Stop position down     
         //---------------------------------------------- 
          IF gI_Bund_S104                    AND    
             //gI_Bund_S110                    AND    
             ( stCycBundTilt.bTestOn         OR
               NOT(stCycBundTilt.bModTest) ) THEN 
            stCycBundTilt.iStep := C_iSTEP_10 ;  
            
            // Action Step 10    
            stCycBundTilt.bTestOn := 0 ;
            
            //Waiting for Stop position down 
          END_IF        
          
        C_iSTEP_10 :  
         //----------------------------------------------      
         // Etape 11 : Stop Tilter and waiting stop    
         //---------------------------------------------- 
          IF bIndPosDownStop                 AND    
             ( stCycBundTilt.bTestOn         OR
               NOT(stCycBundTilt.bModTest) ) THEN 
            stCycBundTilt.iStep := C_iSTEP_11 ;  
            
            // Action Step 11    
            stCycBundTilt.bTestOn := 0 ;
            
            bQ_Bund_DriveStart := 0 ;
            // Waiting stop
          END_IF       
          
        C_iSTEP_11 :  
         //----------------------------------------------      
         // Etape 12 : Move out cylinder 14C3 and 14C4    
         //---------------------------------------------- 
          IF stTON_StopTilt.Q                AND    
             ( stCycBundTilt.bTestOn         OR
               NOT(stCycBundTilt.bModTest) ) THEN 
            stCycBundTilt.iStep := C_iSTEP_12 ;  
            
            // Action Step 12   
            stCycBundTilt.bTestOn := 0 ;
            
            bQ_Bund_SOL_14C3Out := 1 ;
            bQ_Bund_SOL_14C4Out := 1 ; 
          END_IF          
          
        C_iSTEP_12 :  
         //----------------------------------------------       
         // Etape 13 : Waiting back of cylinder 14C5     
         //---------------------------------------------- 
          IF NOT(gI_Bund_S104)               AND    
             NOT(gI_Bund_S110)               AND    
             ( stCycBundTilt.bTestOn         OR
               NOT(stCycBundTilt.bModTest) ) THEN 
            stCycBundTilt.iStep := C_iSTEP_13 ;  
            
            // Action Step 13   
            stCycBundTilt.bTestOn := 0 ; 
            
            // Waiting back of cylinder 14C5 
          END_IF          
                 
        C_iSTEP_13 :  
         //----------------------------------------------       
         // Etape 2 : Waiting for start cycle     
         //---------------------------------------------- 
         IF TRUE THEN
          //IF gI_Bund_S111                    AND   //MODIF DU 14092011  Cycle time too long  
          //   ( stCycBundTilt.bTestOn         OR
          //     NOT(stCycBundTilt.bModTest) ) THEN 
            stCycBundTilt.iStep := C_iSTEP_2 ;  
            
            // Action Step 2   
            stCycBundTilt.bTestOn := 0 ; 
            //Waiting for start cycle 

            g_bBund_InitTilt   := 0 ;
            bInitTiltCycl      := 0 ;
            g_bBundInitTilt_OK := 1 ;
          END_IF                 
                 
        C_iSTEP_15 :  
         //----------------------------------------------      
         // Etape 16 : Rising Tilter 
         //---------------------------------------------- 
          IF NOT(gI_Bund_S104)               AND    
             NOT(gI_Bund_S110)               AND 
             stTON_Out14C3.Q                 AND    
             ( stCycBundTilt.bTestOn         OR
               NOT(stCycBundTilt.bModTest) ) THEN 
            stCycBundTilt.iStep := C_iSTEP_16 ;  
            // Action Step 4   
            stCycBundTilt.bTestOn := 0 ;
            
            bQ_Bund_DriveStart     := 1 ;
            bQ_Bund_DriveDirection := 1 ; 
            g_bBundInitTilt_OK     := 0 ;     
            g_bBund_StartTilt      := 0 ; 
          END_IF                    
                 
        C_iSTEP_16 :  
         //----------------------------------------------      
         // Etape 7 : Stop Tilter and waiting stop   
         //---------------------------------------------- 
          IF ( bIndPosUpStop                 OR   
               g_bBund_EndTravUp )           AND   
             ( stCycBundTilt.bTestOn         OR
               NOT(stCycBundTilt.bModTest) ) THEN 
            stCycBundTilt.iStep := C_iSTEP_7 ;  
            
            // Action Step 7    
            stCycBundTilt.bTestOn := 0 ;
            
            bQ_Bund_DriveStart := 0 ;
            // Waiting stop
          END_IF    
         
        C_iSTEP_25 :  
         //----------------------------------------------   
         // Etape 1 : Initialisation cycle   
         //---------------------------------------------- 
          IF NOT(g_bIndBundManu)             AND    
             ( stCycBundTilt.bTestOn         OR
               NOT(stCycBundTilt.bModTest) ) THEN 
            stCycBundTilt.iStep := C_iSTEP_1 ;  
            
            // Action Step 1  
            stCycBundTilt.bTestOn := 0 ;
            
            stCycBundTilt.bFCyc := 0 ;
            stCycBundTilt.bCyc  := 1 ;    
          END_IF    
        END_CASE     
    //---------------------------------------------------------------------------------------------------------------------

END_PROGRAM
