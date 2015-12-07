(defvar *response* nil)

;; programme pour representer une personne en pleine forme
(defun normal()
  
  (reset)
  
  (let* ((voitureD (permute-list '("voiture1" "voiture2" "voiture3" "voiture4" "voiture5" "voiture6" "voiture7" "voiture8" "voiture9" "VoitureVide" "VoitureVide" "VoitureVide")))
		 (voitureG (permute-list '("voiture1" "voiture2" "voiture3" "voiture4" "voiture5" "voiture6" "voiture7" "voiture8" "voiture9" "VoitureVide" "VoitureVide" "VoitureVide")))		 
		 (envir (permute-list '("env1" "env2" "env3" "env4" "env5" "env6")))
		 
		 (voitD (first voitureD))
		 (voitG (first voitureG))
		 (envText (first envir))
		 
         (windowEnv (open-exp-window "Environnement" :x 200 :y 200)))
	  
	  ;;on se sert de la position des differents elements dans la fenetre pour les distinguer 
    (add-text-to-exp-window :text voitD :x 50 :y 150 :window windowEnv)
    (add-text-to-exp-window :text voitG :x 150 :y 50 :window windowEnv)
    (add-text-to-exp-window :text envText :x 50 :y 50 :window windowEnv)
	
    (install-device windowEnv)

    (proc-display)
	
    (sgp :esc t :rt -.45 :v t :ans 0.5 :mp 16 :act nil)
	
    (run 10 :real-time t))  
    
  )
  
;; programme pour representer une personne assez fatigue
(defun tired()

(reset)

(let* ((voitureD (permute-list '("voiture1" "voiture2" "voiture3" "voiture4" "voiture5" "voiture6" "voiture7" "voiture8" "voiture9" "VoitureVide" "VoitureVide" "VoitureVide")))
	 (voitureG (permute-list '("voiture1" "voiture2" "voiture3" "voiture4" "voiture5" "voiture6" "voiture7" "voiture8" "voiture9" "VoitureVide" "VoitureVide" "VoitureVide")))		 
	 (envir (permute-list '("env1" "env2" "env3" "env4" "env5" "env6")))
	 
	 (voitD (first voitureD))
	 (voitG (first voitureG))
	 (envText (first envir))
	 
	 (windowEnv (open-exp-window "Environnement" :x 200 :y 200)))
  
  ;;on se sert de la position des differents elements dans la fenetre pour les distinguer 
(add-text-to-exp-window :text voitD :x 50 :y 150 :window windowEnv)
(add-text-to-exp-window :text voitG :x 150 :y 50 :window windowEnv)
(add-text-to-exp-window :text envText :x 50 :y 50 :window windowEnv)

(install-device windowEnv)

(proc-display)

(sgp :esc t :rt -.45 :v t :ans 0.5 :mp 16 :egs 1 :act nil :ppm 1)
  
(run 10 :real-time t))  
)

;; programme pour representer une personne tres fatigue
(defun very-tired()

(reset)

(let* ((voitureD (permute-list '("voiture1" "voiture2" "voiture3" "voiture4" "voiture5" "voiture6" "voiture7" "voiture8" "voiture9" "VoitureVide" "VoitureVide" "VoitureVide")))
	 (voitureG (permute-list '("voiture1" "voiture2" "voiture3" "voiture4" "voiture5" "voiture6" "voiture7" "voiture8" "voiture9" "VoitureVide" "VoitureVide" "VoitureVide")))		 
	 (envir (permute-list '("env1" "env2" "env3" "env4" "env5" "env6")))
	 
	 (voitD (first voitureD))
	 (voitG (first voitureG))
	 (envText (first envir))
	 
	 (windowEnv (open-exp-window "Environnement" :x 200 :y 200)))
  
  ;;on se sert de la position des differents elements dans la fenetre pour les distinguer 
(add-text-to-exp-window :text voitD :x 50 :y 150 :window windowEnv)
(add-text-to-exp-window :text voitG :x 150 :y 50 :window windowEnv)
(add-text-to-exp-window :text envText :x 50 :y 50 :window windowEnv)

(install-device windowEnv)

(proc-display)

(sgp :esc t :rt -.45 :v t :ans 0.5 :mp 16 :egs 2 :act nil :ppm 2)
  
(run 10 :real-time t))  
)

(clear-all)

(define-model projet_route

;;paramètres globaux :
;;esc : Enable Subsymbolic Computations = True => pour utiliser le subsymbolique
;;rt : Retrieval Threshold => niveau d'activation de base en dessous duquel les chunks ne seront plus récupérés
;;v : Verbose => affiche les traces lors de l'exécution
;;ans : Activation Noise S => bruit ajouté aux chunks activés à chaque cycle
	;;(sgp :esc t :rt -.45 :v t :ans 0.5 :mp 16 :egs 2)
    
	
	
	
;; Tous les chunk-types, exceptés ceux à un attribut, ont comme attribut "nom" qui sert à les trouver
	
;;différentes valeurs voiture ===>
;;type : "normal", "electrique", "moto"
;;distance/vitesse : GrandeV, MoyenneV, PetiteV
;;numerodevoie : (integer)
;;phares : "E", "A"
 (chunk-type Vehicule nomV Type Distance Vitesse NumeroDeVoie Phares)
 
;;différentes valeurs environnement ===>
;;route : (chunk type)
;;climat : (chunk type)
;;passagepieton : "oui", "non"
;;feu : (chunk type), "non"
 (chunk-type Environnement nomE Route Climat PassagePieton Feu)
 
;;différentes valeurs route ===>
;;NombreDeVoies : (integer)
;;NombreSens : "un", "deux"
 (chunk-type Route nomR NombreDeVoies NombreSens)
 
;;différentes valeurs Climat ===>
;;Nuit : "jour", "nuit"
;;Visibilite : "bonne, "mauvaise"
;;gel : "oui", "non"
 (chunk-type Climat nomC Nuit Visibilite Gel)
 
;;différentes valeurs Feu ===>
;;Couleur : "vert", "rouge"
 (chunk-type Feu Couleur)
 
;;différentes valeurs Decision ===>
;;state : "stop", "courir", "marcher"
 (chunk-type Decision state vitesseG distanceG vitesseD distanceD environnement)
 
;;besoin de definir des chunks vitesse et distance pour les similarites
 (chunk-type Vitesse v)
 (chunk-type Distance d)
;;!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;;Ces valeurs peuvent être modifié DU MOMENT QUE vous modifiez le code pour gérer ces modifications !
;;!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!




(add-dm

(PetiteV ISA Vitesse v "petite")
(MoyenneV ISA Vitesse v "moyenne")
(GrandeV ISA Vitesse v "grande")

(PetiteD ISA Distance d "petite")
(MoyenneD ISA Distance d "moyenne")
(GrandeD ISA Distance d "grande")

(Voiture1 ISA Vehicule nomV "voiture1" Type "electrique" Distance PetiteD Vitesse PetiteV NumeroDeVoie 1 Phares "E")
(Voiture2 ISA Vehicule nomV "voiture2" Type "normal" Distance PetiteD Vitesse MoyenneV NumeroDeVoie 1 Phares "E")
(Voiture3 ISA Vehicule nomV "voiture3" Type "normal" Distance PetiteD Vitesse GrandeV NumeroDeVoie 1 Phares "E")
(Voiture4 ISA Vehicule nomV "voiture4" Type "normal" Distance MoyenneD Vitesse PetiteV NumeroDeVoie 1 Phares "A")
(Voiture5 ISA Vehicule nomV "voiture5" Type "electrique" Distance MoyenneD Vitesse MoyenneV NumeroDeVoie 1 Phares "A")
(Voiture6 ISA Vehicule nomV "voiture6" Type "normal" Distance MoyenneD Vitesse GrandeV NumeroDeVoie 1 Phares "A")
(Voiture7 ISA Vehicule nomV "voiture7" Type "normal" Distance GrandeD Vitesse PetiteV NumeroDeVoie 1 Phares "E")
(Voiture8 ISA Vehicule nomV "voiture8" Type "normal" Distance GrandeD Vitesse MoyenneV NumeroDeVoie 1 Phares "E")
(Voiture9 ISA Vehicule nomV "voiture9" Type "electrique" Distance GrandeD Vitesse GrandeV NumeroDeVoie 1 Phares "E")

;; ce chunk voiture sert a representer l absence de voitures d un cote
(VoitureVide ISA Vehicule nomV "voitureVide" Type "empty" Distance "empty" Vitesse "empty" NumeroDeVoie "empty" Phares "empty")

(Env1 ISA Environnement nomE "env1" Route Route1 Climat Climat1 PassagePieton "non" Feu "non")
(Env2 ISA Environnement nomE "env2" Route Route2 Climat Climat2 PassagePieton "oui" Feu "rouge")
(Env3 ISA Environnement nomE "env3" Route Route2 Climat Climat2 PassagePieton "oui" Feu "vert")
(Env4 ISA Environnement nomE "env4" Route Route2 Climat Climat1 PassagePieton "oui" Feu "non")
(Env5 ISA Environnement nomE "env5" Route Route2 Climat Climat2 PassagePieton "oui" Feu "non")
(Env6 ISA Environnement nomE "env6" Route Route2 Climat Climat1 PassagePieton "oui" Feu "non")

(Route1 ISA Route nomR "route1" NombreDeVoies 1 NombreSens "un")
(Route2 ISA Route nomR "route2" NombreDeVoies 1 NombreSens "deux")

(Climat1 ISA Climat nomC "climat1" Nuit "non" Visibilite "bonne" Gel "non")
(Climat2 ISA Climat nomC "climat2" Nuit "oui" Visibilite "bonne" Gel "oui")

(Feu1 ISA Feu Couleur "vert")
(Feu2 ISA Feu Couleur "rouge")
(Feu3 ISA Feu Couleur "non")

(start ISA chunk) (find-locationEnv ISA chunk) (attendEnv ISA chunk) (researchFeu ISA chunk) (respondEnv ISA chunk) (doneEnv ISA chunk) 
(find-locationGauche ISA chunk) (attendGauche ISA chunk) (researchGauche ISA chunk) (respondGauche ISA chunk) (startGauche ISA chunk) 
(find-locationDroite ISA chunk) (attendDroite ISA chunk) (researchDroite ISA chunk) (respondDroite ISA chunk) (startDroite ISA chunk)
(find-locationGauche2 ISA chunk) (attendGauche2 ISA chunk) (researchGauche2 ISA chunk) (respondGauche2 ISA chunk) (startGauche2 ISA chunk)
(respondWait ISA chunk) (respondCrossWalking ISA chunk) (respondCrossRunning ISA chunk) (gestionGel ISA chunk)
(find-locationNuit ISA chunk) (gestionNuit ISA chunk) (researchNuit ISA chunk) (respondNuit ISA chunk)
(doneNuit ISA chunk) (testNuit ISA chunk)

(goal ISA Decision state start vitesseG "empty" distanceG "empty" vitesseD "empty" distanceD "empty" environnement "empty"))

(P start-environnement
   =goal>
      ISA         Decision
      state       start
 ==>
   +visual-location>
      ISA         visual-location
      :attended    nil
	  < screen-x   100
	  < screen-y   100
   =goal>
      state       find-locationEnv
)

(P analyse-env
   =goal>
      ISA         Decision
      state       find-locationEnv
   =visual-location>
      ISA         visual-location
   ?visual>
      state       free
==>
   +visual>
      ISA         move-attention
      screen-pos  =visual-location
   =goal>
      state       attendEnv
)


(P save-env
   =goal>
      ISA         Decision
      state       attendEnv
   =visual>
      ISA         text
      value       =name
   ?retrieval>
      state       free
==>
   +retrieval>
      isa         Environnement
      nomE        =name
   =goal>
      state       researchFeu
)


(P researchEnv
   =goal>
      ISA         Decision
      state       researchFeu
	  environnement "empty"
   =retrieval>
      isa         Environnement
      Feu			=fire
   ?imaginal>
      state       free
==>
   +imaginal>
      isa         Feu
      Couleur      =fire
   =goal>
      state       respondEnv
	  environnement =retrieval
)

(P respondVert
   =goal>
      ISA         Decision
      state       respondEnv
   =imaginal>
      isa         Feu
      Couleur      "vert"
==>
   =goal>
      state       respondCrossWalking
   !output!       (Le feu est vert on peut traverser !)
)

(P respondRouge
   =goal>
      ISA         Decision
      state       respondEnv
   =imaginal>
      isa         Feu
      Couleur      "rouge"
==>
   =goal>
      state       respondWait
   !output!       (Le feu est rouge stop !)
)

(P stop-noFeu
   =goal>
      ISA         Decision
      state       respondEnv
   =imaginal>
      ISA         Feu
      Couleur       "non"
==>
   =goal>
      state       doneEnv
   !output!       (Il n'y a pas de feu on regarde a gauche !)
)


;; fin reconnaissance Feux

;; check s'il fait nuit ou non => si oui, difficulté à repérer une voiture
;; 
(P obtentionEnvNuit
  =goal>
    ISA     Decision
    state       doneEnv
    environnement =env
==>
  +retrieval>   =env
  =goal>
    state     gestionNuit
)

(P obtentionClimatNuit
  =goal>
    ISA     Decision
    state   gestionNuit
  =retrieval>
    ISA     Environnement
    Climat    =climat
==>
  =retrieval>   =climat
  =goal>
    state   gestionNuit
)

(P responseNuit1
  =goal>
    ISA     Decision
    state   gestionNuit
  =retrieval>
    ISA     Climat
    Nuit     "oui"
==>
  =goal>
    state   doneNuit
    !output!  (Il fait nuit!)
)

(P responseNuit2
  =goal>
    ISA     Decision
    state   gestionNuit
  =retrieval>
    ISA     Climat
    Nuit     "non"
==>
  =goal>
    state   doneNuit
    !output!  (Il fait jour!)
)


#|(P start-nuit
   =goal>
      ISA         Decision
      state       doneEnv
 ==>
   +visual-location>
      ISA         visual-location
      :attended    nil 
    < screen-x   100
    < screen-y   100
   =goal>
      state       find-locationNuit
)

(P analyse-nuit
   =goal>
      ISA         Decision
      state       find-locationNuit
   =visual-location>
      ISA         visual-location
   ?visual>
      state       free
==>
   +visual>
      ISA         move-attention
      screen-pos  =visual-location
   =goal>
      state       attendNuit
)


(P save-nuit
   =goal>
      ISA         Decision
      state       attendNuit
   =visual>
      ISA         text
      value       =name
   ?retrieval>
      state       free
==>
   +retrieval>
      isa         Environnement
      nomE        =name
   =goal>
      state       researchNuit
)


(P researchNuit
   =goal>
      ISA         Decision
      state       researchNuit
   =retrieval>
      isa         Environnement
      Climat     =climat
  ?imaginal>
      state       free
==>
   +imaginal>
      isa         Climat
      nomC        =climat
   =goal>
      state       testNuit
)

(P test-nuit
    =goal>
      ISA         Decision
      state       testNuit
   =imaginal>
      ISA         Climat
      nomC        =climat
    ?retrieval>
      state       free
==>
  +retrieval>
      ISA         Climat
      nomC        =climat
  =goal>
    state         respondNuit
)

(P nuit-ok
   =goal>
      ISA         Decision
      state       respondNuit
   =retrieval>
      ISA         Climat
      nomC        =climat
      Nuit        "oui"
==>
   =goal>
      state       doneNuit
   !output!       (Il fait nuit !)
)|#

(P startGauche
  =goal>
    ISA           Decision
    state         doneNuit
==>
  =goal>
	  state          startGauche
  +visual-location>
      ISA         visual-location
      :attended    nil
	  > screen-x   100
)

(P regarderGauche
    =goal>
      ISA           Decision
      state         startGauche
    =visual-location>
          ISA         visual-location
    ?visual>
          state       free
==>
  =goal>
		state     find-locationGauche
  +visual>
      ISA         move-attention
      screen-pos  =visual-location
)

(P save-gauche
   =goal>
      ISA         Decision
      state       find-locationGauche
   =visual>
      ISA         text
      value       =name
==>
	+retrieval>
      isa         Vehicule
      nomV      =name
   =goal>
      state       researchGauche
)

(P researchVehiculeGauche
   =goal>
      ISA         Decision
      state       researchGauche
   =retrieval>
      isa         Vehicule
      - nomV     "VoitureVide"
      Type      =type
      Distance  =distance
      Vitesse   =vitesse
==>
   =goal>
      state       respondGauche
	  vitesseG	  =vitesse
	  distanceG	  =distance
      !output!  (A gauche je vois une voiture de type =type qui roule a =vitesse vitesse et qui se situe a =distance distance)
)

(P researchVehiculeGaucheVide
   =goal>
      ISA         Decision
      state       researchGauche
   =retrieval>
      isa         Vehicule
      nomV     "VoitureVide"
==>
   =goal>
      state       respondGauche
      !output!  (Il n y a pas de voitures a gauche)
)

(P stop1
   =goal>
      ISA         Decision
      state       researchGauche
   =retrieval>
      isa         Vehicule
      Distance  PetiteD
      Vitesse   MoyenneV
==>
   =goal>
      state       respondWait
      !output!  (Une voiture a gauche se situe a petite distance mais arrive a moyenne vitesse donc il vaut mieux attendre avant de traverser !)
)

(P stop2
   =goal>
      ISA         Decision
      state       researchGauche
   =retrieval>
      isa         Vehicule
      Distance  PetiteD
      Vitesse   GrandeV
==>
   =goal>
      state       respondWait
      !output!  (Une voiture a gauche se situe a petite distance et arrive a grande vitesse donc il vaut mieux attendre avant de traverser !)
)

(P stop3
   =goal>
      ISA         Decision
      state       researchGauche
   =retrieval>
      isa         Vehicule
      Distance  MoyenneD
      Vitesse   GrandeV
==>
   =goal>
      state       respondWait
      !output!  (Une voiture a gauche se situe a moyenne distance mais arrive a grande vitesse et donc il vaut mieux attendre avant de traverser !)
)

;;fin observation vehicules gauche

(P startDroite
  =goal>
    ISA           Decision
    state         respondGauche
==>
  =goal>
	  state          startDroite
  +visual-location>
      ISA         visual-location
      :attended    nil
	  > screen-y   100
)

(P regarderDroite
    =goal>
      ISA           Decision
      state         startDroite
    =visual-location>
          ISA         visual-location
    ?visual>
          state       free
==>
  =goal>
		state     find-locationDroite
  +visual>
      ISA         move-attention
      screen-pos  =visual-location
)

(P save-Droite
   =goal>
      ISA         Decision
      state       find-locationDroite
   =visual>
      ISA         text
      value       =name
==>
	+retrieval>
      isa         Vehicule
      nomV      =name
   =goal>
      state       researchDroite
)

(P researchVehiculeDroite
   =goal>
      ISA         Decision
      state       researchDroite
   =retrieval>
      isa         Vehicule
      - nomV     "VoitureVide"
      Type      =type
      Distance  =distance
      Vitesse   =vitesse
==>
   =goal>
      state       respondDroite
	  vitesseD	  =vitesse
	  distanceD	  =distance
      !output!  (A Droite je vois une voiture de type =type qui roule a =vitesse vitesse et qui se situe a =distance distance)
)

(P researchVehiculeDroiteVide
   =goal>
      ISA         Decision
      state       researchDroite
   =retrieval>
      isa         Vehicule
      nomV     "VoitureVide"
==>
   =goal>
      state       respondDroite
      !output!  (Il n y a pas de voitures a droite)
)

(P stop21
   =goal>
      ISA         Decision
      state       researchDroite
   =retrieval>
      isa         Vehicule
      Distance  PetiteD
      Vitesse   MoyenneV
==>
   =goal>
      state       respondWait
      !output!  (Une voiture a droite se situe a petite distance mais arrive a moyenne vitesse donc il vaut mieux attendre avant de traverser !)
)

(P stop22
   =goal>
      ISA         Decision
      state       researchDroite
   =retrieval>
      isa         Vehicule
      Distance  PetiteD
      Vitesse   GrandeV
==>
   =goal>
      state       respondWait
      !output!  (Une voiture a droite se situe a petite distance et arrive a grande vitesse donc il vaut mieux attendre avant de traverser !)
)

(P stop23
   =goal>
      ISA         Decision
      state       researchDroite
   =retrieval>
      isa         Vehicule
      Distance  MoyenneD
      Vitesse   GrandeV
==>
   =goal>
      state       respondWait
      !output!  (Une voiture a droite se situe a moyenne distance mais arrive a grande vitesse et donc il vaut mieux attendre avant de traverser !)
)

;;fin observation vehicules droite

(P startGauche2
  =goal>
    ISA           Decision
    state         respondDroite
==>
  =goal>
	  state          startGauche2
  +visual-location>
      ISA         visual-location
	  > screen-x   100
)

(P regarderGauche2
    =goal>
      ISA           Decision
      state         startGauche2
    =visual-location>
          ISA         visual-location
    ?visual>
          state       free
==>
  =goal>
		state     find-locationGauche2
  +visual>
      ISA         move-attention
      screen-pos  =visual-location
)

(P save-gauche2
   =goal>
      ISA         Decision
      state       find-locationGauche2
   =visual>
      ISA         text
      value       =name
==>
	+retrieval>
      isa         Vehicule
      nomV      =name
   =goal>
      state       researchGauche2
)

(P researchVehiculeGauche2
   =goal>
      ISA         Decision
      state       researchGauche2
   =retrieval>
      isa         Vehicule
      - nomV     "VoitureVide"
      Type      =type
      Distance  =distance
      Vitesse   =vitesse
==>
   =goal>
      state       respondGauche2
	  vitesseG	  =vitesse
	  distanceG	  =distance
      !output!  (A gauche je vois toujours une voiture de type =type qui roule a =vitesse vitesse et qui se situe a =distance distance)
)

(P researchVehiculeGauche2Vide
   =goal>
      ISA         Decision
      state       researchGauche2
   =retrieval>
      isa         Vehicule
      nomV     "VoitureVide"
==>
   =goal>
      state       respondGauche2
      !output!  (Il n y a toujours pas de voitures a gauche)
)

(P stop31
   =goal>
      ISA         Decision
      state       researchGauche2
   =retrieval>
      isa         Vehicule
      Distance  PetiteD
      Vitesse   MoyenneV
==>
   =goal>
      state       respondWait
      !output!  (Une voiture a gauche se situe toujours a petite distance mais arrive a moyenne vitesse donc il vaut mieux attendre avant de traverser !)
)

(P stop32
   =goal>
      ISA         Decision
      state       researchGauche2
   =retrieval>
      isa         Vehicule
      Distance  PetiteD
      Vitesse   GrandeV
==>
   =goal>
      state       respondWait
      !output!  (Une voiture a gauche se situe toujours a petite distance et arrive a grande vitesse donc il vaut mieux attendre avant de traverser !)
)

(P stop33
   =goal>
      ISA         Decision
      state       researchGauche2
   =retrieval>
      isa         Vehicule
      Distance  MoyenneD
      Vitesse   GrandeV
==>
   =goal>
      state       respondWait
      !output!  (Une voiture a gauche se situe toujours a moyenne distance mais arrive a grande vitesse et donc il vaut mieux attendre avant de traverser !)
)

;;fin re-observation vehicules droite



;;permet au sub-symn de sauter des etapes de regards a gauche ou droite
(P jumpToEnd1
	=goal>
		ISA		Decision
		state	doneNuit
==>
	=goal>
		state	respondGauche2
		!output!  (Je ne regarde meme pas sur les cotes)
)

(P jumpToEnd2
	=goal>
		ISA		Decision
		state	respondGauche
==>
	=goal>
		state	respondGauche2
		!output!  (J ai regarde seulement a gauche)
)

(P jumpToEnd3
	=goal>
		ISA		Decision
		state	respondDroite
==>
	=goal>
		state	respondGauche2
		!output!  (J ai regarde seulement deux fois sur les cotes)
)
;fin sauts d etapes

#|
voici le tableau des decisions :

		vitesse/distance D		e/e |	p/p	|	p/m	|	p/g	|	m/p	|	m/m	|	m/g	|	g/p	|	g/m	|	g/g
vitesse/distance G

				e/e				walk	run		walk	walk	stop	run		walk	stop	stop	run	
				p/p				run		run		run		run		stop	run		run		stop	stop	run
				p/m				walk	run		walk	walk	stop	run		walk	stop	stop	run
				p/g				walk	run		walk	walk	stop	run		walk	stop	stop	run
				m/p				stop	stop	stop	stop	stop	stop	stop	stop	stop	stop
				m/m				run		run		run		run		stop	run		run		stop	stop	run
				m/g				walk	run		walk	walk	stop	run		walk	stop	stop	run
				g/p				stop	stop	stop	stop	stop	stop	stop	stop	stop	stop
				g/m				stop	stop	stop	stop	stop	stop	stop	stop	stop	stop
				g/g				run		run		run		run		stop	run		run		stop	stop	run
|#

(P respond1
   =goal>
      ISA         Decision
      state       respondGauche2
	  vitesseG	  "empty"
	  vitesseD	  "empty"
==>
   =goal>
      state       respondCrossWalking
      !output!  (Je peux y aller en marchant il n y a pas de voitures)
)

(P respond2
   =goal>
      ISA         Decision
      state       respondGauche2
	  vitesseG	  PetiteV
	  distanceG	  PetiteD
==>
   =goal>
      state       respondCrossRunning
      !output!  (Je cours !)
)

(P respond3
   =goal>
      ISA         Decision
      state       respondGauche2
	  vitesseD	  PetiteV
	  distanceD	  PetiteD
==>
   =goal>
      state       respondCrossRunning
      !output!  (Je cours !)
)

(P respond4
   =goal>
      ISA         Decision
      state       respondGauche2
	  vitesseG	  MoyenneV
	  distanceG	  MoyenneD
==>
   =goal>
      state       respondCrossRunning
      !output!  (Je cours !)
)

(P respond5
   =goal>
      ISA         Decision
      state       respondGauche2
	  vitesseD	  MoyenneV
	  distanceD	  MoyenneD
==>
   =goal>
      state       respondCrossRunning
      !output!  (Je cours !)
)

(P respond6
   =goal>
      ISA         Decision
      state       respondGauche2
	  vitesseG	  GrandeV
	  distanceG	  GrandeD
==>
   =goal>
      state       respondCrossRunning
      !output!  (Je cours !)
)

(P respond7
   =goal>
      ISA         Decision
      state       respondGauche2
	  vitesseD	  GrandeV
	  distanceD	  GrandeD
==>
   =goal>
      state       respondCrossRunning
      !output!  (Je cours !)
)

(P respond8
   =goal>
      ISA         Decision
      state       respondGauche2
	  vitesseD	  PetiteV
	  distanceD	  GrandeD
	  vitesseG	  PetiteV
	  distanceG	  GrandeD
==>
   =goal>
      state       respondCrossWalking
      !output!  (Je traverse en marchant.)
)

(P respond9
   =goal>
      ISA         Decision
      state       respondGauche2
	  vitesseD	  MoyenneV
	  distanceD	  GrandeD
	  vitesseG	  MoyenneV
	  distanceG	  GrandeD
==>
   =goal>
      state       respondCrossWalking
      !output!  (Je traverse en marchant.)
)

(P respond10
   =goal>
      ISA         Decision
      state       respondGauche2
	  vitesseD	  PetiteV
	  distanceD	  MoyenneD
	  vitesseG	  PetiteV
	  distanceG	  MoyenneD
==>
   =goal>
      state       respondCrossWalking
      !output!  (Je traverse en marchant.)
)

(P respond11
   =goal>
      ISA         Decision
      state       respondGauche2
	  vitesseD	  MoyenneV
	  distanceD	  GrandeD
	  vitesseG	  PetiteV
	  distanceG	  GrandeD
==>
   =goal>
      state       respondCrossWalking
      !output!  (Je traverse en marchant.)
)

(P respond12
   =goal>
      ISA         Decision
      state       respondGauche2
	  vitesseD	  MoyenneV
	  distanceD	  GrandeD
	  vitesseG	  PetiteV
	  distanceG	  MoyenneD
==>
   =goal>
      state       respondCrossWalking
      !output!  (Je traverse en marchant.)
)

(P respond13
   =goal>
      ISA         Decision
      state       respondGauche2
	  vitesseD	  PetiteV
	  distanceD	  GrandeD
	  vitesseG	  MoyenneV
	  distanceG	  GrandeD
==>
   =goal>
      state       respondCrossWalking
      !output!  (Je traverse en marchant.)
)

(P respond14
   =goal>
      ISA         Decision
      state       respondGauche2
	  vitesseD	  PetiteV
	  distanceD	  MoyenneD
	  vitesseG	  MoyenneV
	  distanceG	  GrandeD
==>
   =goal>
      state       respondCrossWalking
      !output!  (Je traverse en marchant.)
)

(P respond15
   =goal>
      ISA         Decision
      state       respondGauche2
	  vitesseD	  PetiteV
	  distanceD	  GrandeD
	  vitesseG	  PetiteV
	  distanceG	  MoyenneD
==>
   =goal>
      state       respondCrossWalking
      !output!  (Je traverse en marchant.)
)

(P respond16
   =goal>
      ISA         Decision
      state       respondGauche2
	  vitesseD	  PetiteV
	  distanceD	  MoyenneD
	  vitesseG	  PetiteV
	  distanceG	  GrandeD
==>
   =goal>
      state       respondCrossWalking
      !output!  (Je traverse en marchant.)
)

(P respond17
   =goal>
      ISA         Decision
      state       respondGauche2
	  vitesseD	  "empty"
	  vitesseG	  PetiteV
	  distanceG	  GrandeD
==>
   =goal>
      state       respondCrossWalking
      !output!  (Je traverse en marchant.)
)

(P respond18
   =goal>
      ISA         Decision
      state       respondGauche2
	  vitesseD	  "empty"
	  vitesseG	  MoyenneV
	  distanceG	  GrandeD
==>
   =goal>
      state       respondCrossWalking
      !output!  (Je traverse en marchant.)
)

(P respond19
   =goal>
      ISA         Decision
      state       respondGauche2
	  vitesseD	  "empty"
	  vitesseG	  PetiteV
	  distanceG	  MoyenneD
==>
   =goal>
      state       respondCrossWalking
      !output!  (Je traverse en marchant.)
)

(P respond20
   =goal>
      ISA         Decision
      state       respondGauche2
	  vitesseD	  MoyenneV
	  distanceD	  GrandeD
	  vitesseG	  "empty"
==>
   =goal>
      state       respondCrossWalking
      !output!  (Je traverse en marchant.)
)

(P respond21
   =goal>
      ISA         Decision
      state       respondGauche2
	  vitesseD	  PetiteV
	  distanceD	  GrandeD
	  vitesseG	  "empty"
==>
   =goal>
      state       respondCrossWalking
      !output!  (Je traverse en marchant.)
)



(P respond22
   =goal>
      ISA         Decision
      state       respondGauche2
	  vitesseD	  PetiteV
	  distanceD	  MoyenneD
	  vitesseG	  "empty"
==>
   =goal>
      state       respondCrossWalking
      !output!  (Je traverse en marchant.)
)
;; fin decision

(P obtentionEnvGel
	=goal>
		ISA 		Decision
		state       respondCrossRunning
		Environnement =env
==>
	+retrieval> 	=env
	=goal>
		state 		gestionGel
)

(P obtentionClimatGel
	=goal>
		ISA 		Decision
		state		gestionGel
	=retrieval>
		ISA 		Environnement
		Climat		=climat
==>
	=retrieval> 	=climat
	=goal>
		state		gestionGel
)

(P responseGel
	=goal>
		ISA			Decision
		state		gestionGel
	=retrieval>
		ISA			Climat
		Gel			"oui"
==>
	=goal>
		state		respondWait
		!output!  (Mais comme le sol est gele je ne peux pas courir et je dois attendre.)
)
;; fin gestion gel





;; augmentation base levels des chunks de base necessaires au fonctionnement des procedures
(set-base-levels 
  (Env1 10) (Env2 10) (Env3 10) (Env4 10) (Env5 10) (Env6 10) (Feu1 10) (Feu2 10) (Feu3 10)
  (Route1 10) (Route2 10) (Climat1 10) (Climat2 10) 
  (Voiture1 10) (Voiture2 10) (Voiture3 10) (Voiture4 10) (Voiture5 10) (Voiture6 10) (Voiture7 10) (Voiture8 10) (Voiture9 10) (VoitureVide 10)
  (PetiteD 10) (MoyenneD 10) (GrandeD 10) (PetiteV 10) (MoyenneV 10) (GrandeV 10))

;; augmentation des niveaux d utilité pour favoriser les cas d arret pour cause de danger à la traversée
(spp stop1 :u 5)
(spp stop2 :u 5)
(spp stop3 :u 5)

(spp stop21 :u 5)
(spp stop22 :u 5)
(spp stop23 :u 5)

(spp stop31 :u 5)
(spp stop32 :u 5)
(spp stop33 :u 5)

;; settings des similarites entre chunks pour respresenter les erreurs d estimation
(Set-similarities
  (PetiteD MoyenneD -0.2) (PetiteD GrandeD -0.4) (MoyenneD GrandeD -0.2)
  (PetiteV MoyenneV -0.2) (PetiteV GrandeV -0.4) (MoyenneV GrandeV -0.2))
  
;; niveau d utilite des procedures afin de permettre le saut de procedures
 (spp jumpToEnd1 :u 2)
 (spp jumpToEnd2 :u 1.5)
 (spp jumpToEnd3 :u 1)
 (spp startGauche :u 5)
 (spp startDroite :u 5)
 (spp startGauche2 :u 5)


(goal-focus goal)

)
