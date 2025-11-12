# Esercizi Liste e Matrici

# 1. Costruisci una lista chiamata "dati_lab" che includa:
#    - Un vettore con 4 numeri interi consecutivi partendo da 10
#    - Un vettore con i nomi di 4 colori
#    - Un vettore logico con 4 valori

dati_lab = list(10:13, c("rosso", "blu", "verde", "giallo"), c(TRUE, FALSE, TRUE,FALSE))

# 2. Accedi al terzo colore del vettore di caratteri

dati_lab[[2]][3]

# 3. Denomina gli elementi della lista come "interi", "colori", "booleani"

names(dati_lab) = c("interi", "colori", "booleani")
str(dati_lab)

# 4. Recupera il vettore degli interi e quello booleano utilizzando:
#    - Notazione con il simbolo $ (salva come "int1" e "bool1")

int1 = dati_lab$interi
bool1 = dati_lab$booleani

#    - Indicizzazione con doppie parentesi quadre (salva come "int2" e "bool2")

int2 = dati_lab[[1]]
bool2 = dati_lab[[3]]

#    Controlla l'equivalenza

all.equal(int1, int2)
all.equal(bool1, bool2)

# 5. Trasforma il vettore booleano in formato numerico salvandolo come "bool_num"

bool_num = as.numeric(bool1)

# 6. Genera una matrice "A" unendo per riga il vettore "int1" e "bool_num"
#    Osserva la struttura con str() e spiega cosa noti
 
A = rbind(int1, bool_num) #oh oh errore, come risolvere?

str(A)
# La matrice ha 2 righe e 4 colonne, tutti i valori sono numerici

# 7. Inserisci la matrice "A" come quarto elemento della lista "dati_lab"

dati_lab[[4]] = A
# oppure: dati_lab$matrice = A

# 8. Costruisci una matrice "P" di 4 colonne in cui i valori 5, 10, 15 e 20
#    compaiono 6 volte ciascuno distribuiti rispettivamente 
#    nella prima, seconda, terza e quarta colonna

P = matrix(rep(c(5, 10, 15, 20), each = 6), ncol = 4)

# 9. Genera una matrice "Q" contenente i primi 12 numeri pari positivi
#    organizzati su 4 righe e 3 colonne (usa seq() con argomento to= oppure length.out=)

Q = matrix(seq(from = 2, by = 2, length.out = 12), nrow = 4, ncol = 3)

# 10. Forma una matrice "D" selezionando la terza colonna di "P"
#     e la seconda riga di "Q" (con cbind())

D = cbind(P[, 3], Q[2, ])

# 11. Elimina l'ultima colonna dalla matrice "P"

P = P[, -4]

# Controlla che "D" e "P" abbiano lo stesso numero di trighe con nrow()

nrow(D) == nrow(P)

#     Combina le due matrici per ottenere "Z" (usa cbind)

Z = cbind(P, D)

# 12. Estrai dalla matrice "Z":
#     - Gli elementi nelle colonne dispari della penultima riga

Z[nrow(Z) - 1, seq(1, ncol(Z), by = 2)]

#     - Gli elementi della prima e ultima riga limitatamente alla seconda colonna

Z[c(1, nrow(Z)), 2]
