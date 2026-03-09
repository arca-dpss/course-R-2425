# =========================================================
# 1.2 - Introduzione: Oggetti, Operatori, Logica
# =========================================================

# 1. Crea gli oggetti a e b e assegna loro i valori 144 e 11.

# 1.1 Calcola il resto della divisione tra a e b e salvalo come oggetto resto.

# 1.2 Valuta se a è divisibile per b.



# 3. Crea gli oggetti x = 7 e y = 49.

# 3.1 Verifica se x elevato al cubo è maggiore di y.

# 3.2 Verifica se x è pari OPPURE y è multiplo di 6.

# 4. Definisci una proposizione per valutare la condizione:
# "k è un numero maggiore di 100 e pari, oppure è un multiplo di 7".
# Testa almeno tre valori di k: 98, 105, 200.





# =========================================================
# 2.1 - Vettori
# =========================================================

# 1. Crea un vettore temperature con i numeri dispari da 1 a 35
#    usando la funzione seq().

# 1.1 Calcola la media e la deviazione standard di temperature.


# 1.2 Seleziona solo le temperature strettamente maggiori di 20.

# 1.3 Sostituisci i valori minori di 5 con NA.

# 1.4 Ricalcola la media (attenzione ai valori mancanti!).



# 2. Crea un vettore stagioni in cui "primavera", "estate", "autunno", "inverno"
#    sono ripetuti 2 volte ciascuno (ogni stagione in blocco, usa each =).

# 2.1 Seleziona solo gli elementi uguali a "estate" o "inverno".

# 3. Crea un vettore tempi con i valori: 12.3, 9.8, 15.1, 11.4, 8.7, 13.9, 10.2, 14.5

# 3.1 Estrai il primo e il terzultimo elemento.

# 3.2 Conta quanti tempi sono inferiori a 11.

# 3.3 Sostituisci tutti i tempi > 14 con il valore 14 (censura superiore).



# 4. Un'azienda assegna il bonus massimo se un dipendente ha raggiunto
#    almeno il 90% degli obiettivi E ha zero assenze. Assegna il bonus
#    intermedio se ha raggiunto almeno il 75% degli obiettivi e al più
#    2 assenze. Altrimenti nessun bonus.
#    Calcola il risultato per questi dipendenti:
obiettivi <- c(95, 80, 72, 91, 76)   # percentuale obiettivi raggiunti
assenze   <- c(0,  1,  3,  2,  0)    # numero di assenze

# Crea un vettore bonus con "Massimo", "Intermedio", o "Nessuno".
bonus <- rep("Nessuno", length(obiettivi))

