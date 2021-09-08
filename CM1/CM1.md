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