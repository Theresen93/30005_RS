(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Library: HGWeber
 * File: H_FB_RelativeChangeLimitReal.st
 * Author: dominique
 * Created: October 10, 2011
 ********************************************************************
 * Implementation of library HGWeber
 ********************************************************************) 

(*Detects A Change Of A Real Number For One Scan and limit the Change*)
FUNCTION_BLOCK H_FB_RelativeChangeLimitReal1
  
  rMax := IN_rRepeat * IN_rMax ;
  rMin := IN_rRepeat * IN_rMin ;
  
	OUT_bOK := IN_bEnable;
	IF (IN_bEnable) THEN
    rDiff := IN_rLimitIn - rOldLimitIn ;
    OUT_rLimitIn := IN_rLimitIn ;
    // Limit relative change 
    IF rDiff > rMax THEN 
      OUT_rLimitIn := rOldLimitIn + rMax ;
    END_IF 
    IF rDiff < rMin THEN 
      OUT_rLimitIn := rOldLimitIn + rMin ;
    END_IF 
    rInput := OUT_rLimitIn + IN_rInput ;
		IF (rInput <> rOld) THEN
			OUT_bChange := 1;
      OUT_rDiff   := rInput - rOld ;
      rOldLimitIn := OUT_rLimitIn ;
      rOld := rInput ;
      iCount := iCount + 1 ;
      IF iCount < 0 THEN
        iCount := 0 ;
      END_IF
		ELSE
			OUT_bChange := 0;
		END_IF
  ELSE;
    OUT_rLimitIn := IN_rLimitIn ;
    rOldLimitIn  := OUT_rLimitIn ;
    rOld         := OUT_rLimitIn + IN_rInput ;
		OUT_bChange  := 0 ;
	END_IF;




END_FUNCTION_BLOCK
