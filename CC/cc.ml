(*
      ------------------------------------------------
      @title Exercice 1 : Fonctions, conditions, structures
      @author Anthony Manikhouth LSI2
      ------------------------------------------------
*)

# let isBissextile annee = 
    if(
        (annee mod 4 = 0 && annee mod 100 <> 0)  || 
        annee mod 400 <> 0) then
        true
    else
        false ;;

(**
    estJourDansMois
        Entier * Entier -> boolean
        j * m -> est bien un jour dans le mois
*)
# let estJourDansMois j m = 
    (* Vérifications simple *)
    if((j > 31 || j < 1) || (m > 12 || m < 1)) then
        false
    else if(m = 2 && j > 28) then (* Cas bissextile février *)
        false
    else if((m = 4 || m = 6 || m = 9 || m = 11) && j > 30) then (* Mois avec 30 jours *)
        false
    else true ;;
(* val estJourDansMois : int -> int -> bool = <fun> *)
# estJourDansMois 28 1;;
(* - : bool = true *)
# estJourDansMois 31 4;;
(* - : bool = false *)
# estJourDansMois 18 13;;
(* - : bool = false *)
# estJourDansMois 0 4;;        
(* - : bool = false *)
# estJourDansMois 29 2 ;;
(* - : bool = false *)

(**
    dateValide
        Entier * Entier * Entier -> boolean
        j * m * a -> est bien une date valide
 *)

# let dateValide j m a =
    (* Vérifications simple *)
    if((j > 31 || j < 1) || (m > 12 || m < 1)) then
        false
    else if(m = 2 && j > (if (isBissextile a) then 29 else 28)) then (* Cas bissextile février *)
        false
    else if((m = 4 || m = 6 || m = 9 || m = 11) && j > 30) then (* Mois avec 30 jours *)
        false
    else true ;;
(* val dateValide : int -> int -> int -> bool = <fun> *)
# dateValide 18 11 2021;;
(* - : bool = true *)
# dateValide 18 13 2021;;
(* - : bool = false *)
# dateValide 31 11 2021;;
(* - : bool = false *)
# dateValide 29 2 2020;;
(* - : bool = true *)
# dateValide 29 2 2021;;
(* - : bool = false *)

(*
      ------------------------------------------------
      @title Exercice 2: Listes, Récursivité
      @author Anthony Manikhouth LSI2
      ------------------------------------------------
*)

(**
    appartient
        Entier * Liste Entier -> boolean
        x * l -> x dans l
 *)
# let rec appartient x l = match l with
    [] -> false
    | head::tail -> if head = x then 
                        true 
                    else appartient x tail ;; 
(* val appartient : 'a -> 'a list -> bool = <fun> *)
# appartient 3 [1;2;3] ;;
(* - : bool = true *)
# appartient 4 [1;2;5] ;;
(* - : bool = false *)

(**
    compte
        Entier * Liste Entier -> Entier
        x * l -> nombre de fois de x dans l
 *)
# let rec compte x l = 
    if l = [] then 0
    else 
        if List.hd l = x then
            1 + compte x (List.tl l) 
        else 
            0 + compte x (List.tl l) ;;
(* val compte : 'a -> 'a list -> int = <fun> *)
# compte 3 [1;2;3;3] ;;
(* - : int = 2 *)
# compte 3 [1;2;3] ;;
(* - : int = 1 *)