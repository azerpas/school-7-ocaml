# let rec somme l = 
    if l = [] then 0
    else (List.hd l) + somme(List.tl l) ;;