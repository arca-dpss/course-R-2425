# =========================================================
# 2.3 - Liste e Matrici
# =========================================================

# 1. Crea una lista studente contenente:
#    - una stringa (es. "Giulia")
#    - un vettore numerico con 5 voti (es. da 24 a 30)
#    - un valore logico
studente = list("Giulia",
                c(24,25,25,26,30),
                TRUE)

# 1.1 Estrai il secondo voto usando l'indicizzazione numerica.
studente[[2]][2]
# 1.2 Assegna i nomi "nome", "voti", "promosso" agli elementi.
names(studente) = c("nome", "voti", "promosso")
names(studente)
# 1.3 Estrai il vettore voti usando il nome ($).
studente$voti
# 1.4 Calcola la media dei voti estratti.
mean(studente$voti)

# 2. Crea una matrice "P" di 4 righe e 3 colonne,
#    riempita con i numeri da 1 a 12, per righe (byrow = TRUE).
P = matrix(data = 1:12, nrow = 4, ncol = 3,
           byrow = TRUE)
P 
# 2.1 Estrai la seconda riga.
P[2,]
# 2.2 Estrai la terza colonna.
P[,3]
# 2.3 Calcola la somma di ogni colonna (?colSums).
colSums(P)

# 3. Crea una matrice "Q" di 3 righe usando il vettore 1:9,
#    riempita per colonne (default).
Q = matrix(data = 1:9, nrow = 3)
# 3.1 Trasponi la matrice (?t).
t(Q)

# 3.2 Moltiplica P per Q elemento per elemento (P * Q). Funziona? Perché?
P*Q

# 4. Crea una matrice "R_mat" di 2 righe dove:
#    - La prima riga contiene i multipli di 2 da 2 a 8
#    - La seconda riga contiene i multipli di 3 da 3 a 12
R_mat = matrix(data = c(seq(2,8,2),
                        seq(3,12,3)),
               nrow = 2,
               byrow = TRUE)
R_mat

# 4.1 Seleziona gli elementi della prima riga nelle colonne pari.
R_mat[1,which(1:ncol(R_mat)%%2 == 0)]

# 4.2 Aggiungi la matrice "R_mat" alla lista "studente".
studente$R_mat = R_mat

studente
