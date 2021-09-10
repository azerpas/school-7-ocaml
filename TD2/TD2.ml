(*
      ------------------------------------------------
      @title Appropriation du cours
      ------------------------------------------------
*)

(*
    divisiblePar
    -- Spécification --
        Entier * Entier -> bool
        n * m -> n divisible par m
    -- Code --
 *)
# let divisiblePar nombre diviseur = (nombre mod diviseur) = 0 ;;
(** val divisiblePar : int -> int -> bool = <fun> *)
(* -- Application -- *)
# divisiblePar 4 2 ;;
(** - : bool = true *)
# divisiblePar 2 0;;
(** Exception: Division_by_zero. *)
(** Attendu, la division par zéro n'est pas possible *)
# divisiblePar 2 3 ;;
(** - : bool = false *)

(*
    isBissextile
    -- Spécification --
        Entier -> bool
        n -> divisible par 4 [OU] non divisible par 100 [OU] non divisible par 400
    -- Code --
 *)
# let isBissextile annee = 
    if(
        (annee mod 4 = 0 && annee mod 100 <> 0)  || 
        annee mod 400 <> 0) then
        true
    else
        false ;;
(** val isBissextile : int -> bool = <fun> *)
(* -- Application -- *)
# isBissextile 400 ;;
(* - : bool = false *)
# isBissextile 2014 ;;
(* - : bool = true *)

(*
    stringTestDiv
    -- Spécification --
        Entier * Entier -> string
        n * m -> n divisible par m
    -- Code --
 *)
# let stringTestDiv nombre diviseur =
    if (divisiblePar nombre diviseur) then
        "oui"
    else
        "non" ;;
(** val stringTestDiv : int -> int -> string = <fun> *)
(* -- Application -- *)
# stringTestDiv 4 2 ;;
(* - : string = "oui" *)
# stringTestDiv 2 3 ;;
(* - : string = "non" *)

(*
    secondeSuivante
    -- Spécification --
        (Entier * Entier * Entier) -> (Entier * Entier * Entier)
        (heure, minute, seconde) -> (heure_s, minute_s, seconde_s)
    -- Code --
 *)
 (** - Variante 1 *)
let secondeSuivante (heure, minute, seconde) = 
    (* Validate *)
    if(seconde > 59) then
        failwith "Mauvais format seconde"
    else if(minute > 59) then
        failwith "Mauvais format minute"
    else if(heure > 23) then
        failwith "Mauvais format heure"

    (* Increment *)
    if(seconde > 58) then
        if(minute > 58) then 
            if(heure > 22) then
                (0, 0, 0)
            else 
                (heure + 1, 0, 0)
        else 
            (heure, minute + 1, 0)
    else
        (heure, minute, seconde + 1) ;;
(** val secondeSuivante : int * int * int -> int * int * int = <fun> *)
(* -- Application -- *)
# secondeSuivante (10,50,20) ;;
(* - : int * int * int = (10, 50, 21) *)
# secondeSuivante (10,50,59) ;;
(* - : int * int * int = (10, 51, 0) *)
# secondeSuivante (10,59,59) ;;
(* - : int * int * int = (11, 0, 0) *)

(*
    add_Fraction
    -- Spécification --
        fraction * fraction -> fraction
        n1 * n2 -> somme de n1 et n2
    -- Code --
 *)