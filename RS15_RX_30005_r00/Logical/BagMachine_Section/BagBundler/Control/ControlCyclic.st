(********************************************************************
 * COPYRIGHT -- .
 ********************************************************************
 * Program: Control
 * File: ControlCyclic.st
 * Author: dominique
 * Created: August 16, 2011
 ********************************************************************
 * Implementation of program Control
 ********************************************************************)

PROGRAM _CYCLIC


    // -----------------------------------------------------------------     
    // Control Bundler On 
    IF bHMI_Bund_OnOff         AND                     
       NOT(gA[9].Ind_InMotion) AND
       NOT(g_bIndSelBundProd)  AND         
       1                       THEN 
      g_bIndSelBundProd := 1 ; 
    END_IF 
    // Control Bundler Off
    IF NOT(bHMI_Bund_OnOff)    AND                     
       NOT(gA[9].Ind_InMotion) AND
       g_bIndSelBundProd       AND  
       1                       THEN 
      g_bIndSelBundProd := 0 ; 
    END_IF 
       
     
     
     
    // -----------------------------------------------------------------   
    // Control local Bundler manu mode      
    bBundManOn  := EDGEPOS(bHMI_Bund_ManOn_PB) AND NOT(g_bIndBundManu) ;
    bBundManOff := EDGEPOS(bHMI_Bund_ManOn_PB) AND g_bIndBundManu ;
    // On     
    IF bBundManOn              AND 
       gManualMode_On          AND             
       NOT(gA[9].Ind_InMotion) AND      
       1                       THEN 
      g_bIndBundManu := 1 ; 
      iHMI_BundManLock := 1 ;
    END_IF   
    // Off     
    IF ( bBundManOff           OR 
         NOT(gManualMode_On) ) AND  
       1                       THEN 
      g_bIndBundManu := 0 ; 
      iHMI_BundManLock := 0 ;
    END_IF 

    //Manu Mode Off/On From HMI
      H_FB_ToggleTB_0.IN_bTB := g_bIndBundManu ;
      uiBundManTxt_Ind  := H_FB_ToggleTB_0.OUT_uiTxt_Ind;
      uiBundManCol_Ind  := H_FB_ToggleTB_0.OUT_uiCol_Ind;
      H_FB_ToggleTB_0();

    
    
    
    
    // ----------------------------------------------------------------- 
    // Guards
    g_bBundGuard_OK := 1 ; //NOT(gI_GSW_Bund) OR g_bIndSelBundProd ;   D.M. 03/08/2011 BrownPaper_14542 Not used on this machine  


 
    
    
    // ----------------------------------------------------------------- 
    // Bundler ready
    g_bIndBundReady := g_bBundAlarm_OK        AND
                       g_bBundInit_OK         AND   
                       NOT(g_bIndBundManu)    OR 
                       NOT(g_bIndSelBundProd) AND                              
                       1                      ;




    // ----------------------------------------------------------------- 
    // General alarme on Bundler
    g_bBundAlarm_OK := g_bBundGuard_OK                 AND 
                       NOT(g_bBundDriveFault)          AND
                       NOT(g_bBundJamFault)            AND
                       NOT(g_bBund_SensorFault)        AND  
                       NOT(g_bBund_TimOutFault)        OR 
                       NOT(g_bIndSelBundProd)          AND                                     
                       1                               ;
    
    // Reset init indicator in case of fault
    IF NOT(g_bBundAlarm_OK) OR
       g_bIndBundManu       THEN                    
      g_bBundInitSep_OK  := 0 ;                 
      g_bBundInitTilt_OK := 0 ; 
    END_IF ;        
    g_bBundInit_OK := g_bBundInitSep_OK AND g_bBundInitTilt_OK OR NOT(g_bIndSelBundProd) ;           
    
    // Air suply
    gQ_Bund_SOL_AirSupply := g_bBundGuard_OK           AND
                             gBagMachine_EstopAlarmsOK AND   
                             g_bIndSelBundProd         AND
                             g_bMainPower_On           AND  
                             1                         ;
    
    // Sensor fault 
    g_bBund_SensorFault := g_bBund_SensFaultCycSep OR g_bBund_SensFaultCycTilt ;
    // Step Time out 
    g_bBund_TimOutFault := g_bBund_TimOutFaultCycTilt OR g_bBund_TimOutFaultCycSep ;
    
    
    // Reset cycle and sensor fault 
    IF EDGEPOS(gAlarmReset) THEN 
      g_bBund_SensFaultCycSep    := 0 ;
      g_bBund_SensFaultCycTilt   := 0 ;
      g_bBund_TimOutFaultCycSep  := 0 ;  
      g_bBund_TimOutFaultCycTilt := 0 ;    
    END_IF ;        
    
    
    
    // ------------------------------------------------------------------
    // Init Bundler
    // Permissive
    bBundInit_Perm := NOT(gA[9].Ind_InMotion) AND
                      g_bBundAlarm_OK         AND
                      g_bIndSelBundProd       AND 
                      NOT(g_bBundDriveFault)  AND    
                      1                       ;   
    // Start cycle 
    bInitBundStart := bHMI_Bund_Init_PB AND NOT(bInitBund) AND NOT(stTP_0.Q) ;
    // Stop cycle 
    IF EDGEPOS(bHMI_Bund_Init_PB) AND 
       bInitBund                  THEN   
      bInitBundStop := 1 ;
      g_bBundStopInitSep  := 1 ; 
      g_bBundStopInitTilt := 1 ;  
    END_IF  
    stTP_0(IN:=bInitBundStop, PT:=T#2s) ;   
    IF NOT(stTP_0.Q) THEN     
      bInitBundStop := 0 ;
    END_IF  
    
    H_FB_2StepMove_0.IN_bStart  := bInitBundStart ;
    H_FB_2StepMove_0.IN_bPermis := bBundInit_Perm ;    
    H_FB_2StepMove_0.IN_tTpHorn := tBundInitTpHorn ;             
    H_FB_2StepMove_0();
    g_bBund_InitHorn := H_FB_2StepMove_0.OUT_bHorn ;   
          
    IF EDGEPOS(H_FB_2StepMove_0.OUT_bStartMove) AND 
       1                                        THEN   
      g_bBund_InitSep  := 1 ;
      g_bBund_InitTilt := 1 ;    
      g_bBund_SensFaultCycSep    := 0 ;
      g_bBund_SensFaultCycTilt   := 0 ;
      g_bBund_TimOutFaultCycSep  := 0 ;  
      g_bBund_TimOutFaultCycTilt := 0 ;  
    END_IF                
    bInitBund := g_bBund_InitSep  OR 
                 g_bBund_InitTilt ;   
    
    // Init button HMI display 
    CASE H_FB_2StepMove_0.OUT_iActStep OF 
      1 : // Horn ringing 
          uiBundInitTxt_Ind := 1 ;
          uiBundInitCol_Ind := gGreen + gBlack * 256 ;
      2..3 : // Waiting remove start  
          uiBundInitTxt_Ind := 1 ;
          uiBundInitCol_Ind := gBlue + gWhite * 256 ;
      4 : // New start OK
          uiBundInitTxt_Ind := 1 ;
          uiBundInitCol_Ind := gGreen + gBlack * 256 ;
    ELSE
      IF NOT(bInitBund) THEN  
        // Waiting start
        uiBundInitTxt_Ind := 0 ;
        uiBundInitCol_Ind := gBlue + gWhite * 256 ;
      ELSE
        // Cycle running 
        uiBundInitTxt_Ind := 2 ;
        uiBundInitCol_Ind := gRed + gBlack * 256 ;
      END_IF ;              
    END_CASE ;               
        

END_PROGRAM
