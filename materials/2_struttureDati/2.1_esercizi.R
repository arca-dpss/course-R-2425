#   VETTORI 

# 1. Crea un vettore "z" che comprenda i numeri da 1 a 7 
# 1.2 Estrai l'elemento centrale

# 2. Crea un vettore "y" che comprenda i numeri pari compresi tra 1 a 10, ( ?seq() )

# 3. Crea un vettore "x" in cui il numero 3,4,5 vengono ripetuti 3 volte ciascuno ?rep()

# 4. Crea il vettore "s" in cui le lettere "A","B" e "C" 
# vengono ripetute nel medesimo ordine 4 volte ( ?rep() )

# 5. Crea un vettore "k" di lunghezza 3 e un vettore "j" di lunghezza 9.
#    Crea un vettore logico "f" dal vettore "k", in cui vi sia almeno un elemento "TRUE"  
#    ed utilizzalo per estrarre elmenti dal vettore "j"
#    Cosa succede?

k = 1:3
j = 2:10
f = k < 2
f

j[f]
# 4. Calcola media e deviazione standard del vettore p = c(1:10, NA)

# 5. Sostituisci l'ultimo valore di "p" con la media degli elementi del vettore

# 6. Estrai tutti gli elemementi di "p" tranne quelli alla posizione 3,4 e 8

# 7. Assegna dei nomi agli elementi del vettore "p"

# 8. Genera il seguente vettore "q" scrivendo meno codice possibile
#[1] "A" "A" "A" "B" "B" "B" "A" "A" "A" "B" "B" "B"

# 9. Sostiuisci le "A" con "U"

# 10. Spesso è necessario creare delle stringhe random per codificare un partecipante 
# in modo univoco ma senza usare informazioni sensibili. 

# Genera 1 codice univoco formati da id_string_num dove:
# - id è un numero casuale tra 1 e 10 (runif)
# - string è una stringa formata da 5 lettere casuali ( sample(letters,...)
# - nums è un numero casuale tra 100 e 999 
#  Ad esempio 1_adrtv_100 è un id valido.

# Tips: - vedi la funzione sample o runif e round per generare i numeri 
#- vedi l’oggetto letters già disponibile in R - vedi la funzione paste0() o sprintf()

# Genera 1 codice univoco formati da id_string_num dove:
# - id è un numero casuale tra 1 e 10 (runif)
# - string è una stringa formata da 5 lettere casuali ( sample(letters,...)
# - nums è un numero casuale tra 100 e 999 
#  Ad esempio 1_adrtv_100 è un id valido.

# Tips: - vedi la funzione sample o runif e round per generare i numeri 
#- vedi l’oggetto letters già disponibile in R - vedi la funzione paste0() o sprintf()

id=round(runif(1,1,10))
id
str=sample(letters[1:5])
str
d=100:999
num=sample(d,1)
num
id_p=c(id,str,num)
id_p
id_p_singolo <- paste(id_p, collapse = "")
id_p_singolo

