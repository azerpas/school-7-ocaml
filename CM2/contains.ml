# let rec contains x l = match l with
    [] -> false
    | e::q -> if e = x then true else contains x q;; 