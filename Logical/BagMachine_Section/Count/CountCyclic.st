(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: Count
 * File: CountCyclic.st
 * Author: pkiel
 * Created: October 21, 2009
 ********************************************************************
 * Implementation of program Count
 ********************************************************************)

PROGRAM _CYCLIC

(* Hand Count Setpoints & Limits *)
	gRecipeActive.PackCount:=LIMIT(0,gRecipeActive.PackCount,32767);
	gRecipeActive.HoldCount:=LIMIT(0,gRecipeActive.HoldCount,gRecipeActive.PackCount);
	TriggerCount:=gRecipeActive.PackCount-gRecipeActive.HoldCount;

(* Generate Count Pulse From Master Axis *)
	IF (gA[9].PositionDeg>0 AND gA[9].PositionDeg<90) THEN
		CountPulse := 1;
	END_IF
	IF (gA[9].PositionDeg>180 AND gA[9].PositionDeg<240) THEN
		CountPulse := 0;
	END_IF

(* Product Count *)
	IF(EDGEPOS(CountPulse)) THEN
		CurrentPackCount:=CurrentPackCount+1;
    iCurrentpackCountTilt := iCurrentpackCountTilt + 1 ;   //modif increment compt sac apres s103
    // Master number of revolutions 
    gA[9].uiiNumRev := gA[9].uiiNumRev + 1 ;
    IF gA[9].uiiNumRev < 0 THEN 
      gA[9].uiiNumRev := 0 ;
    END_IF     
		IF (gSP_TubeSelect) THEN
			ProductCount1:=ProductCount1+2;
			ProductCount2:=ProductCount2+2;
			ProductCount3:=ProductCount3+2;
			ProductCount4:=ProductCount4+2;
		ELSE
			ProductCount1:=ProductCount1+1;
			ProductCount2:=ProductCount2+1;
			ProductCount3:=ProductCount3+1;
			ProductCount4:=ProductCount4+1;
		END_IF
	END_IF

(* Count Off/On From HMI *)
	HGW_2StatePB_0.PB := EDGEPOS(Count_PB);
	CountPBText_Ind := HGW_2StatePB_0.Text_Ind;
	CountPBColor_Ind := HGW_2StatePB_0.Color_Ind;
	Count_On := HGW_2StatePB_0.State1;
	HGW_2StatePB_0();

(* Delivery Bag Count Solenoid...Disable Count SOL If HandCount Setpoint = 0*)
	IF (gRecipeActive.PackCount>0 AND Count_On) THEN
		IF (CurrentPackCount>=TriggerCount) THEN
			gQ_SOL_BagCount:=1;
		ELSE
			gQ_SOL_BagCount:=0;
		END_IF
	ELSE
		gQ_SOL_BagCount:=0;
	END_IF

(* Pack Count Evaluation *)
  IF (CurrentPackCount>=gRecipeActive.PackCount) THEN
    CurrentPackCount := 0 ;
    g_bBundPackCountOK := (gRecipeActive.PackCount > 0) ;
		IF (gSP_TubeSelect) THEN
			PackCount:=PackCount+2;
		ELSE
			PackCount:=PackCount+1;
		END_IF
  END_IF
  // Bundler reset bag count requested
  IF g_bBund_ResetCountReq THEN
    CurrentPackCount := 0 ;
    g_bBund_ResetCountReq := 0 ;
  END_IF
  
  //*****************************************D.M. 29092011  BrownPaper_14543  change proram
(*start tilter with counter*)
         iBagCountStartTilt := LIMIT(0,gHMI_Bund_iBagCountStartTilt,40);
         
         stTON_S103_Filtr(IN:=gI_Bund_S103, PT:=tTpS103Filtr) ;
         IF NOT(gI_Bund_S103) THEN
           iCurrentpackCountTilt := 0;
           g_bBund_StartTilt := 0 ;
         END_IF
         
         IF EDGEPOS(iCurrentpackCountTilt>=iBagCountStartTilt)       OR 
            EDGEPOS(stTON_S103_Filtr.Q) AND (iBagCountStartTilt = 0) THEN 
           g_bBund_StartTilt := 1;
         END_IF
         
   //*****************************************End D.M. 29092011  BrownPaper_14543  change proram       





(* Product Count Limits *)
	IF (ProductCount1>=2147483646) THEN
		ProductCount1:=0;
	END_IF
	IF (ProductCount2>=2147483646) THEN
		ProductCount2:=0;
	END_IF
	IF (ProductCount3>=2147483646) THEN
		ProductCount3:=0;
	END_IF
	IF (ProductCount4>=2147483646) THEN
		ProductCount4:=0;
	END_IF

(* HMI Count Display *)

	IF (HMI_CountSelect_PB) THEN
		HMI_CountSelect_Ind:=HMI_CountSelect_Ind+1;
		IF (HMI_CountSelect_Ind>5) THEN
			HMI_CountSelect_Ind:=1;
		END_IF
		HMI_CountSelect_PB:=0;
	END_IF

	CASE (HMI_CountSelect_Ind) OF
		1:
			HMI_ProductCount:=ProductCount1;
			IF (HMI_ProductCountReset_PB) THEN
				ProductCount1:=0;
				HMI_ProductCountReset_PB:=0;
			END_IF
		2:
			HMI_ProductCount:=ProductCount2;
			IF (HMI_ProductCountReset_PB) THEN
				ProductCount2:=0;
				HMI_ProductCountReset_PB:=0;
			END_IF
		3:
				HMI_ProductCount:=ProductCount3;
			IF (HMI_ProductCountReset_PB) THEN
				ProductCount3:=0;
				HMI_ProductCountReset_PB:=0;
			END_IF
		4:
			HMI_ProductCount:=ProductCount4;
			IF (HMI_ProductCountReset_PB) THEN
				ProductCount4:=0;
				HMI_ProductCountReset_PB:=0;
			END_IF
		5:
			HMI_ProductCount:=PackCount;
			IF (HMI_ProductCountReset_PB) THEN
				PackCount:=0;
				HMI_ProductCountReset_PB:=0;
			END_IF
	END_CASE

END_PROGRAM
