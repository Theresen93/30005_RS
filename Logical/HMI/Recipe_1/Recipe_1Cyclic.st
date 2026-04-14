(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: Recipe_1
 * File: Recipe_1Cyclic.st
 * Author: pkiel
 * Created: October 13, 2009
 ********************************************************************
 * Implementation of program Recipe_1
 ********************************************************************)

PROGRAM _CYCLIC

  RecipeDropdown := LIMIT (1,RecipeDropdown,50);
  RecipeSelected := gRecipeBase[RecipeDropdown];
  RecipeViewSelect := RecipeViewSelect;

  (* Recipe Load *)
  IF (RecipeLoad_PB) THEN
    gRecipeActive 				:= RecipeSelected;
    RecipeCurrent_Index 		:= RecipeDropdown;
    RecipeLoad_PB 				:= 0;
    gRecipeChange				:= 1;
    RecipeSavePrompt 			:= 0;
  END_IF

  (* Recipe Save *)
  IF (RecipeSave_PB) THEN
    gRecipeBase[RecipeCurrent_Index] := gRecipeActive;
    RecipeSavePrompt := 0;
    RecipeSave_PB :=0;
  END_IF

  ListBoxControl := ListBoxControl;

  (* Recipe Save As *)
  IF (RecipeSaveAsPopUp_PB) THEN
    RecipeTempName := gRecipeBase[RecipeDropdown].Name;
    RecipeSaveAsPopUp_PB := 0;
  END_IF
  IF (RecipeSaveAs_PB) THEN
    gRecipeBase[RecipeDropdown] := gRecipeActive;
    gRecipeBase[RecipeDropdown].Name := RecipeTempName;
    RecipeTempName:='';
    RecipeSavePrompt := 0;
    RecipeSaveAs_PB :=0;
  END_IF

  (* Recipe Delete *)
  IF (RecipeDelete_PB) THEN
    gRecipeBase[RecipeDropdown].Name 						       := 'BLANK RECIPE';
    gRecipeBase[RecipeDropdown].Repeat 						     := 0.0 ;
      gRecipeBase[RecipeDropdown].Drum_Offset			 		   := 0.0 ;
      gRecipeBase[RecipeDropdown].Entry_Draw					   := 0.0 ;
      gRecipeBase[RecipeDropdown].Exit_Draw					     := 0.0 ;
      gRecipeBase[RecipeDropdown].HoldCount					     := 0 ;
      gRecipeBase[RecipeDropdown].PackCount					     := 0 ;
      gRecipeBase[RecipeDropdown].Holding_Offset				 := 0.0 ;
      gRecipeBase[RecipeDropdown].Perf_Offset            := 0.0 ;
      gRecipeBase[RecipeDropdown].Tearing_Offset				 := 0.0 ;
      gRecipeBase[RecipeDropdown].rPerf_PhasMasterDeg    := 0.0 ;
      gRecipeBase[RecipeDropdown].rHolding_PhasMasterDeg := 0.0 ;
      gRecipeBase[RecipeDropdown].rTearing_PhasMasterDeg := 0.0 ;
      gRecipeBase[RecipeDropdown].rDrum_PhasMasterDeg    := 0.0 ;
      gRecipeBase[RecipeDropdown].bSelColdMicroPerfProd  := 0 ; 
      gRecipeBase[RecipeDropdown].rCMPerf_PhasMasterDeg  := 0.0 ;
      gRecipeBase[RecipeDropdown].rCMPerf_Draw           := 0.0 ;
      gRecipeBase[RecipeDropdown].bCMPerf_Mode           := 0 ;
      gRecipeBase[RecipeDropdown].rHMPerf_PhasMasterDeg  := 0.0 ;
      gRecipeBase[RecipeDropdown].bHMPerf_Mode           := 0 ;
      gRecipeBase[RecipeDropdown].iHMPerf_Up             := 0 ;
      gRecipeBase[RecipeDropdown].rHotMicroPerfSize_in   := 0.0 ;
      gRecipeBase[RecipeDropdown].rTearEB_PhasMasterDeg  := 0.0 ;
      gRecipeBase[RecipeDropdown].bSelEnvBProd           := 0 ; 
      gRecipeBase[RecipeDropdown].rEnvB_Offset           := 0.0 ;
      gRecipeBase[RecipeDropdown].rTearEB_Offset         := 0.0 ;
      gRecipeBase[RecipeDropdown].rEnvB_PerfSize_in      := 0.0 ;
      gRecipeBase[RecipeDropdown].rSlopeExitTable        := 0.0 ; 
      gRecipeBase[RecipeDropdown].bSelTypeRSGlue         := 0 ;
      gRecipeBase[RecipeDropdown].bSelTypeOtherRSGlue    := 0 ;
      gRecipeBase[RecipeDropdown].bSelFPProd             := 0 ; 
      gRecipeBase[RecipeDropdown].bSelHeaterProd         := 0 ; 
      gRecipeBase[RecipeDropdown].rHeatSPDegF            := 0.0 ;
      gRecipeBase[RecipeDropdown].iNumToothGearPrint     := 0 ;
      gRecipeBase[RecipeDropdown].iPrintUp               := 0 ;
      RecipeDelete_PB :=0;
      END_IF

      (* Recipe Check: Is Current Recipe Changed From The Recipe That was Loaded? *)
      (*IF (RecipeCurrent.Name<>gRecipeBase[RecipeCurrent_Index].Name) THEN
      RecipeSavePrompt := 1;
      END_IF*)
      IF (gRecipeActive.Repeat <> gRecipeBase[RecipeCurrent_Index].Repeat) THEN
        RecipeSavePrompt := 1;
      END_IF
      IF (gRecipeActive.Drum_Offset <> gRecipeBase[RecipeCurrent_Index].Drum_Offset) THEN
        RecipeSavePrompt := 1;
      END_IF
      IF (gRecipeActive.Entry_Draw <> gRecipeBase[RecipeCurrent_Index].Entry_Draw) THEN
        RecipeSavePrompt := 1;
      END_IF
      IF (gRecipeActive.Exit_Draw <> gRecipeBase[RecipeCurrent_Index].Exit_Draw) THEN
        RecipeSavePrompt := 1;
      END_IF
      IF (gRecipeActive.HoldCount <> gRecipeBase[RecipeCurrent_Index].HoldCount) THEN
        RecipeSavePrompt := 1;
      END_IF
      IF (gRecipeActive.PackCount <> gRecipeBase[RecipeCurrent_Index].PackCount) THEN
        RecipeSavePrompt := 1;
      END_IF
      IF (gRecipeActive.Holding_Offset <> gRecipeBase[RecipeCurrent_Index].Holding_Offset) THEN
        RecipeSavePrompt := 1;
      END_IF
      IF (gRecipeActive.Perf_Offset <> gRecipeBase[RecipeCurrent_Index].Perf_Offset) THEN
        RecipeSavePrompt := 1;
      END_IF
      IF (gRecipeActive.Tearing_Offset <> gRecipeBase[RecipeCurrent_Index].Tearing_Offset) THEN
        RecipeSavePrompt := 1;
      END_IF
      IF (gRecipeActive.rPerf_PhasMasterDeg <> gRecipeBase[RecipeCurrent_Index].rPerf_PhasMasterDeg) THEN
        RecipeSavePrompt := 1;
      END_IF
      IF (gRecipeActive.rHolding_PhasMasterDeg <> gRecipeBase[RecipeCurrent_Index].rHolding_PhasMasterDeg) THEN
        RecipeSavePrompt := 1;
      END_IF
      IF (gRecipeActive.rTearing_PhasMasterDeg <> gRecipeBase[RecipeCurrent_Index].rTearing_PhasMasterDeg) THEN
        RecipeSavePrompt := 1;
      END_IF
      IF (gRecipeActive.rDrum_PhasMasterDeg <> gRecipeBase[RecipeCurrent_Index].rDrum_PhasMasterDeg) THEN
        RecipeSavePrompt := 1;
      END_IF
      IF (gRecipeActive.rCMPerf_OffsetIn <> gRecipeBase[RecipeCurrent_Index].rCMPerf_OffsetIn) THEN
        RecipeSavePrompt := 1;
      END_IF
      IF (gRecipeActive.rCMPerf_PhasMasterDeg <> gRecipeBase[RecipeCurrent_Index].rCMPerf_PhasMasterDeg) THEN
        RecipeSavePrompt := 1;
      END_IF
      IF (gRecipeActive.rHMPerf_OffsetIn <> gRecipeBase[RecipeCurrent_Index].rHMPerf_OffsetIn) THEN
        RecipeSavePrompt := 1;
      END_IF
      IF (gRecipeActive.rHMPerf_PhasMasterDeg <> gRecipeBase[RecipeCurrent_Index].rHMPerf_PhasMasterDeg) THEN
        RecipeSavePrompt := 1;
      END_IF
      IF (gRecipeActive.rCMPerf_Draw <> gRecipeBase[RecipeCurrent_Index].rCMPerf_Draw) THEN
        RecipeSavePrompt := 1;
      END_IF
      IF (gRecipeActive.rHotMicroPerfSize_in <> gRecipeBase[RecipeCurrent_Index].rHotMicroPerfSize_in) THEN
        RecipeSavePrompt := 1;
      END_IF
      IF (gRecipeActive.bSelFPProd <> gRecipeBase[RecipeCurrent_Index].bSelFPProd) THEN
        RecipeSavePrompt := 1;
      END_IF
      IF (gRecipeActive.bSelHeaterProd <> gRecipeBase[RecipeCurrent_Index].bSelHeaterProd) THEN
        RecipeSavePrompt := 1;
      END_IF
      IF (gRecipeActive.rHeatSPDegF <> gRecipeBase[RecipeCurrent_Index].rHeatSPDegF) THEN
        RecipeSavePrompt := 1 ;
      END_IF
      IF (gRecipeActive.bSelColdMicroPerfProd <> gRecipeBase[RecipeCurrent_Index].bSelColdMicroPerfProd) THEN
        RecipeSavePrompt := 1;
      END_IF
      IF (gRecipeActive.rSlopeExitTable <> gRecipeBase[RecipeCurrent_Index].rSlopeExitTable) THEN
        RecipeSavePrompt := 1;
      END_IF
      IF (gRecipeActive.bSelTypeRSGlue <> gRecipeBase[RecipeCurrent_Index].bSelTypeRSGlue) THEN
        RecipeSavePrompt := 1;
      END_IF
      IF (gRecipeActive.iNumToothGearPrint <> gRecipeBase[RecipeCurrent_Index].iNumToothGearPrint) THEN
        RecipeSavePrompt := 1;
      END_IF
      IF (gRecipeActive.iPrintUp <> gRecipeBase[RecipeCurrent_Index].iPrintUp) THEN
        RecipeSavePrompt := 1;
      END_IF
      IF (gRecipeActive.rEnvB_PhasMasterDeg <> gRecipeBase[RecipeCurrent_Index].rEnvB_PhasMasterDeg) THEN
        RecipeSavePrompt := 1;
      END_IF
      IF (gRecipeActive.rTearEB_PhasMasterDeg <> gRecipeBase[RecipeCurrent_Index].rTearEB_PhasMasterDeg) THEN
        RecipeSavePrompt := 1;
      END_IF
      IF (gRecipeActive.rEnvB_Offset <> gRecipeBase[RecipeCurrent_Index].rEnvB_Offset) THEN
        RecipeSavePrompt := 1;
      END_IF
      IF (gRecipeActive.rTearEB_Offset <> gRecipeBase[RecipeCurrent_Index].rTearEB_Offset) THEN
        RecipeSavePrompt := 1;
      END_IF
      IF (gRecipeActive.rEnvB_PerfSize_in <> gRecipeBase[RecipeCurrent_Index].rEnvB_PerfSize_in) THEN
        RecipeSavePrompt := 1;
      END_IF
      IF (gRecipeActive.rHMPerf_PhasMasterDeg <> gRecipeBase[RecipeCurrent_Index].rHMPerf_PhasMasterDeg) THEN
        RecipeSavePrompt := 1;
      END_IF
      IF (gRecipeActive.bCMPerf_Mode <> gRecipeBase[RecipeCurrent_Index].bCMPerf_Mode) THEN
        RecipeSavePrompt := 1;
      END_IF
      IF (gRecipeActive.bHMPerf_Mode <> gRecipeBase[RecipeCurrent_Index].bHMPerf_Mode) THEN
        RecipeSavePrompt := 1;
      END_IF
      IF (gRecipeActive.iHMPerf_Up <> gRecipeBase[RecipeCurrent_Index].iHMPerf_Up) THEN
        RecipeSavePrompt := 1;
      END_IF
      IF (gRecipeActive.bSelEnvBProd <> gRecipeBase[RecipeCurrent_Index].bSelEnvBProd) THEN
        RecipeSavePrompt := 1;
      END_IF
      IF (gRecipeActive.bSelTypeOtherRSGlue <> gRecipeBase[RecipeCurrent_Index].bSelTypeOtherRSGlue) THEN
        RecipeSavePrompt := 1;
      END_IF

      IF (RecipeSavePrompt) THEN
        RecipeSavePromptText_Ind := 1;
        RecipeSavePromptColor_Ind := gRed+(256*gBlack);
      ELSE
        RecipeSavePromptText_Ind := 0;
        RecipeSavePromptColor_Ind := 34+(256*gBlack);
      END_IF


 
      IF g_bSplashDone THEN 
        // Detect Number pliers on Drum Change 
        rRepeatMetric := gRecipeActive.Repeat*25.4;
          rRepeatMetric_Old := Repeat_Old*25.4;
      
          (* Detect Repeat Change *)
          IF ((gRecipeActive.Repeat<>Repeat_Old)OR (gRecipeChange)) THEN
            gRepeatChange:=1;
            gRecipeChange:=0;
            Repeat_Old := gRecipeActive.Repeat;
              END_IF
              // Number of pliers on Drum calc
              IF (rRepeatMetric > gr_rBagSize4_2Pliers_mm) OR 
                gRecipeActive.bSelEnvBProd                THEN  
                g_rNumbPliers := 2.0 ;
              ELSE 
                g_rNumbPliers := 4.0 ;
              END_IF ;
              // Detect number of pliers change on Drum 
              IF (g_rNumbPliers <> rNumbPliers_Old) THEN 
                g_bNumPliersChange := 1 ; 
                rNumbPliers_Old := g_rNumbPliers;
                // Detect change from 4 to 2 pliers on Drum
                IF (rRepeatMetric > gr_rBagSize4_2Pliers_mm)      AND 
                  (rRepeatMetric_Old <= gr_rBagSize4_2Pliers_mm) THEN 
                  g_bNumPliersChange4to2[1] := 1 ;
                  g_bNumPliersChange4to2[2] := 1 ;
                ELSE
                  // Detect change from 2 to 4 pliers on Drum
                  g_bNumPliersChange2to4[1] := 1 ;
                END_IF
              END_IF
              IF g_bNumPliersChange4to2[1] OR 
                g_bNumPliersChange2to4[1] THEN 
                // Change Modulo on Tearing and Drum
                g_bChangeModTearingReq := 1 ;
                g_bChangeModDrumReq    := 1 ;
                g_bChangeModTearEBReq  := 1 ;
              END_IF
          
              // Drum picture animation 
              IF g_iMachType <> C_iRS15 THEN         
                iAnimDrum := REAL_TO_INT(g_rNumbPliers) ;             
              ELSE
                iAnimDrum := 5 ;
              END_IF    
              
              // Number of maintaining case RS15       
              IF (rRepeatMetric>=gr_rBagSize2_4Hold_mm) THEN
                iAnimHoldTearRS15 := 2 ;  
              ELSE
                iAnimHoldTearRS15 := 4 ;
              END_IF        
              
              TON_0( IN:=gRepeatChange, PT:=T#1s );
              IF (TON_0.Q) THEN
                gRepeatChange      := 0 ;
                g_bNumPliersChange := 0 ; 
              END_IF
              // Display screen config HoldTearDrum
              gHMI_GoToHoldTearDrum_PB := EDGEPOS(g_bNumPliersChange) OR EDGEPOS(bAnimHoldTearEnvBChange) OR EDGEPOS(bAnimHoldTearRS15Change) ;
              // Indicator Tearing on the first station
              gr_rIndEnvB2AxTear1 := 0 ;
      
              IF gA[13].bInMach THEN  // Case Envelope Bag 2 Axis
                rHoldPerimeter_mm := gr_rBagSize2_4Hold_mm*2.0 ;
                IF gRecipeActive.bSelEnvBProd THEN 
                  IF (rRepeatMetric<=rHoldPerimeter_mm) THEN 
                    iAnimHoldTearEnvB := 4 ;
                  ELSE
                    iAnimHoldTearEnvB := 5 ; 
                  END_IF
                  rSP_PosRefEnvB := gr_rPosEnvBHoldBag ;
                ELSE
                  IF (g_rNumbPliers=4) THEN 
                    iAnimHoldTearEnvB := 1 ;
                  ELSIF (g_rNumbPliers=2)                       AND 
                    (rRepeatMetric<=gr_rEnvBSizeTear2_1_mm) THEN
                    gr_rIndEnvB2AxTear1 := 0 ; // Indicator Tearing on the first station
                    iAnimHoldTearEnvB := 2 ;
                  ELSE
                    gr_rIndEnvB2AxTear1 := 1 ; // Indicator Tearing on the first station
                    iAnimHoldTearEnvB := 3 ;  
                  END_IF
                  rTempPosRefEnvB := gr_rPosEnvBHoldBag + 45.0 ;
                  rSP_PosRefEnvB := H_FC_Modulus (
                    IN_rMod := 360.0 ,
                    IN_rVar := rTempPosRefEnvB
                    ) ;
                END_IF   
              END_IF
              g_EnvB_iHoldTearEnvBCase := iAnimHoldTearEnvB ; 
              bAnimHoldTearEnvBChange := (iAnimHoldTearEnvB_Old<>iAnimHoldTearEnvB) ; 
              bAnimHoldTearRS15Change := (iAnimHoldTearRS15_Old<>iAnimHoldTearRS15) ;
              iAnimHoldTearEnvB_Old := iAnimHoldTearEnvB ;
              iAnimHoldTearRS15_Old := iAnimHoldTearRS15 ;
              HMI_rSPPosRefEnvB := rSP_PosRefEnvB ;   
              END_IF
              
              END_PROGRAM
