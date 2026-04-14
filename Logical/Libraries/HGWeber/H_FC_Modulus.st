(********************************************************************
 * COPYRIGHT -- .
 ********************************************************************
 * Library: HGWeber
 * File: H_FC_Modulus.st
 * Author: dominique
 * Created: February 09, 2012
 ********************************************************************
 * Implementation of library HGWeber
 ********************************************************************) 

(* TODO: Add your comment here *)
FUNCTION H_FC_Modulus(*Calculat the modulus of number*)

  IF (IN_rVar>=0.0) THEN 
    rVar := IN_rVar - TRUNC(IN_rVar/IN_rMod)*IN_rMod ;
  ELSE
    rVar := IN_rVar + TRUNC(ABS(IN_rVar)/IN_rMod+1)*IN_rMod ;
  END_IF 
     
  H_FC_Modulus := rVar ;

END_FUNCTION
