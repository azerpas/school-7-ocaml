# CM2

## Listes
```py
let testListe = ["test"; "22"];;
let l1 = [];;
let l1 = 5 :: l1;;
l1;;
"Bonjour"::testListe;;
testListe;;
```

## Fonctions
- Head: premier élément
```py
List.hd[1;2;3];;
> int = 1
```
	- Exception si liste vide
- Tail: Reste de la liste
```py
List.tl["z";"d";"f"];;
> string list = ["d","f"]
```     
	- Exception si liste vide

## Itération
Toute liste peut être construite à partir de ligne vide: `nil`.     
### Conséquence
Lorsqu'on doit faire un calcul pour tous les éléments:
1. On définit le cas de la liste vide
2. On définit le calcul pour l'élément en tête
3. Le calcul consiste à appliquer le calcul pour l'élément en tête puis à recommencer sur le reste de la liste, jusqu'à ce que ce reste soit la liste vide
