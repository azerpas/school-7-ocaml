let rec tri_insertion l = match l with
    []      -> l
    | h::[] -> l
    | h::t  -> insere h tri_insertion t ;; 