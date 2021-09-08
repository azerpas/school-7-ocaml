(* 
    Spécification: 
        - Entier -> Entier
        - n -> Calculer suite de fibonacci de n
 *)
let rec fibo n = if n = 0 then 0
    else if n = 1 then 1
    else fibo(n-1) + fibo(n-2) ;; 

let rec fibo2 n = match n with
    0 -> 0
  | 1 -> 1
  | n -> fibo2(n-1) + fibo2(n-2) ;; 