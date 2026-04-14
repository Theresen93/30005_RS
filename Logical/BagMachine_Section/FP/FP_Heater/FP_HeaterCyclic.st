(********************************************************************
 * COPYRIGHT -- .
 ********************************************************************
 * Program: FP_Heater
 * File: FP_HeaterCyclic.st
 * Author: dominique
 * Created: August 22, 2012
 ********************************************************************
 * Implementation of program FP_Heater
 ********************************************************************)

PROGRAM _CYCLIC


//------------------------------------------------------------------  
// Lecture sonde de temperature
  rSondeTempRegTDegC[1] := INT_TO_REAL(gAI_DRY_Pt100_Temp) / 10.0 ;
  rSondeTempRegTDegF[1] := rSondeTempRegTDegC[1] * 9/5 + 32 ;
  
  
  // -------------------------------------------------------------------
  // Temperature Sensor Alarme 
  g_DRY_bTempSensorAlarm := (g_usiAI_DRY_Pt100_TempStatus = 3) ;  

  // Limit operator Setpoint 
  gRecipeActive.rHeatSPDegF := LIMIT(rBornInfConsTempChauf[1],gRecipeActive.rHeatSPDegF,rBornSupConsTempChauf[1]) ;
 
  // Parametre mesure de temperature du regulateur
  IF g_DRY_bActHeat AND NOT(g_DRY_bTempSensorAlarm) AND NOT(g_bIndEStop) THEN
    rMesTempRegTChauf[1] := rSondeTempRegTDegF[1] ;
  ELSE
    rMesTempRegTChauf[1] := gRecipeActive.rHeatSPDegF ;
  END_IF;
 
  // Calcul periode echantillonnage appel PID, en s
  // TSI#cycleTime : Temps de cyle de la tache cyclique d appel du regulateur, en ms ( normalmement = 30ms ) 
  iiRegTChauf_TC[1] := 20 ;
  // Periode appel boucle PID
  rRegTChauf_T[1] := 2 ;
    
  // Valeur filtree de l'erreur 
  // Y = 1/(1+t/T)E + 1/(1+T/t)Y_1
  IF ( rRegTChauf_T[1] <> 0 ) AND 
     ( rPT1_t <> 0 )          THEN      
    rRegTChauf_ErrF_1[1] := rRegTChauf_ErrF[1] ;
    rRegTChauf_ErrF[1] := ( 1/(1+rPT1_t/rRegTChauf_T[1]) * rRegTChauf_Err[1] + 1/(1+rRegTChauf_T[1]/rPT1_t) * rRegTChauf_ErrF_1[1] ) ;
  END_IF;
    
  // Appel du PID tout les n cycles PWM
  IF iCptSeuilAppelRegTChauf[1] >= iSeuilAppelPID_RegTChauf[1] THEN
    // Calcul nouvelle erreur 
    rRegTChauf_Err[1] := ( gRecipeActive.rHeatSPDegF - rMesTempRegTChauf[1] ) ;
    // Calcul terme proportionnel
    rRegTChauf_TP[1] := rPIDRegTChaufKP[1] * rRegTChauf_Err[1] ;
    // Calcul terme Integral
    IF rPIDRegTChaufKI[1] <> 0.0 THEN  // Traitement cas division par 0
      rRegTChauf_TI[1] := rRegTChauf_TI_1[1] + rRegTChauf_T[1] * 1/rPIDRegTChaufKI[1] * rRegTChauf_Err[1] ;
    ELSE
      rRegTChauf_TI[1] := 0 ;
    END_IF;
    // Init terme Integral sur desactivation regul  
    IF g_bIndEStop OR rRegTChauf_TI[1] < 0 OR rRegTChauf_TI_1[1] < 0 OR g_DRY_bTempSensorAlarm THEN 
      rRegTChauf_TI[1]   := 0 ;   
      rRegTChauf_TI_1[1] := 0 ;
    END_IF;
    // Limitation val sup terme Integral lorsque sortie saturee
    IF rRegTChauf_YPC[1] >= 100 THEN 
      rRegTChauf_TI[1] := rRegTChauf_TI_1[1] ;        
    END_IF;
    rRegTChauf_TI_1[1] := rRegTChauf_TI[1] ;
    // Calcul terme Derive
    IF rRegTChauf_T[1] <> 0.0 THEN  // Traitement cas division par 0
      rDiff_ErrF[1] := ( rRegTChauf_ErrF[1] - rRegTChauf_Err_1[1] ) ;
      rRegTChauf_TD[1] := 1/rRegTChauf_T[1] * rPIDRegTChaufKD[1] * rDiff_ErrF[1] ;
      // Memo erreur filtree 
      rRegTChauf_Err_1[1] := rRegTChauf_ErrF[1] ;
    ELSE
      rRegTChauf_TD[1] := 0 ;
    END_IF;
    // Calcul sortie
    rRegTChauf_Y[1] := rRegTChauf_TP[1] + rRegTChauf_TI[1] + rRegTChauf_TD[1] ;
    // Conversion sortie en % 
    IF rBornSupConsTempChauf[1] <> 0.0 THEN  // Traitement cas division par 0
      rRegTChauf_YPC[1] := rRegTChauf_Y[1] /rBornSupConsTempChauf[1] * 100 ;
    ELSE
      rRegTChauf_YPC[1] := 0 ;
    END_IF;
    IF rRegTChauf_YPC[1] > 100 THEN 
      rRegTChauf_YPC[1] := 100 ;
    END_IF;
    IF rRegTChauf_YPC[1] < 0 OR g_DRY_bTempSensorAlarm OR g_bIndEStop OR NOT(g_DRY_bActHeat) THEN 
      rRegTChauf_YPC[1] := 0 ;
    END_IF;
  END_IF;

  // Appel bloc PID      
  // Incrementation et remise a zero du compteur d'appel du PID
  iSeuilAppelPID_RegTChauf[1] := 100 ; // Pour une tache interruptive de 20ms 100x20 = 2000ms = 2s
  iCptSeuilAppelRegTChauf[1]  := iCptSeuilAppelRegTChauf[1]  + 1  ;
  IF iCptSeuilAppelRegTChauf[1] > iSeuilAppelPID_RegTChauf[1] THEN
    iCptSeuilAppelRegTChauf[1] := 0 ;
  END_IF;

  // Parametres du PWM
  LCRPWM_0[1].enable      := 1 ;
  LCRPWM_0[1].x           := rRegTChauf_YPC[1] ;
  LCRPWM_0[1].max_value   := 100.0 ;
  LCRPWM_0[1].min_value   := 0.0 ;
  LCRPWM_0[1].t_min_pulse := iiRegTChauf_TC[1] / 1000 ;
  LCRPWM_0[1].t_period    := rRegTChauf_T[1] ;
  LCRPWM_0[1]() ; 
    
  // Activation de la sortie regulee
  IF g_DRY_bActHeat AND NOT(g_DRY_bTempSensorAlarm) AND NOT(g_bIndEStop) THEN
    bImdoRT_ActChauf[1] := LCRPWM_0[1].pulse AND NOT(bTest) ;
  ELSE
    bImdoRT_ActChauf[1] := 0 ;
  END_IF;
  gQ_CR_DRY_HeatRegul := bImdoRT_ActChauf[1] ;
  
  // Calcul pic de chauffe a l'activation du chauffage 
  IF EDGEPOS(g_DRY_bActHeat) THEN 
    bImpulsDemarSech := 1 ;
  END_IF ;
  IF rSondeTempRegTDegF[1] >= gRecipeActive.rHeatSPDegF - rDeltaTStopPicChauf THEN 
    bImpulsDemarSech := 0 ;
  END_IF ;
  
  // Batterie de chauffe TOR
  IF gRecipeActive.rHeatSPDegF > rSeuilConsTempActBattTOR OR 
    bImpulsDemarSech                                      THEN
    gQ_CR_DRY_HeatContinu := g_DRY_bActHeat AND NOT(bTest);
  ELSE
    gQ_CR_DRY_HeatContinu := 0 ;
  END_IF ;
            
  
  // Conversion for trending 
  IF ( gInchMetric_Ind = 2 ) THEN 
    rTrendActTempRegT[1]   := rSondeTempRegTDegC[1] ;
    rTrendSetPTempRegT[1]  := (gRecipeActive.rHeatSPDegF-32) * 5/9 ;
    rTrendRegTChauf_Err[1] := (rRegTChauf_Err[1]-32) * 5/9 ;
  ELSE
    rTrendActTempRegT[1]   := rSondeTempRegTDegF[1] ;
    rTrendSetPTempRegT[1]  := gRecipeActive.rHeatSPDegF ;
    rTrendRegTChauf_Err[1] := rRegTChauf_Err[1] ;
  END_IF;
  
  
  
  
  
  
END_PROGRAM
