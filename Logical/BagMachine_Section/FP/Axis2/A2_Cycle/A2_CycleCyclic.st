(********************************************************************
 * COPYRIGHT -- .
 ********************************************************************
 * Program: A2_Cycle
 * File: A2_CycleCyclic.st
 * Author: Dominique
 * Created: October 15, 2011
 ********************************************************************
 * Implementation of program A2_Cycle
 ********************************************************************)

PROGRAM _CYCLIC


// Manu axis movement for timing setting 


    
    //----------------------------------------------------------------------
    // FP Nip rolle auto Off
    // During timing setting automatique switch Off nip rolle 
       stTON_02 (IN:=gstCycA[2].CycManTimSet.bCyc ,PT:=T#650ms) ;
       stTOF_00 (IN:=gstCycA[2].CycManTimSet.bCyc ,PT:=T#1s_500ms) ;
       g_bFP_NipRolAutoOff := gstCycA[2].CycManTimSet.bCyc OR 
                              stTOF_00.Q                   ;
    
    
    
    
    //----------------------------------------------------------------------
    // Offset management
    
    // When synchro is off, Offset is set to 0
       IF NOT(gA[2].Ind_SynchronizedMotion) AND 
          gstCycA[2].CycManTimSet.bFCyc     THEN 
         rPrintRolActOffsetInch := 0.0 ;   
         rSP_PrintRolOffsetInch := 0.0 ;
       END_IF ;
    // Set point Offset value Lock
    g_bLockSP_OffsetPrintRol := NOT(g_bCondManuTimSet)            OR 
                                gstCycA[2].CycManTimSet.bSCyc     OR 
                                0                                 ;                                       
        
    // Offset Manu button animation 
    bLockOffsetPB_Man := g_bFP_SP_Offset                   OR
                         g_bStartOffsetAuto                OR  
                         NOT(g_bCondManuTimSet)            ; 
    
    // Limit offset set point 
    rSP_PrintRolOffsetInch := LIMIT(0.0,rSP_PrintRolOffsetInch,gRecipeActive.Repeat) ; 
    IF gA[2].Cmd_ManuTimSetPlus THEN
      rSP_PrintRolOffsetInch := 0.0 ;
    END_IF ;
    // Calculation distance on axis  
    rSP_AxisOffsetInch := rSP_PrintRolOffsetInch * gA[2].rRSynNum / gA[2].rRSynDen ;
    
    // Offset Auto button animation
    bLockOffsetPB := gstCycA[2].CycManTimSet.bFCyc     AND 
                     (rSP_PrintRolOffsetInch <= 0.0)   OR 
                     g_HMI_Cmd_ManuTimSetPlus          OR 
                     (gstCycA[2].CycManTimSet.iStep>2) AND 
                     NOT(g_bFP_SP_Offset)            ;   
                      
    IF NOT(bLockOffsetPB)        AND  
       NOT(HMI_Cmd_AutoOffsetPB) THEN   
      iAnimOffsetPB := 2 ;                     // Ready
    END_IF ;                
    IF (rSP_PrintRolOffsetInch>0.0) AND 
       NOT(g_bFP_SP_Offset)         AND
       NOT(bLockOffsetPB)           AND 
       HMI_Cmd_AutoOffsetPB         THEN  
      iAnimOffsetPB := 3 ;                     // Start
    END_IF ;                
    IF g_bFP_SP_Offset THEN     
      iAnimOffsetPB := 4 ;                     // Stop
    END_IF ; 
    IF bLockOffsetPB THEN 
      iAnimOffsetPB := 0 ;                     // PB Lock
    END_IF ;
    
    CASE iAnimOffsetPB OF 
      0..1 : ; // PB Lock
        uiSP_OffsetCol_Ind := gBlue + gWhite * 256 ; 
      2 : ;    // Ready
        uiSP_OffsetCol_Ind := gBlue + gWhite * 256 ; 
      3 : ;    // Start
        uiSP_OffsetCol_Ind := gGreen + gBlack * 256 ; 
      4 : ;    // Stop
        uiSP_OffsetCol_Ind := gRed + gBlack * 256 ; 
    END_CASE 
    uiSP_OffsetTxt_Ind := iAnimOffsetPB ;
    
    // Start Offset Auto
    IF EDGENEG(HMI_Cmd_AutoOffsetPB) THEN 
      g_bStartOffsetAuto := 1 ;
    END_IF ;
 

    //---------------------------------------------------------------------------------------------------------------------
    // Printing rolle offset cycle 
    //---------------------------------------------------------------------------------------------------------------------    
    // Start cycle 
    gstCycA[2].CycManTimSet.CmdStart := ( gA[2].Cmd_ManuTimSetPlus    OR 
                                          gA[2].Cmd_ManuTimSetMinus ) AND 
                                        gA[2].Ind_Ready               OR
                                        g_bStartOffsetAuto            AND 
                                        1                             ;               
    IF gstCycA[2].CycManTimSet.CmdStart THEN                   
      gstCycA[2].CycManTimSet.bSCyc := 1 ;
    END_IF ;
    
    //----------------------------------------------------------------------
    // Cycle at rest  
    IF NOT(gstCycA[2].CycManTimSet.bSCyc) AND 
       1                                  THEN
      IF NOT( gstCycA[2].CycManTimSet.bFCyc ) THEN  
        // Init after cycle unpropaly ended    
        gstCycA[2].CycManTimSet.bFCyc := 1 ;
        gstCycA[2].CycManTimSet.bCyc  := 0 ; 
        
        g_bFP_SP_Offset                      := 0 ;
        g_bStartOffsetAuto                   := 0 ; 
        gstCycA[2].CycManTimSet.CmdMov       := 0 ;
        gstCycA[2].CycManTimSet.CmdStop      := 0 ;
        gstCycA[2].CycManTimSet.CmdSynchroOn := 0 ;   
        gstCycA[2].CycManTimSet.CmdExeMov    := 0 ;  
        gstCycA[2].CycManTimSet.CmdExeStop   := 0 ;
      END_IF  
      gstCycA[2].CycManTimSet.iStep := 0 ;   
      RETURN ;
    ELSE
    //----------------------------------------------------------------------
    // Cycle running     
    
      // Permanent conditions    
      IF ( NOT(gA[2].Ind_Ready)                    OR 
           NOT(gstCycA[2].CycManTimSet.CmdStart) ) AND
         NOT(g_bFP_SP_Offset)                      AND
         NOT(g_bStartOffsetAuto)                   AND   
         (gstCycA[2].CycManTimSet.iStep <= 2)      THEN 
        gstCycA[2].CycManTimSet.bSCyc := 0 ;  
        RETURN ;
      END_IF 
      
      IF g_bFP_SP_Offset                   AND 
         ( NOT(gStopStringOK)              OR 
           EDGEPOS(HMI_Cmd_AutoOffsetPB) ) THEN 
        gstCycA[2].CycManTimSet.iStep := C_iSTEP_13 ;  
        // Action Step 13  
        gstCycA[2].CycManTimSet.CmdExeMov  := 0 ; 
        gstCycA[2].CycManTimSet.CmdExeStop := 1 ;
        // Waiting Stop
      END_IF 
      
      IF (gstCycA[2].CycManTimSet.iStep = C_iSTEP_11) AND 
         (gstCycA[2].CycManTimSet.enMoveStat = FAULT) THEN 
        gstCycA[2].CycManTimSet.iStep := C_iSTEP_16 ;  
        // Action Step 16  
        // Waiting Reset Fault
      END_IF 
      
      
      // Permanent actions 
      stTON_01 ( 
            IN := ( gstCycA[2].CycManTimSet.iStep = C_iSTEP_0 ) ,
            PT := T#30ms
               ) ;
      
      // Actual offset calculation         
      IF (gstCycA[2].CycManTimSet.iStep >= C_iSTEP_3) THEN 
        rTempDiffPrintRolPos := g_rPrintRolCalcPos_in - rMemoPosPrintRol ;
        rMemoPosPrintRol := g_rPrintRolCalcPos_in ;
        rDiffPrintRolPos := H_FC_Modulus ( 
                                 IN_rMod := gRecipeActive.Repeat ,
                                 IN_rVar := rTempDiffPrintRolPos 
                                         ) ; 
        rTempActOffsetInch[2] := rPrintRolActOffsetInch ;        
        rPrintRolActOffsetInch := rPrintRolActOffsetInch + rDiffPrintRolPos ;
        rPrintRolActOffsetInch := H_FC_Modulus ( 
                                       IN_rMod := gRecipeActive.Repeat ,
                                       IN_rVar := rPrintRolActOffsetInch 
                                               ) ;      
        
        // Set point distance Offset animation                                         
        IF g_bFP_SP_Offset THEN
          rSP_PrintRolOffsetInch := rSP_PrintRolOffsetInch - rDiffPrintRolPos ;
          IF (rSP_PrintRolOffsetInch < 0.001) THEN  
            rSP_PrintRolOffsetInch := 0.0 ;                                                
          END_IF                                                                                 
        END_IF                                     
      END_IF       
      

      stTON_03 ( 
            IN := (gstCycA[2].CycManTimSet.iStep = C_iSTEP_15) AND NOT(HMI_Cmd_AutoOffsetPB) ,
            PT := T#500ms
               ) ;           
      
    END_IF  
    //----------------------------------------------------------------------
    // Cycle steps     
      
        CASE gstCycA[2].CycManTimSet.iStep OF 

        C_iSTEP_0 :    
         //----------------------------------------------      
         // Etape 1 : Initialisation     
         //           Waiting auto switch Off nip rolle    
         //----------------------------------------------
          IF stTON_01.Q THEN 
            gstCycA[2].CycManTimSet.iStep := C_iSTEP_1 ;  
            
            // Action Step 1  
            gstCycA[2].CycManTimSet.bFCyc := 0 ;
            gstCycA[2].CycManTimSet.bCyc  := 1 ; 
            
            gstCycA[2].CycManTimSet.rSP_Distance := 0 ;
          END_IF          
                      
        C_iSTEP_1 :    
         //----------------------------------------------      
         // Etape 2  : Synchro      
         //----------------------------------------------  
          // Condition Step2
          IF (stTON_02.Q OR stTOF_00.Q) THEN 
            gstCycA[2].CycManTimSet.iStep := C_iSTEP_2 ;    
            
            // Action Step 2    
            gstCycA[2].CycManTimSet.CmdSynchroOn := 1 ;  
          END_IF          
           
        C_iSTEP_2 :      
         //----------------------------------------------      
         // Step 3 : Activation motion and Stop waiting   
         // Etape 10 : Synchro and start Offset with set point  
         //----------------------------------------------      
          IF gstCycA[2].CycManTimSet.bSynchroOkSlavA[2] AND 
             (rSP_PrintRolOffsetInch <= 0)              THEN 
            gstCycA[2].CycManTimSet.iStep := C_iSTEP_3 ;  
            
            // Action Step 3      
            gstCycA[2].CycManTimSet.CmdMov  := 1 ;
            gstCycA[2].CycManTimSet.CmdStop := 0 ;
            // Stop waiting
            // Memo printing cylinder actual position 
            rMemoPosPrintRol := g_rPrintRolCalcPos_in ;
            RETURN ;    
          END_IF          
          // Condition Step10
          IF stTON_02.Q                                 AND 
             gstCycA[2].CycManTimSet.bSynchroOkSlavA[2] AND 
             g_bStartOffsetAuto                         AND   
             ( gstCycA[2].CycManTimSet.bTestOn          OR 
               NOT(gstCycA[2].CycManTimSet.bModTest) )  THEN 
            gstCycA[2].CycManTimSet.iStep := C_iSTEP_10 ;    
            
            // Action Step 10    
            gstCycA[2].CycManTimSet.bTestOn := 0 ;
            
            g_bFP_SP_Offset    := 1 ;
            g_bStartOffsetAuto := 0 ;
            gstCycA[2].CycManTimSet.CmdExeMov  := 1 ;
            gstCycA[2].CycManTimSet.CmdExeStop := 0 ;     
            gstCycA[2].CycManTimSet.rSP_Distance := rSP_AxisOffsetInch ;
            // Memo printing cylinder actual position 
            rMemoPosPrintRol := g_rPrintRolCalcPos_in ;
          END_IF         
          
        C_iSTEP_3 :      
         //----------------------------------------------      
         // Step 4 : Stop motion and End stop waiting   
         //----------------------------------------------      
          IF NOT(gstCycA[2].CycManTimSet.CmdStart) THEN 
            gstCycA[2].CycManTimSet.iStep := C_iSTEP_4 ;  
               
            // Action Step 4 
            gstCycA[2].CycManTimSet.CmdMov  := 0 ;
            gstCycA[2].CycManTimSet.CmdStop := 1 ;
            // End stop waiting
          END_IF  

        C_iSTEP_4 :  
         //----------------------------------------------      
         // Step 3 : Activation motion and Stop waiting  
         // Step 5 : Cut synchro  
         //----------------------------------------------    
          // Condition Step3
          IF gstCycA[2].CycManTimSet.CmdStart THEN 
            gstCycA[2].CycManTimSet.iStep := C_iSTEP_3 ;   
               
            // Action Step 3      
            gstCycA[2].CycManTimSet.CmdMov  := 1 ;
            gstCycA[2].CycManTimSet.CmdStop := 0 ;
            // Stop waiting
            RETURN ;
          END_IF ;   
          // Condition Step5  
          IF NOT(gstCycA[2].CycManTimSet.CmdStop) THEN 
            gstCycA[2].CycManTimSet.iStep := C_iSTEP_5 ;   
               
            // Action Step 5      
            gstCycA[2].CycManTimSet.CmdSynchroOn := 0 ;      
          END_IF    
          
        C_iSTEP_5 :  
         //---------------------------------------------- 
         // Step 0 : First step  
         //----------------------------------------------      
          IF TRUE THEN
            gstCycA[2].CycManTimSet.iStep := C_iSTEP_0 ;  
            
            // Action Step 0    
            gstCycA[2].CycManTimSet.bSCyc := 0 ; 
            gstCycA[2].CycManTimSet.bFCyc := 1 ;
            gstCycA[2].CycManTimSet.bCyc  := 0 ;   
          END_IF     
          
        C_iSTEP_10 :  
         //---------------------------------------------- 
         // Step 11 : Waiting end of move  
         //----------------------------------------------      
          IF TRUE                                          AND 
             ( gstCycA[2].CycManTimSet.bTestOn             OR 
               NOT(gstCycA[2].CycManTimSet.bModTest) )     THEN
            gstCycA[2].CycManTimSet.iStep := C_iSTEP_11 ;  
            
            // Action Step 11    
            gstCycA[2].CycManTimSet.bTestOn := 0 ;
            
            // Waiting end of move
          END_IF          
          
        C_iSTEP_11 :  
         //---------------------------------------------- 
         // Step 12 : End move  
         //----------------------------------------------      
          IF (gstCycA[2].CycManTimSet.enMoveStat = FINISHED) AND 
             ( gstCycA[2].CycManTimSet.bTestOn               OR 
               NOT(gstCycA[2].CycManTimSet.bModTest) )       THEN
            gstCycA[2].CycManTimSet.iStep := C_iSTEP_12 ;  
            
            // Action Step 12    
            gstCycA[2].CycManTimSet.bTestOn := 0 ;
            
            gstCycA[2].CycManTimSet.CmdExeMov := 0 ;
            g_bFP_SP_Offset := 0 ;
          END_IF        
          
        C_iSTEP_12 :  
         //---------------------------------------------- 
         // Step 0 : First step  
         //----------------------------------------------      
          IF (gstCycA[2].CycManTimSet.enMoveStat = INACTIVE) AND 
             ( gstCycA[2].CycManTimSet.bTestOn               OR 
               NOT(gstCycA[2].CycManTimSet.bModTest) )       THEN
            gstCycA[2].CycManTimSet.iStep := C_iSTEP_0 ;  
            
            // Action Step 0    
            gstCycA[2].CycManTimSet.bTestOn := 0 ;
            
            gstCycA[2].CycManTimSet.CmdSynchroOn := 0 ;
              
            gstCycA[2].CycManTimSet.bSCyc := 0 ; 
            gstCycA[2].CycManTimSet.bFCyc := 1 ;
            gstCycA[2].CycManTimSet.bCyc  := 0 ;   
          END_IF      
          
        C_iSTEP_13 :  
         //---------------------------------------------- 
         // Step 14 : End stop  
         //----------------------------------------------      
          IF (gstCycA[2].CycManTimSet.enMoveStat = INACTIVE) AND 
             ( gstCycA[2].CycManTimSet.bTestOn               OR 
               NOT(gstCycA[2].CycManTimSet.bModTest) )       AND 
             gA[2].Ind_StandStill                            THEN
            gstCycA[2].CycManTimSet.iStep := C_iSTEP_14 ;  
            
            // Action Step 14 
            gstCycA[2].CycManTimSet.bTestOn := 0 ;
            
            gstCycA[2].CycManTimSet.CmdExeStop := 0 ;   
          END_IF        
          
        C_iSTEP_14 :  
         //---------------------------------------------- 
         // Step 15 : Waiting  
         //----------------------------------------------      
          IF gA[2].Ind_SynchronizedMotion                  AND  
             ( gstCycA[2].CycManTimSet.bTestOn             OR 
               NOT(gstCycA[2].CycManTimSet.bModTest) )     THEN
            gstCycA[2].CycManTimSet.iStep := C_iSTEP_15 ;  
            
            // Action Step 15    
            gstCycA[2].CycManTimSet.bTestOn := 0 ;
            
            // Waiting 
          END_IF         
          
        C_iSTEP_15 :  
         //---------------------------------------------- 
         // Step 0 : First step  
         //----------------------------------------------      
          IF stTON_03.Q                                    AND  
             ( gstCycA[2].CycManTimSet.bTestOn             OR 
               NOT(gstCycA[2].CycManTimSet.bModTest) )     THEN
            gstCycA[2].CycManTimSet.iStep := C_iSTEP_0 ;  
            
            // Action Step 0    
            gstCycA[2].CycManTimSet.bTestOn := 0 ;
            
            gstCycA[2].CycManTimSet.bSCyc := 0 ; 
            gstCycA[2].CycManTimSet.bFCyc := 1 ;
            gstCycA[2].CycManTimSet.bCyc  := 0 ; 
            g_bStartOffsetAuto := 0 ;
            g_bFP_SP_Offset    := 0 ;  
            gstCycA[2].CycManTimSet.CmdSynchroOn := 0 ;  
          END_IF      
          
        C_iSTEP_16 :  
         //---------------------------------------------- 
         // Step 17 : End cycle  
         //----------------------------------------------      
          IF gAlarmReset                                   AND 
             ( gstCycA[2].CycManTimSet.bTestOn             OR 
               NOT(gstCycA[2].CycManTimSet.bModTest) )     THEN
            gstCycA[2].CycManTimSet.iStep := C_iSTEP_17 ;  
            
            // Action Step 17    
            gstCycA[2].CycManTimSet.bTestOn := 0 ;
            
            gstCycA[2].CycManTimSet.CmdExeMov := 0 ; 
          END_IF      
          
        C_iSTEP_17 :  
         //---------------------------------------------- 
         // Step 0 : First step  
         //----------------------------------------------      
          IF (gstCycA[2].CycManTimSet.enMoveStat = INACTIVE) AND 
             ( gstCycA[2].CycManTimSet.bTestOn               OR 
               NOT(gstCycA[2].CycManTimSet.bModTest) )       THEN
            gstCycA[2].CycManTimSet.iStep := C_iSTEP_0 ;  
            
            // Action Step 0    
            gstCycA[2].CycManTimSet.bTestOn := 0 ;
            
            gstCycA[2].CycManTimSet.bSCyc := 0 ; 
            gstCycA[2].CycManTimSet.bFCyc := 1 ;
            gstCycA[2].CycManTimSet.bCyc  := 0 ; 
            g_bStartOffsetAuto := 0 ;
            g_bFP_SP_Offset    := 0 ;  
            gstCycA[2].CycManTimSet.CmdSynchroOn := 0 ;  
          END_IF     
        END_CASE     
    //---------------------------------------------------------------------------------------------------------------------
    

          

END_PROGRAM
