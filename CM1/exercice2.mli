let isBissextile annee = 
    if(
        (annee mod 4 = 0 && annee mod 100 <> 0)  || 
        annee mod 400 <> 0) then
        true
    else
        false ;;