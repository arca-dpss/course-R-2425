# Soluzioni 

# Liste e Matrici 

# 1. Crea una lista "my_list" (senza nomi) formata da un vettore numerico di 3 elementi, 
#    un vettore character di 5 elementi e un vettore logico di 3 elementi

my_list = list(c(.2,.3,1), letters[1:5], c(TRUE,FALSE,TRUE))
str(my_list)

# 2. Estrai il 3° elemento del vettore character
my_list[[2]][[3]]

# 3. Nomina i tre elementi della lista, rispettivamente "z" (numerico), "ch" (character), "logi" (logico)
names(my_list) = c("z","ch","logi")
str(my_list)

# 4. Estrai (separatamente) il vettore numerico "z" e quello logico "logi" dalla lista,
# sia attraverso i nomi creando il i vettori, "z1", e "logi1",
# che con l'indicizzazione numerica [] (crea vettore "z2", e "logi2"),
# Assicurati siano identici

z1 = my_list$z; 
z2 = my_list[[1]];
z1 == z2
z3 = my_list[["z"]];
all.equal(my_list[[1]], my_list$z)

logi1 = my_list$logi; logi2 = my_list[[3]]; all.equal(logi1,logi2) #?all.equal

# 5. Crea un vettore integer ("inter") trasformando il vettore logico ("logi1").
inter = as.integer(my_list$logi);inter

# 6. Crea una matrice "Z" unendo (per riga) i 2 vettori che hai appena estratto ("inter", "logi1")
# che attributi ha la matrice e perchè?
Z = rbind(inter,my_list$logi);  #?rbind unisco per riga

attributes(Z);str(Z); Z
#$dimnames[[1]] righe 

# 7. Aggiungi alla lista"my_list" la matrice "Z".
str(my_list)
my_list[[4]] = Z; # assegno all'elemento, non [4] perchè identifica una lista
str(my_list)

# 8. Crea la matrice "K" formata da 3 colonne in cui le lettere "A","B" e "C" 
# vengano ripetute 4 volte ciascuna rispettivamente nella prima, seconda e terza colonna.
# 
K = matrix(ncol = 3, data = rep(c("A","B","C"), each = 4))
# byrow = FALSE

# 9. Crea la matrice "K2" formata da 3 righe in cui le lettere "A","B" e "C" 
# vengano ripetute 4 volte ciascuna rispettivamente nella prima, seconda e terza riga
# 
K2 = matrix(nrow = 3, data = rep(c("A","B","C"), each = 4), byrow = TRUE)

#9. Crea la matrice "J" contenente tutti i primi 12 numeri pari (%%)
#   disposti su 4 righe e 3 colonne.
dat = (1:24)[(1:24) %% 2 == 0][1:12]
# oppure ?seq

J = matrix(data = dat, nrow = 4, ncol = 3)
J

#11. Crea una matrice "B" composta dalla prima colonna dalla matrice "K"
#   e la seconda colonna della matrice "J"
B = cbind(K[,1],J[,2])
B
# 12. Ridefinisci la matrice "K" eliminando la seconda colonna. 
# Verifica che le matrici "B" e "K" abbiano la stessa dimensione.
# unisci le due matrici in maniera tale da ottenere una matrice "X" di dimensione 4,4
K  = K [,-2]; # tolgo la seconda colonna con l'inidicizzazione negativa
dim(B) == dim(K)
X = cbind(K,B); X

# 13. Selziona gli elementi compresi tra la seconda e quarta riga, 
# seconda e terza colonna della matrice "X"
# prima righe e poi, colonne
X[2:4,2:3]

#-----------------------------------------------------








