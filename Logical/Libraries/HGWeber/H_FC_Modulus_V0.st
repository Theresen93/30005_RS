(********************************************************************
 * COPYRIGHT -- .
 ********************************************************************
 * Library: HGWeber
 * File: NewFunction.st
 * Author: dominique
 * Created: August 04, 2011
 ********************************************************************
 * Implementation of library HGWeber
 ********************************************************************) 


FUNCTION H_FC_Modulus_V0 (*Calculat the modulus of number*)
    rVar := IN_rVar ;

WHILE rVar < 0.0 DO
    rVar := rVar + IN_rMod ;
END_WHILE ;

WHILE rVar > IN_rMod DO
    rVar := rVar - IN_rMod ;
END_WHILE ;

H_FC_Modulus_V0 := rVar ;
END_FUNCTION
