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