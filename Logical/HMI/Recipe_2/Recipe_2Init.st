(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: Recipe_2
 * File: Recipe_2Init.st
 * Author: pkiel
 * Created: November 16, 2009
 ********************************************************************
 * Implementation of program Recipe_2
 ********************************************************************)

PROGRAM _INIT

(*Name of the recipe data structure*)
	pNames[0]:=ADR('gRecipeBase');

	CSV_Init_0(pStructName:=ADR(pNames), NumOfStructs:=1, FullNameLenght:=0, Options:=0);

(*Setup hardware axis as defined in the CPU->properties->file device*)
	(*pDevice[0]	:= ADR('RECIPE');*)
	pDevice[1]	:= ADR('USB1');
	pDevice[2]	:= ADR('USB2');

	step 		:= INIT_WAIT;
	indexNum	:= 0;
	hmiDevice	:= 1;

	gRecipeCntl.cmdDelete	:= FALSE;
	gRecipeCntl.cmdLoad		:= FALSE;
	gRecipeCntl.cmdSave		:= FALSE;
	gRecipeCntl.driveSelect := 1;
	RecipeBackUpPopUp := 1;
	RecipeRestorePopUp := 1;

END_PROGRAM

