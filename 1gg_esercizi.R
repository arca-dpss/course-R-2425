# Esericizi riassuntivi prima lezione

# Creazione di ogetti e operatori ----------------------------------------

# 1. Crea gli oggetti a e b assegnando loro il valore 15 e 5 rispettivamente
# 1.1. Verifica se a è divisibile per b

# 2. Crea un’espressione per verificare se un numero 
# n è negativo o è maggiore di 10. 
# Testa l’espressione con n = -5, n = 11 e n = 0.

# Definizione n

# Verifica delle condizioni


# 3. Hai due vettori altezza e peso. 
# Determina se un valore di peso è inferiore a 50 o 
# se l’altezza è maggiore di 1.80.
# Definizione dei dati
altezza = c(1.75, 1.82, 1.68, 1.90)
peso = c(48, 75, 49, 88)

# Verifica delle condizioni


# 4. Definisci un’espressione per verificare se un numero y 
# appartiene all’intervallo [5, 15] oppure [20, 25]. 
# Testa con y = 10, y = 18 e y = 23.

# 5. Hai un vettore di numeri vet_num = c(2, 4, 6, 8, 10). 
# Scrivi un’espressione per verificare se un numero x 
# appartiene a questo vettore. 
# Testa con x = 4, x = 7 e x = 10.

# Definizione del vettore


# Definizione del numero da testare


# Verifica con %in%




# Vettori -----------------------------------------------------------------

# 1. Crea un vettore v contenente i numeri decrescenti da 10 a 1.
# 1.1 Estrai il primo e l'ultimo elemento di v.
# 1.2 Trova la somma di tutti gli elementi di v.


# 2. Vettore di numeri dispari
# Crea un vettore "odd" che contenga i numeri dispari tra 1 e 15 
# utilizzando la funzione seq().

# 3. Genera un vettore "w" in cui le stringhe "X", "Y", "Z" 
# sono ripetute rispettivamente 2, 3 e 4 volte.

# 3.1 Ordina gli elementi di w in ordine alfabetico. ?sort


# 4. Crea un vettore num con i valori da 1 a 10.
# 4.1 Sostituisci tutti i numeri divisibili per 3  %% con il valore NA.
# 4.2 Calcola la media degli elementi di num, escludendo i valori NA.


# 5. Crea un vettore rep_num che ripete il pattern di numeri 1, 2, 3 5 volte.
# 5.1 Cambia l'ordine degli elementi in modo che il vettore 
# sia in ordine decrescente. ?sort



# Fattori ---------------------------------
# 1. Crea un fattore animali con i livelli "cane", "uccello", e "pesce", ciascuno ripetuto 4 volte.
# 1.1 Visualizza i livelli del fattore.
# 1.2 Cambia i livelli in "mammifero", "volatile", "acquatico".



# 2. Crea un fattore colori con i livelli "rosso", "verde", "blu", "giallo", ciascuno ripetuto 3 volte.
# 2.1 Rimuovi gli elementi con livello "giallo".
# 2.2 Usa droplevels() per eliminare i livelli inutilizzati.


# 3. Crea un fattore meteo_1 con i livelli "sole", "pioggia", "neve", "vento", 
# ciascuno ripetuto 2 volte. 
# 3.1 Crea un nuovo fattore meteo_2 con l'ordine dei livelli invertito.
# ? sort


# 4. Crea un fattore frutta con i livelli "mela", "pera", "banana".
# 4.1 Aggiungi un nuovo livello "arancia" e 
# assegna questa nuova categoria a una nuova osservazione.


# 5. Crea un fattore treatment con le categorie "A", "B", "C", 
# ciascuna ripetuta 3 volte.
# 5.1 Cambia le osservazioni delle prime 3 posizioni in "D".
# 5.2 Aggiungi i livelli mancanti se necessario e verifica il risultato.

