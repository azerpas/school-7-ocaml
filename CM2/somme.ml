(*
    Spécification
    Somme : Liste de type  'a -> 'a
            l -> calculer la somme des éléments de l
 *)
# let rec somme l = 
    if l = [] then 0
    else (List.hd l) + somme(List.tl l) ;;