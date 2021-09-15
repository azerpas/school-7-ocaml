# let rec greatest l = 
    if l = [] then failwith "liste vide"
    else if (List.tl l) = [] then (List.hd l)
    else
        max (List.hd l) (greatest (List.tl l)) ;;