(********************************************************************
 * COPYRIGHT -- .
 ********************************************************************
 * Program: A13_Cycle
 * File: A13_CycleCyclic.st
 * Author: dominique
 * Created: November 21, 2011
 ********************************************************************
 * Implementation of program A13_Cycle
 ********************************************************************)

PROGRAM _CYCLIC


// Manu axis movement for timing setting 


    //---------------------------------------------------------------------------------------------------------------------
    // Tearing timing setting cycle 
    //---------------------------------------------------------------------------------------------------------------------   
    // Start cycle 
    gstCycA[13].CycManTimSet.CmdStart := ( gA[13].Cmd_ManuTimSetPlus        OR 
                                           gA[13].Cmd_ManuTimSetMinus )     AND
                                         ( NOT(g_bCycManTimeSetOn)          OR 
                                           gstCycA[13].CycManTimSet.bSCyc ) AND 
                                         gA[13].Ind_Ready                   AND 
                                         gA[7].Ind_Ready                    ;               
    IF gstCycA[13].CycManTimSet.CmdStart THEN                   
      gstCycA[13].CycManTimSet.bSCyc := 1 ;
    END_IF ;
    
    //----------------------------------------------------------------------
    // Cycle at rest  
    IF NOT(gstCycA[13].CycManTimSet.bSCyc) AND 
       1                                 THEN
      IF NOT( gstCycA[13].CycManTimSet.bFCyc ) THEN  
        // Init after cycle unpropaly ended    
        gstCycA[13].CycManTimSet.bFCyc := 1 ;
        gstCycA[13].CycManTimSet.bCyc  := 0 ; 
        
        gstCycA[13].CycManTimSet.CmdMov       := 0 ;
        gstCycA[13].CycManTimSet.CmdStop      := 0 ;
        gstCycA[13].CycManTimSet.CmdSynchroOn := 0 ;   
      END_IF  
      gstCycA[13].CycManTimSet.iStep := 0 ;   
      RETURN ;
    ELSE
    //----------------------------------------------------------------------
    // Cycle running     
    
      // Permanent conditions    
      IF NOT(gA[13].Ind_Ready)                  OR 
         NOT(gA[7].Ind_Ready)                  OR 
         NOT(gstCycA[13].CycManTimSet.CmdStart) AND 
         (gstCycA[13].CycManTimSet.iStep <= 2)  THEN 
        gstCycA[13].CycManTimSet.bSCyc := 0 ;  
        RETURN ;
      END_IF 
      
      // Permanent actions 
      stTON_01 ( 
            IN := ( gstCycA[13].CycManTimSet.iStep = C_iSTEP_0 ) ,
            PT := T#30ms
               ) ;
      
    END_IF  
    //----------------------------------------------------------------------
    // Cycle steps     
      
        CASE gstCycA[13].CycManTimSet.iStep OF 

        C_iSTEP_0 :    
         //----------------------------------------------      
         // Etape 1 : Initialisation     
         //----------------------------------------------
          IF stTON_01.Q THEN 
            gstCycA[13].CycManTimSet.iStep := C_iSTEP_1 ;  
            
            // Action Step 1  
            gstCycA[13].CycManTimSet.bFCyc := 0 ;
            gstCycA[13].CycManTimSet.bCyc  := 1 ;    
          END_IF          
                      
        C_iSTEP_1 :    
         //----------------------------------------------      
         // Etape 2 : Synchro Drum on Tearing    
         //----------------------------------------------      
          IF TRUE THEN 
            gstCycA[13].CycManTimSet.iStep := C_iSTEP_2 ;    
            
            // Action Step 2    
            gstCycA[13].CycManTimSet.CmdSynchroOn := 1 ;      
          END_IF          
           
        C_iSTEP_2 :      
         //----------------------------------------------      
         // Step 3 : Activation motion and Stop waiting   
         //----------------------------------------------      
          IF gstCycA[13].CycManTimSet.bSynchroOkSlavA[7]  AND  
             gstCycA[13].CycManTimSet.bSynchroOkSlavA[13] THEN 
            gstCycA[13].CycManTimSet.iStep := C_iSTEP_3 ;  
            
            // Action Step 3      
            gstCycA[13].CycManTimSet.CmdMov  := 1 ;
            gstCycA[13].CycManTimSet.CmdStop := 0 ;
            // Stop waiting
          END_IF         
          
        C_iSTEP_3 :      
         //----------------------------------------------      
         // Step 4 : Stop motion and End stop waiting   
         //----------------------------------------------      
          IF NOT(gstCycA[13].CycManTimSet.CmdStart) THEN 
            gstCycA[13].CycManTimSet.iStep := C_iSTEP_4 ;  
               
            // Action Step 4 
            gstCycA[13].CycManTimSet.CmdMov  := 0 ;
            gstCycA[13].CycManTimSet.CmdStop := 1 ;
            // End stop waiting
          END_IF  

        C_iSTEP_4 :  
         //----------------------------------------------      
         // Step 3 : Activation motion and Stop waiting  
         // Step 5 : Cut synchro  
         //----------------------------------------------    
          // Condition Step3
          IF gstCycA[13].CycManTimSet.CmdStart THEN 
            gstCycA[13].CycManTimSet.iStep := C_iSTEP_3 ;   
               
            // Action Step 3      
            gstCycA[13].CycManTimSet.CmdMov  := 1 ;
            gstCycA[13].CycManTimSet.CmdStop := 0 ;
            // Stop waiting
            RETURN ;
          END_IF ;   
          // Condition Step5  
          IF NOT(gstCycA[13].CycManTimSet.CmdStop) THEN 
            gstCycA[13].CycManTimSet.iStep := C_iSTEP_5 ;   
               
            // Action Step 5      
            gstCycA[13].CycManTimSet.CmdSynchroOn := 0 ;      
          END_IF    
          
        C_iSTEP_5 :  
         //---------------------------------------------- 
         // Step 6 : New offset calculation   
         //----------------------------------------------      
          IF NOT(gstCycA[13].CycManTimSet.bSynchroOkSlavA[7]) THEN
            gstCycA[13].CycManTimSet.iStep := C_iSTEP_6 ;  
            
            // Action Step 6  
            // Memo Actual phase Offset   
            rTempActPhasDeg[13]    := gRecipeActive.rTearEB_PhasMasterDeg;
            rTempActOffsetInch[13] := gRecipeActive.rTearEB_Offset ;
            // Update phase
            gRecipeActive.rDrum_PhasMasterDeg   := gA[7].rActPhasDeg ;
            gRecipeActive.rTearEB_PhasMasterDeg := gA[13].rActPhasDeg ;
            // Update Offset 
            rTemp_[13] := rTempActOffsetInch[13] + (gRecipeActive.rTearEB_PhasMasterDeg - rTempActPhasDeg[13])/(gA[13].rRSynNum/gA[13].rRSynDen)*gA[13].InchPerDeg ;
            gRecipeActive.rTearEB_Offset := H_FC_Modulus (IN_rMod := gRecipeActive.Repeat, IN_rVar := rTemp_[13]) ;
          END_IF     
          
        C_iSTEP_6 :  
         //---------------------------------------------- 
         // Step 0 : First step  
         //----------------------------------------------      
          IF NOT(gstCycA[13].CycManTimSet.bSynchroOkSlavA[7]) AND 
             (gA[13].Ind_CurrentAutomatState <> 3)            THEN
            gstCycA[13].CycManTimSet.iStep := C_iSTEP_0 ;  
            
            // Action Step 0    
            gstCycA[13].CycManTimSet.bSCyc := 0 ; 
            gstCycA[13].CycManTimSet.bFCyc := 1 ;
            gstCycA[13].CycManTimSet.bCyc  := 0 ;   
          END_IF    
        END_CASE 
    //---------------------------------------------------------------------------------------------------------------------
    

    
          

END_PROGRAM
