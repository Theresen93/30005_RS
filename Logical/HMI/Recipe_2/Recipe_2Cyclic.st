(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: Recipe_2
 * File: Recipe_2Cyclic.st
 * Author: pkiel
 * Created: November 16, 2009
 ********************************************************************
 * Implementation of program Recipe_2
 ********************************************************************)

PROGRAM _CYCLIC

strcpy(ADR(gRecipeCntl.currRecipe), ADR(recipeName[indexNum]));


CASE step OF

	INIT_WAIT:
		IF(waitCnt > 100)THEN
			waitCnt 	:= 0;
			step 		:= INIT_RECIPE;
		ELSE
			waitCnt := waitCnt + 1;
		END_IF


	INIT_RECIPE:
		(**** Get directory info ****)
		(* Initialize info structure *)

		DirInfo_0(enable:=1, pDevice:= pDevice[gRecipeCntl.driveSelect], pPath:=ADR(''));

		(* Get FBK output information *)
		dirNum		:= DirInfo_0.dirnum;
		fileNum 	:= DirInfo_0.filenum;

		                           		  (*01234567890123456789*)
		strcpy(ADR(gRecipeCntl.status),ADR('READ DIR INFO'));

		(* Verify status *)
		IF (DirInfo_0.status = 0) THEN
			step := INIT_RECIPE + 1;
			(* Verify number of files found *)
			IF (fileNum >= MAX_RECIPE) THEN
				fileNum := MAX_RECIPE;
			END_IF
			fileCounter := 0;
			memset(ADR(readDir),0,SIZEOF(readDir));
			memset(ADR(recipeName),0,SIZEOF(recipeName));
			memset(ADR(recipeDescription),0,SIZEOF(recipeDescription));

			driveSelectOld	:= gRecipeCntl.driveSelect;

		ELSE
			IF (DirInfo_0.status <> 65535) THEN

				IF(DirInfo_0.status = fiERR_FILE_DEVICE)THEN

					IF(gRecipeCntl.driveSelect < 2)THEN
						gRecipeCntl.driveSelect := gRecipeCntl.driveSelect + 1;
					ELSE
														  (*01234567890123456789*)
						strcpy(ADR(gRecipeCntl.status),ADR('USB NOT CONNECTED'));
						gRecipeCntl.driveSelect := driveSelectOld;

						step 	:= COMMAND_RECIPE;
						stsCnt 	:= 0;

					END_IF

				ELSE
					errorLevel		:= 2;
					errStep 		:= step;
					step 			:= ERROR_STEP;

					IF (DirInfo_0.status = 20799) THEN
						wError := FileIoGetSysError();
					ELSE
						wError := DirInfo_0.status;
					END_IF
				END_IF

			END_IF
		END_IF

	11:

		(**** Get directory info ****)
		(* Verify counter variable *)
		IF (fileCounter < fileNum) THEN
			(* Initialize read directory structure *)
			DirRead_0(enable:= 1, pDevice:= DirInfo_0.pDevice, pPath:= 0, entry:= fileCounter, option:= FILE_FILE, pData:= ADR(readDir), data_len:= SIZEOF(readDir));

			itoa((fileCounter + 1), ADR(countString));
			itoa(fileNum, ADR(totalNumString));

									  		  (*01234567890123456789*)
			strcpy(ADR(gRecipeCntl.status),ADR('READ FILE '));
			strcat(ADR(gRecipeCntl.status),ADR(countString));
			strcat(ADR(gRecipeCntl.status),ADR(' OF '));
			strcat(ADR(gRecipeCntl.status),ADR(totalNumString));

			(* Verify status *)
			IF (DirRead_0.status = 0) THEN
				step 	:= INIT_RECIPE + 2;

			ELSE
				IF (DirRead_0.status <> 65535) THEN
					errorLevel		:= 3;
					errStep 		:= step;
					step 			:= ERROR_STEP;

					IF (DirRead_0.status = 20799) THEN
						wError := FileIoGetSysError();
					ELSE
						wError := DirRead_0.status;
					END_IF
				END_IF
			END_IF

		ELSE
			step 	:= COMMAND_RECIPE;
			stsCnt 	:= 0;

		END_IF



	12:
		(**** Try to open existing file ****)
		(* Initialize file open structrue *)
		FileOpen_0(enable:=1, pDevice:=DirInfo_0.pDevice, pFile:= ADR(readDir.Filename), mode:=FILE_R);

			 					   		  (*01234567890123456789*)
		(*strcpy(ADR(gRecipeCntl.status),ADR('OPEN RECIPE FILE'));*)

		(* Verify status (20708 -> File doesn't exist) *)
		IF (FileOpen_0.status = 20708) THEN
			step 		:= INIT_RECIPE + 1;
			fileCounter := fileCounter + 1;
		ELSE
			IF (FileOpen_0.status = 0) THEN
				memset(ADR(recipeDescriptionTemp),0,SIZEOF(recipeDescriptionTemp));
				step := INIT_RECIPE + 3;
			ELSE
				IF (FileOpen_0.status <> 65535) THEN
					errorLevel		:= 4;
					errStep 		:= step;
					step 			:= ERROR_STEP;

					IF (FileOpen_0.status = 20799) THEN
						wError := FileIoGetSysError();
					ELSE
						wError := FileOpen_0.status;
					END_IF
				END_IF
			END_IF
		END_IF


	13:
		(**** Read data from file - description****)
		(* Initialize file read structure *)

		FileRead_0(enable:=1, ident:=FileOpen_0.ident, offset:=114, pDest:= ADR(recipeDescriptionTemp), len:=SIZEOF(recipeDescription[fileCounter]));


			 					   		  (*01234567890123456789*)
		(*strcpy(ADR(gRecipeCntl.status),ADR('READ DESCRIPTION'));*)

		(* Verify status *)
		IF (FileRead_0.status = 0) THEN
			step := INIT_RECIPE + 4;
			strLenChk := strlen(ADR(readDir.Filename));


			IF(strLenChk > 4)THEN


				memChk := memcmp((ADR(readDir.Filename) + strLenChk - 4),ADR('.CSV') , 4);

				IF(memChk = 0)THEN
					(*Copy the name of the file*)
					memcpy(ADR(recipeName[fileCounter]),ADR(readDir.Filename), (strLenChk));

					(*Copy the recipe description*)
					FOR cnt := 0 TO 79 DO

						pChar ACCESS ADR(recipeDescriptionTemp) + cnt;
						IF(pChar = CR)THEN
							EXIT;
						END_IF
					END_FOR
					memcpy(ADR(recipeDescription[fileCounter]),ADR(recipeDescriptionTemp),cnt);
				END_IF

			END_IF

			fileCounter := fileCounter + 1;
		ELSE
			IF (FileRead_0.status <> 65535) THEN
				errorLevel		:= 5;
				errStep 		:= step;
				step 			:= ERROR_STEP;

				IF (FileRead_0.status = 20799) THEN
					wError := FileIoGetSysError();
				ELSE
					wError := FileRead_0.status;
				END_IF
			END_IF

		END_IF


	14:
		(**** Close the file ****)
		(* Initialize file close structure *)
		FileClose_0(enable:=1, ident:=FileOpen_0.ident);

			 					   		  (*01234567890123456789*)
		(*strcpy(ADR(gRecipeCntl.status),ADR('CLOSE FILE'));*)

		(* Verify status *)
   		IF (FileClose_0.status = 0) THEN
 			step := INIT_RECIPE + 1;
   		ELSE
			IF (FileClose_0.status <> 65535) THEN
				errorLevel		:= 6;
				errStep 		:= step;
				step 			:= ERROR_STEP;

				IF (FileClose_0.status = 20799) THEN
					wError := FileIoGetSysError();
				ELSE
					wError := FileClose_0.status;
				END_IF
			END_IF

		END_IF


	COMMAND_RECIPE:

		IF(stsCnt > 200)THEN
			gRecipeCntl.opActive := 0;
					  				      	  (*012345678901234567890123456789*)
			strcpy(ADR(gRecipeCntl.status),ADR('READY'));
		ELSE
			stsCnt := stsCnt + 1;
		END_IF

		IF(gRecipeCntl.cmdDelete)THEN
			gRecipeCntl.cmdDelete  	:= 0;
			gRecipeCntl.opActive 	:= 1;
			step := DELETE_RECIPE;

		ELSIF(gRecipeCntl.cmdLoad)THEN

			gRecipeCntl.cmdLoad		:= 0;
			gRecipeCntl.opActive 	:= 1;
			step := LOAD_RECIPE;

		ELSIF(gRecipeCntl.cmdSave) THEN

			gRecipeCntl.cmdSave 	:= 0;
			gRecipeCntl.opActive 	:= 1;
			step := SAVE_RECIPE;
		ELSIF(driveSelectOld <> gRecipeCntl.driveSelect)THEN
			step := INIT_RECIPE;
		END_IF

	DELETE_RECIPE:

		(**** Delete the file ****)
		(* Initialize file delete structure *)
		strcpy(ADR(tempString),ADR(gRecipeCntl.currRecipe));
		(*strcat(ADR(tempString),ADR('.CSV'));*)

		FileDelete_0(enable:=1, pDevice:=pDevice[gRecipeCntl.driveSelect], pName:=ADR(tempString));

			 					   		  (*01234567890123456789*)
		strcpy(ADR(gRecipeCntl.status),ADR('DELETE FILE'));

		(* Verify status *)
   		IF ((FileDelete_0.status = 0) OR (FileDelete_0.status = fiERR_FILE_NOT_FOUND)) THEN
 			step := INIT_WAIT;
   		ELSE
			IF (FileDelete_0.status <> 65535) THEN
				errorLevel		:= 10;
				errStep 		:= step;
				step 			:= ERROR_STEP;

				IF (FileDelete_0.status = 20799) THEN
					wError := FileIoGetSysError();
				ELSE
					wError := FileDelete_0.status;
				END_IF
			END_IF

		END_IF

	SAVE_RECIPE:
		(*IF(strlen(ADR(gRecipeCntl.newRecipe)) > 0)THEN*)
			(****      Create CSV file     ****)
			(*   Initialize file CSV search   *)

			CSV_Search_0(pStructName:=ADR(pNames), NumOfStructs:=1, pStructMem:=CSV_Init_0.pStructMem, MemLen:=CSV_Init_0.MemCounter,
			Options:=0, FullNameLenght:= CSV_Init_0.FullNameLenght, FileHeader:=1, Separator:= 59, pMaschineNo:=0, pComment:=ADR('Recipe Backup File'), pVersion:=0);

											  (*01234567890123456789*)
			strcpy(ADR(gRecipeCntl.status),ADR('CREATING CSV FILE'));

			(* Verify status *)
	   		IF (CSV_Search_0.status = 0) THEN
	 			step := SAVE_RECIPE + 1;
	   		ELSE
				IF (CSV_Search_0.status <> 65535) THEN
					errorLevel		:= 10;
					errStep 		:= step;
					step 			:= ERROR_STEP;

					IF (CSV_Search_0.status = 20799) THEN
						wError := FileIoGetSysError();
					ELSE
						wError := CSV_Search_0.status;
					END_IF
				END_IF

			END_IF

		(*ELSE
										      (*01234567890123456789*)
			(*strcpy(ADR(gRecipeCntl.status),ADR('NO RECIPE NAME'));
			step := ERROR_STEP;
		END_IF*)

	71:
		(**** Write CSV file            ****)
		(* Initialize file write structrue *)
		strcpy(ADR(tempString),ADR('Recipe'));

		CSV_WriteFile_0(pFileName:=ADR(tempString), pDevice:=pDevice[gRecipeCntl.driveSelect], pStructMem:=CSV_Init_0.pStructMem,
       	MemLen:= CSV_Search_0.FileLen, Mode:= FILE_OW);

		   	 					   	  	  (*01234567890123456789*)
		strcpy(ADR(gRecipeCntl.status),ADR('SAVING TO CSV FILE'));

		IF (CSV_WriteFile_0.status = 0) THEN
			step := INIT_WAIT;
		ELSE
			IF (CSV_WriteFile_0.status <> 65535) THEN
				errorLevel		:= 10;
				errStep 		:= step;
				step 			:= ERROR_STEP;

				IF (CSV_WriteFile_0.status = 20799) THEN
					wError := FileIoGetSysError();
				ELSE
					wError := CSV_WriteFile_0.status;
				END_IF
			END_IF
		END_IF


	LOAD_RECIPE:
		(**** Read CSV file 	      ****)
		(* Initialize Read CSV structrue *)
		strcpy(ADR(tempString),ADR('Recipe'));

		CSV_ReadFile_0(pFileName:=ADR(tempString), pDevice:=pDevice[gRecipeCntl.driveSelect], No_DatatypControl:=0, Separator:=59, Options:=0);

			 					   	      (*01234567890123456789*)
		strcpy(ADR(gRecipeCntl.status),ADR('LOADING DATA FROM CSV FILE'));

		IF (CSV_ReadFile_0.status = 0) THEN
			step := INIT_WAIT;
		ELSE
			IF (CSV_ReadFile_0.status <> 65535) THEN
				errorLevel		:= 20;
				errStep 		:= step;
				step 			:= ERROR_STEP;

				IF (CSV_ReadFile_0.status = 20799) THEN
					wError := FileIoGetSysError();
				ELSE
					wError := CSV_ReadFile_0.status;
				END_IF
			END_IF
		END_IF

	ERROR_STEP:
									   (*01234567890123456789*)
		strcpy(ADR(gRecipeCntl.status),ADR('ERROR NUM-'));
		itoa(wError, ADR(errorString));
		strcat(ADR(gRecipeCntl.status),ADR(errorString));
		step 	:= INIT_WAIT;

END_CASE



IF(gRecipeCntl.driveSelect = 0)THEN
	hmiDevice := 0;
END_IF

END_PROGRAM
