(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: BackUp
 * File: BackUpCyclic.st
 * Author: pkiel
 * Created: December 11, 2009
 ********************************************************************
 * Implementation of program BackUp
 ********************************************************************)

PROGRAM _CYCLIC
	
	TON_0(IN := SystemBackUp_PB, PT := T#5s); 	(* Trigger File Write *)
	TON_1(IN := SystemRestore_PB, PT := T#5s); 	(* Trigger File Read *)
	TON_2(IN := NOT(bOK), PT := T#5s); 			(* Error Timer *)
	TON_3(IN := OpComplete, PT := T#5s); 		(* Operation Complete Timer *)
	TON_4(IN := FileNotFound, PT := T#5s); 		(* File Not Found Timer *)

	CASE byStep OF
        
			0: (**** Loop For Command Selection ****)
                
					IF (EDGEPOS(TON_0.Q)) THEN
						cmdSystemBackUp := 1;
						byStep := 1;
					ELSIF (EDGEPOS(TON_1.Q)) THEN
	                	cmdSystemRestore := 1;
						byStep := 1;
					END_IF
				
			1: (**** Try to open existing file ****)
	                (* Initialize file open structrue *)
	                FOpen.enable    := 1;
	                FOpen.pDevice   := ADR(strDevice);
	                FOpen.pFile     := ADR(strFile);
	                FOpen.mode      := FILE_RW;  (* Read and write access *)

	                (* Call FBK *)
	                FOpen();

	                (* Get FBK output information *)
	                dwIdent := FOpen.ident;
	                wStatus := FOpen.status;

	                (* Verify status (20708 -> File doesn't exist) *)
	                IF (wStatus = 20708) THEN
	                        IF cmdSystemBackUp THEN
									byStep := 2;
							ELSIF cmdSystemRestore THEN
	                        		byStep := 11;
							END_IF
	                ELSE
	                        IF (wStatus = 0) THEN
	                            IF cmdSystemBackUp THEN
									byStep := 3;
								ELSIF cmdSystemRestore THEN
	                        		byStep := 4;
								END_IF
	                        ELSE
	                                IF (wStatus <> 65535) THEN
	                                        byErrorLevel := 1;
	                                        byStep := 10;

	                                        IF (wStatus = 20799) THEN
	                                                wError := FileIoGetSysError();
	                                        END_IF
	                                END_IF
	                        END_IF
	                END_IF

	        2: (**** Create file ****)
	                (* Initialize file create structure *)
	                FCreate.enable  := 1;
	                FCreate.pDevice := ADR(strDevice);
	                FCreate.pFile   := ADR(strFile);

	                (* Call FBK *)
	                FCreate();

	                (* Get FBK output information *)
	                dwIdent := FCreate.ident;
	                wStatus := FCreate.status;

	                (* Verify status *)
	                IF (wStatus = 0) THEN
							byStep := 3;
	                ELSE
	                        IF (wStatus <> 65535) THEN
	                                byErrorLevel := 2;
	                                byStep := 10;

	                                IF (wStatus = 20799) THEN
	                                        wError := FileIoGetSysError();
	                                END_IF
	                        END_IF
	                END_IF

	        3: (**** Write data to file ****)
	                (* Load Data Into System Structure *)
					SystemData.gSP_A	 				        := gSP_A;
					SystemData.gReg 					        := gReg;
					SystemData.gPassword 				      := gPassword;
					SystemData.gMachineTime				    := gMachineTime;
					SystemData.gSP_CmdSpeed				    := gSP_CmdSpeed;
					SystemData.gSP_ColdGlue				    := gSP_ColdGlue;
					SystemData.gSP_HotGlue				    := gSP_HotGlue;
					SystemData.gSP_GlueTrayAutoSpeed	:= gSP_GlueTrayAutoSpeed;
					SystemData.gSP_PerfCylSelect		  := gSP_PerfCylSelect;
					SystemData.gSP_PerfKnifeCount		  := gSP_PerfKnifeCount;
					SystemData.gSP_TubeSelect		  	  := gSP_TubeSelect;
					
					(* Write System Structure To File *)
	                FWrite.enable   := 1;
	                FWrite.ident    := dwIdent;
	                FWrite.offset   := 0;
	                FWrite.pSrc     := ADR(SystemData);
	                FWrite.len      := SIZEOF(SystemData);

	                (* Call FBK *)
	                FWrite();

	                (* Get status *)
	                wStatus := FWrite.status;

	                (* Verify status *)
	                IF (wStatus = 0) THEN
	                        byStep := 5;
	                ELSE
	                        IF (wStatus <> 65535) THEN
	                                byErrorLevel := 3;
	                                byStep := 10;

	                                IF (wStatus = 20799) THEN
	                                        wError := FileIoGetSysError();
	                                END_IF
	                        END_IF
	                END_IF

	        4: (**** Read data from file ****)
	                (* Initialize file read structure *)
	                FRead.enable    := 1;
	                FRead.ident     := dwIdent;
	                FRead.offset    := 0;
	                FRead.pDest     := ADR(SystemData);
	                FRead.len       := SIZEOF(SystemData);

	                (* Call FBK *)
	                FRead();

	                (* Get status *)
	                wStatus := FRead.status;

	                (* Verify status *)
	                IF (wStatus = 0) THEN
						gSP_A 						    := SystemData.gSP_A;
						gReg 					      	:= SystemData.gReg;
						gPassword 					  := SystemData.gPassword;
						gMachineTime				  := SystemData.gMachineTime;
						gSP_CmdSpeed				  := SystemData.gSP_CmdSpeed;
						gSP_ColdGlue	 			  := SystemData.gSP_ColdGlue;
						gSP_HotGlue					  := SystemData.gSP_HotGlue;
						gSP_GlueTrayAutoSpeed	:= SystemData.gSP_GlueTrayAutoSpeed;
						gSP_PerfCylSelect			:= SystemData.gSP_PerfCylSelect;
						gSP_PerfKnifeCount		:= SystemData.gSP_PerfKnifeCount;
						gSP_TubeSelect				:= SystemData.gSP_TubeSelect;
						
						byStep := 5;
	                ELSE
	                    IF (wStatus <> 65535) THEN
	                 	   byErrorLevel := 4;
	                       byStep := 10;

	                       IF (wStatus = 20799) THEN
	                    	   wError := FileIoGetSysError();
	                       END_IF
	                	END_IF
	                END_IF

	        5: (**** Close file ****)
	                (* Initialize file close structure *)
	                FClose.enable   := 1;
	                FClose.ident    := dwIdent;

	                (* Call FBK *)
	                FClose();

	                (* Get status *)
	                wStatus := FClose.status;

	                (* Verify status *)
	                IF (wStatus = 0) THEN
							cmdSystemBackUp := 0;
							cmdSystemRestore := 0;
	                        OpComplete := 1;
							byStep := 6;
	                ELSE
	                        IF (wStatus <> 65535) THEN
	                                byErrorLevel := 5;
	                                byStep := 10;

	                                IF (wStatus = 20799) THEN
	                                        wError := FileIoGetSysError();
	                                END_IF
	                        END_IF
	                END_IF

	        6: (**** Operation Complete ****)
                
	                IF (TON_3.Q) THEN
						OpComplete := 0;
						byStep := 0;
					END_IF
				
			10: (**** Error step ****)
	                bOK := FALSE;
					cmdSystemBackUp := 0;
					cmdSystemRestore := 0;
					IF (TON_2.Q) THEN
						bOK := 1;
						byStep := 0;
					END_IF
		
			11: (**** File Not Found ****)
	                bOK := FALSE;
					FileNotFound := 1;
					cmdSystemBackUp := 0;
					cmdSystemRestore := 0;
	                IF (TON_4.Q) THEN
						FileNotFound := 0;
						bOK := TRUE;
						byStep := 0;
					END_IF
				
	END_CASE

END_PROGRAM
