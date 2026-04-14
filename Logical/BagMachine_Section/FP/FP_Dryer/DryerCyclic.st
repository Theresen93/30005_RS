(********************************************************************
 * COPYRIGHT -- .
 ********************************************************************
 * Program: FP_Dryer
 * File: FP_DryerCyclic.st
 * Author: dominique
 * Created: November 08, 2011
 ********************************************************************
 * Implementation of program FP_Dryer
 ********************************************************************)

PROGRAM _CYCLIC

    // -------------------------------------------------------------------
    // Temperature Sensor Alarme 
    g_DRY_bTempSensorAlarm := (g_usiAI_DRY_Pt100_TempStatus = 3) ;  

    
    
    // -------------------------------------------------------------------
    // Blower On/Off
    IF g_DRY_bBlowerAlarm           OR 
       EDGENEG(gI_SS_MainPowerOff ) OR 
       NOT(g_bMainPower_OnDelay)    OR 
       g_bIndEStop                  THEN  
      HMI_Cmd_BlowerOnPB := 0 ;
    END_IF ;
    
    IF HMI_Cmd_AutoOffDryOnPB THEN 
      bQ_CR_DRY_Blower := HMI_Cmd_BlowerOnPB AND 
                          g_bMachineRun      AND 
                          1                  ;     
    ELSE 
      bQ_CR_DRY_Blower := HMI_Cmd_BlowerOnPB AND 
                          1                  ;  
    END_IF ;
                        
    // Output activation 
    gQ_CR_DRY_Blower := ( bQ_CR_DRY_Blower OR 
                          stTOF_0.Q )      AND 
                          NOT(g_bIndEStop) ;
                        
    // HMI Blower PB Texte 
    IF HMI_Cmd_BlowerOnPB THEN                     
      uiBlowerOnPBTxt_Ind := 1 ;
    ELSE             
      uiBlowerOnPBTxt_Ind := 0 ;
    END_IF ;      
    // HMI Dryer Auto Off PB Texte 
    IF HMI_Cmd_AutoOffDryOnPB THEN                     
      uiAutoOffDryOnPBTxt_Ind := 7 ;
    ELSE             
      uiAutoOffDryOnPBTxt_Ind := 6 ;
    END_IF ;                            
        
        
    // -------------------------------------------------------------------
    // Heater On/Off
    bActHeat := NOT(g_DRY_bHeaterAlarm) AND 
                g_bMainPower_OnDelay    AND  
                HMI_Cmd_BlowerOnPB      AND  
                NOT(g_bIndEStop)        AND 
                1                       ;
  
    g_DRY_bActHeat := gRecipeActive.bSelHeaterProd AND 
                      bQ_CR_DRY_Blower             AND 
                      bActHeat                     ;
    
    // Heater On delayed
    stTON_0(IN:=gQ_CR_DRY_HeatRegul,PT:=T#7s);
    bInd_NeedCool := stTON_0.Q      OR 
                     g_DRY_bActHeat AND 
                     stTOF_0.Q      ;    
          
    // Blower Off delayed in oder to cool the Heater when switching Off Dryer 
    stTOF_0(IN:=bInd_NeedCool,PT:=T#30s);
    rBlowerTimeRemain := (TIME_TO_REAL(stTOF_0.PT) - TIME_TO_REAL(stTOF_0.ET))/1000.0 ; 
    // Blower Time Remaining Visible  
    IF stTOF_0.Q             AND 
       NOT(g_bMachineRun)    AND 
       NOT(bQ_CR_DRY_Blower) THEN 
      iTimRemVisible := 0 ;
    ELSE
      iTimRemVisible := 1 ;
    END_IF      
    g_DRY_bIndCooling := stTOF_0.Q ; 
    IF EDGENEG(gI_SS_MainPowerOff ) AND 
       g_DRY_bIndCooling            THEN 
      g_DRY_bMemPowerOff := 1 ;
    END_IF      
    IF NOT(g_DRY_bIndCooling ) THEN
      g_DRY_bMemPowerOff := 0 ;
      g_DRY_bFlash := 0 ;
    END_IF    
    H_FB_Flash_0(IN_bEnable:=g_DRY_bMemPowerOff, IN_rNumFlashPerSec:=2) ;
    g_DRY_bFlash := H_FB_Flash_0.OUT_bFlash ;
    
    
    // HMI Heater PB Texte 
    IF gRecipeActive.bSelHeaterProd THEN                     
      uiHeaterOnPBTxt_Ind := 3 ;
    ELSE             
      uiHeaterOnPBTxt_Ind := 2 ;
    END_IF ;                                  
   
    // Dryer activated 
    g_bSelDryerProd := gRecipeActive.bSelHeaterProd OR 
                       HMI_Cmd_BlowerOnPB           OR 
                       bTest                        ;
    
END_PROGRAM
