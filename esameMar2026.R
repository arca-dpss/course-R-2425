# =======================================================================
# ESAME FINALE DI PROGRAMMAZIONE IN R
# TEMPO A DISPOSIZIONE: 1 ORA (60 MINUTI)
# =======================================================================

# -----------------------------------------------------------------------
# SEZIONE 1: VETTORI E OPERATORI LOGICI 
# -----------------------------------------------------------------------

# 1. Crea gli oggetti p e q con i valori 145 e 12.
#    Verifica tramite un'espressione logica se p è divisibile per q (usa %%).
p = 145
q = 12
p %% q == 0

# 2. Crea un vettore tempi contenente una sequenza da 10 a 60 con passi di 5 
#    (usa la funzione seq).
tempi = seq(10, 60, by = 5)
tempi

# 3. Sostituisci tutti i valori di tempi maggiori di 40 con NA.
tempi[tempi > 40] = NA
tempi

# 4. Calcola la media del vettore tempi gestendo correttamente i valori NA.
mean(tempi, na.rm = TRUE)


# 5. Esegui il confronto logico tra le stringhe "Zebra" e "alpaca".
#    Poi ripeti il confronto rendendolo case-insensitive usando tolower().
"Zebra" > "alpaca"              
tolower("Zebra") > tolower("alpaca")  # confronto case-insensitive

# 6. Crea un vettore aree in cui le etichette "NORD", "CENTRO", "SUD" 
#    sono ripetute 3 volte ciascuna, a blocchi (es. NORD, NORD, NORD, CENTRO...).
aree = rep(c("NORD", "CENTRO", "SUD"), each = 3)
aree


# -----------------------------------------------------------------------
# SEZIONE 2: FATTORI 
# -----------------------------------------------------------------------

# 7. Crea un vettore stringa medaglie = c("Oro", "Bronzo", "Argento", "Oro", "Bronzo").
#    Trasformalo in un fattore ORDINATO con i livelli logici corretti 
#    ("Bronzo" < "Argento" < "Oro"). O crea direttamente un fattore ordinato.
medaglie = factor(c("Oro", "Bronzo", "Argento", "Oro", "Bronzo"),
                  levels = c("Bronzo", "Argento", "Oro"),
                  ordered = TRUE)
medaglie

# 8. Rinomina i livelli del fattore 'medaglie' in "Terzo", "Secondo", "Primo".
levels(medaglie) = c("Terzo", "Secondo", "Primo")
levels(medaglie)

# 9. Crea un fattore turni con i livelli "Mattina", "Pomeriggio", "Notte", 
#     ciascuno ripetuto 2 volte.
turni = factor(rep(c("Mattina", "Pomeriggio", "Notte"), each = 2),
               levels = c("Mattina", "Pomeriggio", "Notte"))
turni

# 10. Elimina le osservazioni corrispondenti alla "Notte".
turni = turni[turni != "Notte"]
turni

# 11. Usa droplevels() per pulire i livelli inutilizzati e stampa i livelli rimanenti.
turni = droplevels(turni)
levels(turni)

# 12. Sostituisci l'ultima osservazione con "Sera"
levels(turni) = c(levels(turni), "Sera")
turni[length(turni)] = "Sera"
turni


# -----------------------------------------------------------------------
# SEZIONE 3: LISTE, MATRICI
# -----------------------------------------------------------------------

# 13. Crea una matrice Mat di 3 righe e 4 colonne, riempita per colonne (default)
#     con i numeri da 1 a 12.
Mat = matrix(1:12, nrow = 3, ncol = 4)
Mat

# 14. Estrai l'elemento posizionato nella seconda riga e terza colonna.
Mat[2, 3]

# 15. Calcola la somma di ogni colonna della matrice usando colSums().
colSums(Mat)


# 16. Crea una lista esperimento che contenga:
#     - Nome: "Studio_Alpha"
#     - Dati: la matrice 'Mat'
#     - Concluso: FALSE
esperimento = list(
  Nome     = "Studio_Alpha",
  Dati     = Mat,
  Concluso = FALSE
)

# 17. Estrai la matrice dalla lista in due modi: con $ e con le doppie quadre [[ ]].
#     Verifica se i due risultati sono identici usando identical().
esperimento$Dati
esperimento[["Dati"]]
identical(esperimento$Dati, esperimento[["Dati"]])  # TRUE

# 18. Crea il vettore: frutti = c("mela", "Melone", "banana", "Mela verde")
#     Usa grepl() con ignore.case = TRUE per creare un vettore logico che 
#     indichi quali elementi contengono la stringa "mela".
frutti = c("mela", "Melone", "banana", "Mela verde")
logico_mela = grepl("mela", frutti, ignore.case = TRUE)

# 19. Usa il vettore logico appena creato per estrarre da 'frutti' 
#     solo le parole corrispondenti.
frutti[logico_mela]

# -----------------------------------------------------------------------
# SEZIONE 4: DATAFRAME 
# -----------------------------------------------------------------------

# 20. Crea il dataframe 'studenti':
#     - ID: 1:5
#     - Nome: c("Leo", "Mia", "Ugo", "Ada", "Eli")
#     - Corso (fattore): "A", "B", "A", "B", "A"
#     - Voto: c(28, NA, 25, 30, 18)
studenti = data.frame(
  ID    = 1:5,
  Nome  = c("Leo", "Mia", "Ugo", "Ada", "Eli"),
  Corso = factor(c("A", "B", "A", "B", "A")),
  Voto  = c(28, NA, 25, 30, 18)
)


# 21. Usa table() per contare quanti studenti ci sono per ogni Corso.
table(studenti$Corso)

# 22. Estrai i nomi degli studenti usando $ e prova anche con le [[]]
studenti$Nome
studenti[["Nome"]]

# 23. Estrai dal dataframe solo le righe complete (senza NA) usando complete.cases().
studenti[complete.cases(studenti), ]

# 24. Usa order() per riordinare il dataframe in base al Voto, dal più alto al più basso.
studenti[order(studenti$Voto, decreasing = TRUE), ]

# 25. Aggiungiamo un nuovo studente al Corso "C". 
levels(studenti$Corso) = c(levels(studenti$Corso), "C")
levels(studenti$Corso)

# 26. Ora inserisci la riga: ID = 6, Nome = "Pio", Corso = "C", Voto = 24 
#     usando rbind(). puoi creare un vettore o un data.frame da unire
nuova_riga = data.frame(ID = 6, Nome = "Pio",
                        Corso = factor("C", levels = levels(studenti$Corso)),
                        Voto = 24)
studenti = rbind(studenti, nuova_riga)

# 27. Tutti gli iscritti al Corso "B" si ritirano. Crea un dataframe 'studenti_attivi'
#     filtrando (subset) solo gli studenti che NON sono del Corso "B".
studenti_attivi = subset(studenti, Corso != "B")


# 28. Controlla i livelli della colonna Corso in 'studenti_attivi'. 
#     Usa droplevels() per rimuovere il livello "B" rimasto vuoto.
levels(studenti_attivi$Corso)
studenti_attivi$Corso = droplevels(studenti_attivi$Corso)
levels(studenti_attivi$Corso)


# 29. Crea un secondo dataframe 'residenze':
#     - ID: c(1, 3, 5, 6)
#     - Citta: c("Roma", "Milano", "Roma", "Napoli")
residenze = data.frame(
  ID    = c(1, 3, 5, 6),
  Citta = c("Roma", "Milano", "Roma", "Napoli")
)

# 30. Usa merge() per unire 'studenti' e 'residenze' usando la chiave 'ID'.
#     Mantieni tutte le righe (all = TRUE).
merge(studenti, residenze, by = "ID", all = TRUE)


# 31. EXTRA: (TIDYR) Carica la libreria tidyr. Usa pivot_longer() su 'residenze' 
#     per allungare le colonne (puramente come esercizio sintattico, anche se ha 1 sola colonna target).
library(tidyr)
pivot_longer(residenze, cols = Citta, names_to = "Variabile", values_to = "Valore")


# -----------------------------------------------------------------------
# SEZIONE 5: PROGRAMMAZIONE, APPLY E CICLI 
# -----------------------------------------------------------------------

# 32. Scrivi una funzione saluto che riceva 'nome' e 'citta'. 
#     Usa paste() per restituire: "Ciao [nome], benvenuto a [citta]!".
saluto = function(nome, citta) {
  paste0("Ciao ", nome, ", benvenuta a ", citta, "!")
}
saluto("Bea", "Lucca")

# 33. Scrivi una funzione valuta_numero che riceva 'x'.
#     Se x > 10 stampa "x è maggiore di 10", se x < 10 stampa "x è minore di 10", 
#     altrimenti "x è uguale a 10".

valuta_numero = function(x) {
  if (x > 10){
    print("x è maggiore di 10")
  }else if (x < 10) {
    print("x è minore di 10")    
  }else{
    print("x è uguale a 10")    
  }
}
valuta_numero(13)

# 34. Riscrivi la logica dell'esercizio 32 applicata a un vettore 'v = c(5, -2, 0)'
#     utilizzando la funzione vettorializzata dplyr::case_when().
v = c(5, -2, 0)
dplyr::case_when(
  v > 10  ~ "x è maggiore di 10",
  v < 10  ~ "x è minore di 10",
  TRUE    ~ "x è uguale a 10"
)

# 35. Crea una funzione 'radice' che riceva 'x'. Se x < 0, interrompi l'esecuzione 
#     con un warning o uno stop("Impossibile radice di negativo"). Altrimenti calcola sqrt(x).
radice = function(x) {
  if (x < 0) stop("Impossibile calcolare la radice di un numero negativo")
  sqrt(x)
}
radice(9)
radice(-9)

# --- FAMIGLIA APPLY ---

# 36. Matrice numerica P:
P = matrix(rnorm(12), nrow = 3, ncol = 4)
#     Usa apply() per calcolare la MEDIA di ciascuna RIGA della matrice P.
apply(P, 1, mean)   # media per ogni riga

# 37. Usa apply() sulla stessa matrice P per calcolare la SOMMA di ciascuna COLONNA.
apply(P, 2, sum)    # somma per ogni colonna


# 38. Considera il dataframe 'studenti' creato in precedenza (senza NA per comodità):
df_voti = data.frame(Corso = factor(c("A","B","A","B")), Voto = c(28, 22, 26, 30))

# Usa tapply() per calcolare il Voto MEDIO suddiviso per Corso.
df_voti = data.frame(Corso = factor(c("A","B","A","B")), Voto = c(28, 22, 26, 30))
tapply(df_voti$Voto, df_voti$Corso, mean)

# 39. Crea una lista L = list(a = 1:5, b = 10:15). 
#     Usa lapply() per calcolare la somma (sum) di ogni elemento della lista L.
L = list(a = 1:5, b = 10:15)
lapply(L, sum)

# --- CICLI ---

# 40. Ciclo FOR: Inizializza divisione a 1. Usa un ciclo for per iterare sui numeri 
#     da 1 a 5, moltiplicando progressivamente la variabile divisione Stampa il risultato.
divisione = 1
for (i in 1:5) {
  divisione = divisione * i
}
print(divisione)

# 40. Ciclo WHILE: Parti da somma = 0 e contatore = 1.
#     Finché somma è minore o uguale a 50, aggiungi il contatore alla somma
#     e incrementa il contatore di 1. Alla fine, stampa il contatore.
somma     = 0
contatore = 1
while (somma <= 50) {
  somma     = somma + contatore
  contatore = contatore + 1
}
print(contatore)



# ==========================================
# Esercizi: aggiuntivi
# ==========================================

# 41. Scrivi una funzione pari_dispari() che accetti un vettore numerico.
#    Utilizza un ciclo for e la logica if-else per scorrere il vettore e 
#    stampare per ogni numero: "[Numero] è Pari" oppure "[Numero] è Dispari".
#    Suggerimento: usa l'operatore modulo %%.
vettore_test = c(4, 7, 10, 15, 22)
pari_dispari = function(vettore) {
  for (n in vettore) {
    if (n %% 2 == 0) {
      cat(n, "è Pari\n")
    } else {
      cat(n, "è Dispari\n")
    }
  }
}
vettore_test = c(4, 7, 10, 15, 22)
pari_dispari(vettore_test)

# 42. Scrivi un programma che faccia un conto alla rovescia partendo da 10.
#    Utilizza un ciclo while. Quando il conto arriva a 0, il ciclo deve 
#    interrompersi e il programma deve stampare "Partenza!".
conto = 10
while (conto >= 0) {
  if (conto == 0) {
    cat("Partenza!\n")
    break
  }
  cat(conto, "\n")
  conto = conto - 1
}

# 43. Crea una funzione `calcola_fattoriale(n)` che calcoli il fattoriale
#    di un numero intero positivo 'n' usando un ciclo for. 
#    (Il fattoriale di 5 è 5 * 4 * 3 * 2 * 1).
#    Se l'utente inserisce 0, la funzione deve restituire 1.
calcola_fattoriale = function(n) {
  if (n == 0) return(1)
  risultato = 1
  for (i in 1:n) {
    risultato = risultato * i
  }
  risultato
}
calcola_fattoriale(5)   # 120
calcola_fattoriale(0) 
# controllo factorial(5), factorial è una funzione di R base

# 44. Scrivi una funzione `valuta_esame()` che prenda in input un vettore di voti 
#    universitari (da 0 a 30) e utilizzi dplyr::case_when() per restituire:
#    - "Bocciato" se il voto è minore di 18
#    - "Sufficiente" se è tra 18 e 23
#    - "Buono" se è tra 24 e 27
#    - "Ottimo" se è tra 28 e 30
#    Testala con: voti = c(15, 18, 25, 30, 22)
valuta_esame = function(voti) {
  dplyr::case_when(
    voti < 18             ~ "Bocciato",
    voti >= 18 & voti <= 23 ~ "Sufficiente",
    voti >= 24 & voti <= 27 ~ "Buono",
    voti >= 28 & voti <= 30 ~ "Ottimo"
  )
}
voti = c(15, 18, 25, 30, 22)
valuta_esame(voti)

# 45. Utilizza un ciclo for per scorrere tutte le 
#    colonne del dataset integrato in R airquality. 
#    Per ogni colonna, verifica se ci sono valori mancanti (NA). 
#    Se ci sono, stampa il nome della colonna e il numero totale di NA.
#    Suggerimento: usa sum(is.na()) e names(airquality).
for (col in names(airquality)) {
  n_na = sum(is.na(airquality[[col]]))
  if (n_na > 0) {
    cat("Colonna:", col, "- NA:", n_na, "\n")
  }
}

# 46. Simula il lancio di una moneta utilizzando sample(c("Testa", "Croce"), 1).
#    Utilizza un ciclo repeat che continui a lanciare la moneta finché non 
#    ottieni "Testa" per 3 volte (non necessariamente consecutive). 
#    Usa una variabile contatore e l'istruzione break per uscire dal ciclo.
contatore_testa = 0
repeat {
  lancio = sample(c("Testa", "Croce"), 1)
  if (lancio == "Testa") contatore_testa = contatore_testa + 1
  if (contatore_testa == 3) break
}
cat("Ottenute 3 Teste!\n")

# 47. Crea una funzione chiamata trova_massimo che trovi il valore massimo 
#    in un vettore numerico SENZA utilizzare la funzione integrata max().
#    Inizializza una variabile `massimo_corrente` col primo elemento del vettore, 
#    poi usa un ciclo for e un if per confrontare e aggiornare il valore.
trova_massimo = function(vettore) {
  massimo_corrente = vettore[1]
  for (x in vettore) {
    if (x > massimo_corrente) massimo_corrente = x
  }
  massimo_corrente
}
trova_massimo(c(3, 7, 1, 9, 4)) 

# 48. Scrivi una funzione `calcola_logaritmo(x)` che restituisca il logaritmo 
#    naturale di un numero. Se il numero inserito è negativo o zero, la funzione 
#    deve generare un warning con la funzione warning() ("Attenzione: numero non valido") 
#    e restituire NA, altrimenti restituisce il logaritmo calcolato.
calcola_logaritmo = function(x) {
  if (x <= 0) {
    warning("Attenzione: numero non valido")
    return(NA)
  }
  log(x)
}
calcola_logaritmo(-3)
calcola_logaritmo(10)

