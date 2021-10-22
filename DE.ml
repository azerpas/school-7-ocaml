(*
    ALTN73-DE : Programmation Fonctionnelle / Scala 
    @author azerpas
*)

(*
      ------------------------------------------------
      @title ALTN73-DE : Programmation Fonctionnelle / Scala 
      @subtitle Exercice 1: Types simples / composés et expressions conditionnelles (5pts)
      @author azerpas
      ------------------------------------------------
*)

(** 1. *)
type date = {jour: int; mois: int; annee: int} ;;
let aujourdhui = {jour = 22; mois = 10; annee = 2021} ;;
(* val aujourdhui : date = {jour = 22; mois = 10; annee = 2021} *)

(** 2. *)
(* 
    bissextile
        int -> boolean
        annee -> si annee est bissextile
*)
let bissextile annee = 
    if((annee mod 4 = 0 && annee mod 100 <> 0)  ||  annee mod 400 <> 0) then
        true
    else
        false ;;
(* val bissextile : int -> bool = <fun> *)

(** 3. *)
(*
    joursMois
        int * int -> int
        mois * annee -> le nombre de jours dans le mois d'une année
*)
let joursMois mois annee =
    if(mois < 1 || mois > 12) then failwith "mois invalide"
    else
        if (bissextile annee) then
            if(mois = 2) then
                29
            else if(mois = 4 || mois = 6 || mois = 9 || mois = 11) then
                30
            else 31
        else 
            if(mois = 2) then
                28
            else if(mois = 4 || mois = 6 || mois = 9 || mois = 11) then
                30
            else 31 ;;
(* val joursMois : int -> int -> int = <fun> *)        

(** 4. *)
(*
    lendemain
        date -> date
        date -> lendemain du jour de la date
*)
let lendemain date =
    (* Vérifications *)
    if(date.jour > 31 || date.jour < 1) then failwith "jour invalide"
    else if (date.mois > 12 || date.mois < 1) then failwith "mois invalide"

    else
    (** 1. Passage au mois suivant *)
    if(date.jour = (joursMois date.mois date.annee)) then
        if(date.mois = 12) then (* Le changement de mois peut entraîner la nouvelle année... *)
            { jour = 1; mois =  1; annee = date.annee + 1 }
        else (* Nouveau mois *)
            { jour = 1; mois = date.mois + 1; annee = date.annee }
    (** 2. Changement de jour normal *)
    else 
        { jour = date.jour + 1; mois = date.mois; annee = date.annee } ;;
(* val lendemain : date -> date = <fun> *)
# lendemain {jour = 31; mois = 12; annee = 2021} ;;
(* - : date = {jour = 1; mois = 1; annee = 2022} *)

(*
      ------------------------------------------------
      @title ALTN73-DE : Programmation Fonctionnelle / Scala 
      @subtitle Exercice 2: Listes, fonctions sur listes et récursivité (5 pts)
      @author azerpas
      ------------------------------------------------
*)

(** 1.a. *)
(* 
    nbElm
        Liste de type 'a -> int
        l -> nombre des éléments de l
*)
let rec nbElm l = 
    if l = [] then 0
    else 1 + nbElm(List.tl l) ;;
(* val nbElm : 'a list -> int = <fun> *)

(** 1.b *)
(*
    somElm
        Liste de type int -> int
        l -> somme des éléments de l
*)
let rec somElm l = 
    if l = [] then 0
    else (List.hd l) + somElm(List.tl l) ;;
(* val somElm : int list -> int = <fun> *)

(** 1.c *)
(*
    moyElm
        Liste de type int -> float
        l -> moyenne des éléments de l
*)
let moyElm l = 
    if l = [] then 0
    else (somElm l) / (nbElm l) ;;
(* val moyElm : int list -> int = <fun> *)

(** 2. *)
(*
    enleve_element
        a' * Liste de type 'a -> Liste de type 'a
        x * l -> l sans la première occurence de x
*)
let rec enleve_element x l = match l with 
    [] -> l
    | head::tail -> if head = x then tail
                    else head::enleve_element x tail ;;
(* val enleve_element : 'a -> 'a list -> 'a list = <fun> *)
# enleve_element 2 [1;2;3;2;4;2] ;; 
(* - : int list = [1; 3; 2; 4; 2] *)

(* - Est-ce que c’est une récursivité terminale? Justifier. *)
(*** C'est une récursivité terminale car on "ajoute" toujours le head à la récursivité *)

(*
    enleve_tous_elements
        a' * Liste de type 'a -> Liste de type 'a
        x * l -> l sans tous les x
*)
let rec enleve_tous_elements x l = match l with
    [] -> l
    | head::tail -> if head = x then enleve_tous_elements x tail
                    else head::enleve_tous_elements x tail ;;
(* val enleve_tous_elements : 'a -> 'a list -> 'a list = <fun> *)
# enleve_tous_elements 2 [1;2;3;2;4;2] ;; 
(* - : int list = [1; 3; 4] *)

(*
      ------------------------------------------------
      @title ALTN73-DE : Programmation Fonctionnelle / Scala 
      @subtitle Exercice 3: Tris - Complexité  (5 pts)
      @author azerpas
      ------------------------------------------------
*)

(* On sait chercher le maximum d'une liste d'int , de float , de char ou de string. *)
(*
    greatest
        Liste de type 'a -> 'a
        l -> le max de l
*)
let rec greatest l = match l with
    | [] -> failwith "liste vide"
    | last::[] -> last
    | head::tail -> max head (greatest tail) ;;
(* val greatest : 'a list -> 'a = <fun> *)
# greatest [3;4;1;10;4] ;;
(* - : int = 10 *)

(* On  prend  le  premier  maximum  de  la  liste,  on  le  concatène  à  la  fin  de  de  liste  et  on 
rappelle la fonction sans oublier de retirer ce premier maximum de la liste de départ. *)
(* 
    tri
        Liste de type 'a -> Liste de type 'a
        l -> Liste triée par Maximum Successif
*)
let rec tri l = 
    if l = [] then failwith "liste vide"
    else 
        let biggest = (greatest l) in 
            (tri (enleve_element biggest l))@biggest ;;

let rec tri l = 
    if l = [] then failwith "liste vide"
    else 
        (tri (enleve_element (greatest l) l))@(greatest l) ;;

(*
      ------------------------------------------------
      @title ALTN73-DE : Programmation Fonctionnelle / Scala 
      @subtitle Exercice 4: Arbres : une autre structure de données récursive (5pts)
      @author azerpas
      ------------------------------------------------
*)
type arbreBin = 
    | Vide 
    | Noeud of int * arbreBin * arbreBin ;;

(** 1. *)
let a1 = 
    Noeud(
        2,
        Noeud(1, Vide, Vide),
        Noeud(
            3,
            Vide, 
            Noeud(4, Vide, Vide)
        )
    ) ;;
(* val a1 : arbreBin = Noeud (2, Noeud (1, Vide, Vide), Noeud (3, Vide, Noeud (4, Vide, Vide))) *)

let a2 = 
    Noeud(
        6,
        Noeud(
            2,
            Noeud(1, Vide, Vide),
            Noeud(
                3,
                Vide,
                Noeud(4, Vide, Vide)
            )
        ),
        Noeud(5, Vide, Vide)
    ) ;;
(* val a2 : arbreBin = Noeud (6, Noeud (2, Noeud (1, Vide, Vide), Noeud (3, Vide, Noeud (4, Vide, Vide))), Noeud (5, Vide, Vide)) *)

(** 2. *)
(*
    length
        Arbre binaire int -> int
        a  -> le nombre de noeuds de a
 *)
let rec length a = match a with 
    | Vide -> 0
    | Noeud (pere, fils1, fils2) -> 1 + length fils1 + length fils2 ;;
(* val length : arbreBin -> int = <fun> *)
# length a1 ;;
(* - : int = 4 *)
# length a2 ;;
(* - : int = 6 *)

(** 3. *)
(* a1 est un arbre binaire ordonné car 2 > 1 et 2 < 3 et que 3 < 4, les éléments de gauche sont toujours plus faibles que ceux de droite *)
(* a2 n'est pas un arbre binaire ordonné car 6 > 5 alors que 5 est le fils à droite de 6, la règle n'est pas respectée *)