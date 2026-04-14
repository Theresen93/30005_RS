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
    // ACDC Power Supply cycle 
    //---------------------------------------------------------------------------------------------------------------------    
    // Start cycle 
    gstCycA[1].CycManTimSet.CmdStart := ( gA[1].Cmd_ManuTimSetPlus    OR 
                                          gA[1].Cmd_ManuTimSetMinus ) AND 
                                        NOT(gA[1].Error)              AND 
                                        NOT(gA[11].Error)             ;             
    IF gstCycA[1].CycManTimSet.CmdStart THEN                   
      gstCycA[1].CycManTimSet.bSCyc := 1 ;
    END_IF ;
    
    //----------------------------------------------------------------------
    // Cycle at rest  
    IF NOT(gstCycA[1].CycManTimSet.bSCyc) AND 
       1                                 THEN
      IF NOT( gstCycA[1].CycManTimSet.bFCyc ) THEN  
        // Init after cycle unpropaly ended    
        gstCycA[1].CycManTimSet.bFCyc := 1 ;
        gstCycA[1].CycManTimSet.bCyc  := 0 ; 
        
        gstCycA[1].CycManTimSet.CmdMov  := 0 ;
        gstCycA[1].CycManTimSet.CmdStop := 0 ;
        gstCycA[1].CycManTimSet.CmdSynchroOn := 0 ; 
      END_IF  
      gstCycA[1].CycManTimSet.iStep := 0 ;   
      RETURN ;
    ELSE
    //----------------------------------------------------------------------
    // Cycle running     
    
      // Permanent conditions    
      IF NOT(gA[1].Ind_Ready)                  OR 
         NOT(gA[11].Ind_Ready)                 OR 
         NOT(gstCycA[1].CycManTimSet.CmdStart) AND 
         (gstCycA[1].CycManTimSet.iStep <= 2)  THEN 
        gstCycA[1].CycManTimSet.bSCyc := 0 ;  
        RETURN ;
      END_IF 
      
      // Permanent actions 
      stTON_01 ( 
            IN := ( gstCycA[1].CycManTimSet.iStep = C_iSTEP_0 ) ,
            PT := T#30ms
               ) ;
    END_IF  
    //----------------------------------------------------------------------
    // Cycle steps     
      
        CASE gstCycA[1].CycManTimSet.iStep OF 

        C_iSTEP_0 :    
         //----------------------------------------------      
         // Etape 1 : Initialisation     
         //----------------------------------------------
          IF stTON_01.Q THEN 
            gstCycA[1].CycManTimSet.iStep := C_iSTEP_1 ;  
            
            // Action Step 1  
            gstCycA[1].CycManTimSet.bFCyc := 0 ;
            gstCycA[1].CycManTimSet.bCyc  := 1 ;    
          END_IF          
                      
        C_iSTEP_1 :    
         //----------------------------------------------      
         // Etape 2 : Synchro Drum    
         //----------------------------------------------      
          IF TRUE THEN 
            gstCycA[1].CycManTimSet.iStep := C_iSTEP_2 ;    
            
            // Action Step 2    
            gstCycA[1].CycManTimSet.CmdSynchroOn := 1 ;      
          END_IF          
           
        C_iSTEP_2 :      
         //----------------------------------------------      
         // Step 3 : Activation motion and Stop waiting   
         //----------------------------------------------      
          IF gstCycA[1].CycManTimSet.bSynchroOkSlavA[11] THEN 
            gstCycA[1].CycManTimSet.iStep := C_iSTEP_3 ;  
            
            // Action Step 3      
            gstCycA[1].CycManTimSet.CmdMov  := 1 ;
            gstCycA[1].CycManTimSet.CmdStop := 0 ;
            // Stop waiting
          END_IF         
          
        C_iSTEP_3 :      
         //----------------------------------------------      
         // Step 4 : Stop motion and End stop waiting   
         //----------------------------------------------      
          IF NOT(gstCycA[1].CycManTimSet.CmdStart) THEN 
            gstCycA[1].CycManTimSet.iStep := C_iSTEP_4 ;  
               
            // Action Step 4 
            gstCycA[1].CycManTimSet.CmdMov  := 0 ;
            gstCycA[1].CycManTimSet.CmdStop := 1 ;
            // End stop waiting
          END_IF  

        C_iSTEP_4 :  
         //----------------------------------------------      
         // Step 3 : Activation motion and Stop waiting  
         // Step 5 : Cut synchro  
         //----------------------------------------------    
          // Condition Step3
          IF gstCycA[1].CycManTimSet.CmdStart THEN 
            gstCycA[1].CycManTimSet.iStep := C_iSTEP_3 ;   
               
            // Action Step 3      
            gstCycA[1].CycManTimSet.CmdMov  := 1 ;
            gstCycA[1].CycManTimSet.CmdStop := 0 ;
            // Stop waiting
            RETURN ;
          END_IF ;   
          // Condition Step5  
          IF NOT(gstCycA[1].CycManTimSet.CmdStop) THEN 
            gstCycA[1].CycManTimSet.iStep := C_iSTEP_5 ;   
               
            // Action Step 5      
            gstCycA[1].CycManTimSet.CmdSynchroOn := 0 ;      
          END_IF    
          
        C_iSTEP_5 :  
         //---------------------------------------------- 
         // Step 6 : New offset calculation   
         //----------------------------------------------      
          IF TRUE THEN
            gstCycA[1].CycManTimSet.iStep := C_iSTEP_6 ;  
            
            // Action Step 6  
            // Memo Actual phase Offset   
            rTempActPhasDeg[1]    := gRecipeActive.rPerf_PhasMasterDeg ;
            rTempActOffsetInch[1] := gRecipeActive.Perf_Offset ;
            // Update phase
            gRecipeActive.rPerf_PhasMasterDeg := gA[11].rActPhasDeg ;
            // Update Offset 
            rTemp_[1] := gA[11].PositionInch - gA[9].PositionInch ;                                                                
            gRecipeActive.Perf_Offset := H_FC_Modulus (IN_rMod := gRecipeActive.Repeat, IN_rVar := rTemp_[1]) ;
          END_IF     
          
        C_iSTEP_6 :  
         //---------------------------------------------- 
         // Step 0 : First step  
         //----------------------------------------------      
          IF TRUE THEN
            gstCycA[1].CycManTimSet.iStep := C_iSTEP_0 ;  
            
            // Action Step 0    
            gstCycA[1].CycManTimSet.bSCyc := 0 ; 
            gstCycA[1].CycManTimSet.bFCyc := 1 ;
            gstCycA[1].CycManTimSet.bCyc  := 0 ;   
          END_IF    
        END_CASE     
    //---------------------------------------------------------------------------------------------------------------------
    

    
      

END_PROGRAM
