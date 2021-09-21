(*
      ------------------------------------------------
      @title Arbres binaires
      @subtitle Préalables
      ------------------------------------------------
*)

type 'a arbreBin = Vide | Noeud of 'a arbreBin * 'a * 'a arbreBin | Feuille of 'a;;

(** a1 *)
let a1 = Noeud(
    Noeud(
        Feuille 3,
        1,
        Noeud(
            Feuille 6,
            4,
            Feuille 7
        )
    ),
    0,
    Noeud(
        Vide,
        2,
        Noeud(
            Feuille 9,
            5,
            Feuille 8
        )
    )
) ;;

(** a2 *)
let a2 = Noeud(
    Noeud(
        Feuille 2,
        4,
        Feuille 8
    ),
    16,
    Feuille 32
);;

(*
    taille
        Arbre binaire étiqueté -> Entier
        a  ->  n, le nombre de noeuds de a
 *)
let rec taille a = match a with 
    | Vide -> 0
    | Feuille f -> 1
    | Noeud (fils1, pere, fils2) -> 1 + taille fils1 + taille fils2 ;;
(* val taille : 'a arbreBin -> int = <fun> *)
# taille a1 ;;
(* - : int = 10 *)

(*
    hauteur
        Arbre binaire étiqueté -> Entier
        a ->  n, le nombre de niveaux dans a
 *)
let rec hauteur a = match a with 
    | Vide -> -1
    | Feuille f -> 1
    | Noeud (fils1, pere, fils2) -> 1 + max(hauteur fils1) (hauteur fils2) ;;
(* val hauteur : 'a arbreBin -> int = <fun> *)
# hauteur a1 ;;
(* - : int = 4 *)
# hauteur a2;;
(* - : int = 3 *)

(*
    recherche 
        Entier, ArbreBin -> booléen
        e, a -> true si e est une étiquette de a,faux sinon
 *)
let rec recherche e a = match a with
    | Vide -> false
    | Feuille f -> e = f
    | Noeud (fils1, pere, fils2) -> (pere = e) || (appartient e fils1) || (appartient e fils2) ;;
(* val recherche : 'a -> 'a arbreBin -> bool = <fun> *)
# recherche 10 a1;;
(* - : bool = false *)

(*
    equilibre
        ArbreBin -> boolean
        a -> si l'arbre binaire est équilibré
 *)
let rec equilibre a = match a with
    | Vide -> true
    | Noeud (fils1, pere, fils2) -> 
        if ( ((hauteur fils1)-(hauteur fils2)) >= 0 && ((hauteur fils1)-(hauteur fils2)) <= 1 ) 
        && ((equilibre fils1) = (equilibre fils2)) 
            then true else false ;;
(* val equilibre : 'a arbreBin -> bool = <fun> *)
# equilibre a1 ;;
(* - : bool = false *)
# equilibre a2 ;;
(* - : bool = true *)

(*
      ------------------------------------------------
      @title Arbres binaires
      @subtitle Problème 1
      ------------------------------------------------
*)

(*
    1.
    somme TODO:
        ArbreBin -> Entier
        a -> somme des noeuds
*)
let somme a = match a with 
    | Vide -> 0
    | Feuille f -> f
    | Noeud (fils1, pere, fils2) -> pere + (somme_term fils1) + (somme_term fils2) ;;
(* val somme : int arbreBin -> int = <fun> *)
# somme a1 ;;
(* - : int = 45 *)
 
(*
    somme_term
        ArbreBin -> Entier
        a -> somme des noeuds
*)
let rec somme_term a = ;;
(* val somme_term : int arbreBin -> int = <fun> *)
# somme_term a1 ;;
(* - : int = 45 *)

(*
    2.
    max_a
        ArbreBin -> Entier
        a -> Entier maximum de a 
*)
let rec max_a a = match a with 
    | Vide -> 0
    | Feuille f -> f
    | Noeud (fils1, pere, fils2) -> max pere (max (max_a fils1) (max_a fils2)) ;;
(* val max_a : int arbreBin -> int = <fun> *)
# max_a a1 ;;
(* - : int = 9 *)

(*
    3.
    complet
        ArbreBin -> boolean
        a ->  si arbre est complet
*)
let rec complet a = match a with 
    | Vide -> false
    | Feuille f -> true
    | Noeud (fils1, pere, fils2) -> if (complet fils1) && (complet fils2) then true else false ;;
(* val complet : 'a arbreBin -> bool = <fun> *)
# complet a1 ;;
(* - : bool = false *)
# complet a2 ;;
(* - : bool = true *)

(*
    4.
    parfait
        ArbreBin -> boolean
        a ->  si arbre est parfait (complet et équilibré)
*)
let parfait a = (complet a) && (equilibre a) ;;
(* val parfait : 'a arbreBin -> bool = <fun> *)
# parfait a1;;
(* - : bool = false *)
# parfait a2;;
(* - : bool = true *)

(*
    5.
    miroir
        ArbreBin -> ArbreBin
        a -> miroir de a
 *)
let rec miroir a = match a with
    | Vide -> Vide
    | Feuille f -> Feuille f
    | Noeud (fils1, pere, fils2) -> Noeud ((miroir fils2), pere, (miroir fils1)) ;;
(* val miroir : 'a arbreBin -> 'a arbreBin = <fun> *)
# miroir a1 ;;
(* - : int arbreBin =
Noeud (Noeud (Noeud (Feuille 8, 5, Feuille 9), 2, Vide), 0,
 Noeud (Noeud (Feuille 7, 4, Feuille 6), 1, Feuille 3)) *)


(*
      ------------------------------------------------
      @title Arbres binaires
      @subtitle Problème 2
      ------------------------------------------------
*)

type 'a elem_arbre = N of 'a | F of 'a | V ;;

(*
    1.
    prefixe
        ArbreBin -> List 'a
        a -> Liste du parcours en préfixe
 *)
let rec prefixe a = match a with 
    | Vide -> [V]
    | Feuille f -> [F f]
    | Noeud (g, x, d) -> [N x]@(prefixe g)@(prefixe d) ;;
(* val prefixe : 'a arbreBin -> 'a elem_arbre list = <fun> *)
# prefixe a1;;
(* - : int elem_arbre list = 
[N 0; N 1; F 3; N 4; F 6; F 7; N 2; V; N 5; F 9; F 8] *)

(*
    1.
    infixe
        ArbreBin -> List 'a
        a -> Liste du parcours en infixe
*)
let rec infixe a = match a with 
    | Vide -> [V]
    | Feuille f -> [F f]
    | Noeud (g, x, d) -> (infixe g)@[N x]@(infixe d) ;;

(*
    1.
    postfixe
        ArbreBin -> List 'a
        a -> Liste du parcours en postfixe
*)
let rec postfixe a = match a with 
    | Vide -> [V]
    | Feuille f -> [F f]
    | Noeud (g, x, d) -> (postfixe g)@(postfixe d)@[N x] ;;