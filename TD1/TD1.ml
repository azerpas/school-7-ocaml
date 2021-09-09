(*
      ------------------------------------------------
      @title Premiers pas en Ocaml
      @subtitle Mes premières commandes en Ocaml
      ------------------------------------------------
*)

# 2 + 2;;
(* - : int = 4 *)
# "il etait " ^ "une fois";;
(* - : string = "il etait une fois" *)
# 29 / 4;;
(* - : int = 7 *)
# 29 /. 4;;
(* Error: This expression has type int but an expression was expected of type
         float
  Hint: Did you mean `29.'? *)
  (* Cette erreur est attendue, les nombres étant entiers, l'opérateur float n'est
  	pas accepté ici *)
# 29.0 /. 4.0;;
(* - : float = 7.25 *)
# 29 mod 4;;
(* - : int = 1 *)
# 0.5 + 20.2;;
(* Error: This expression has type float but an expression was expected of type
         int *)
   (* Cette erreur est attendue, les nombres étant float, l'opérateur entier n'est
  	pas accepté ici *) 
# 0.5 +. 20.2;;
(* - : float = 20.7 *)
# (42, 'A');;
(* - : int * char = (42, 'A') *)
# fst(42, 'A');; (* Renvoie le premier élément d'un couple *)
(* - : int = 42 *)
# snd(42, 'A');; (* Renvoie le second élément d'un couple *)
(* - : char = 'A' *)
# 2 = 2;;
(* - : bool = true *)
# 2 <> 2;;
(* - : bool = false *)
# 'a' = 'A';;
(* - : bool = false *)
# false || true;;
(* - : bool = true *)
# true && true;;
(* - : bool = true *)
# (2 = 3) || ('A'<> 'a'&& true);;
(* - : bool = true *)
# 1 ;; (* Commentaires *)
(* - : int = 1 *)
# [];;
(* - : 'a list = [] *)
# [1 ; 2 ; 3];;
(* - : int list = [1; 2; 3] *)

(* 
      ------------------------------------------------
      @subtitle Mes premières définitions en Ocaml
      ------------------------------------------------
*)

(*
      Définir x = 6
 *)
# let x = 1 + 2 + 3;;
(* val x : int = 6 ;; *)

(*
      x2 = 36
*)
# let x2 = x * x;;
(* val x2 : int = 36 ;; *)

# let a = 1 ;;
(* val a : int = 1 ;; *)
# let translation = fun x -> x + a ;; (* le paramètre 'x' est additionné à la variable 'a'  *)
(* val translation : int -> int = <fun> ;; *)

# translation 3;;
(* - : int = 4 ;; (* On obtient bien 3 + 1 = 4 *) *)
# let a = 2 ;;
val a : int = 2 ;; (* On redéfini a = 2 *)
# translation 3;; 
(* - : int = 4 ;; (* Mais le résultat est toujours 4 car 'translation' a été définie avec a = 1 *) *)

(* Pour les besoins de l'exercice j'ai remplacé 'x' par 't' ('x' ayant été définie auparavant) *)
# let t = 20 in t * 4;;
(* - : int = 80 ;; *)
# t;;
(* Error: Unbound value t *)
(* Résultat logique, 't' n'étant défini que dans le contexte du let *)

# let x = "Le langage " and x2 = " Ocaml" in x ^ x2;;
(* - : string = "Le langage  Ocaml" *)

(* 
      ------------------------------------------------
      @subtitle Mes premières fonctions en Ocaml
      ------------------------------------------------
*)

# let succ x = x + 1;;
(* val succ : int -> int = <fun> *)
# succ 2;;        
(* - : int = 3 *)

# let puissance4 x =
      let carre y = y * y in (* def locale d’une fonction *)
      carre (carre x);;  
(* val puissance4 : int -> int = <fun> *)
# puissance4 2;;
(* - : int = 16 *)

# let moyenne a b = (a +. b) /. 2.0;;
(* val moyenne : float -> float -> float = <fun> *)
# let moyenne2 (a, b) = (a +. b) /. 2.0;;
(* val moyenne2 : float * float -> float = <fun> *)
# moyenne 3.0 2.0;;
(* - : float = 2.5 *)
# moyenne 3.0;;
(* - : float -> float = <fun> *) (* Ne marche pas car moyenne nécessite deux paramètres distincts *)
# (moyenne 3.0) 2.0;;
(* - : float = 2.5 *) (* Marche car les parenthèses ne servent à rien ici *)
# moyenne (3.0, 2.0);; 
(* Error: This expression has type 'a * 'b
       but an expression was expected of type float *)
(* Ne marche pas car moyenne nécessite deux paramètres distincts et non un couple *)
# moyenne2 (3.0, 2.0);;
(* - : float = 2.5 *)
# moyenne2 3.0;;
(* Error: This expression has type float but an expression was expected of type
         float * float *)
(* Ne marche pas car moyenne2 nécessite un couple en paramètre *)

# let f = fun x1 -> (fun x2 -> fun x3 -> x1 * x2 - x3);;
(* val f : int -> int -> int -> int = <fun> *)
# f 2 4 6;;
(* - : int = 2 *)

# let f = fun x1 x2 x3 -> x1 * x2 - x3;;
(* val f : int -> int -> int -> int = <fun> *)
# f 2 4 6;;
(* - : int = 2 *)