# Programmation fonctionnelle 1

## Factoriel 
```
let rec factoriel n = if n>1 then
            n * factoriel (n-1)
            else 1 ;;
``` 

## Conception d'une fonction
- Fonction = brique de base
- Étapes: 
    1. Spécification
    2. Algorithme 
    3. Code

## Spécification de la fonction factorielle 
- `types des arguments -> type du résultat`: `Entier -> Entier`
- `paramètres -> retourne`: `n -> factorielle de n`

## Algorithme
Comment obtenir le résultat ?
    - Souvent non-unique
    - Peut utiliser d'autres fonctions
    - **Indépendant des langages de prog**
    - Notation textuelle

### Exceptions
```
let head = function
    [] -> failwith "Empty list"
```

### Commentaires
```(* ceci est un commentaire *)```

### Install 
```
$ brew install ocaml
$ ocaml
# ...
```

## Exemples et arbres syntaxiques
### Différentes notations d'expressions 
- 1 expression (1 arbre), 3 notations: 
    - 12 + 4 * 5 : Notation infixée
    - 12 4 5 * + : Notation postfixée
    - + 12 * 4 5 : Notation préfixée

### Notations des opérateurs connus
- Opérateurs arithmétiques ou logiques binaires: *Notation infixée*

### Lambda expression

## Composition de fonctions
``` py
let f = function x -> 2*x+7 ;;
> val f : int -> int = <fun>

let g = function (x, y, z) -> x+y*z ;;
> val g : int * int * int -> int = <fun>

g(1,2,3) ;;
> int = 7

g(f(1), f(2), f(3)) ;;
```

## Variable
### Déclaration simultanées
``` py
let x = 2 and z = 4 ;;
```

### Environnement 
```py
Env = {(x, 3, int), (y, 2.1, float)}
```
```py
let x = 3 ;;
> Env = {(x, 3, int)}
let y = 10 in let x = 2 in y + x ;;
> Env = {(x, 3, int) {(y, 10, int) {(x, 2, int)}}}
> Env = {(x, 3, int)}
```

## Types
Types: int, float, char, string, bool    
Opérations entiers: + - * / mod     
Opérations réels: +. -. *. /. **
- string_of_int
- int_of_string

### Nouveaux types
```py
type jour = int ;; (* {1,..., 31} *)
type mois = Jan | Fev | ... | Dec ;;
type date = jour * mois * annee ;;
```

### n-uplets
```py
(heure, minute, seconde)
(nom, prenom, age)
(12, "octobre") ;;
> int * string = 12, "octobre"
(65, 'B', "ascii") ;;
> int * char * string = 65, 'B', "ascii"
```

### Listes
Seulement un type à la fois
```py
[1; 2; 3]
> int list = [1; 2; 3]
[1; "deux"; 3]
> ERROR
```