(********************************************************************
 * COPYRIGHT --    

 ********************************************************************
 * Library: HGWeber
 * File: H_FB_2StepMove.st
 * Author: dominique
 * Created: August 18, 2011
 ********************************************************************
 * Implementation of library HGWeber
 ********************************************************************) 

(* TODO: Add your comment here *)
FUNCTION_BLOCK H_FB_2StepMove
  
  IF EDGEPOS(IN_bStart) AND 
     IN_bPermis         AND 
     ( iStep = 0 )      THEN   
    iStep := 1 ;
    RETURN ;
  END_IF 
     
  IF NOT(IN_bPermis) THEN 
    iStep          := 0 ;
    OUT_bHorn      := 0 ;
    OUT_bStartMove := 0 ;
    
  END_IF    
     
  stTON_0(IN:=(iStep=1), PT:=IN_tTpHorn) ;  
  stTON_1(IN:=(iStep=2), PT:=T#2s) ;    
  stTON_2(IN:=(iStep=3), PT:=T#2s) ;   
  stTON_3(IN:=(iStep=4), PT:=T#1s) ;  
     
  CASE iStep OF 
    1 : ; // Horn ringing
        IF IN_bStart THEN 
          OUT_bHorn := 1 ;
          IF stTON_0.Q THEN 
            iStep     := 2 ; 
            OUT_bHorn := 0 ;
          END_IF   
        ELSE
          iStep     := 0 ;
          OUT_bHorn := 0 ;
        END_IF  
    2 : ; // Waiting remove start     
        IF NOT(stTON_1.Q) THEN 
          IF NOT(IN_bStart) THEN 
            iStep := 3 ;   
          END_IF   
        ELSE
          iStep := 0 ;
        END_IF  
    3 : ; // Waiting new start     
        IF NOT(stTON_2.Q) THEN 
          IF IN_bStart THEN 
            iStep := 4 ;   
            OUT_bStartMove := 1 ;
          END_IF   
        ELSE
          iStep := 0 ;
        END_IF  
    4 : ; // Output during 1s     
        IF stTON_3.Q THEN 
          iStep := 0 ;   
          OUT_bStartMove := 0 ;
        END_IF   
  END_CASE
  OUT_iActStep := iStep ;   
END_FUNCTION_BLOCK
