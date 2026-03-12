# Programmazione iterativa

# 1. Calcola il prodotto dei numeri da 1 a 10 utilizzando un ciclo for.
#   Inizializza una variabile prodotto a 1 e moltiplicala progressivamente per
#   ogni numero da 1 a 10. Alla fine, stampa il risultato.
prodotto = 1
for (i in 1:10) {
  prodotto = prodotto * i
}
print(prodotto)

# 2. Crea una funzione chiamata prodotto_vettore che accetti come argomento un 
# vettore numerico e restituisca il prodotto di tutti i suoi elementi.
# Utilizza un ciclo for per iterare attraverso gli elementi del vettore.
# Testa la funzione con diversi vettori numerici.
prodotto_vettore = function(vettore) {
  prodotto = 1
  for (elemento in vettore) {
    prodotto = prodotto * elemento
  }
  return(prodotto)
}

# 3. Implementa una funzione per calcolare la varianza di un vettore
# Ricorda che la varianza è la media dei quadrati degli scarti dalla media.
# La funzione deve quindi:
# - calcolare la media del vettore
# - calcolare la somma dei quadrati degli scarti dalla media
# - dividere per length(vettore)
varianza_vettore = function(vettore) {
  media = mean(vettore)
  somma_scarti = 0
  for (i in vettore) {
    somma_scarti = somma_scarti + (i - media)^2
  }
  return(somma_scarti / length(vettore))
}

# 4. Scrivi un ciclo for che scorra i numeri da -5 a 5 e stampi per ciascuno
# di essi se il numero è "Positivo", "Negativo" o "Zero". Utilizza un ciclo
# for e una struttura condizionale if-else if-else per classificare ogni numero.
for (i in -5:5) {
  if (i > 0) {
    print("Positivo")
  } else if (i < 0) {
    print("Negativo")
  } else {
    print("Zero")
  }
}

# 5. Utilizza un ciclo for per stampare i quadrati dei primi 8 numeri.
# Per ogni iterazione, calcola il quadrato del numero corrente (i^2) e stampalo.
for (i in 1:8) {
  print(i^2)
}

# 6. Scrivi un programma che sommi progressivamente i numeri naturali partendo da 1
# fino a quando la somma totale supera 100. Utilizza un ciclo while che continui
# finché la somma è minore o uguale a 100. Alla fine, stampa la somma finale
# e quanti numeri sono stati sommati per raggiungerla.
somma = 0
contatore = 1
while (somma <= 100) {
  somma = somma + contatore
  contatore = contatore + 1
}
print(paste("Somma finale:", somma, "- Numeri sommati:", contatore - 1))

# 7. Simula il lancio ripetuto di due dadi a sei facce fino a ottenere un doppio sei
# (entrambi i dadi mostrano 6). Utilizza un ciclo repeat con un'istruzione break
# per terminare quando si verifica la condizione desiderata. Per ogni lancio,
# stampa i valori ottenuti da entrambi i dadi. (puoi usare print e paste)
repeat {
  dado1 = sample(1:6, 1)
  dado2 = sample(1:6, 1)
  print(paste("Dado 1:", dado1, "- Dado 2:", dado2))
  if (dado1 == 6 & dado2 == 6) break
}

# 8. Scrivi un programma che scorra tutte le colonne del dataset mtcars e, per ogni
# variabile numerica, calcoli e stampi la mediana. Utilizza un ciclo for che iteri
# su tutte le colonne (ncol), verifichi se la colonna è numerica con is.numeric(),
# e in caso affermativo calcoli e stampi la mediana arrotondata a due decimali.
for (i in 1:ncol(mtcars)) {
  if (is.numeric(mtcars[,i])) {
    print(paste("Mediana di", colnames(mtcars)[i], ":", 
                round(median(mtcars[,i]), 2)))
  }
}

# 9. Calcola e stampa la deviazione standard delle prime quattro colonne numeriche
# del dataset iris (Sepal.Length, Sepal.Width, Petal.Length, Petal.Width).
# Utilizza un ciclo for che iteri sulle colonne da 1 a 4, calcoli la deviazione
# standard con sd() e stampi il risultato arrotondato a tre cifre decimali.
for (i in 1:4) {
  print(paste(colnames(iris)[i], "- SD:", round(sd(iris[,i]), 3)))
}

# 10. Genera e salva in un vettore 500 valori casuali estratti da una distribuzione uniforme
# continua nell'intervallo [0, 1]. Utilizza un ciclo for e la funzione runif()
# per generare un valore per ogni iterazione. Osserva come i valori si
# distribuiscano uniformemente tra 0 e 1 (hist)
numeri = numeric(length = 500)
for (i in 1:500) {
  numeri[i] =runif(1, min = 0, max = 1)
}

# 11. Simula i dati di accuracy per un esperimento go/no-go con due gruppi sperimentali
# (Controllo e Sperimentale). Ogni gruppo ha 50 partecipanti, e ogni partecipante
# completa 80 trial. Il 70% dei trial sono di tipo "Go" e il 30% di tipo "NoGo".
# Per il gruppo Controllo, la probabilità di risposta corretta è 0.92 per i trial Go
# e 0.88 per i trial NoGo. Per il gruppo Sperimentale, le probabilità sono 0.95 (Go)
# e 0.85 (NoGo).
# Crea un dataframe con le colonne: Gruppo, Partecipante, Trial, Tipo, Corretto.
# Alla fine, stampa le prime 20 righe e la media di accuracy per gruppo e tipo di trial.
gruppi = c("Controllo", "Sperimentale")
partecipanti_per_gruppo = 50
trials_per_partecipante = 80

dati = data.frame(Gruppo = character(), 
                  Partecipante = integer(), 
                  Trial = integer(),
                  Tipo = character(),
                  Corretto = logical())

for (gruppo in gruppi) {
  for (partecipante in 1:partecipanti_per_gruppo) {
    for (trial in 1:trials_per_partecipante) {
      tipo_trial = sample(c("Go", "NoGo"), 1, prob = c(0.7, 0.3))
      
      if (gruppo == "Controllo") {
        prob_corretto = ifelse(tipo_trial == "Go", 0.92, 0.88)
      } else {
        prob_corretto = ifelse(tipo_trial == "Go", 0.95, 0.85)
      }
      
      corretto = sample(c(TRUE, FALSE), 1, prob = c(prob_corretto, 1-prob_corretto))
      
      dati = rbind(dati, data.frame(Gruppo = gruppo,
                                    Partecipante = partecipante,
                                    Trial = trial,
                                    Tipo = tipo_trial,
                                    Corretto = corretto))
    }
  }
}

print(head(dati, 20))
print(aggregate(Corretto ~ Gruppo + Tipo, data = dati, FUN = mean))

# 12. Implementa una funzione conta_sopra_soglia che accetti due argomenti: un vettore
# numerico e un valore soglia. La funzione deve contare e restituire quanti elementi
# del vettore superano la soglia specificata. Utilizza un ciclo for per scorrere
# il vettore e un contatore che si incrementa quando un elemento supera la soglia.
# Testa la funzione con vettori di diversa lunghezza e soglie diverse.
conta_sopra_soglia = function(vettore, soglia) {
  conta = 0
  for (elemento in vettore) {
    if (elemento > soglia) {
      conta = conta + 1
    }
  }
  return(conta)
}



# 13. Crea una funzione chiamata standardizza che accetti un vettore numerico come
# input e restituisca il vettore standardizzato (z-score). La standardizzazione
# trasforma ogni elemento sottraendo la media del vettore e dividendo per la
# deviazione standard: z_i = (x_i - media) / sd. 

standardizza = function(vettore) {
  media = mean(vettore)
  sd = sd(vettore)
  risultato = numeric(length(vettore))
  for (i in 1:length(vettore)) {
    risultato[i] = (vettore[i] - media) / sd
  }
  return(risultato)
}

