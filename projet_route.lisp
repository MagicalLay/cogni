(defvar *response* nil)

(defun decide()
  
  (reset)
  
  
  (let* ((lis (permute-list '("R" "V")))
         (text1 (first lis))
         (window (open-exp-window "Environnement")))
    
    (add-text-to-exp-window :text text1 :x 125 :y 150)
   
    (install-device window)
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
    
 (chunk-type Vehicule Type SendDeCirculation Distance Vitesse NumeroDeVoie Phares)
 (chunk-type Environnement Route Climat PassagePieton Feu)
 (chunk-type Route NombreDeVoies NombreSens)
 (chunk-type Climat Nuit Visibilite Gel)
 (chunk-type Feu Couleur)
 (chunk-type Decision state)

(add-dm
;(Voiture1 ISA Vehicule Type "normal" SendDeCirculation "gauche" Distance 80 Vitesse 50 NumeroDeVoie 1 Phares "E")
;(Env1 ISA Environnement Route Route1 Climat Climat1 PassagePieton "oui" Feu Feu1)
;(Route1 ISA Route NombreDeVoies 1 NombreSens 1)
;(Climat1 ISA Climat Nuit "non" Visibilite "ok" Gel "non")
;(Feu1 ISA Feu Couleur "vert")
(start ISA chunk) (attend ISA chunk)
 (respond ISA chunk) (done ISA chunk) (finFEU ISA chunk)
(goal ISA Decision state start)
)

(P start-environnement
   =goal>
      ISA         Decision
      state       start
 ==>
   +visual-location>
      ISA         visual-location
      :attended    nil
   =goal>
      state       find-location
)

(P analyse-env
   =goal>
      ISA         Decision
      state       find-location
   =visual-location>
      ISA         visual-location
   
   ?visual>
      state       free
   
==>
   +visual>
      ISA         move-attention
      screen-pos  =visual-location
   =goal>
      state       attend
)

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
)


(P respond1
   =goal>
      ISA         Decision
      state       respond
   =imaginal>
      isa         Feu
      Couleur      "v"
==>
   =goal>
      state       done
   !output!       (Le feu est vert!)
)

(P respond2
   =goal>
      ISA         Decision
      state       respond
   =imaginal>
      isa         Feu
      Couleur      "r"
==>
   =goal>
      state       done
   !output!       (Le feu est rouge!)
)



(goal-focus goal)




)

