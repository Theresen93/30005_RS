(********************************************************************
 * COPYRIGHT -- .
 ********************************************************************
 * Program: Unwinder
 * File: UnwinderCyclic.st
 * Author: dominique
 * Created: August 10, 2011
 ********************************************************************
 * Implementation of program Unwinder
 ********************************************************************)

PROGRAM _CYCLIC
  
    // Brake WARNER on machine Pyrollpack_14661
      
 (* Terminal1 |  Brake Control (PID regulation)
    ----------|--------------------
       0      |      YES
    ----------|--------------------
       1      |      NO
       
    Terminal4 |  Lock Brake ( EStop ) 
    ----------|--------------------
       0      |      YES
    ----------|--------------------
       1      |      NO             *)
    
// ------------------------------------------------------------------------------------
// Brake management 
    // Special case WARNER Brake on machine Pyrollpack_14661
    // Terminal1 on WARNER device (Control)
    bPIDRegul := g_bMainPower_On      AND 
                 gA[9].Ind_InMotion   AND                                 
                 1                    ;     
    gQ_CR_UNW_PIDRegul := NOT(bPIDRegul) ;

    // Terminal4 on WARNER device (Lock)
    bLock := g_bMainPower_On     AND 
             ( g_bIndStopFault   OR 
               g_bIndStopFault ) AND 
             1                   ;      
    gQ_CR_UNW_Lock := NOT(bLock) AND                               
                      1          ;  
 


// ------------------------------------------------------------------------------------
    // Enable regualtion on the customer's unwinder when master is in motion 
    gQ_CR_UnwinRegEnable := gA[9].Ind_InMotion OR 
                            bTest              ;
    

  // ------------------------------------------------------------------------------------
  // Regualtion on the HOLWEG unwinder when master is in motion                              
    // Input B on MEROBEL device
    bTemp := gI_SS_UNW_Brake    AND 
             gA[9].Ind_InMotion ;    
    gQ_CR_UNW_Brake := NOT(bTemp)                  AND   
                       ( NOT(g_bIndStopFault)      AND 
                         NOT(g_bIndEStop)          OR 
                         NOT(gA[9].Ind_InMotion) ) AND                               
                       1                           ;  

    // Input A on MEROBEL device
    gQ_CR_UNW_PIDRegul := gI_SS_UNW_Brake             AND 
                          ( NOT(g_bIndStopFault)      AND 
                            NOT(g_bIndEStop)          OR 
                            NOT(gA[9].Ind_InMotion) ) AND                               
                          1                           ;                       
                      





// ------------------------------------------------------------------------------------
// Forks management
    bForkUpReq   := gI_SS_UNW_ForkUp AND NOT(gI_SS_UNW_ForkDown) ;   
    bForkDownReq := gI_SS_UNW_ForkDown AND NOT(gI_SS_UNW_ForkUp) ;         
    bForkRequest := gI_SS_UNW_ForkUp OR gI_SS_UNW_ForkDown ;
    stTON_DelayActFork(IN:=bForkRequest, PT:=tDelayActFork) ;
    // Fork Up
    bImQ_CR_UNW_ForkUp := bForkUpReq         AND
                        stTON_DelayActFork.Q ; 
    gQ_CR_UNW_ForkUp := bImQ_CR_UNW_ForkUp AND 
                        NOT(g_bIndEStop)   ;         
    // Fork Down
    bImQ_CR_UNW_ForkDown := bForkDownReq         AND
                            stTON_DelayActFork.Q ;
    gQ_CR_UNW_ForkDown := bImQ_CR_UNW_ForkDown AND 
                          NOT(g_bIndEStop)     ;          
  

    // Hydraulic Pump 
    stTOF_ActHydroPump(IN:=bForkRequest, PT:=tTimActPump);
    bImQ_CR_UNW_HydroPump := stTOF_ActHydroPump.Q ;
    gQ_CR_UNW_HydroPump := bImQ_CR_UNW_HydroPump AND NOT(g_bIndEStop) ;
  
END_PROGRAM
