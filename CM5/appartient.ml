# type arbreBin =
    | Vide
    | Noeud of int * arbreBin * arbreBin ;

# let rec appartient e a = match a with
    Vide -> false
    | Noeud (x, l, r) -> (x = e) || (appartient e l) || (appartient e r) ;;