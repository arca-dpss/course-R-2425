# Esericizi riassuntivi prima lezione

# Creazione di ogetti e operatori ----------------------------------------

# 1. Crea gli oggetti a e b assegnando loro il valore 15 e 5 rispettivamente
a = 15
b = 5

# 1.1. Verifica se a è divisibile per b
a %% b == 0

# 2. Crea un’espressione per verificare se un numero 
# n è negativo o è maggiore di 10. 
# Testa l’espressione con n = -5, n = 11 e n = 0.
# n = ? 
# Verifica
condizione = (n < 0) | (n > 10)

# 3. Hai due vettori altezza e peso. 
# Determina se un valore di peso è inferiore a 50 o 
# se l’altezza è maggiore di 1.80.
# Definizione dei dati
altezza = c(1.75, 1.82, 1.68, 1.90)
peso = c(48, 75, 49, 88)

# Verifica delle condizioni
(peso < 50) | (altezza > 1.80)

# 4. Definisci un’espressione per verificare se un numero y 
# appartiene all’intervallo [5, 15] oppure [20, 25]. 
# Testa con y = 10, y = 18 e y = 23.
y = 10
y%in%c(5:15) | y%in%c(20:25) #  è possibile utilizzare l'operatore %in% inclusione

# 5. Hai un vettore di numeri vet_num = c(2, 4, 6, 8, 10). 
# Scrivi un’espressione per verificare se un numero x 
# appartiene a questo vettore. 
# Testa con x = 4, x = 7 e x = 10.

# Definizione del vettore
vet_num = c(2, 4, 6, 8, 10)

# Definizione del numero da testare
x = 4

# Verifica con %in%
x %in% vet_num



# Vettori -----------------------------------------------------------------

# 1. Crea un vettore v contenente i numeri decrescenti da 10 a 1.
# 1.1 Estrai il primo e l'ultimo elemento di v.
# 1.2 Trova la somma di tutti gli elementi di v.

v = 10:1; v
v[1]; # primo 
v[length(v)] # ultimo 
sum(v) # somma

# 2. Vettore di numeri dispari
# Crea un vettore "odd" che contenga i numeri dispari tra 1 e 15 
# utilizzando la funzione seq().
odd = seq(1, 15, by = 2); odd

# 3. Genera un vettore "w" in cui le stringhe "X", "Y", "Z" 
# sono ripetute rispettivamente 2, 3 e 4 volte. ?rep()
w = c(rep("X", 2), rep("Y", 3), rep("Z", 4)); w

# 3.1 Ordina gli elementi di w in ordine alfabetico. ?sort
sort(w)

# 4. Crea un vettore num con i valori da 1 a 10.
# 4.1 Sostituisci tutti i numeri divisibili per 3 con il valore NA.
# 4.2 Calcola la media degli elementi di num, escludendo i valori NA.

num = 1:10; 
num
# se il resto del numero / 3 è uguale a 0 allora assegno NA
num[num %% 3 == 0] = NA
num
mean(num, na.rm = TRUE)

# 5. Crea un vettore rep_num che ripete il pattern di numeri 1, 2, 3 5 volte.
# 5.1 Cambia l'ordine degli elementi in modo che il vettore 
# sia in ordine decrescente.

rep_num = rep(c(1, 2, 3), times = 5)
rep_num
sort(rep_num, decreasing = TRUE) # ?sort


# Fattori ---------------------------------
# 1. Crea un fattore animali con i livelli "cane", "uccello", e "pesce", ciascuno ripetuto 4 volte.
# 1.1 Visualizza i livelli del fattore.
# 1.2 Cambia i livelli in "mammifero", "volatile", "acquatico".

animali = factor(rep(c("cane", "uccello", "pesce"), each = 4))
animali
levels(animali)
levels(animali) = c("mammifero", "volatile", "acquatico")
animali


# 2. Crea un fattore colori con i livelli "rosso", "verde", "blu", "giallo", ciascuno ripetuto 3 volte.
# 2.1 Rimuovi gli elementi con livello "giallo".
# 2.2 Usa droplevels() per eliminare i livelli inutilizzati.

colori = factor(rep(c("rosso", "verde", "blu", "giallo"), each = 3)); colori
colori = colori[colori != "giallo"] # tengo tutti gli elementi diversi da giallo
colori
colori = droplevels(colori); colori

# 3. Crea un fattore meteo_1 con i livelli "sole", "pioggia", "neve", "vento", 
# ciascuno ripetuto 2 volte. 
# 3.1 Crea un nuovo fattore meteo_2 con l'ordine dei livelli invertito.
# ? sort
meteo_1 = factor(rep(c("sole", "pioggia", "neve", "vento"), each = 2)); meteo_1
meteo_2 = factor(meteo_1, levels = sort(levels(meteo_1), decreasing = T)); meteo_2
# attraverso la funzione sort posso riordinare l'ordine dei livelli 

# 4. Crea un fattore frutta con i livelli "mela", "pera", "banana".
# 4.1 Aggiungi un nuovo livello "arancia" e 
# assegna questa nuova categoria a una nuova osservazione.
frutta = factor(rep(c("mela", "pera", "banana"), each = 3)); frutta
levels(frutta) = c(levels(frutta), "arancia")
frutta_no = c(frutta, "arancia"); frutta_no #no!
frutta_ok = c(frutta, as.factor("arancia"));frutta_ok 
# devo utilizzare as.factor per specificare che si tratta di un fattore, 
# altrimenti R trasfroma a carattere

# 5. Crea un fattore treatment con le categorie "A", "B", "C", 
# ciascuna ripetuta 3 volte.
# 5.1 Cambia le osservazioni delle prime 3 posizioni in "D".
# 5.2 Aggiungi i livelli mancanti se necessario e verifica il risultato.

treatment = factor(rep(c("A", "B", "C"), each = 3)) 
treatment
levels(treatment) = c(levels(treatment), "D") #tengo i livelli di prima più "D"
treatment[1:3] = "D"
treatment
# treatment[1:3] primi tre elementi assegno il valore "D"

