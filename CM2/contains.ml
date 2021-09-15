# let rec contains x l = match l with
    [] -> false
    | head::tail -> if head = x then true else contains x tail;; 