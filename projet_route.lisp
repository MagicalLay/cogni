(defvar *response* nil)

(defun decide()
  
  (reset)
  
  
<<<<<<< HEAD
  (let* (;(feu (permute-list '("R" "V" "non")))
		 ;(route (permute-list '("r1" "r2")))
		 ;(climat (permute-list '("cl" "cl2")))
		 ;(passage (permute-list '("oui" "non")))
		 (envir (permute-list '("env1" "env2" "env3")))
		 (voiture (permute-list '("voiture1" "voiture2" "voiture3")))
		 
      ;   (text1 (first feu))
		 ;(text2 (first route))
		 ;(text3 (first climat))
		 ;(text4 (first passage))
     (text4 (first voiture))
		 (text5 (second voiture))
		 (text6 (first envir))
         (windowEnv (open-exp-window "Environnement" :x 500 :y 50)))
         ;(windowG (open-exp-window "Gauche" :x 0 :y 50))
         ;(windowD (open-exp-window "Droite" :x 1000 :y 50)))
    
    (add-text-to-exp-window :text text6 :x 10 :y 150 :window windowEnv)    
    ;(add-text-to-exp-window :text text4 :x 100 :y 150 :window windowEnv)
    ;(add-text-to-exp-window :text text5 :x 200 :y 150 :window windowEnv)

 
=======
  (let* ((feu (permute-list '("R" "V" "non")))
		 (route (permute-list '("r1" "r2")))
		 (climat (permute-list '("cl" "cl2")))
		 (passage (permute-list '("oui" "non")))
		 (envir (permute-list '("env1" "env2" "env3")))
		 (voiture (permute-list '("Voit1" "Voit2" "Voit3")))
		 
         (text1 (first feu))
		 (text2 (first route))
		 (text3 (first climat))
		 (text4 (first passage))
		 (text5 (first voiture))
		 (text6 (first envir))
         (window (open-exp-window "Environnement")))
    
    (add-text-to-exp-window :text text6 :x 125 :y 150)
	;;(add-text-to-exp-window :text text2 :x 125 :y 150)
	;;(add-text-to-exp-window :text text3 :x 125 :y 150)
>>>>>>> origin/master
	
   
    ;(install-device windowG)
    ;(install-device windowD)
    (install-device windowEnv)

    (proc-display)

    (run 10 :real-time t))      
  )
(clear-all)

(define-model projet_route

;;paramètres globaux :
;;esc : Enable Subsymbolic Computations = True => pour utiliser le subsymbolique
;;rt : Retrieval Threshold => niveau d'activation de base en dessous duquel les chunks ne seront plus récupérés
;;v : Verbose => affiche les traces lors de l'exécution
;;ans : Activation Noise S => bruit ajouté aux chunks activés à chaque cycle
	(sgp :esc t :rt -.45 :v t :ans 0.5)
    
	
	
	
;; Tous les chunk-types, exceptés ceux à un attribut, ont comme attribut "nom" qui sert à les trouver
	
;;différentes valeurs voiture ===>
;;type : "normal", "electrique", "moto"
;;sensdecirculation : "gauche", "droite" (on s'interesse seulement aux vehicules venant vers nous)
;;distance/vitesse : "grande", "moyenne", "petite"
;;numerodevoie : (integer)
;;phares : "E", "A"
 (chunk-type Vehicule nomV Type SendDeCirculation Distance Vitesse NumeroDeVoie Phares)
 
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
 (chunk-type Decision state)
 
;;!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;;Ces valeurs peuvent être modifié DU MOMENT QUE vous modifiez le code pour gérer ces modifications !
;;!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!




(add-dm
(Voiture1 ISA Vehicule nomV "voiture1" Type "normal" SendDeCirculation "gauche" Distance "grande" Vitesse "grande" NumeroDeVoie 1 Phares "E")
(Voiture2 ISA Vehicule nomV "voiture2" Type "normal" SendDeCirculation "droite" Distance "moyenne" Vitesse "grande" NumeroDeVoie 1 Phares "A")
(Voiture3 ISA Vehicule nomV "voiture3" Type "electrique" SendDeCirculation "gauche" Distance "petite" Vitesse "moyenne" NumeroDeVoie 1 Phares "E")

(Env1 ISA Environnement nomE "env1" Route Route1 Climat Climat1 PassagePieton "non" Feu "non")
(Env2 ISA Environnement nomE "env2" Route Route2 Climat Climat2 PassagePieton "oui" Feu "rouge")
(Env3 ISA Environnement nomE "env3" Route Route2 Climat Climat2 PassagePieton "oui" Feu "vert")

(Route1 ISA Route nomR "route1" NombreDeVoies 1 NombreSens "un")
(Route2 ISA Route nomR "route2" NombreDeVoies 1 NombreSens "deux")

(Climat1 ISA Climat nomC "climat1" Nuit "non" Visibilite "bonne" Gel "non")
(Climat2 ISA Climat nomC "climat2" Nuit "oui" Visibilite "bonne" Gel "non")

(Feu1 ISA Feu Couleur "vert")
(Feu2 ISA Feu Couleur "rouge")
(Feu3 ISA Feu Couleur "non")

<<<<<<< HEAD
(start ISA chunk) (find-locationEnv ISA chunk) (attendEnv ISA chunk) 
(researchFeu ISA chunk) (respondEnv ISA chunk) (doneEnv ISA chunk) 
(find-locationGauche ISA chunk) (attendGauche ISA chunk) (researchGauche ISA chunk)
(respondGauche ISA chunk) (startGauche ISA chunk)
=======
(start ISA chunk) (attend ISA chunk) (researchFeu ISA chunk)
 (respond ISA chunk) (done ISA chunk) (finFEU ISA chunk)
>>>>>>> origin/master
(goal ISA Decision state start))

(P start-environnement
   =goal>
      ISA         Decision
      state       start
 ==>
   +visual-location>
      ISA         visual-location
      :attended    nil
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
<<<<<<< HEAD
      state       attendEnv
=======
      state       attend
>>>>>>> origin/master
   =visual>
      ISA         text
      value       =name
==>
   =goal>
      state       researchFeu
   +retrieval>
      isa         Environnement
      nomE      =name
)

#|
(P save-env
   =goal>
      ISA         Decision
      state       attend
   =visual>
      ISA         text
      value       =letter
   ?imaginal>
      state       free
==>
   =goal>
      state       respond
   +imaginal>
      isa         Feu
      Couleur      =letter
)|#


(P researchEnv
   =goal>
      ISA         Decision
      state       researchFeu
   =retrieval>
      isa         Environnement
      Feu			=fire
   ?imaginal>
      state       free
==>
   =goal>
<<<<<<< HEAD
      state       respondEnv
=======
      state       respond
>>>>>>> origin/master
   +imaginal>
      isa         Feu
      Couleur      =fire
)

(P respond1
   =goal>
      ISA         Decision
      state       respondEnv
   =imaginal>
      isa         Feu
      Couleur      "vert"
==>
   =goal>
      state       doneEnv
   !output!       (Le feu est vert!)
)

(P respond2
   =goal>
      ISA         Decision
      state       respondEnv
   =imaginal>
      isa         Feu
      Couleur      "rouge"
==>
   =goal>
      state       doneEnv
   !output!       (Le feu est rouge!)
)

(P stop-noFeu
   =goal>
      ISA         Decision
<<<<<<< HEAD
      state       respondEnv
=======
      state       respond
>>>>>>> origin/master
   =imaginal>
      ISA         Feu
      Couleur       "non"
==>
   =goal>
<<<<<<< HEAD
      state       doneEnv
   !output!       (Il n'y a pas de feu!)
)

#|(P startGauche
  =goal>
    ISA           Decision
    state         doneEnv
==>
  =goal>
   state          startGauche
  +visual-location>
      ISA         visual-location
      :attended    nil

)
=======
      state       done
   !output!       (Il n'y a pas de feu!)
)
>>>>>>> origin/master

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
   state          find-locationGauche
  +visual>
      ISA         move-attention
      screen-pos  =visual-location
)
(P analyse-Gauche
   =goal>
      ISA         Decision
      state       find-locationGauche
   =visual-location>
      ISA         visual-location
   ?visual>
      state       free
==>
   +visual>
      ISA         move-attention
      screen-pos  =visual-location
   =goal>
      state       attendGauche
)

(P save-gauche
   =goal>
      ISA         Decision
      state       attendGauche
   =visual>
      ISA         text
      value       =name
==>
   =goal>
      state       researchGauche
   +retrieval>
      isa         Vehicule
      nomV      =name
)

(P researchVehiculeGauche
   =goal>
      ISA         Decision
      state       researchGauche
   =retrieval>
      isa         Vehicule
      nomV     =voitGauche
      Type      =type
      Distance  =distance
      Vitesse   =vitesse
==>
   =goal>
      state       respondGauche
      !output!  (A gauche je vois une voiture de type =type qui roule à =vitesse vitesse et qui se situe à une distance =distance)
)|#

(goal-focus goal)

)
