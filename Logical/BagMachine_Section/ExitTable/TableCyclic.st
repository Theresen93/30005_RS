(********************************************************************
 * COPYRIGHT -- .
 ********************************************************************
 * Program: ExitTable
 * File: TableCyclic.st
 * Author: dominique
 * Created: October 20, 2011
 ********************************************************************
 * Implementation of program ExitTable
 ********************************************************************)

PROGRAM _CYCLIC
    
    bFasterReq := gI_SS_ExitTableFaster OR HMI_ExTb_bExitTableFaster_PB ;
    bSlowerReq := gI_SS_ExitTableSlower OR HMI_ExTb_bExitTableSlower_PB ;
    bFastSlowReq := bFasterReq OR bSlowerReq ;
        
    // Change slope by increment
    IF EDGEPOS(bFasterReq) THEN 
      gRecipeActive.rSlopeExitTable := gRecipeActive.rSlopeExitTable + rIncrChangeSlope ;
    END_IF ;  
    IF EDGEPOS(bSlowerReq) THEN 
      gRecipeActive.rSlopeExitTable := gRecipeActive.rSlopeExitTable - rIncrChangeSlope ;
    END_IF ;  
    
    // Change continually slope after 1s
    stTON_ContinuChangeSlope_0(IN:=bFastSlowReq, PT:=T#1s) ; 
    // Change faster after 3s
    stTON_ContinuChangeSlope_0(IN:=bFastSlowReq, PT:=T#3s) ; 
    IF stTON_ContinuChangeSlope_0.Q THEN 
      rFactMulIncr := 1.0 ; 
    END_IF ;  
    IF stTON_ContinuChangeSlope_1.Q THEN 
      rFactMulIncr := 6.0 ;
    END_IF ;  
    IF bFasterReq THEN 
      gRecipeActive.rSlopeExitTable := gRecipeActive.rSlopeExitTable + rIncrSlopeContinuChange * rFactMulIncr ;
    END_IF ;           
    IF bSlowerReq THEN 
      gRecipeActive.rSlopeExitTable := gRecipeActive.rSlopeExitTable - rIncrSlopeContinuChange * rFactMulIncr ;
    END_IF ;
      
    // Limit 
    gRecipeActive.rSlopeExitTable := LIMIT(0,gRecipeActive.rSlopeExitTable,400) ;
    
    // Actual Speed Exit Table calculation 
    // With gRecipeActive.rSlopeExitTable = 100% the maximum speed of the green belts on the exit table is reached when machine runs at maximum speed in bag/min 
    rCMD_RS_ExitTableSpeed := gRecipeActive.rSlopeExitTable/100 * gActualMachineSpeed_BPM/gr_rMachMaxSpeed_BPM ;
    rCMD_RS_ExitTableSpeed := LIMIT(0,rCMD_RS_ExitTableSpeed,1.0) ;
    
    gQ_CMD_RS_ExitTableSpeed := REAL_TO_INT(rCMD_RS_ExitTableSpeed * C_rMaxAna) + iCMD_Offset ;

END_PROGRAM
