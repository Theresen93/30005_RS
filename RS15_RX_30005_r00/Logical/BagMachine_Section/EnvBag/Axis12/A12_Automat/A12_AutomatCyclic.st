(********************************************************************
 * COPYRIGHT -- Microsoft
 ********************************************************************
 * Program: A12_Automat
 * File: A12_AutomatCyclic.st
 * Author: dominique
 * Created: November 21, 2011
 ********************************************************************
 * Implementation of program A12_Automat
 ********************************************************************)

PROGRAM _CYCLIC

    // Synchro ratio Master/Slave 
    iIndex := MC_BR_AutControl_0.ActualStateIndex ; 
    IF gRecipeActive.bSelEnvBProd THEN       
      CASE iIndex OF 
        3 : // Master = Tearing   
           //gA[12].rRSynNum := 1.0 ;         D.M. 03/02/2012 Pyrollpack_14661 Suppress cause is not correct for offset Virtual Masrter / Slave calculation in A4_Basic and not used in setting mode Automat state 3   
           //gA[12].rRSynDen := 2.0 ;
      ELSE  // Master = Virtual
           //gA[12].rRSynNum := 1.0 ;
           //gA[12].rRSynDen := 1.0 ;
      END_CASE 
      // Master = Virtual
      gA[12].rRSynNum := 1.0 ;
      gA[12].rRSynDen := 1.0 ;
    ELSE 
      CASE iIndex OF 
        3 : // Master = Tearing   
           //gA[12].rRSynNum := 1.0 ;
           //gA[12].rRSynDen := 4.0 ;
      ELSE  // Master = Virtual
           IF (g_rNumbPliers <> 0.0) THEN 
             gA[12].rRSynDen := g_rNumbPliers ;
           ELSE
             gA[12].rRSynDen := 4.0 ;
           END_IF   
           gA[12].rRSynNum := 1.0 ;        
      END_CASE 
    END_IF   
    
    
(**** STRAIGHT GEARED CAM AUTOMAT WITH ABSOLUTE PHASE SYNCHRONIZATION FOR ENVELOPE BAG AXIS ***)

(* Set Up Master Position Parameter ID *)
  
  // Holding+Tearing+EnvBag+TearEB+Drum timing setting  
  IF gstCycA[3].CycManTimSet.CmdSynchroOn OR   
     gstCycA[4].CycManTimSet.CmdSynchroOn THEN  
    MC_BR_AutControl_0.Signal1 := 1 ; 
    MC_BR_AutControl_0.Signal2 := 0 ; 
  ELSE
    MC_BR_AutControl_0.Signal1 := 0 ; 
    MC_BR_AutControl_0.Signal2 := 1 ; 
  END_IF
  
  // A12 Synchro OK indicator 
  gstCycA[3].CycManTimSet.bSynchroOkSlavA[12] := ( MC_BR_InitMasterParIDTransfer_1.Master = gA[4].Ident )                                AND 
                                                 ( MC_BR_InitMasterParIDTransfer_1.MasterParID = gstCycA[4].CycManTimSet.uiMasterParID ) AND 
                                                 ( MC_BR_AutControl_0.ActualStateIndex = 3 )                                             AND 
                                                 gA[12].Ind_SynchronizedMotion AND ParID_Ready ;                                                   
  
  // A12 Synchro OK indicator 
  gstCycA[4].CycManTimSet.bSynchroOkSlavA[12] := ( MC_BR_InitMasterParIDTransfer_1.Master = gA[4].Ident )                                AND 
                                                 ( MC_BR_InitMasterParIDTransfer_1.MasterParID = gstCycA[4].CycManTimSet.uiMasterParID ) AND 
                                                 ( MC_BR_AutControl_0.ActualStateIndex = 3 )                                             AND 
                                                 gA[12].Ind_SynchronizedMotion AND ParID_Ready ;                                                   
                                                    
                                                                                                      
                                                                                                    
  // EnvBag+TearEB+Drum timing setting  
  IF gstCycA[12].CycManTimSet.bCyc THEN 
    IF (gstCycA[12].CycManTimSet.CmdSynchroOn) THEN  
      MC_BR_AutControl_0.Signal1 := 0 ; 
      MC_BR_AutControl_0.Signal2 := 0 ; 
      MC_BR_AutControl_0.Signal3 := 1 ; 
    ELSE
      MC_BR_AutControl_0.Signal1 := 0 ; 
      MC_BR_AutControl_0.Signal2 := 0 ;
      MC_BR_AutControl_0.Signal3 := 0 ;
    END_IF
  END_IF
  
  // A12 Synchro OK indicator
  gstCycA[12].CycManTimSet.bSynchroOkSlavA[12] := ( MC_BR_AutControl_0.ActualStateIndex = 2 )   AND  
                                                  gA[12].Ind_SynchronizedMotion AND ParID_Ready ;   
  
     
  IF gstCycA[3].CycManTimSet.bFCyc  AND 
     gstCycA[4].CycManTimSet.bFCyc  AND 
     gstCycA[12].CycManTimSet.bFCyc THEN 
    MC_BR_AutControl_0.Signal1 := 0 ; 
    MC_BR_AutControl_0.Signal2 := 0 ; 
    MC_BR_AutControl_0.Signal3 := 0 ; 
  END_IF
  
  
  // Slave Period   
  IF gRecipeActive.bSelEnvBProd THEN
    rSlave_TimingAxisPeriod := gA[12].AxisPeriod / 2.0 ; // Tearing Axis is Master  
    rSlave_AxisPeriod       := gA[12].AxisPeriod ;       // Virtual Master Axis is Master 
  ELSE  
    rSlave_TimingAxisPeriod := gA[12].AxisPeriod / 4.0 ; // Tearing Axis is Master
    rSlave_AxisPeriod       := gA[12].AxisPeriod / g_rNumbPliers ; // Virtual Master Axis is Master
  END_IF
  
  
  //Synch_Request := gA[12].Cmd_SynchronizedMotion ;
  Synch_Request := gA[12].Cmd_SynchronizedMotion AND NOT(MC_BR_AutControl_0.Stop) ;  // D.M. 26/01/2012 RS26 Pyrollpack_14661 added because it happened that Stop=1 and Synch_Request=1 => MC_BR_AutControl_0 makes fault 29256    
	IF (Synch_Request AND NOT ParID_Ready) THEN
    MC_BR_InitMasterParIDTransfer_0.Master:= gA[9].Ident ;  
    MC_BR_InitMasterParIDTransfer_0.Slave:=gA[12].Ident;
    MC_BR_InitMasterParIDTransfer_0.MasterParID:= 412 ; // ParID 412 = VAX Position (in case virtual axis)
    MC_BR_InitMasterParIDTransfer_0.SlaveChannel:=0;
    MC_BR_InitMasterParIDTransfer_0.Execute:= 1 ;
    IF (MC_BR_InitMasterParIDTransfer_0.Done) THEN
      MasterParID:=MC_BR_InitMasterParIDTransfer_0.ReceiveParID;
      MC_BR_InitMasterParIDTransfer_0.Execute:=FALSE;
      ParID_Ready1:=1;
    ELSIF (MC_BR_InitMasterParIDTransfer_0.Error) THEN
    (*Store ErrorID in a variable,
      ErrorID is reset on falling edge of 'Execute'*)
      ErrorID:=MC_BR_InitMasterParIDTransfer_0.ErrorID;
      ParID_Ready1:=0;
      MC_BR_InitMasterParIDTransfer_0.Execute:=FALSE;
    END_IF
    MC_BR_InitMasterParIDTransfer_1.Master       := gA[4].Ident ;  
    MC_BR_InitMasterParIDTransfer_1.Slave        := gA[12].Ident;
    MC_BR_InitMasterParIDTransfer_1.MasterParID  := gstCycA[12].CycManTimSet.uiMasterParID ;  
    MC_BR_InitMasterParIDTransfer_1.SlaveChannel := 2 ;
    MC_BR_InitMasterParIDTransfer_1.Execute      := 1 ;
    IF (MC_BR_InitMasterParIDTransfer_1.Done) AND ParID_Ready1 THEN
      uiMasterParID1:=MC_BR_InitMasterParIDTransfer_1.ReceiveParID;
      MC_BR_InitMasterParIDTransfer_1.Execute:=FALSE;
      ParID_Ready:=1;
    ELSIF (MC_BR_InitMasterParIDTransfer_1.Error) THEN
    (*Store ErrorID in a variable,
      ErrorID is reset on falling edge of 'Execute'*)
      ErrorID:=MC_BR_InitMasterParIDTransfer_1.ErrorID;
      ParID_Ready:=0;
      MC_BR_InitMasterParIDTransfer_1.Execute:=FALSE;
    END_IF
	END_IF
  MC_BR_InitMasterParIDTransfer_0();
  MC_BR_InitMasterParIDTransfer_1();

(**** Initialize Automat Parameters Upon Automat Start Request ****)
	IF (EDGEPOS(ParID_Ready))THEN      
     
		//*** Calculate Slave Start Offset ****
			MasterOffset := gRecipeActive.Tearing_Offset+gRecipeActive.Holding_Offset;
			PositionOffset:= REAL_TO_DINT((gA[9].PositionInch-(gA[12].PositionInch-MasterOffset))*1000);
			PositionMOD:= REAL_TO_DINT(gRecipeActive.Repeat*1000);
			SlaveStartOffset:= (DINT_TO_REAL(PositionOffset MOD PositionMOD))/1000;
			IF (SlaveStartOffset >= (0.5*gRecipeActive.Repeat)) THEN
				SlaveStartOffset := SlaveStartOffset - gRecipeActive.Repeat;
			END_IF
			IF (SlaveStartOffset < (-0.5*gRecipeActive.Repeat)) THEN
				SlaveStartOffset := SlaveStartOffset + gRecipeActive.Repeat;
			END_IF
      
      IF gRecipeActive.bSelEnvBProd AND
         gr_rIndEnvB2AxTear1        AND 
         1                          THEN     
        // Mecanic ratio between EnvB Axis and Lower roller of Envelope Bag Station = 45/30 = 3/2
        // Lower Roller Envelope Bag Station performs 2 revolutions per bag to come back on the same position for each bag and run faster than tearing belts carriage to not obstruct the bag way
        rSlave_AxisPeriod := 2 * 2/3 * gA[12].AxisPeriod ;    
      ELSE
        rSlave_AxisPeriod := gA[12].AxisPeriod * gA[12].rRSynNum/gA[12].rRSynDen ;
      END_IF
      rOffsetDeg := gRecipeActive.rEnvB_PhasMasterDeg ;
      
      rSPMaPos := (gA[12].PositionDeg - rOffsetDeg)/(gA[12].rRSynNum/gA[12].rRSynDen) ;
      rTemp_[1] := gA[12].PositionDeg ;
      rTemp_[0] := rSPMaPos - gA[9].PositionDeg ;
      rMaCompDist := H_FC_Modulus (
                          //IN_rMod := (360 * gA[12].rRSynNum/gA[12].rRSynDen) ,
                          IN_rMod := 360 ,
                          IN_rVar := rTemp_[0]
                                  ) ; 

		(*general automat parameter*)
			//AutData.Master				    := gA[3].Ident;
			AutData.MasterParID			  := MasterParID;
			AutData.StartPosition		  := 0;
			AutData.StartInterval		  := gA[9].AxisPeriod;
			AutData.MaxMasterVelocity	:= gr_rMachMaxSpeed_BPM ;

		//Automat STATE 0 Basis State
			AutData.State[0].Event[0].Type		  := ncST_END;
			AutData.State[0].Event[0].Attribute	:= ncAT_ONCE;
      IF (rMaCompDist >= 1/gA[9].UnitsPerDeg) AND // rMaCompDist must be >= 1 Units
         gA[12].bSynchroReq                   THEN 
		  	AutData.State[0].Event[0].NextState	:= 1;
      ELSE
        rMaCompDist := 1/gA[9].UnitsPerDeg ;
        AutData.State[0].Event[0].NextState := 2;
      END_IF 

         
    //Automat STATE 1 Master/Slave Absolute Phase Correction
      AutData.State[1].MasterParID        := MasterParID;
      AutData.State[1].CamProfileIndex    := 16#FFFF;
      AutData.State[1].MasterFactor       := REAL_TO_UDINT(rMaCompDist * gA[12].UnitsPerDeg) ; 
      AutData.State[1].SlaveFactor        := 0 ;  
      AutData.State[1].CompMode           := ncOFF;

      AutData.State[1].Event[0].Type      := ncST_END ;
      AutData.State[1].Event[0].Attribute := ncST_END ;
      AutData.State[1].Event[0].NextState := 2 ;

      AutData.State[1].Event[1].Type      := ncSIGNAL1 ;
      AutData.State[1].Event[1].Attribute := ncAT_ONCE ;
      AutData.State[1].Event[1].NextState := 3 ;  

      AutData.State[1].Event[2].Type      := ncSIGNAL3 ;
      AutData.State[1].Event[2].Attribute := ncAT_ONCE ;
      AutData.State[1].Event[2].NextState := 2 ;        
       
    //Automat STATE 2 Master/Slave run
      AutData.State[2].MasterParID     := MasterParID;
      AutData.State[2].CamProfileIndex := 16#FFFF;
      AutData.State[2].MasterFactor    := REAL_TO_UDINT(gA[9].AxisPeriod); 
      AutData.State[2].SlaveFactor     := REAL_TO_UDINT(rSlave_AxisPeriod); 
      AutData.State[2].CompMode        := ncOFF;

      AutData.State[2].Event[0].Type      := ncST_END ;
      AutData.State[2].Event[0].Attribute := ncST_END;
      AutData.State[2].Event[0].NextState := 2;

      AutData.State[2].Event[1].Type      := ncST_END+ncNEGATIVE ;
      AutData.State[2].Event[1].Attribute := ncST_END;
      AutData.State[2].Event[1].NextState := 2;

      AutData.State[2].Event[2].Type      := ncSIGNAL1;
      AutData.State[2].Event[2].Attribute := ncAT_ONCE;
      AutData.State[2].Event[2].NextState := 3;

    //Automat STATE 3 Master/Slave Timing setting 
      AutData.State[3].MasterParID     := uiMasterParID1;
      AutData.State[3].CamProfileIndex := 16#FFFF;
      AutData.State[3].MasterFactor    := REAL_TO_UDINT(gA[4].AxisPeriod);
      AutData.State[3].SlaveFactor     := REAL_TO_UDINT(rSlave_TimingAxisPeriod);
      AutData.State[3].CompMode        := ncOFF;

      AutData.State[3].Event[0].Type       := ncST_END ;
      AutData.State[3].Event[0].Attribute  := ncST_END ;
      AutData.State[3].Event[0].NextState  := 3 ;

      AutData.State[3].Event[1].Type       := ncST_END+ncNEGATIVE ;
      AutData.State[3].Event[1].Attribute  := ncST_END ;
      AutData.State[3].Event[1].NextState  := 3 ;

      AutData.State[3].Event[2].Type       := ncSIGNAL2 ;
      AutData.State[3].Event[2].Attribute  := ncAT_ONCE ;
      AutData.State[3].Event[2].NextState  := 2 ;
      


      MC_BR_AutControl_0.Enable      := 1;
      MC_BR_AutControl_0.AdrAutData  := ADR(AutData);
      MC_BR_AutControl_0.InitAutData := 1;    
  END_IF
  
			(* wait for initialization done or restart *)
			IF ((MC_BR_AutControl_0.AutDataInitialized=1) AND (Synch_Request)) THEN
				MC_BR_AutControl_0.InitAutData := 0;
				MC_BR_AutControl_0.Enable :=1;
				AutomatStart := 1;
        uiMC_BR_AutControl_0_MemoErrorID := 0 ;
			END_IF
			(* check if error occured *)
			IF (MC_BR_AutControl_0.ErrorID <> 0) THEN
        uiMC_BR_AutControl_0_MemoErrorID := MC_BR_AutControl_0.ErrorID ;
				MC_BR_AutControl_0.Enable := 0;
			END_IF

	(******************** ENABLE CAM-AUTOMAT **********************)

	IF (AutomatStart) THEN
			MC_BR_AutControl_0.Start := 1;
			AutomatStart := 0;
	END_IF

	IF (NOT Synch_Request) THEN
			MC_BR_AutControl_0.Stop := 1;
			MC_BR_AutControl_0.Start := 0;
      ParID_Ready := 0;
      ParID_Ready1 := 0;
			IF (MC_BR_AutControl_0.Running=0) THEN
				MC_BR_AutControl_0.Enable := 0;
				MC_BR_AutControl_0.Stop := 0;
        g_bEnvBagSelectChang := 0 ;
			END_IF
   //*************************************************
   // D.M. 26/01/2012 RS26 Pyrollpack_14661 added because after guard fault it happened that Stop=1 and MC_BR_AutControl_0.Enable => not possible to finish MC_BR_AutControl_0 => program locked   
      IF MC_BR_AutControl_0.Stop        AND 
         NOT(MC_BR_AutControl_0.Enable) THEN
        MC_BR_AutControl_0.Enable := 1 ;
      END_IF
   //*************************************************      
  END_IF

	gA[12].Ind_AutomatEnabled:=MC_BR_AutControl_0.Enable;
	gA[12].Ind_CurrentAutomatState:=MC_BR_AutControl_0.ActualStateIndex;
  gA[12].Ind_bSynchroOK := (MC_BR_AutControl_0.ActualStateIndex >= 2) AND gA[12].Ind_SynchronizedMotion ; ;

	(********************** MC_AUTCONTROL *************************)
	MC_BR_AutControl_0.Slave:= gA[12].Ident;
	MC_BR_AutControl_0();


(******************** UPDATE CAM-AUTOMAT STATE 2 **********************)
  IF g_bEnvBagSelectChang                      AND 
     (MC_BR_AutControl_0.ActualStateIndex = 2) THEN
    MC_BR_InitAutState_0.Execute := 1 ; 
    uiInitAutState_0_MemoErrorID := 0 ;
  END_IF
  MC_BR_InitAutState_0.MasterParID     := MasterParID ;
  MC_BR_InitAutState_0.Slave           := gA[12].Ident ;
  MC_BR_InitAutState_0.StateIndex      := 2 ;
  MC_BR_InitAutState_0.CamProfileIndex := 16#FFFF ;
  MC_BR_InitAutState_0.MasterFactor    := REAL_TO_UDINT(gA[9].AxisPeriod) ;
  MC_BR_InitAutState_0.SlaveFactor     := REAL_TO_DINT(rSlave_AxisPeriod) ;
  MC_BR_InitAutState_0.CompMode        := ncOFF ;
  MC_BR_InitAutState_0() ;
  
  IF (MC_BR_InitAutState_0.Done)  OR 
     (MC_BR_InitAutState_0.Error) THEN
    MC_BR_InitAutState_0.Execute := 0;
    uiInitAutState_0_MemoErrorID := MC_BR_InitAutState_0.ErrorID ;
  END_IF
     
END_PROGRAM
