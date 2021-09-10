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
 (** - Variante 2 *)
# let secondeSuivante (heure, minute, seconde) =
    match (heure, minute, seconde)
    with (23, 59, 59) -> (0, 0, 0) 
        | (heure, 59, 59) -> (heure+1, 0, 0)
        | (heure, minute, 59) -> (heure, minute+1, 0)
        | (heure, minute, seconde) -> (heure,
        minute, seconde+1) ;;
(** val secondeSuivante : int * int * int -> int * int * int = <fun> *)
(* -- Application -- *)
# secondeSuivante (10,50,20) ;;
(* - : int * int * int = (10, 50, 21) *)

(*
    add_Fraction
    -- Spécification --
        fraction * fraction -> fraction
        n1 * n2 -> somme de n1 et n2
    -- Code --
 *)
# type fraction = {num: int; denum: int};;
(** type fraction = { num : int; denum : int; } *)
# let add_fraction r1 r2 = 
    {num = r1.num * r2.denum + r2.num * r1.denum ; 
        denum = r1.denum * r2.denum};;
(** val add_fraction : fraction -> fraction -> fraction = <fun> *)
(* -- Application -- *)
# add_fraction {num=1; denum=3} {num=2; denum=5};;
(* - : fraction = {num = 11; denum = 15} *)

(*
      ------------------------------------------------
      @title Problème 1
      ------------------------------------------------
*)

(*
    testEgalite1
    -- Spécification --
        fraction * fraction -> boolean
        f1 * f2 -> f1 et f2 sont égaux ?
    -- Code --
 *)
# let testEgalite1 f1 f2 = 
    if(f1.num = f2.num && f1.denum = f2.denum) then 
        true
    else
        false ;;
(** val testEgalite1 : fraction -> fraction -> bool = <fun> *)
(* -- Application -- *)
# testEgalite1 {num=1; denum=3} {num=1; denum=2};;
(* - : bool = false *)
# testEgalite1 {num=1; denum=3} {num=1; denum=3};;
(* - : bool = true *)