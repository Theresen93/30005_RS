(********************************************************************
 * COPYRIGHT -- .
 ********************************************************************
 * Program: A15_MotionCycle
 * File: A15_MotionCycleCyclic.st
 * Author: dominique
 * Created: November 06, 2011
 ********************************************************************
 * Implementation of program A15_MotionCycle
 ********************************************************************)

PROGRAM _CYCLIC
    // --------------------------------------------------------------------------------------------------------------------
    // Simul
    IF g_bSim THEN 
      stTON_0(IN:=bQ_SOL_HMP_ProtecDown,PT:=T#3s) ; 
      gI_HMP_ProtecDownPE := stTON_0.Q ;
      
      stTON_1(IN:=NOT(bQ_SOL_HMP_BrushForward),PT:=T#3s) ;
      gI_HMP_BrushReturnPE := stTON_1.Q ;
    END_IF ; 
    
    //---------------------------------------------------------------------------------------------------------------------
    // Output assignment and manual mode
    IF NOT(g_stHMPerfCyc.bSelProd) THEN 
      // Manu operation 
      gQ_SOL_HMP_ProtecDown := gI_SS_HMP_ManuProtecDown   OR 
                               gI_HMP_ManuBrushForward_PB OR        
                               NOT(gI_HMP_BrushReturnPE)  ;
                               
      gQ_SOL_HMP_BrushForward := gI_HMP_ManuBrushForward_PB AND 
                                 gI_HMP_ProtecDownPE        ;
    ELSE
      // Automatic operation
      gQ_SOL_HMP_BrushForward := bQ_SOL_HMP_BrushForward AND 
                                 gI_HMP_ProtecDownPE     ;
      gQ_SOL_HMP_ProtecDown := bQ_SOL_HMP_ProtecDown     OR  
                               NOT(gI_HMP_BrushReturnPE) ;
    END_IF ; 
     
     
    // Light indicator
    gQ_HMP_LightOn := g_stHMPerfCyc.bSelProd ;
    
    
    
    // Heater activation  
    gQ_HMP_Heater := gI_SS_HMP_Heating             AND 
                     g_stHMPerfCyc.bSelProd        AND
                     NOT(g_bIndEStop)              AND
                     g_bMainPower_On               AND   
                     ( g_stHMPerfCyc.bSlowRot_OK   OR      
                       g_stHMPerfCyc.bSynchro_OK ) ;    
                           

    //---------------------------------------------------------------------------------------------------------------------
    // Actual Line Speed, in m/min
    rLS_Act_mmin := gActualMachineSpeed_FPM/3.2808 + g_rTest_[0] ;
    
    
    //---------------------------------------------------------------------------------------------------------------------
    // Axis motion management cycle 
    //---------------------------------------------------------------------------------------------------------------------    
    // Start cycle 
    IF g_stHMPerfCyc.bSelProd THEN                   
      g_stHMPerfCyc.bSCyc := 1 ;
    END_IF ;
    
    //----------------------------------------------------------------------
    // Cycle at rest  
    IF NOT(g_stHMPerfCyc.bSCyc) AND 
       1                        THEN
      IF NOT( g_stHMPerfCyc.bFCyc ) THEN  
        // Init after cycle unpropaly ended    
        g_stHMPerfCyc.bFCyc    := 1 ;
        g_stHMPerfCyc.bCyc     := 0 ; 
        g_stHMPerfCyc.bCycFail := 1 ; 
        
        g_stHMPerfCyc.Cmd_SlowRot    := 0 ;   
        g_stHMPerfCyc.Cmd_Stop       := 0 ;
        g_stHMPerfCyc.Cmd_EnableAxis := 0 ;   
        g_stHMPerfCyc.bSynchro_OK    := 0 ; 
        g_stHMPerfCyc.bSlowRot_OK    := 0 ;   
        gA[15].Cmd_CalcCameProf      := 0 ;  
        g_bHMP_CmdPhasing            := 0 ;
        g_bHMP_PhasInProgres         := 0 ;
        bGearInError                 := 0 ;
        bQ_SOL_HMP_BrushForward      := 0 ;  
        bQ_SOL_HMP_ProtecDown        := 0 ;
        g_stHMPerfCyc.bStopReq       := 0 ;
        g_stHMPerfCyc.bSelProd       := 0 ;
      END_IF  
      g_stHMPerfCyc.iStep := 0 ;   
      RETURN ;
    ELSE
    //----------------------------------------------------------------------
    // Cycle running     
    
      // Permanent conditions    
      
      // Reset fault
      IF gAlarmReset                     AND 
         (g_stHMPerfCyc.iStep=C_iSTEP_2) THEN 
        bGearInError := 0 ; 
      END_IF 
      
      // Fault conditions detection 
      g_stHMPerfCyc.bFaultCond := NOT(gA[15].Ind_Ready)           OR
                                  gA[15].Cmd_EStopDisable         OR    
                                  NOT(gA[15].Cmd_Enable)          AND 
                                  g_stHMPerfCyc.Cmd_EnableAxis    OR 
                                  bGearInError                    AND 
                                  (g_stHMPerfCyc.iStep=C_iSTEP_0) ;
       
      // Stop conditions detection                            
      g_stHMPerfCyc.bStopCond := NOT(g_bMainPower_On)   OR 
                                 bGearInError           OR 
                                 g_stHMPerfCyc.bStopReq ;
      
      // Fault reaction 
      IF g_stHMPerfCyc.bFaultCond AND 
         g_stHMPerfCyc.bCyc       THEN 
        g_stHMPerfCyc.iStep := C_iSTEP_2 ;  
        
        g_stHMPerfCyc.Cmd_SlowRot    := 0 ;   
        g_stHMPerfCyc.Cmd_Stop       := 0 ;
        g_stHMPerfCyc.Cmd_EnableAxis := 0 ;   
        gA[15].Cmd_CalcCameProf      := 0 ;  
        g_bHMP_CmdPhasing            := 0 ;
        g_bHMP_PhasInProgres         := 0 ;
        g_stHMPerfCyc.bSynchro_OK    := 0 ; 
        g_stHMPerfCyc.bSlowRot_OK    := 0 ;  
        bQ_SOL_HMP_BrushForward      := 0 ;  
        bQ_SOL_HMP_ProtecDown        := 0 ;
      END_IF 

      // Stop reaction 
      IF g_stHMPerfCyc.bStopCond  AND 
         g_stHMPerfCyc.bCyc       AND 
         (g_stHMPerfCyc.iStep>4)  AND 
         (g_stHMPerfCyc.iStep<15) THEN 
        g_stHMPerfCyc.iStep := C_iSTEP_4 ;  
        // Action Step 4  
        // Waiting State
      END_IF 
      
      
      
      // Permanent actions 
      

      // Condition for Slow Rotation Detection 
      g_stHMPerfCyc.bSlowRotCond := ( (rLS_Act_mmin<gr_rHMPerfSLActTool_mmin) OR 
                                      gMachine_Jog )                          AND
                                    NOT(g_stHMPerfCyc.bSlowRot_OK)            ;
                                    
                  
                                    
      // Synchro Axis
      MC_GearIn_0.Master           := gA[9].Ident ;  // Master Axis*)
      MC_GearIn_0.Slave            := gA[15].Ident ; // Slave Axis*)
      MC_GearIn_0.RatioNumerator   := 1 ;  
      MC_GearIn_0.RatioDenominator := gRecipeActive.iHMPerf_Up ;  
      MC_GearIn_0.Acceleration     := 1.5*gA[9].SP_Accel ;
      MC_GearIn_0.Deceleration     := 4*gA[9].SP_Decel ;
      IF MC_GearIn_0.InGear OR 
         MC_GearIn_0.Error  THEN
        uiMC_GearIn_ErrorID := MC_GearIn_0.ErrorID ;
        bGearInError := MC_GearIn_0.Error ;
        MC_GearIn_0.Execute := 0 ;
      END_IF
      MC_GearIn_0() ;                   
                                    
       
    END_IF  
    //----------------------------------------------------------------------
    // Cycle steps     
      
        CASE g_stHMPerfCyc.iStep OF 

        C_iSTEP_0 :    
         //----------------------------------------------      
         // Step 1 : Initialisation     
         //----------------------------------------------
          IF TRUE THEN 
            g_stHMPerfCyc.iStep := C_iSTEP_1 ;  
            
            // Action Step 1  
            g_stHMPerfCyc.bFCyc    := 0 ;
            g_stHMPerfCyc.bCyc     := 1 ; 
            g_stHMPerfCyc.bCycFail := 0 ;    
            
            g_stHMPerfCyc.bSynchro_OK := 0 ; 
            g_stHMPerfCyc.bSlowRot_OK := 0 ;  
          END_IF    

        C_iSTEP_1 :    
         //----------------------------------------------      
         // Step 2  : Fault management   
         // Step 3  : Enable Axis   
         // Step 0  : First Step   
         //----------------------------------------------
         // Conditions Step 2
          IF g_stHMPerfCyc.bFaultCond         AND 
             ( g_stHMPerfCyc.bTestOn          OR 
               NOT(g_stHMPerfCyc.bModTest) ) THEN 
            g_stHMPerfCyc.iStep := C_iSTEP_4 ;  
            
            // Action Step 2  
            g_stHMPerfCyc.bTestOn := 0 ;
               
            // Fault management   
            RETURN ;
          END_IF    
          
         // Conditions Step 3
          IF gA[15].Ind_Ready                AND 
             NOT(gA[15].Ind_Enabled)         AND  
             NOT(g_stHMPerfCyc.bStopCond)    AND
             NOT(g_stHMPerfCyc.bFaultCond)   AND  
             ( g_stHMPerfCyc.bTestOn         OR 
               NOT(g_stHMPerfCyc.bModTest) ) THEN 
            g_stHMPerfCyc.iStep := C_iSTEP_3 ;  
            
            // Action Step 3 
            g_stHMPerfCyc.bTestOn := 0 ;
               
            g_stHMPerfCyc.Cmd_EnableAxis := 1 ;
            RETURN ;
          END_IF    
          
         // Conditions Step 0
          IF g_stHMPerfCyc.bStopReq           AND 
             ( g_stHMPerfCyc.bTestOn          OR 
               NOT(g_stHMPerfCyc.bModTest) ) THEN 
            g_stHMPerfCyc.iStep := C_iSTEP_0 ;  
            
            // Action Step 0    
            g_stHMPerfCyc.bTestOn := 0 ;
                               
            g_stHMPerfCyc.bSCyc := 0 ;
            g_stHMPerfCyc.bFCyc := 1 ;
            g_stHMPerfCyc.bCyc  := 0 ; 
            
            g_stHMPerfCyc.bStopReq := 0 ;
            g_stHMPerfCyc.bSelProd := 0 ;
          END_IF    

        C_iSTEP_2 :    
         //----------------------------------------------     
         // Step 4  : Waiting State   
         // Step 3  : Enable Axis and Came calculation and Download   
         // Step 0  : First Step   
         //----------------------------------------------
         // Conditions Step 4
          IF gA[15].Ind_Enabled               AND  
             NOT(g_stHMPerfCyc.bStopCond)     AND 
             ( g_stHMPerfCyc.bTestOn          OR 
               NOT(g_stHMPerfCyc.bModTest) ) THEN 
            g_stHMPerfCyc.iStep := C_iSTEP_4 ;  
            
            // Action Step 4  
            g_stHMPerfCyc.bTestOn := 0 ;
               
            // Waiting State   
            RETURN ;
          END_IF    
          
         // Conditions Step 3
          IF gA[15].Ind_Ready                AND 
             NOT(gA[15].Ind_Enabled)         AND   
             NOT(g_stHMPerfCyc.bStopCond)    AND
             NOT(g_stHMPerfCyc.bFaultCond)   AND 
             ( g_stHMPerfCyc.bTestOn         OR 
               NOT(g_stHMPerfCyc.bModTest) ) THEN 
            g_stHMPerfCyc.iStep := C_iSTEP_3 ;  
            
            // Action Step 3 
            g_stHMPerfCyc.bTestOn := 0 ;
               
            g_stHMPerfCyc.Cmd_EnableAxis := 1 ;
            RETURN ;
          END_IF    
          
         // Conditions Step 0
          IF g_stHMPerfCyc.bStopCond          AND 
             ( g_stHMPerfCyc.bTestOn          OR 
               NOT(g_stHMPerfCyc.bModTest) ) THEN 
            g_stHMPerfCyc.iStep := C_iSTEP_0 ;  
            
            // Action Step 0    
            g_stHMPerfCyc.bTestOn := 0 ;
                            
            g_stHMPerfCyc.bSCyc := 0 ;
            g_stHMPerfCyc.bFCyc := 1 ;
            g_stHMPerfCyc.bCyc  := 0 ; 
            
            g_stHMPerfCyc.bStopReq := 0 ;
            g_stHMPerfCyc.bSelProd := 0 ;
          END_IF    

        C_iSTEP_3 :    
         //----------------------------------------------      
         // Step 4 : Waiting State     
         //----------------------------------------------
          IF gA[15].Ind_Enabled THEN 
            g_stHMPerfCyc.iStep := C_iSTEP_4 ;  
            
            // Action Step 4  
            // Waiting State    
          END_IF     

        C_iSTEP_4 :    
         //----------------------------------------------      
         // Step 15 : Stop request          
         // Step 5  : Slow rotation    Return Brush         
         // Step 10 : Synchro Axe     
         //----------------------------------------------
         // Condititons Step 15
          IF g_stHMPerfCyc.bStopCond          AND 
             ( g_stHMPerfCyc.bTestOn          OR 
               NOT(g_stHMPerfCyc.bModTest) ) THEN 
            g_stHMPerfCyc.iStep := C_iSTEP_15 ;  
            
            // Action Step 15 
            g_stHMPerfCyc.bTestOn := 0 ;
               
            RETURN ;   
          END_IF  
               
         // Condititons Step 5
          IF g_stHMPerfCyc.bSlowRotCond       AND 
             ( g_stHMPerfCyc.bTestOn          OR 
               NOT(g_stHMPerfCyc.bModTest) ) THEN 
            g_stHMPerfCyc.iStep := C_iSTEP_5 ;  
            
            // Action Step 5 
            g_stHMPerfCyc.bTestOn := 0 ;
            
            // Return Brush
            bQ_SOL_HMP_BrushForward := 0 ;    
            RETURN ;    
          END_IF    
               
         // Condititons Step 10
          IF NOT(g_stHMPerfCyc.bSynchro_OK)          AND
             (rLS_Act_mmin>gr_rHMPerfSLActTool_mmin) AND
             g_bMachineRun                           AND
             NOT(gA[15].Cmd_PhaseOffset)             AND     
             ( g_stHMPerfCyc.bTestOn                 OR 
               NOT(g_stHMPerfCyc.bModTest) )         THEN 
            g_stHMPerfCyc.iStep := C_iSTEP_10 ;  
            
            // Action Step 10 
            g_stHMPerfCyc.bTestOn := 0 ;
            
            // Synchro Axe
            MC_GearIn_0.Execute       := 1 ; 
            g_stHMPerfCyc.bSlowRot_OK := 0 ;       
          END_IF      

        C_iSTEP_5 :    
         //----------------------------------------------      
         // Step 6 : Move up protector
         //          Activate Slow Rotation      
         //----------------------------------------------
          IF gI_HMP_BrushReturnPE             AND 
             ( g_stHMPerfCyc.bTestOn          OR 
               NOT(g_stHMPerfCyc.bModTest) ) THEN 
            g_stHMPerfCyc.iStep := C_iSTEP_6 ;  
            
            // Action Step 6  
            g_stHMPerfCyc.bTestOn := 0 ;
            
            // Move down protector
            bQ_SOL_HMP_ProtecDown := 0 ;  
            
            // Activate Slow Rotation
            g_stHMPerfCyc.bSlowRot_OK := 1 ;
            g_stHMPerfCyc.Cmd_SlowRot := 1 ;
            
            g_stHMPerfCyc.rSP_Vel := gr_rHMPerfSlowRot_rpm ;
            g_stHMPerfCyc.rSP_Acc := gr_rHMPerfAcc_rpm2 ;
            g_stHMPerfCyc.rSP_Dec := gr_rHMPerfDec_rpm2 ;
          END_IF     

        C_iSTEP_6 :    
         //----------------------------------------------      
         // Step 7 : Synchro Off     
         //----------------------------------------------
          IF NOT(gI_HMP_ProtecDownPE)           AND
             NOT(g_stHMPerfCyc.Cmd_SlowRot)     AND 
             NOT(gA[15].Ind_SynchronizedMotion) AND 
             ( g_stHMPerfCyc.bTestOn            OR 
               NOT(g_stHMPerfCyc.bModTest) )   THEN 
            g_stHMPerfCyc.iStep := C_iSTEP_7 ;  
            
            // Action Step 7  
            g_stHMPerfCyc.bTestOn := 0 ;
            
            g_stHMPerfCyc.bSynchro_OK := 0 ;  
          END_IF     

        C_iSTEP_7 :    
         //----------------------------------------------    
         // Step 4 : Waiting State       
         //----------------------------------------------
          IF TRUE                              AND 
             ( g_stHMPerfCyc.bTestOn           OR 
               NOT(g_stHMPerfCyc.bModTest) )   THEN 
            g_stHMPerfCyc.iStep := C_iSTEP_4 ;  
            
            // Action Step 4  
            g_stHMPerfCyc.bTestOn := 0 ;
            
            // Waiting State
          END_IF   

        C_iSTEP_10 :    
         //----------------------------------------------      
         // Step 11 : Phasing      
         //----------------------------------------------
          IF NOT(MC_GearIn_0.Execute)        AND 
             ( g_stHMPerfCyc.bTestOn         OR 
               NOT(g_stHMPerfCyc.bModTest) ) THEN 
            g_stHMPerfCyc.iStep := C_iSTEP_11 ;  
            
            // Action Step 11 
            g_stHMPerfCyc.bTestOn := 0 ;
            
            // Synchro Phasing
            g_bHMP_CmdPhasing := 1 ;
            // Calculation Offset, in Deg
            rCalc[0] := (gRecipeActive.rHMPerf_OffsetIn + gRecipeActive.Perf_Offset) / gRecipeActive.Repeat * 360.0 ;
            // Calculation Actual Slave Phase on Master side, in Deg (PosSalve = R x PosMaster + Phase = R x ( PosMaster + Offset ) => Phase = R x Offset  with R = rRSynNum/rRSynDen
            rCalc[1] := gA[15].rActPhasDeg / (gA[15].rRSynNum/gA[15].rRSynDen) ;
            // Difference between Set Point Offset and Actual Offset
            rCalc[2] := rCalc[0] - rCalc[1] ;
            // Phase Shift Set Point to match with Set Point Offset
            g_rHMP_SP_Phasing := H_FC_Modulus (IN_rMod := 360.0, IN_rVar := rCalc[2]) ;
          END_IF   

        C_iSTEP_11 :    
         //----------------------------------------------      
         // Step 13 : Move down protector      
         //----------------------------------------------
          IF NOT(g_bHMP_CmdPhasing)          AND   
             NOT(g_bHMP_PhasInProgres)       AND   
             ( g_stHMPerfCyc.bTestOn         OR 
               NOT(g_stHMPerfCyc.bModTest) ) THEN 
            g_stHMPerfCyc.iStep := C_iSTEP_13 ;  
            
            // Action Step 13  
            g_stHMPerfCyc.bTestOn := 0 ;
            
            // Move down protector
            bQ_SOL_HMP_ProtecDown     := 1 ;    
            g_stHMPerfCyc.bSynchro_OK := 1 ; 
          END_IF   

        C_iSTEP_13 :    
         //----------------------------------------------    
         // Step 14 : Move forward Brush       
         //----------------------------------------------
          IF gI_HMP_ProtecDownPE             AND  
             ( g_stHMPerfCyc.bTestOn         OR 
               NOT(g_stHMPerfCyc.bModTest) ) THEN 
            g_stHMPerfCyc.iStep := C_iSTEP_14 ;  
            
            // Action Step 14  
            
            // Move forward Brush
            bQ_SOL_HMP_BrushForward := 1 ;
          END_IF     

        C_iSTEP_14 :    
         //----------------------------------------------    
         // Step 4 : Waiting State       
         //----------------------------------------------
          IF NOT(gI_HMP_BrushReturnPE)       AND  
             ( g_stHMPerfCyc.bTestOn         OR 
               NOT(g_stHMPerfCyc.bModTest) ) THEN 
            g_stHMPerfCyc.iStep := C_iSTEP_4 ;  
            
            // Action Step 4  
            g_stHMPerfCyc.bTestOn := 0 ;
            
            // Waiting State
          END_IF     

        C_iSTEP_15 :    
         //----------------------------------------------    
         // Step 16 : Return Brush      
         //----------------------------------------------
          IF TRUE                            AND  
             ( g_stHMPerfCyc.bTestOn         OR 
               NOT(g_stHMPerfCyc.bModTest) ) THEN 
            g_stHMPerfCyc.iStep := C_iSTEP_16 ;  
            
            // Action Step 16  
            g_stHMPerfCyc.bTestOn := 0 ;
            
            // Return Brush
            bQ_SOL_HMP_BrushForward := 0 ;     
          END_IF     

        C_iSTEP_16 :    
         //----------------------------------------------    
         // Step 17 : Stop Axis       
         //           Move up protector  
         //----------------------------------------------
          IF gI_HMP_BrushReturnPE            AND   
             ( g_stHMPerfCyc.bTestOn         OR 
               NOT(g_stHMPerfCyc.bModTest) ) THEN 
            g_stHMPerfCyc.iStep := C_iSTEP_17 ;  
            
            // Action Step 17  
            g_stHMPerfCyc.bTestOn := 0 ;
            
            // Stop Axis
            g_stHMPerfCyc.Cmd_Stop      := 1 ;
            gA[15].Cmd_ContinuousMotion := 0 ;   
            g_stHMPerfCyc.bSynchro_OK   := 0 ;  
            g_stHMPerfCyc.bSlowRot_OK   := 0 ;   
            // Move up protector
            bQ_SOL_HMP_ProtecDown := 0 ;   
          END_IF   

        C_iSTEP_17 :    
         //----------------------------------------------    
         // Step 18 : Disable Axis       
         //----------------------------------------------
          IF NOT(g_stHMPerfCyc.Cmd_Stop)     AND 
             gA[15].Ind_StandStill           AND 
             NOT(gI_HMP_ProtecDownPE)        AND  
             ( g_stHMPerfCyc.bTestOn         OR 
               NOT(g_stHMPerfCyc.bModTest) ) THEN 
            g_stHMPerfCyc.iStep := C_iSTEP_18 ;  
            
            // Action Step 18
            g_stHMPerfCyc.bTestOn := 0 ;
            
            g_stHMPerfCyc.Cmd_EnableAxis := 0 ;
          END_IF   

        C_iSTEP_18 :    
         //----------------------------------------------    
         // Step 0 : First step  
         //----------------------------------------------
          IF NOT(gA[15].Ind_Enabled)         AND
             NOT(gI_HMP_ProtecDownPE)        AND   
             ( g_stHMPerfCyc.bTestOn         OR 
               NOT(g_stHMPerfCyc.bModTest) ) THEN 
            g_stHMPerfCyc.iStep := C_iSTEP_0 ;  
            
            // Action Step 0
            g_stHMPerfCyc.bTestOn := 0 ;
                            
            g_stHMPerfCyc.bSCyc := 0 ;
            g_stHMPerfCyc.bFCyc := 1 ;
            g_stHMPerfCyc.bCyc  := 0 ; 
            
            g_stHMPerfCyc.bSelProd := NOT(g_stHMPerfCyc.bStopReq) ;
            g_stHMPerfCyc.bStopReq := 0 ;  
          END_IF   
  
        END_CASE   
  
  
  
  
  

END_PROGRAM
