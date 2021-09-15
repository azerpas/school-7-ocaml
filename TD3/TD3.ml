(*
      ------------------------------------------------
      @title Récursivité et liste
      @subtitle Appropriation du cours
      ------------------------------------------------
*)

# let rec nbOccurences e l = 
    if l = [] then 0
        else 
        if List.hd l = e then
                1 + nbOccurences e (List.tl l) 
        else 
                0 + nbOccurences e (List.tl l) ;;
(* val nbOccurences : 'a -> 'a list -> int = <fun> *)
# nbOccurences 3 [3;4;3] ;;
(* - : int = 2 *)

(** retireOccurence1() *)
# let rec removeElement x l = 
    if l = [] then l   
    else
        if (List.hd l) = x then (List.tl     l)
        else (List.hd l)::(removeElement x (Li  st.tl l)) ;;
(* val removeElement : 'a -> 'a list -> 'a list = <fun> *)
# removeElement 3 [4;3;5] ;;
(* - : int list = [4; 5] *)

(** plusGrand() *)
# let rec greatest l = 
    if l = [] then failwith   "liste vide"
    else if (List.tl l) = [] then (Li  st.hd l)
    else
        max (List.hd l) (greates    t (List.tl l)) ;;
(* val greatest : 'a list -> 'a = <fun> *)
# greatest [4;5;10;3;9] ;;
(* - : int = 10 *)



(*
      ------------------------------------------------
      @title Récursivité et liste
      @subtitle Problème 1
      ------------------------------------------------
*)

(*
    Spécification: sommeList1
        liste de type a' -> a'
        l -> somme de la liste l
 *)
# let rec sommeList1 l = 
    if l = [] then 0
    else (List.hd l) + sommeList1 (List.tl l) ;;
(* val sommeList1 : int list -> int = <fun> *)
# sommeList1 [4;3;5] ;;
(* - : int = 12 *)

(* 
    Spécification: mulScalaire
        liste de type float * float -> liste de type float
        l, lambda -> l
 *)
# let rec mulScalaire l lambda = 
    if l = [] then failwith "liste vide"
    else if (List.tl l) = [] then [(List.hd l) *. lambda]
    else (lambda *. (List.hd l))::(mulScalaire (List.tl l) lambda) ;;
(* val mulScalaire : float list -> float -> float list = <fun> *)
# mulScalaire [4.;3.] 2. ;;
(* - : float list = [8.; 6.] *)


(*
      ------------------------------------------------
      @title Récursivité et liste
      @subtitle Problème 2
      ------------------------------------------------
*)

(*
    sommeListe2
        liste de type int * liste de type int -> liste de type int
        l1, l2 ->  liste de sommes des éléments
 *)
# let rec sommeListe2 l1 l2 = 
    if l1 = [] || l2 = [] then failwith "l1 or l2 empty"
    else if (List.tl l1) = [] || (List.tl l2) = [] then [(List.hd l1)+(List.hd l2)]
    else ((List.hd l1)+(List.hd l2))::(sommeListe2 (List.tl l1) (List.tl l2)) ;;
(* val sommeListe2 : int list -> int list -> int list = <fun> *)
# sommeListe2 [3;4] [3] ;;
(* - : int list = [6] *)

(*
    sommeListe3 TODO:
        liste de type int * liste de type int -> liste de type int
        l1, l2 ->  liste de sommes des éléments
*)
# let rec sommeListe3 l1 l2 = 
    if l1 = [] && (List.tl l2) <> [] then (List.hd l2)::(sommeListe3 [] (List.tl l2))
    else if (List.tl l1) <> [] && l2 = [] then (List.hd l1)::(sommeListe3 (List.tl l1) [])
    else if (List.tl l1) = [] || (List.tl l2) = [] then [(List.hd l1)+(List.hd l2)]
    else ((List.hd l1)+(List.hd l2))::(sommeListe3 (List.tl l1) (List.tl l2)) ;;


(*
      ------------------------------------------------
      @title Récursivité et liste
      @subtitle Problème 3
      ------------------------------------------------
*)

(*
    equal
        liste de type int * liste de type int -> boolean
        l1, l2 ->  si L1 = L2
*)
# let rec equal l1 l2 = 
    if (l1 = [] && l2 <> []) || (l1 <> [] && l2 = []) then false (* si une des deux est vide *)
    else if l1 = [] && l2 = [] then true (* si les deux sont vides alors on est à la fin *)
    else if (List.hd l1) = (List.hd l2) then equal (List.tl l1) (List.tl l2) (* rang à rang *)
    else false ;; 
(* val equal : 'a list -> 'a list -> bool = <fun> *)
# equal [3] [3] ;;
(* - : bool = true *)
# equal [3;4] [3] ;;
(* - : bool = false *)

(*
    miroir
        liste de type 'a -> liste de type 'a
        l1 -> liste miroitée
 *)
# let rec miroir l1 = match (List.tl l1) with
    [] -> [(List.hd l1)] (** init *)
    | head::tail -> (miroir tail)@[head] ;; 