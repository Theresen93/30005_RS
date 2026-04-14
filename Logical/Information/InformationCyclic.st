(********************************************************************
 * COPYRIGHT -- .
 ********************************************************************
 * Program: Information
 * File: InformationCyclic.st
 * Author: dominique
 * Created: October 29, 2011
 ********************************************************************
 * Implementation of program Information
 ********************************************************************)

PROGRAM _CYCLIC
  (* 

    D.M. Le 04/13/2012  Pyrollpack_14661    Version programme Mise a jour apres livraison 
    
    Reste a valider :    
    --------------------------------------------
      1) Decalage dep manu Axes Arra + TE + ApPo + ArraPo
         --> A l'arret : Dep Manu 
         --> En marche : Dep Manu + Calage Offset
      
      2) Decalage Perfo en marche
      
      3) Resynchro des axes 
         --> Cas 4 pinces sac normal 
         --> Cas 2 pinces sac normal
         --> Cas sac Pochette
         
      4) Position Axe ApPo en position de mainiten  
         --> Cas sac normal 
         --> Cas sac Pochette
         corriger le cas echeant la valeur du parametre "gr_rPosEnvBHoldBag"

      5) Calcul temoin ApPo en zone de contacte 








    Pyrollpack_14661
    
    Perf               : 8LSC5B.E1030D005-0     F8LSC5BE103
    EntryPull_ExitPull : 8LSA73.E0030D100-0     F8LSA73E003A
    Holding_Tearing    : 8LSA73.EB030D100-0     F8LSA73EB03 
    Drum               : 8LSA73.EB030D100-0     F8LSA73EB03
    IF                 : 1PH7 137-2ED03-0CA3    FPH71372ED03   (Codeur Abs EnDat Multitour)
  


  //------------------------------------------------------------------------------------------------------------------ 
    // Synchro ratio with Virtual Master
    
    Case Normal Bag production  
    ------------------------------
    Tube length | Holding | Tearing | Env Bag | Tear EB | Drum   
   --------------------------------------------------------------
    [160, 400]  |   1/2   |    1    |   1/4   |    1    |   1
   --------------------------------------------------------------
    ]400, 500]  |    1    |    2    |   1/2   |    2    |   2 
   --------------------------------------------------------------
    ]500, 760]  |    1    |    2    |   1/2   |    2    |   2
    
    
    Case Envelope Bag production  
    ------------------------------
    Tube length | Holding | Tearing | Env Bag | Tear EB | Drum   
   --------------------------------------------------------------
    [260, 320[  |   1/2   |    2    |   1     |    2    |   2
   --------------------------------------------------------------
    ]320, 760]  |    1    |    2    |   1     |    2    |   2 
                 









    D.M. Le 07/11/2011  BrownPaper_14606 
    
Fonctions Validees :    
    
    
    
Fonctions encore a implementer ou finir :

    Reste a faire 
    --------------------------------------------
      1) Sechage IF 
         CODE     => Regul Chauffe (Finalement faite par regualtion externe cause pas le temps de developper un programme)  
         CODE     => Bat TOR
         CODE     => Defaut Thermostat secu + moteurs Soufflage + batterie chauffe + Defaut sonde temperarure (arret chauffe)     
         => ATENTION Codage Ok mais Reste a etre valide  
      
      2) WISTA  
         OK       => Gestion Axe
         => Synchro Axe avec conservation de offset  
         => Passage de Synchro a RL et vis et versa  
         => Calage en marche + ecran + commutateurs sur appareil (depuis ecran est plus pratique)  
         => Du fait de RL calage a l'arret pas necessaire   
         OK       => Defauts Axes  
         OK       => Defaut casse bande   
         OK       => Defaut carter  
         OK       => Info AU
      
      3) Devieur bande 
         OK       => Colle En/Hors
         OK       => Asservissement debit vitesse   
         OK       => Soufflage En/Hors
         OK       => Defaut fin bobine Poly
         OK       => Defaut disjoncteur soufflage  
         OK       => Defaut carter  
         OK       => Info AU 
      
      4) Micro Perfo a froid  
         OK       => Gestion Axe
         OK       => Defauts Axes
         OK       => Defaut disjoncteur aspiration dechets  
         OK       => Defaut carter  
      
      
      
         OK             5) ATTENTION   INIT DES AXES ARRA+MAIN+TE  A FAIRE + DEFINITION POSITIONS PARTICULUIERES DES AXES => REPRENDRE MEME CHOSE QUE SUR B&H
           
      
         OK             6) Rentrer config IP Client
      
      
         OK + correction Bug 7) ATTENTION AI SHUNTE PROVISOIREMENT DEFAUT PORTES IF !!!!! VOIR ALARME 70
      
      
         OK       8) ATTENTION AI INHIBE CALCUL DE DEFAUT DES MODULES I/O A METTRE A JOUR ET A REACTIVER
      
      
         OK       9) Mettre a jour nom des disjoncteurs moteur, chauffe, etc...
      
      
         OK       10) AU AXES MACHINE A L'ARRET 
      
      
         OK       11) Integrer vue cadence Perfo Type 1 et 2 speciale pour RS26 (Si possible corriger vue de RS15 Cas Inch cause manque les decimales sur axe de ordonnees) 

      
         OK       12) IHM mettre a jour I/O dans Maintenance
      
      
         OK       13) ATTENTION !!!! Decalage a l'arret Flexo fonctionne apparemment mais apres pas possible de tourner cause Flexo est beaucoup trop lente => casse la bande au niveau de AppE RS !!!  => Certainement Came Automate est reste dans Etat 4 (exactement ca)
      
      
         OK       14) ATTENTION !!!! d'apres Georges Mathe Hors Imp FP Auto sur seuil vitesse ne fonctionne pas !!!! fait Hors Imp que une x arrive a vitesse nulle  
         En fait ca fonctionnait tres bien       
      
      
      15) ATTENTION !!!! Calage sur Hot Micro Perf n'est pas conserve au redemarrage meme apres arret normal 
      
      
         OK       16) Vue registration => ajout 1 deciamle a la valeur de correction cause comme le + souvent est <= 1   => ca affiche toujours 0 ... et on a l'impression que ca ne corrige pas
        
      
         OK       17) ATTENTION !!! Bug dans redef pos Axe Arra il ne faut pas affecter de position > au modulo => Fonction Home fait un defaut 
        
      
       18) VALIDER REDEFINITION POSITION ARRA LORS DE PASSAGE 4 <--> 2 PINCES !!!!   
        





//-----------------------------------------------------------------------------------------------------------------------------------------------
      // Modifs apportees au programme precedent 

      1) Dans module programme gestion colle sur derouleur, ajout gestion colle sur guide bande => changement nom de Unw_Glue => Unw_3W_Glue
      
      2) Ai verouille calcul affichage ecran config Arr/MAin/TE tant que demarrage ecran non termine
      
      3) Ajout condition pas(AU) sur sortie Glue !!! 
      
      4) ATTENTION !!! Bug Phasing Axes =>  Phasing_1 fait défaut lorsque dep manu axe a l'arret avec Phasing_0 => retarder la reactivation de Phasing_1 a la fin de Phasing_0 

      5) ATTENTION !!! Mettre a jour calcul temoin "gGuardsOK" dans Guard_Mon
      
      6) ATTENTION !!! filtrer defaut carter Gates IF avec mode reglage + Modifier de telle sorte que le mode reglage n'acquitte pas autoamtiquement le defaut 
      
      7) ATTENTION !!! Ai deplace les variables ci-dessous de Init A9_Basic --> Cyclic Setup cause lors de chargement en RUN il est arrive que ces valeurs soient remise a 0 => Passage en SERV de CPU en pleinne demonstartion client ...
      
                    // General parameter init
                    gr_rMachMaxSpeed_BPM := 1000.0 ;  
  
                    // Machie Type
                    g_iMachType := C_iRS26 ;
  
                    // Bag size limite
                    g_rMaxBagSize_RS15_mm := 400.0 ; 
                    g_rMinBagSize_RS15_mm := 105.0 ; 
                    g_rMaxBagSize_RS26_mm := 760.0 ; 
                    g_rMinBagSize_RS26_mm := 160.0 ; 
  
      
      8) ATTENTION !!! filtrer defaut carter Gates IF avec mode reglage
        
      9) ATTENTION !!! ajout d'un temoin AlimPuis retarde pour calcul defaut 230V et Disjoncteur Fan Perfo cause faisait encore le defaut a la mise sous puissance
        
      10) Ai corrige fonction redefinition position Arra lors de passage 4 <--> 2 pinces pour limiter nouvelle position <= Modulo sinon fonction Home fait un defaut 29225
        
      11) Completer defaut AU a l'arret avec AxeIF
    
      12) Mise a jour Message 2 => Carters !!! + Axes non pret
    
      13) Refait vue Cad Max Perfo RS15 Inch avec decimale sur Axe des ordonnees 
    

    























//*********************************************************************************************************************************************************************************





    D.M. Le 29/10/2011  B&H_14541 Programme Dev basee sur version en cours sur machine au 28/10/2011 en fin de journee (B&H_14541 Provient de programme Brown_Paper_14542)                    
    Ajout de :
    
Validation
    OK    1) Animation sur ecran en phase de synchro des Axes.
           
    OK    2) Modification gestion presseur AppS et IF pour eviter mise sous pression automatique sur acquittement defaut AU ou mise sous puissance.
    OK       Presseur AppE pour interdire On si BP Off active 
    
    OK    3) Ajout courbes cadence Max machine RS26 Perfo 400mm uniquement
    
    OK    4) Fermeture auto affichage courbes de cadence Max machine sur sortie de la vue SetUp Perfo 
    
    OK    5) Calage manu Perfo a l'arret 
    
    OK    6) Calage manu IF a l'arret         
    
    OK    7) Supression "shuntage" defaut carter  
    
    OK    8) !!! ATTENTION !!!  Ajout d'un AU sur les axes pour le cas deplacement manu des axes machine a l'arret 
    OK       + Ajout disable Axes en fin d'AU
    
    OK    9) Limitation a RS15 uniquement de correction position arret machine avec Arra hors position d'arrachement 
    OK    + Limitation a RS15 uniquement de coupure Enable Drive Drum lorsque Home Tearing et vis et versa
    OK    + Table A4_Init Homing regalge parametres ci-dessous sur ncNEGATIVE au lieu de ncPOSITIVE pour referencement dans sens negatif
                                                  edge_sw   --> ncNEGATIVE    Edge of reference switch
                                                  start_dir --> ncNEGATIVE    Start direction
                                                  trigg_dir --> ncNEGATIVE    Trigger directionpour direction Home sens negatif conforme a RS26
                                                  
    
    OK    10) Ajout calcul temoin "Drum in contact zone with blade" arbitrairement fixe a 20° 
     
    OK    11) En marche calage RS sur impression 
    
    OK    12) Correction resynchro Holding apres manu => toujours retour en Etat 2 (Synchro OK) puisque axe vient d'etre regle en manu !!! => donc il faut conserver ce reglage !!! 
    
    OK    13) Decomposition decalage Offset Drum en marche
    
    OK    14) Adaptation position de Reference Tearing Axis en fonction du Format (+/-180° cas 2 pinces a voir) + adapattion cycle referencement cas RS26 ou RS15
    
    OK    15) Ai ajouter filtre selection DHS pour prod sur affichage message deselection fin de bobines DHS
    
    OK    16) Modif defaut 230V pour que fasse defaut uniquement lorsque PowerOn et pas entree 230V active 

    OK    17) Modif calcul defaut disjoncteur Fan Perfo pour que fasse defaut que si Ligne 24V pas coupee (Power On , pas AU pas def Carter, etc...)
    
    OK    18) Correction Beug Action Etape6 venant de Etape2 cycle manu Main => ajouter : "gstCycA[3].CycManTimSet.CmdSynchroOn := 0 ;"
    
    OK    19) Réglage de tous les Offsets de referencemet à 0°
    
    OK    20) Ajout position caracreristiques de axeq Arra Main et TE lorsque Arra arrache (est a la vertical) Main maintien (est a la vertical) et pince tambour pince le sac (Lame dans la pince) 
    
    OK    21) Position init des axes Main + Arra + TE => Pour simplifier parametrage ai mis le meme offset sur les 3 Axes = 20°
    
    OK    22) Corriger I/0 dans vues maintenance 
    
    OK    23) Corriger cad max Perfo points particuliers transition 1 <--> 2 Perfo
       
    OK    24) Demande auto operateur positionner Holding+Tearinf+Drum axis dans config correcte lors de passage 4 <--> 2 pinces
       OK =>  + Verifier si toujours possible d'aboutir a la config demandee
       OK =>  + Si trop complique demander a operateur de positionner stations conformement a image sur IHM et de confirmer par un boutton => redefinir position correcte de Arra et Maint 
    
    OK    25) Mise a jour recettage
    
    
    
    Reste a faire 
    --------------------------------------------
    
    
    
    ??) Modulation tension de bande AppE en fonction de VL
    
    
    
    ATTENTION !!!! A FAIRE AVANT DEPART MACHINE 
    
    OK    1) Config IP client a rentrer 
    
      2) Niveau Bus DC Puis a adapte pour tension client Udc = Racive(2)*Ueff = 480 x 1.414 = 678.82 V
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
   *)
END_PROGRAM
