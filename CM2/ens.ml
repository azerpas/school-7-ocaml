# let rec listeToEnsb l = match l with 
    [] -> []
    | a::[] -> l
    | o::r -> if(contains o r) then listeToEnsb r
                else o::listeToEnsb r ;;