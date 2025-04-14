# 1. Somma dei numeri da 1 a 30
somma = 0
for (i in 1:30) {
  somma = somma + i
}
print(somma)

# 1.1 Funzione per sommare gli elementi di un vettore
somma_vettore = function(vettore) {
  somma = 0
  for (elemento in vettore) {
    somma = somma + elemento
  }
  return(somma)
}

# 2. Funzione per calcolare la media di un vettore senza mean()
media_vettore = function(vettore) {
  somma = somma_vettore(vettore)
  return(somma / length(vettore))
}

# 3. Stampare "Pari" o "Dispari" per numeri da 1 a 10
for (i in 1:10) {
  if (i %% 2 == 0) {
    print("Pari")
  } else {
    print("Dispari")
  }
}

# 4. Stampare "R è fantastico!" 5 volte
for (i in 1:5) {
  print("R è fantastico!")
}

# 5. Contare fino a 10 con un ciclo while
contatore = 1
while (contatore <= 10) {
  print(contatore)
  contatore = contatore + 1
}

# 6. Simulare il lancio di un dado fino a ottenere 6
repeat {
  lancio = sample(1:6, 1)
  print(lancio)
  if (lancio == 6) break
}

# 7. Scorrere le colonne di iris e stampare media o tabella di frequenza
for (i in 1:ncol(iris)) {
  if (is.numeric(iris[,i])) {
    print(paste("Media di", colnames(iris)[i], ":", round(mean(iris[,i]),2)))
  } else if (is.factor(iris[,i])) {
    print(paste("Tabella di frequenza di", colnames(iris)[i], ":"))
    print(table(iris[,i]))
  }
}

# 8. Stampare i nomi delle prime 3 colonne di mtcars
for (i in 1:3) {
  print(colnames(mtcars)[i])
}

# 9. Simulare 10 valori da una distribuzione normale
for (i in 1:10) {
  print(rnorm(1, mean = 5, sd = 2))
}

# 10. Simulare tempi di reazione per due gruppi
gruppi = c("A", "B")
partecipanti = 100
dati = data.frame(Gruppo = character(), Partecipante = integer(), RT = numeric())

for (gruppo in gruppi) {
  for (partecipante in 1:partecipanti) {
    RT = ifelse(gruppo == "A", rlnorm(1, log(0.500), 0.50), rlnorm(1, log(0.450), 0.50))
    dati = rbind(dati, data.frame(Gruppo = gruppo, 
                                   Partecipante = partecipante, 
                                   RT = RT))
  }
}
print(dati)
hist(dati$RT)
