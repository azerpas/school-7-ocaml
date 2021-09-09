let divisiblePar nombre diviseur = (nombre mod diviseur) = 0 ;;

let afficheTestDiv nombre diviseur = 
    if(divisiblePar nombre diviseur) then
        "oui"
    else
        "non" ;; 