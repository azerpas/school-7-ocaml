(*
    Spécification
    T, Liste d'éléments de type T -> Entier
    e, l -> nombre d'apparitions de e dans l
 *)

# let rec nbOccurences e l = 
    if l = [] then 0
    else 
        if List.hd l = e then
            1 + nbOccurences e (List.tl l) 
        else 
            0 + nbOccurences e (List.tl l) ;;

# let rec nbOccurences2 e l = match l with 
    [] -> 0
    | hd::tl -> if hd = e then 1 nbOccurences2 e tl
                else 0 + nbOccurences2 e tl ;;