# let rec separe l =
    if (l = [] || (List.tl l) = []) then (l, [])
    else 
        let (l1, l2) = separe (List.tl (List.tl l))
        in ((List.hd l)::l1, (List.hd (List.tl l))::l2) ;;