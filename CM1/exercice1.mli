let inBetween nombre petit grand = 
    if(petit > grand) then
        failwith "Le second paramètre doit être plus petit que le troisième"
    else if (nombre > petit && nombre < grand) then
        true
    else 
        false ;;