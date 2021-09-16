# let rec fusionne l1 l2 = 
    if (l1 = []) then l2
    else if (l2 = []) then l1
    else if ((List.hd l1) <= (List.hd l2)) then
        (List.hd l1)::(fusionne (List.tl l1) l2)
    else (List.hd l2)::(fusionne l1 (List.tl l2)) ;;