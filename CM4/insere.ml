# let rec insere x l = 
    if l = [] then [x]
    else if ((List.hd l) > x) then x::l
        else (List.hd l)::(insere x (List.tl l)) ;;