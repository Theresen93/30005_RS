(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: Recipe_1
 * File: Recipe_1Init.st
 * Author: pkiel
 * Created: October 13, 2009
 ********************************************************************
 * Implementation of program Recipe_1
 ********************************************************************)

PROGRAM _INIT

	RecipeLoadPopUp := 1;
	RecipeSavePopUp := 1;
	RecipeSaveAsPopUp := 1;
	RecipeDeletePopUp := 1;
	RecipeCurrent_Index := LIMIT(1,RecipeCurrent_Index,50);

END_PROGRAM

