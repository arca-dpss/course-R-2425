# Soluzioni
# VETTORI

# # 1. Crea un vettore "z" che comprenda i numeri da 1 a 7 
# 1.2 Estrai l'elemento centrale

z = 1:7; z
median(z)
z[(length(z)+1)/2]

# 2. Crea un vettore "y" che comprenda i numeri pari compresi tra 2 a 10, ( ?seq() )
y = seq(2,10,by=2); y
# numeri da 2 a 10, ogni 2

# 3. Crea un vettore "x" in cui il numero 3,4,5 vengono ripetuti 3 volte ciascuno ?rep()
x = rep(c(3,4,5),each = 3);x
# l'argomento each ripete tot volte il singolo elemento

# 4. Crea il vettore "s" in cui le lettere "A","B" e "C" 
# vengono ripetute nel medesimo ordine 4 volte ( ?rep() )
s = rep(c("A","B", "C"), times = 4); s
# argomento times ripete l'intero vettore

# 5. Crea un vettore "k" di lunghezza 3 e un vettore "j" di lunghezza 9.
#    Crea un vettore logico "f" dal vettore "k", in cui vi sia almeno un elemento "TRUE"  
#    ed utilizzalo per estrarre elmenti dal vettore "j"
#    Cosa succede?

k = 1:3; j = 1:9; f = k>2; j[f]
# il vettore logico viene ripetuto per la lunghezza di j, quindi 3 volte
# j[f] restituisce quindi 3 valori ogni volta che il valore è true 

# 4. Calcola media e deviazione standard del vettore p = c(1:10, NA)
p = c(1:10, NA); mean(p, na.rm = T); sd(p, na.rm = T)
# importanza di utilizzare l'arogmento na.rm

# 5. Sostituisci l'ultimo valore di "p" con la media degli elementi del vettore
# il comando length(p) ci fornisce la lunghezza del vettore cioè 11
length(p)
# possiamo quindi direttamente utilizzare la funzione per riferirci
p[length(p)]
# all'ultimo elemento, e assegnargli il valore medio di p
p[length(p)] = mean(p, na.rm = T)
p

# 6. Estrai tutti gli elemementi del vettore "p" tranne quelli alla posizione 3,4 e 8
p[-c(3,4,8)]
# indicizzazione negativa, basta appore il simbolo - 

# 7. Assegna dei nomi agli elementi del vettore "p"
# attaverso la funzione names
names(p) # gli elementi non hanno nome 
# attraverso questo comando estraggo 11 lettere
letters[1:length(p)] # length == lunghezza vettore p
names(p) = letters[1:length(p)]; 
attributes(p)

# 8. Genera il seguente vettore "q" scrivendo meno codice possibile
#[1] "A" "A" "A" "B" "B" "B" "A" "A" "A" "B" "B" "B"

q = rep(c("A","B"), each = 3, times = 2); q
# each = ogni elemento tot volte, times = quante volte 


# 9. Sostiuisci le "A" con "U"
q[q=="A"] # elementi di q uguali ad "A"
# inidicizzazione logica, sostituisco gli elementi di q == A con q
q[q=="A"] = "U"; q


# 10. Genera 1 codice univoco formati da id_string_num dove:
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

id = sample(1:10, size = 1) # numero casuale tra 1 e 10
string = paste0(sample(letters, size = 5), collapse = "")
nums = round(runif(1, min = 100, max = 999)) # oppure sample(100:999, size = 1)
# con sprintf
sprintf("%s_%s_%s", id, string, nums)
paste0(id, "_", string, "_", nums)

