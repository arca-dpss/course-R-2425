# Programmazione iterativa --------------------------------------------------------

# 1. Scrivi un ciclo for che somma tutti i numeri da 1 a 10.
somma=0
for (i in 1:10) {
  somma=somma + i
}
somma

#1.1 Scrivi una funzione che utilizzi un ciclo for per calcolare 
# la somma degli elementi di un vettore.

somma_vettore1=function(vettore) {
  somma=0
  for (i in vettore) {
    somma=somma + i
  }
  return(somma)
}
somma_vettore1(1:5) 

somma_vettore2=function(vettore) {
  somma=0
  for (i in 1:length(vettore)) {
    somma=somma + vettore[i]
  }
  return(somma)
}
somma_vettore2(1:5)

# 2. Scrivi una funzione che calcoli la media 
# degli elementi di un vettore senza usare mean().

media=function(vettore) {
  somma=0
  for (i in vettore) {
    somma=somma + i
  }
  return(somma / length(vettore))
}
media(1:10)  


# 3. Usa un ciclo for per stampare "Pari" o "Dispari" per ogni numero da 1 a 10.

for (i in 1:10) {
  if (i %% 2 == 0) {
    print(paste(i, "è Pari"))
  } else {
    print(paste(i, "è Dispari"))
  }
}


# 4. Usa un ciclo for per stampare la frase "R è fantastico!" 5 volte.

for (i in 1:5) {
  print("R è bello!")
}

# 5. Usa un ciclo while per contare fino a 10, iniziando da 1.

x=1
while (x <= 10) {
  print(x)
  x=x + 1
}


# 6. Scrivi un ciclo repeat che simuli il lancio di un dado 
# finché non esce il numero 6.

repeat {
  dado=sample(1:6, 1)
  print(dado)
  if (dado == 6) break
}


# 7. Scrivi un ciclo for che scorre le colonne 
#  del iris  (disponibile direttamente in R) 
#  e stampa la media della variabile se la variabile è numerica
#  altrimenti la tabella di frequenza se la variabile è un fattore
#  Usa ncol, print, is.numeric, is.factor...

for (i in 1:ncol(iris)){
  if(is.numeric(iris[,i])){
    out = mean(iris[,i], na.rm = T)
  } else{
    out = table(iris[,i])
  }
  print(out)
}


# 8. Scrivi un ciclo for che scorre le prime 3 colonne 
#  del dataset mtcars (disponibile direttamente in R) 
#  e stampa il nome della colonna
#  Usa le funzioni colnames e print

for (i in 1:3){
  col_i=colnames(mtcars)[i]
  print(col_i)
}

# 9. Simula 10 valori da una distribuzione normale con media 5 e 
# deviazione standard 2 usando un ciclo for (?rnorm)
set.seed(123)
valori=numeric(10)

for (i in 1:10) {
  valori[i]=rnorm(1, mean = 5, sd = 2)
}
valori

# 10. Simula i tempi di reazione di 10 partecipanti in due gruppi ("A" e "B"), 
# usando un ciclo nested. 5 x fgruppo

gruppi =c("A", "B")
partecipanti =5
dati1 =data.frame(Gruppo = character(), Partecipante = integer(), RT = numeric())

# option 1
for (gruppo in gruppi) {
  for (partecipante in 1:partecipanti) {
    print(gruppo)
    print(partecipante)
    RT1 = ifelse(gruppo == "A", rnorm(1, .500, .050), rnorm(1, .450, .050))
    dati1 = rbind(dati1, data.frame(Gruppo = gruppo, 
                                   Partecipante = partecipante, 
                                   RT = RT1))
  }
}
dati1

# option 2
N_subj = 10
gruppo = character()
dati2 =data.frame(Gruppo = character(N_subj), 
                  Partecipante = integer(N_subj), RT = numeric(N_subj))

for (i in 1:N_subj) {
    gruppo[i] = ifelse(i < 5, "A","B")
    RT2 = ifelse(gruppo[i] == "A", rlnorm(1, .500, .050), rlnorm(1, .450, .050))
    dati2$Gruppo[i] = gruppo[i] 
    dati2$Partecipante[i] = i
    dati2$RT[i] = RT2                 
}
dati2






