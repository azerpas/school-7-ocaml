(*
      ------------------------------------------------
      @title Ensemble ordonnés et opérations ensemblistes
      @subtitle Problème 1
      ------------------------------------------------
*)

(** 1.a *)
(* 
    estTriee
        liste d'entiers -> boolean
        l -> si l est triée
 *)
# let rec estTriee l = match l with
    [] -> true
    | _::[] -> true 
    | x::y::tail -> if x <= y then estTriee tail else false ;;

(** 1.b *)
(*
    estEnsemble
        liste d'entiers -> boolean
        l -> si l est sans doublon
*)
# let rec estEnsemble l = match l with 
    [] -> true
    | _::[] -> true 
    | x::y::tail -> if (x <> y) then
                        if tail <> [] then 
                            if y <> (List.hd tail) then estEnsemble tail
                            else false
                        else true
                    else false ;;
(* val estEnsemble : 'a list -> bool = <fun> *)
# estEnsemble [3;4] ;;
(* - : bool = true *)
# estEnsemble [3;4;4] ;;
(* - : bool = false *)
# estEnsemble [4;4] ;;
(* - : bool = false *)

(** 1.c *)
(*
    estEnsembleOrdonne
        liste d'entiers -> boolean
        l -> si est un ensemble ordonne
*)
# let rec estEnsembleOrdonne l = (estEnsemble l) && (estTriee l) ;;
(* val estEnsembleOrdonne : 'a list -> bool = <fun> *)
# estEnsembleOrdonne [3;4;5] ;;
(* - : bool = true *)
# estEnsembleOrdonne [3;3;4;5] ;;
(* - : bool = false *)

(** 2.a *)
(*
    last
        liste a' -> 'a
        l -> dernier élément de l
 *)
# let rec last l = match l with
    [] -> failwith "Liste vide"
    | lastEl::[] -> lastEl
    | _::tail -> last tail ;;
(* val last : 'a list -> 'a = <fun> *)
# last [4;5;6] ;;
(* - : int = 6 *)
# last [4;5] ;;
(* - : int = 5 *)

(** 2.b *)
(*
    alea
        int * int -> int
        k, sup -> nombre aléatoire entre k et sup
 *)
# let rec alea k sup = 
    if k > sup then failwith "k > sup; please change"
    else 
        let b = Random.int sup in 
            if b > k then b
            else 
                if b+k <= sup then b+k
                else alea k sup ;;
(* val alea : int -> int -> int = <fun> *)
# alea 10 15 ;;
(* - : int = 11 *)
# alea 10 11 ;;
(* - : int = 10 *)

(** 2.c *)
let rec listAlea n = ;;

(*
      ------------------------------------------------
      @title Ensemble ordonnés et opérations ensemblistes
      @subtitle Problème 2
      ------------------------------------------------
*)

# let e1 = [0;1;2;3;5;6;7;9] ;;
# let e2 = [2;3;4;8;9] ;;

(** Fonctions utilisées *)
# let rec contains x l = match l with
    [] -> false
    | head::tail -> if head = x then true else contains x tail ;; 
# let rec insere x l = 
    if l = [] then [x]
    else if ((List.hd l) > x) then x::l
        else (List.hd l)::(insere x (List.tl l)) ;;
# let rec removeElement x l = 
    if l = [] then l   
    else
        if (List.hd l) = x then (List.tl     l)
        else (List.hd l)::(removeElement x (List.tl l)) ;;

(* 
    1.
    intersection
        liste d'entier * liste d'entier -> l
        l1 * l2 -> l'intersection des deux
 *)
# let rec intersection l1 l2 = 
    if l1 = [] then []
    else 
        if contains (List.hd l1) l2 then (List.hd l1)::(intersection (List.tl l1) l2) 
        else (intersection (List.tl l1) l2) ;;
(* val intersection : 'a list -> 'a list -> 'a list = <fun> *)
# intersection e1 e2 ;;
(* - : int list = [2; 3; 9] *)

(*
    2.
    union
        liste d'entier * liste d'entier -> l
        l1 * l2 -> l'union des deux

    On va prendre l2 comme liste de retour,
    c.a.d qu'on va lui ajouter tous les éléments 
    présents dans l1 mais pas dans l2.
    Une fois que l1 est vide on renvoie l2.
 *)
# let rec union l1 l2 =
    if l1 = [] then l2
    else if contains (List.hd l1) l2 then 
        union (List.tl l1) l2 (* on passe au suivant *)
    else
        (union (List.tl l1) (insere (List.hd l1) l2)) ;;
(* val union : 'a list -> 'a list -> 'a list = <fun> *)
# union e1 e2 ;;
(* - : int list = [0; 1; 2; 3; 4; 5; 6; 7; 8; 9] *)

(*
    3.
    difference
       liste d'entier * liste d'entier -> l
        l1 * l2 -> la différence de l1 par l2
 *)
# let rec difference l1 l2 = 
    if l2 = [] then l1
    else if contains (List.hd l2) l1 then
        (difference (removeElement (List.hd l2) l1) (List.tl l2))
    else 
        difference l1 (List.tl l2) ;;
(* val difference : 'a list -> 'a list -> 'a list = <fun> *)
# difference e1 e2 ;;
(* - : int list = [0; 1; 5; 6; 7] *)

(*
    3.
    diff_sym
        liste d'entier * liste d'entier -> l
        l1 * l2 -> les éléments dans l1 ou l2 mais pas dans les deux
 *)
# let rec diff_sym l1 l2 = 
    if l2 = [] then l1
    else if contains (List.hd l2) l1 then
        (diff_sym (removeElement (List.hd l2) l1) (List.tl l2))
    else 
        (* si l'élément de l2 n'est pas présent dans l1, on l'ajoute *)
        diff_sym (insere (List.hd l2) l1) (List.tl l2) ;; 
(* val difference : 'a list -> 'a list -> 'a list = <fun> *)
# diff_sym e1 e2 ;;
(* - : int list = [0; 1; 4; 5; 6; 7; 8] *)