(*
    Spécification: removeElement
    T, Liste de T -> Liste de T
    o, l -> l sans première occurence de o
*)

# let rec removeElement x l = 
    if l = [] then l 
    else
        if (List.hd l) = x then (List.tl l)
        else (List.hd l)::(removeElement x (List.tl l)) ;;

# let rec removeElement2 x l = match l with 
    [] -> l
    | hd::tl -> if hd = x then tl
                else hd::removeElement2 x tl ;;