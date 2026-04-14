(********************************************************************
 * COPYRIGHT -- .
 ********************************************************************
 * Program: A1_Cycle
 * File: A1_CycleCyclic.st
 * Author: dominique
 * Created: August 01, 2011
 ********************************************************************
 * Implementation of program A1_Cycle
 ********************************************************************)

PROGRAM _CYCLIC


// Manu axis movement for timing setting 


    //---------------------------------------------------------------------------------------------------------------------
    // Holding timing setting cycle 
    //---------------------------------------------------------------------------------------------------------------------     
    
    // Start cycle 
    gstCycA[3].CycManTimSet.CmdStart := ( gA[3].Cmd_ManuTimSetPlus        OR 
                                          gA[3].Cmd_ManuTimSetMinus )     AND
                                        ( NOT(g_bCycManTimeSetOn)         OR 
                                          gstCycA[3].CycManTimSet.bSCyc ) AND    
                                        gA[3].Ind_Ready                   AND    
                                        gA[4].Ind_Ready                   AND 
                                        gA[7].Ind_Ready                   ;               
    IF gstCycA[3].CycManTimSet.CmdStart THEN                   
      gstCycA[3].CycManTimSet.bSCyc := 1 ;
    END_IF ;
    
    //----------------------------------------------------------------------
    // Cycle at rest   
    IF NOT(gstCycA[3].CycManTimSet.bSCyc) AND 
       1                                 THEN
      IF NOT( gstCycA[3].CycManTimSet.bFCyc ) THEN  
        // Init after cycle unpropaly ended    
        gstCycA[3].CycManTimSet.bFCyc := 1 ;
        gstCycA[3].CycManTimSet.bCyc  := 0 ; 
        
        gstCycA[3].CycManTimSet.CmdMov       := 0 ;
        gstCycA[3].CycManTimSet.CmdStop      := 0 ;
        gstCycA[3].CycManTimSet.CmdSynchroOn := 0 ; 
        
        gA[3].Cmd_Override  := 1 ;
        gA[3].rSP_OverrideA := 1.0 ;  
      END_IF  
      gstCycA[3].CycManTimSet.iStep := 0 ;   
      RETURN ;
    ELSE
    //----------------------------------------------------------------------
    // Cycle running     
    
      // Permanent conditions    
      IF NOT(gA[3].Ind_Ready)                  OR 
         NOT(gA[4].Ind_Ready)                  OR 
         NOT(gA[7].Ind_Ready)                  OR 
         NOT(gstCycA[3].CycManTimSet.CmdStart) AND 
         (gstCycA[3].CycManTimSet.iStep <= 1)  THEN 
        gstCycA[3].CycManTimSet.bSCyc := 0 ; 
        RETURN ;
      END_IF      
         
      // Permanent actions 
      stTON_01 ( 
            IN := ( gstCycA[3].CycManTimSet.iStep = C_iSTEP_0 ) ,
            PT := T#30ms
               ) ;
               
      // Phasing override acce management ( Override seems do be not efficient with phasing )  
      IF EDGE(gstCycA[3].CycManTimSet.CmdStart) THEN 
        IF gstCycA[3].CycManTimSet.CmdStart THEN 
          gA[3].rSP_OverrideA := 0.5 ;
        ELSE
          gA[3].rSP_OverrideA := 1.0 ;
        END_IF  
        gA[3].Cmd_Override := 1 ;
      END_IF  
          
               
    END_IF  
    //----------------------------------------------------------------------
    // Cycle steps     
      
        CASE gstCycA[3].CycManTimSet.iStep OF 

        C_iSTEP_0 :    
         //----------------------------------------------      
         // Etape 1 : Initialisation     
         //----------------------------------------------
          IF stTON_01.Q THEN 
            gstCycA[3].CycManTimSet.iStep := C_iSTEP_1 ;  
            
            // Action Step 1  
            gstCycA[3].CycManTimSet.bFCyc := 0 ;
            gstCycA[3].CycManTimSet.bCyc  := 1 ;    
          END_IF          
                      
        C_iSTEP_1 :    
         //----------------------------------------------      
         // Etape 2 : Synchro Tearing + Drum on Holding    
         //----------------------------------------------      
          IF TRUE THEN 
            gstCycA[3].CycManTimSet.iStep := C_iSTEP_2 ;    
            
            // Action Step 2    
            gstCycA[3].CycManTimSet.CmdSynchroOn := 1 ;  
          END_IF          
           
        C_iSTEP_2 :      
         //----------------------------------------------      
         // Step 3 : Activation motion and Stop waiting       
         // Step 6 : Exit cycle    
         //----------------------------------------------      
          // Condition Step3
          IF gstCycA[3].CycManTimSet.bSynchroOkSlavA[3]    AND 
             gstCycA[3].CycManTimSet.bSynchroOkSlavA[4]    AND 
             gstCycA[3].CycManTimSet.bSynchroOkSlavA[7]    AND 
             ( gstCycA[3].CycManTimSet.bSynchroOkSlavA[12] OR 
               NOT(gA[12].bInMach) )                       AND 
             ( gstCycA[3].CycManTimSet.bSynchroOkSlavA[13] OR 
               NOT(gA[13].bInMach) )                       AND 
             NOT(gA[3].Cmd_Override)                       THEN 
            gstCycA[3].CycManTimSet.iStep := C_iSTEP_3 ;  
            
            // Action Step 3      
            gstCycA[3].CycManTimSet.CmdMov  := 1 ;
            gstCycA[3].CycManTimSet.CmdStop := 0 ;
            // Stop waiting
            RETURN ;
          END_IF    
             
          // Condition Step6  
          IF NOT(gstCycA[3].CycManTimSet.CmdStart) THEN 
            gstCycA[3].CycManTimSet.iStep := C_iSTEP_6 ;   
               
            // Action Step 6  
            gstCycA[3].CycManTimSet.CmdSynchroOn := 0 ;            
          END_IF    
          
        C_iSTEP_3 :      
         //----------------------------------------------      
         // Step 4 : Stop motion and End stop waiting   
         //----------------------------------------------      
          IF NOT(gstCycA[3].CycManTimSet.CmdStart) AND 
             NOT(gA[3].Cmd_Override)               THEN 
            gstCycA[3].CycManTimSet.iStep := C_iSTEP_4 ;  
               
            // Action Step 4 
            gstCycA[3].CycManTimSet.CmdMov  := 0 ;
            gstCycA[3].CycManTimSet.CmdStop := 1 ;
            // End stop waiting
          END_IF  

        C_iSTEP_4 :  
         //----------------------------------------------        
         // Step 3 : Activation motion and Stop waiting  
         // Step 5 : Cut synchro  
         //----------------------------------------------    
          // Condition Step3
          IF gstCycA[3].CycManTimSet.CmdStart AND 
             NOT(gA[3].Cmd_Override)          THEN 
            gstCycA[3].CycManTimSet.iStep := C_iSTEP_3 ;   
               
            // Action Step 3      
            gstCycA[3].CycManTimSet.CmdMov  := 1 ;
            gstCycA[3].CycManTimSet.CmdStop := 0 ;
            // Stop waiting
            RETURN ;
          END_IF    
          // Condition Step5  
          IF NOT(gstCycA[3].CycManTimSet.CmdStop) THEN 
            gstCycA[3].CycManTimSet.iStep := C_iSTEP_5 ;   
               
            // Action Step 5      
            gstCycA[3].CycManTimSet.CmdSynchroOn := 0 ;      
          END_IF    
          
        C_iSTEP_5 :  
         //---------------------------------------------- 
         // Step 6 : New offset calculation   
         //----------------------------------------------      
          IF NOT(gstCycA[3].CycManTimSet.bSynchroOkSlavA[4])    AND 
             NOT(gstCycA[3].CycManTimSet.bSynchroOkSlavA[7])    AND 
             ( NOT(gstCycA[3].CycManTimSet.bSynchroOkSlavA[12]) OR 
               NOT(gA[12].bInMach) )                            AND 
             ( NOT(gstCycA[3].CycManTimSet.bSynchroOkSlavA[13]) OR 
               NOT(gA[13].bInMach) )                            THEN
            gstCycA[3].CycManTimSet.iStep := C_iSTEP_6 ;  
            
            // Action Step 6 
            // Memo Actual phase Offset   
            rTempActPhasDeg[3] := gRecipeActive.rHolding_PhasMasterDeg ;
            rTempActOffsetInch[3] := gRecipeActive.Holding_Offset ;
            // Update phase
            gRecipeActive.rHolding_PhasMasterDeg := gA[3].rActPhasDeg ;
            gRecipeActive.rTearing_PhasMasterDeg := gA[4].rActPhasDeg ;
            gRecipeActive.rDrum_PhasMasterDeg    := gA[7].rActPhasDeg ;
            IF gA[12].bInMach THEN 
              gRecipeActive.rEnvB_PhasMasterDeg := gA[12].rActPhasDeg ;  
            END_IF    
            IF gA[13].bInMach THEN 
              gRecipeActive.rTearEB_PhasMasterDeg := gA[13].rActPhasDeg ;  
            END_IF    
            // Update Offset 
            rTemp_[3] := rTempActOffsetInch[3] + (gRecipeActive.rHolding_PhasMasterDeg - rTempActPhasDeg[3])/(gA[3].rRSynNum/gA[3].rRSynDen)*gA[3].InchPerDeg ;
            gRecipeActive.Holding_Offset := H_FC_Modulus (IN_rMod := gRecipeActive.Repeat, IN_rVar := rTemp_[3]) ;
          END_IF     
          
        C_iSTEP_6 :  
         //---------------------------------------------- 
         // Step 0 : First step  
         //---------------------------------------------- 
          IF NOT(gstCycA[3].CycManTimSet.bSynchroOkSlavA[4])    AND 
             NOT(gstCycA[3].CycManTimSet.bSynchroOkSlavA[7])    AND 
             ( NOT(gstCycA[3].CycManTimSet.bSynchroOkSlavA[12]) OR 
               NOT(gA[12].bInMach) )                            AND 
             ( NOT(gstCycA[3].CycManTimSet.bSynchroOkSlavA[13]) OR 
               NOT(gA[13].bInMach) )                            THEN
            gstCycA[3].CycManTimSet.iStep := C_iSTEP_0 ;  
            
            // Action Step 0    
            gstCycA[3].CycManTimSet.bSCyc := 0 ; 
            gstCycA[3].CycManTimSet.bFCyc := 1 ;
            gstCycA[3].CycManTimSet.bCyc  := 0 ;   
          END_IF    
        END_CASE       
    //---------------------------------------------------------------------------------------------------------------------
    

    
          

END_PROGRAM
