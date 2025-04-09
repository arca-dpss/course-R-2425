# Esercizi su Liste e Matrici con Soluzioni

# 1. Crea una lista "my_data" contenente:
#    - Un vettore numerico di 4 elementi
#    - Un vettore di caratteri di 3 elementi
#    - Un vettore logico di 2 elementi

my_data = list(c(1.5, 2.7, 3.2, 4.1), 
                c("rosso", "verde", "blu"), 
                c(TRUE, FALSE))
str(my_data)

# 2. Estrai il secondo elemento del vettore di caratteri

my_data[[2]][2]

# 3. Assegna i nomi "num", "char", "log" agli elementi della lista

names(my_data) = c("num", "char", "log")
str(my_data)

# 4. Estrai il vettore numerico e quello logico dalla lista in due modi diversi:
#    - Usando i nomi (crea "num1" e "log1")
#    - Usando l'indicizzazione numerica (crea "num2" e "log2")
#    Verifica che siano identici

num1 = my_data$num
log1 = my_data$log

num2 = my_data[[1]]
log2 = my_data[[3]]

all.equal(num1, num2)
all.equal(log1, log2)

# 5. Converti il vettore logico in un vettore numerico chiamato "num_log"

num_log = as.numeric(my_data$log)
num_log

# 6. Crea una matrice "M" combinando per colonna i vettori "num1" e "num_log"
#    Quali attributi ha la matrice e perché?

M = cbind(num1, num_log)
attributes(M)
# La matrice avrà attributi "dim" (dimensioni) e "dimnames" (nomi delle colonne)

# 7. Aggiungi la matrice "M" alla lista "my_data"

my_data$M = M

my_data = list(my_data, M)

my_data$fnfnfnfn = 
str(my_data)

# 8. Crea una matrice "L" di 3 righe dove i numeri 1, 2 e 3 
#    sono ripetuti 5 volte ciascuno rispettivamente nella prima, seconda e terza riga
dat = rep(1:3, each=5)

L = matrix(data = dat, nrow=3, byrow=TRUE)
L

L = matrix(data = rep(1:3, each=5), nrow=3, byrow=TRUE)


# 9. Crea una matrice "N" contenente i primi 15 numeri dispari
#    disposti su 5 righe e 3 colonne ?seq length.out

seq(from = 1, by=2, length.out = 15)



# cambio slide sui dataframe

N = matrix(seq(from = 1, by=2, length.out = 15), nrow=5, ncol=3)
N

# 10. Crea una matrice "C" composta dalla seconda riga della matrice "L"
#     e la terza colonna della matrice "N"

C = rbind(L[2,], N[,3]) 
C


# 11. Rimuovi la prima riga dalla matrice "L". 
#     Verifica che le matrici "C" e "L" abbiano lo stesso numero di righe.
#     Unisci le due matrici in modo da ottenere una matrice "Y" di dimensione 2x8

L = L[-1,]
nrow(C) == nrow(L)

# 11.1 Aggiungi una riga alla matrice L in maniera tale che C ed L abbiano lo
#      stesso numero di righe

Y = cbind(L, C)
Y

# 12. Seleziona gli elementi della matrice "Y" che si trovano:
#     - Nella prima riga e nelle colonne dalla terza alla quinta
#     - Nella seconda riga e nelle colonne pari

Y[1, 3:5]
ncol(Y) # 10 colonne
Y[2,seq(from = 2, to = ncol(Y), by = 2)]
1:ncol(Y)
(1:ncol(Y))%%2
(1:ncol(Y))%%2 == 0

Y[2, (1:ncol(Y))%%2 == 0]


