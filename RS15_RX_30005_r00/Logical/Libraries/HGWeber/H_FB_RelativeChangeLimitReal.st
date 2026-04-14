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
FUNCTION_BLOCK H_FB_RelativeChangeLimitReal
  
  
  
  // D.M. 11/10/2011 BrownPaper_14543  FB not usable. VAR_IN_OUT does no work at all... contains always a big value no idea where it come from and not possible to write it... 
  
  
  
  rMax     := IN_rRepeat * IN_rMax ;
  rMin     := IN_rRepeat * IN_rMin ;
  rLimitIn := INOUT_rLimitIn ;
  
	OUT_bOK := IN_bEnable;
	IF (IN_bEnable) THEN
    rDiff := rLimitIn - rOldLimitIn ;
    // Limit relative change 
    IF rDiff > rMax THEN 
      rLimitIn := rOldLimitIn + rMax ;
    END_IF 
    IF rDiff < rMin THEN 
      rLimitIn := rOldLimitIn + rMin ;
    END_IF 
    rInput := rLimitIn + IN_rInput ;
		IF (rInput <> rOld) THEN
			OUT_bChange := 1;
      OUT_rDiff   := rInput - rOld ;
      rOldLimitIn := rLimitIn ;
      rOld := rInput ;
		ELSE
			OUT_bChange := 0;
		END_IF
	ELSE
		OUT_bChange :=0;
	END_IF
  
  INOUT_rLimitIn := rLimitIn ;

  

END_FUNCTION_BLOCK
