let secondeSuivante (heure, minute, seconde) = 
    (* Validate *)
    if(seconde > 59) then
        failwith "Mauvais format seconde"
    else if(minute > 59) then
        failwith "Mauvais format minute"
    else if(heure > 23) then
        failwith "Mauvais format heure"

    (* Increment *)
    if(seconde > 58) then
        if(minute > 58) then 
            if(heure > 22) then
                (0, 0, 0)
            else 
                (heure + 1, 0, 0)
        else 
            (heure, minute + 1, 0)
    else
        (heure, minute, seconde + 1) ;;