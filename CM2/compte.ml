(* 
    Spécification
    Compte: Liste de type 'a -> int
            l -> calculer le nombre d'éléments
 *)

# let rec compte l = 
    if l = [] then 0
    else 1 + compte(List.tl l) ;;


# let rec nbEls l = match l with
    [] -> 0
    | l -> 1 + nbEls(List.tl l) ;;