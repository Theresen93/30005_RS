(********************************************************************
 * COPYRIGHT -- .
 ********************************************************************
 * Program: Separator
 * File: SeparatorCyclic.st
 * Author: dominique
 * Created: August 15, 2011
 ********************************************************************
 * Implementation of program Separator
 ********************************************************************)

PROGRAM _CYCLIC
    
    
    
    
    
    //---------------------------------------------------------------------------------------------------------------------
    // Output assignments
    gQ_Bund_SOL_14C1Out    := bQ_Bund_SOL_14C1Out AND gBagMachine_EstopAlarmsOK ;  
    gQ_Bund_SOL_14C2Out    := bQ_Bund_SOL_14C2Out AND gBagMachine_EstopAlarmsOK ;  
    gQ_Bund_SOL_PresSelect := bQ_Bund_SOL_PresSelect AND gBagMachine_EstopAlarmsOK ;





    //---------------------------------------------------------------------------------------------------------------------
    // Sensor watching
    
    H_FB_Flash_0(IN_bEnable:=1, IN_rNumFlashPerSec:=2) ;
    bFlash := H_FB_Flash_0.OUT_bFlash ;
    
    // S102 on 14C1 Out
    H_FB_WS_14C1.IN_bSensorOut  := gI_Bund_S102 ;
    H_FB_WS_14C1.IN_bSOL_In     := NOT(gQ_Bund_SOL_14C1Out) ;    
    H_FB_WS_14C1.IN_bSOL_Out    := gQ_Bund_SOL_14C1Out ;
    H_FB_WS_14C1.IN_bActSensIn  := 0 ;
    H_FB_WS_14C1.IN_bActSensOut := 1 ;
    H_FB_WS_14C1.IN_tTpWatchIn  := g_tBund_TpWatchSens ;
    H_FB_WS_14C1.IN_tTpWatchOut := g_tBund_TpWatchSens ;
    H_FB_WS_14C1.IN_bReset      := gAlarmReset ;
    H_FB_WS_14C1();
    bS102_FaultOut := H_FB_WS_14C1.OUT_bSensOut_FaultOut ;
    bS102_FaultIn  := H_FB_WS_14C1.OUT_bSensOut_FaultIn ;
    bS102_Fault    := H_FB_WS_14C1.OUT_bSensOut_Fault ;
    
    // S101 on 14C2 In
    H_FB_WS_14C2.IN_bSensorIn   := gI_Bund_S101 ;
    H_FB_WS_14C2.IN_bSOL_In     := NOT(gQ_Bund_SOL_14C2Out) ;    
    H_FB_WS_14C2.IN_bSOL_Out    := gQ_Bund_SOL_14C2Out ;
    H_FB_WS_14C2.IN_bActSensIn  := 1 ;
    H_FB_WS_14C2.IN_bActSensOut := 0 ;
    H_FB_WS_14C2.IN_tTpWatchIn  := g_tBund_TpWatchSens ;
    H_FB_WS_14C2.IN_tTpWatchOut := g_tBund_TpWatchSens ;
    H_FB_WS_14C2.IN_bReset      := gAlarmReset ;
    H_FB_WS_14C2();
    bS101_FaultOut := H_FB_WS_14C2.OUT_bSensIn_FaultOut ;
    bS101_FaultIn  := H_FB_WS_14C2.OUT_bSensIn_FaultIn ;
    bS101_Fault    := H_FB_WS_14C2.OUT_bSensIn_Fault ;



    // HMI Sensors states display
    IF gI_Bund_S101 THEN 
      iHMI_Bund_S101 := 1 ;
    ELSE
      iHMI_Bund_S101 := 0 ;
    END_IF   
    IF bS101_Fault AND 
       bFlash      THEN 
      iHMI_Bund_S101 := 2 ;
    END_IF         
    
    IF gI_Bund_S102 THEN 
      iHMI_Bund_S102 := 1 ;
    ELSE
      iHMI_Bund_S102 := 0 ;
    END_IF    
    IF bS102_Fault AND 
       bFlash      THEN 
      iHMI_Bund_S102 := 2 ;
    END_IF         
    
    IF gI_Bund_S103 THEN 
      iHMI_Bund_S103 := 1 ;
    ELSE
      iHMI_Bund_S103 := 0 ;
    END_IF    
    
    IF gI_Bund_S109 THEN 
      iHMI_Bund_S109 := 1 ;
    ELSE
      iHMI_Bund_S109 := 0 ;
    END_IF  
    
    g_bBund_SensFaultCycSep := bS101_Fault OR bS102_Fault ;
    
    
    // HMI Cylinders states display   
    // Cylinder 14C1
    // Case Out
    IF gQ_Bund_SOL_14C1Out THEN       
      iHMI_Bund_14C1Out_State := 4 ;
      iHMI_Bund_14C1In_State  := 0 ;
    END_IF   
    IF bS102_FaultOut THEN 
      IF bFlash THEN 
        iHMI_Bund_14C1Out_State := 5 ;
      ELSE  
        iHMI_Bund_14C1Out_State := 6 ;
      END_IF     
    END_IF   
    // Case In
    IF NOT(gQ_Bund_SOL_14C1Out) THEN       
      iHMI_Bund_14C1In_State  := 1 ;
      iHMI_Bund_14C1Out_State := 0 ;
    END_IF   
    IF bS102_FaultIn THEN 
      IF bFlash THEN 
        iHMI_Bund_14C1In_State := 2 ;
      ELSE  
        iHMI_Bund_14C1In_State := 3 ;
      END_IF        
    END_IF       
    
    // Cylinder 14C2
    // Case Out
    IF gQ_Bund_SOL_14C2Out THEN       
      iHMI_Bund_14C2Out_State := 4 ;
      iHMI_Bund_14C2In_State  := 0 ;
    END_IF   
    IF bS101_FaultOut THEN 
      IF bFlash THEN 
        iHMI_Bund_14C2Out_State := 5 ;
      ELSE  
        iHMI_Bund_14C2Out_State := 6 ;
      END_IF    
    END_IF   
    // Case In
    IF NOT(gQ_Bund_SOL_14C2Out) THEN       
      iHMI_Bund_14C2In_State  := 1 ;
      iHMI_Bund_14C2Out_State := 0 ;
    END_IF   
    IF bS101_FaultIn THEN 
      IF bFlash THEN 
        iHMI_Bund_14C2In_State := 2 ;
      ELSE  
        iHMI_Bund_14C2In_State := 3 ;
      END_IF 
    END_IF       
    
    // Pressure selection PB 
    IF bQ_Bund_SOL_PresSelect THEN 
      uiPresSelPBTxt_Id := 1 ;
      uiPresSelPBCol_Id := 197 + gBlack * 256 ;
    ELSE
      uiPresSelPBTxt_Id := 0 ;
      uiPresSelPBCol_Id := 42 + gBlack * 256 ;
    END_IF ;
    

    //---------------------------------------------------------------------------------------------------------------------
    // Packet separator cycle 
    //---------------------------------------------------------------------------------------------------------------------    

    // Start cycle         
    IF g_bIndSelBundProd              AND 
       gBagMachine_EstopAlarmsOK      AND 
       NOT(bInitSepCycl)              AND
       NOT(g_bBund_SensFaultCycSep)   AND
       NOT(g_bBund_TimOutFaultCycSep) AND    
       1                              THEN                   
      stCycBundSep.bSCyc := 1 ;
    END_IF ;
    
    //----------------------------------------------------------------------
    // Cycle at rest  
    IF NOT(stCycBundSep.bSCyc) AND 
       1                       THEN
      IF NOT( stCycBundSep.bFCyc ) THEN  
        // Init after cycle unpropaly ended    
        stCycBundSep.bFCyc := 1 ;
        stCycBundSep.bCyc  := 0 ; 
        stCycBundSep.bCycFail := 1 ;
        
        bInitSepCycl    := 0 ;
        g_bBund_InitSep := 0 ;
      END_IF  
      stCycBundSep.iStep := 0 ;   
      RETURN ;
    ELSE
    //----------------------------------------------------------------------
    // Cycle running     
     
    // Manu mode 
      IF g_bIndBundManu THEN 
        stCycBundSep.iStep := C_iSTEP_15 ;
        // In manu mode cycle is frozen in Step15
        IF bHMI_BundMan_14C1P_PB THEN 
          bQ_Bund_SOL_14C1Out := 1 ;
        END_IF 
        IF bHMI_BundMan_14C1M_PB THEN 
          bQ_Bund_SOL_14C1Out := 0 ;
        END_IF 
        IF bHMI_BundMan_14C2P_PB THEN 
          bQ_Bund_SOL_14C2Out := 1 ;
        END_IF 
        IF bHMI_BundMan_14C2M_PB THEN 
          bQ_Bund_SOL_14C2Out := 0 ;
        END_IF 
        IF bHMI_BundMan_PresSelect_PB THEN 
          bQ_Bund_SOL_PresSelect := NOT(bQ_Bund_SOL_PresSelect) ; 
          bHMI_BundMan_PresSelect_PB := 0 ;    
          iTest := iTest + 1 ;        
        END_IF 
      END_IF 
      IF NOT(g_bIndBundManu) THEN      
        bHMI_BundMan_14C1P_PB := 0 ;
        bHMI_BundMan_14C2P_PB := 0 ;   
        bHMI_BundMan_14C1M_PB := 0 ;
        bHMI_BundMan_14C2M_PB := 0 ;
        bHMI_BundMan_PresSelect_PB := 0 ;
      END_IF 
      
    // Permanent conditions   
      IF NOT(gBagMachine_EstopAlarmsOK) OR 
         g_bBund_SensFaultCycSep        THEN 
        stCycBundSep.bSCyc := 0 ;   
        bHMI_BundMan_14C1P_PB := 0 ;
        bHMI_BundMan_14C2P_PB := 0 ;
        bHMI_BundMan_14C1M_PB := 0 ;
        bHMI_BundMan_14C2M_PB := 0 ;
        bHMI_BundMan_PresSelect_PB := 0 ;
      END_IF 
      
      // Init cycle
      // Start init
      IF g_bBund_InitSep   AND 
         NOT(bInitSepCycl) THEN 
        bInitSepCycl      := 1 ;
        g_bBundInitSep_OK := 0 ; 
        g_bBund_ResetCountReq := 1 ;
        // Put cycle in Step 4
        stCycBundSep.iStep := C_iSTEP_4 ;
        // Action Step 4         
        bQ_Bund_SOL_14C1Out := 0 ;
        
        // Init cycle
        stCycBundSep.bFCyc := 0 ;
        stCycBundSep.bCyc  := 1 ; 
        stCycBundSep.bCycFail := 0 ;  
        iMemoStepCyc := C_iSTEP_99 ;    
      END_IF 
      // Stop init
      IF g_bBundStopInitSep THEN 
        g_bBund_InitSep    := 0 ;
        g_bBundInitSep_OK  := 0 ; 
        g_bBundStopInitSep := 0 ;
        stCycBundSep.bSCyc := 0 ;   
      END_IF 
         
      // Watching Step time out
      IF g_bIndBundManu                     OR 
         ( stCycBundSep.iStep < C_iSTEP_4 ) THEN 
        iMemoStepCyc := C_iSTEP_99 ;    
        stTON_WatchCyc(IN:=(iMemoStepCyc=stCycBundSep.iStep), PT:=tTpWatchCyc);   
      ELSE
        stTON_WatchCyc(IN:=(iMemoStepCyc=stCycBundSep.iStep), PT:=tTpWatchCyc);   
        iMemoStepCyc := stCycBundSep.iStep ;    
      END_IF  
      IF stTON_WatchCyc.Q THEN     
        g_bBund_TimOutFaultCycSep := 1 ; 
        stCycBundSep.bSCyc := 0 ; 
      END_IF  
      
      
      
    // Permanent actions 
      stTON_RetCyl14C1(IN:=(stCycBundSep.iStep = C_iSTEP_4), PT:=tTpRetCyl14C1) ;
      
      // Selection pressure in contre-weight cylinder of Separator
      // bQ_Bund_SOL_PresSelect = 1 => pressure contre-weight
      // bQ_Bund_SOL_PresSelect = 0 => supply pressure
      stTON_SelPres(IN:=bQ_Bund_SOL_14C2Out, PT:=tTpSelPres) ; 
      IF NOT(g_bIndBundManu) THEN 
        bQ_Bund_SOL_PresSelect := stTON_SelPres.Q ;
      END_IF  
    END_IF  
    //----------------------------------------------------------------------
    // Cycle steps     
        
        CASE stCycBundSep.iStep OF 
        
        C_iSTEP_0 :    
         //----------------------------------------------      
         // Etape 1 : Initialisation cycle     
         //----------------------------------------------
          IF TRUE THEN 
            stCycBundSep.iStep := C_iSTEP_1 ;  
            
            // Action Step 1  
            stCycBundSep.bFCyc := 0 ;
            stCycBundSep.bCyc  := 1 ; 
            stCycBundSep.bCycFail := 0 ;   
            
            bQ_Bund_SOL_14C1Out := 1 ;
            bQ_Bund_SOL_14C2Out := 0 ;
            g_bBundPackCountOK  := 0 ;
          END_IF          
                      
        C_iSTEP_1 :    
         //----------------------------------------------      
         // Etape 2 : Waiting for pack count    
         //----------------------------------------------      
          IF gI_Bund_S101                   AND 
             gI_Bund_S102                   AND 
             ( stCycBundSep.bTestOn         OR
               NOT(stCycBundSep.bModTest) ) THEN 
            stCycBundSep.iStep := C_iSTEP_2 ;    
            
            // Action Step 2  
            stCycBundSep.bTestOn := 0 ;
            
            // Waiting for pack count     
          END_IF          
           
        C_iSTEP_2 :      
         //----------------------------------------------      
         // Step 3 : Out cylinder 14C2 to separate packet
         //          and activate tempo in permanent actions for contre-weight pressure selection 
         //          and waiting for sensor S103   
         //----------------------------------------------      
          IF g_bBundPackCountOK             AND  
             g_bBundInitSep_OK              AND 
             ( stCycBundSep.bTestOn         OR
               NOT(stCycBundSep.bModTest) ) THEN 
            stCycBundSep.iStep := C_iSTEP_3 ;  
            
            // Action Step 3  
            stCycBundSep.bTestOn := 0 ;
            
            bQ_Bund_SOL_14C2Out := 1 ;  
            g_bBundPackCountOK  := 0 ;
          END_IF   
               
        C_iSTEP_3 :  
         //----------------------------------------------      
         // Step 4 : Move in cylinder 14C1 
         //          and activate tempo in permanent actions   
         //----------------------------------------------      
          IF g_bBund_MoveInSep_OK           AND    
             ( stCycBundSep.bTestOn         OR
               NOT(stCycBundSep.bModTest) ) THEN 
            stCycBundSep.iStep := C_iSTEP_4 ;  
               
            // Action Step 4 
            stCycBundSep.bTestOn := 0 ;
            
            bQ_Bund_SOL_14C1Out  := 0 ;
            g_bBund_MoveInSep_OK := 0 ;
          END_IF  
        
        C_iSTEP_4 :  
         //----------------------------------------------    
         // Step 5 : Move in cylinder 14C2 to put back separator in init position  
         //----------------------------------------------      
          IF stTON_RetCyl14C1.Q             AND    
             ( stCycBundSep.bTestOn         OR
               NOT(stCycBundSep.bModTest) ) THEN 
            stCycBundSep.iStep := C_iSTEP_5 ;   
               
            // Action Step 5      
            stCycBundSep.bTestOn := 0 ;
            
            bQ_Bund_SOL_14C2Out := 0 ;  
          END_IF    
          
        C_iSTEP_5 :  
         //---------------------------------------------- 
         // Step 6 : Output cylinder 14C1 to out the separation fingers    
         //----------------------------------------------      
          IF gI_Bund_S101                   AND    
             ( stCycBundSep.bTestOn         OR
               NOT(stCycBundSep.bModTest) ) THEN 
            stCycBundSep.iStep := C_iSTEP_6 ;  
            
            // Action Step 6  
            stCycBundSep.bTestOn := 0 ;
            
            bQ_Bund_SOL_14C1Out := 1 ;  
          END_IF     
          
        C_iSTEP_6 :  
         //----------------------------------------------      
         // Etape 2 : Waiting for pack count    
         //---------------------------------------------- 
          IF gI_Bund_S102                   AND    
             ( stCycBundSep.bTestOn         OR
               NOT(stCycBundSep.bModTest) ) THEN 
            stCycBundSep.iStep := C_iSTEP_2 ;  
            
            // Action Step 2    
            stCycBundSep.bTestOn := 0 ;
            // Waiting for pack count
          
            g_bBund_InitSep   := 0 ;
            bInitSepCycl      := 0 ;
            g_bBundInitSep_OK := 1 ;
          END_IF       
          
        C_iSTEP_15 :  
         //----------------------------------------------      
         // Etape 1 : Initialisation cycle  
         //---------------------------------------------- 
          IF NOT(g_bIndBundManu)            AND    
             ( stCycBundSep.bTestOn         OR
               NOT(stCycBundSep.bModTest) ) THEN 
            stCycBundSep.iStep := C_iSTEP_1 ;  
            
            // Action Step 1    
            stCycBundSep.bTestOn := 0 ;
            
            stCycBundSep.bFCyc := 0 ;
            stCycBundSep.bCyc  := 1 ;    
            
            g_bBundPackCountOK  := 0 ;
            // Waiting for pack count
          END_IF    
        END_CASE     
    //---------------------------------------------------------------------------------------------------------------------
    


    

    
END_PROGRAM
