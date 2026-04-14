(********************************************************************
 * COPYRIGHT -- .
 ********************************************************************
 * Library: HGWeber
 * File: H_FB_Flash.st
 * Author: dominique
 * Created: August 19, 2011
 ********************************************************************
 * Implementation of library HGWeber
 ********************************************************************) 


FUNCTION_BLOCK H_FB_Flash    
    
  IF IN_bEnable THEN 
    tTpFlash := REAL_TO_TIME(1000/IN_rNumFlashPerSec) ;
    stTON_0(IN:=NOT(stTON_1.Q),PT:=tTpFlash);
    stTON_1(IN:=stTON_0.Q,PT:=tTpFlash);
    
    OUT_bFlash:=stTON_0.Q ;
  ELSE  
    OUT_bFlash:= 0 ;
  END_IF ;
  

END_FUNCTION_BLOCK
