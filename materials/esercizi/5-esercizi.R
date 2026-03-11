# Funzioni e programmazione condizionale

# 1.  Scrivi una funzione in R che prenda un numero come input e 
#    restituisca il triplo di quel numero.


# 2. Definisci una funzione che calcoli l'area di un rettangolo
#    Area = Base * Altezza
#    sia utilizzando la funzione return e { } 
#    sia utilizzando una sola riga di codice (senza { } e return)


# 3. Definisci una funzione che stampi un messaggio di benvenuto personalizzato
#    Scrivi una funzione benvenuto(nome, città) che prenda come input il nome e 
#    la città di una persona e restituisca un messaggio personalizzato come:
#    "Benvenuto/a, [nome]! 
#    Che piacere avere un ospite da [città]!".
#    Usa le funzioni paste() e print() per formattare e stampare il messaggio.


# 4. Definisci una funzione che calcoli la media e la deviazione standard di un vettore numerico "w".
w = c(12:25, NA, 8:15)
#    e restituisca una frase come:
#    "La media del vettore è ... e la deviazione standard è ..." 
#    usando sprintf() o paste().
#    Ricorda di gestire i valori NA.


# Programmazione condizionale

# 5. Definisci una funzione sign_check() che riceve in input un numero e 
#    restituisce una stringa:
#    "positivo" se il numero è maggiore di zero,
#    "negativo" se il numero è minore di zero,
#    "zero" se il numero è uguale a zero.


# 6. Definisci una funzione multiplo_tre() che riceve in input un numero e
#    restituisce un valore logico:
#    TRUE se il numero è un multiplo di 3
#    FALSE altrimenti
#    Suggerimento: usa l'operatore %% 


# 7. Definisci una funzione transform() che, dato un numero, 
#    restituisca:
#    Il numero elevato al quadrato se è maggiore di 20,
#    Il numero elevato al cubo se è minore di 10,
#    Il numero stesso altrimenti.
#    
#    Utilizza if ... else if ... else ...


# 8. Dato il vettore
temperature = rnorm(100, 15, 8)
#    Definisci una funzione class_temp() che classifica una temperatura 
#    in base al suo valore:
#    
#    temp < 0: "Gelo",
#    0 <= temp < 15: "Freddo",
#    15 <= temp < 25: "Mite",
#    25 >= temp: "Caldo".
#
#    Usa una serie di ifelse() nested per assegnare una variabile 
#    temp_label con le etichette corrispondenti.


# 9. Utilizza dplyr::case_when() per riscrivere la funzione class_temp()
#    dell'esercizio precedente con le stesse etichette.


# 10. Crea una funzione che accetti un vettore e verifichi se contiene valori NA. 
#    Se contiene NA, lancia un warning con il messaggio "Attenzione: il vettore contiene valori mancanti".
#    Restituisci comunque la somma del vettore (gestendo i NA).
#    Suggerimento: ?warning ?any, ?is.na


# 11. Una palestra offre abbonamenti con prezzi variabili:
#     €50/mese per abbonamenti annuali (12 mesi).
#     €60/mese per abbonamenti semestrali (6 mesi).
#     €70/mese per abbonamenti mensili (1 mese).
#     Crea un vettore con il numero di mesi di abbonamento scelti da diversi clienti
#     e calcola il costo totale per ciascun cliente.
#     
mesi_abbonamento = c(1, 6, 12, 1, 6, 12, 3)
#     Suggerimento: considera che 3 mesi = 3 abbonamenti mensili


