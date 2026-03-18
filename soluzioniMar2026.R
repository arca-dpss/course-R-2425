# =======================================================================
# ESAME FINALE DI PROGRAMMAZIONE IN R - SOLUZIONI
# =======================================================================

# -----------------------------------------------------------------------
# SEZIONE 1: VETTORI E OPERATORI LOGICI
# -----------------------------------------------------------------------

# 1.
p <- 145
q <- 12
p %% q == 0  # FALSE: 145 non è divisibile per 12

# 2.
tempi <- seq(10, 60, by = 5)

# 3.
tempi[tempi > 40] <- NA

# 4.
mean(tempi, na.rm = TRUE)

# 5.
"Zebra" > "alpaca"                          # confronto case-sensitive
tolower("Zebra") > tolower("alpaca")        # confronto case-insensitive

# 6.
aree <- rep(c("NORD", "CENTRO", "SUD"), each = 3)


# -----------------------------------------------------------------------
# SEZIONE 2: FATTORI
# -----------------------------------------------------------------------

# 7.
medaglie <- factor(c("Oro", "Bronzo", "Argento", "Oro", "Bronzo"),
                   levels = c("Bronzo", "Argento", "Oro"),
                   ordered = TRUE)

# 8.
levels(medaglie) <- c("Terzo", "Secondo", "Primo")

# 9.
turni <- factor(rep(c("Mattina", "Pomeriggio", "Notte"), each = 2),
                levels = c("Mattina", "Pomeriggio", "Notte"))

# 10.
turni <- turni[turni != "Notte"]

# 11.
turni <- droplevels(turni)
levels(turni)

# 12.
levels(turni) <- c(levels(turni), "Sera")
turni[length(turni)] <- "Sera"


# -----------------------------------------------------------------------
# SEZIONE 3: LISTE, MATRICI
# -----------------------------------------------------------------------

# 13.
Mat <- matrix(1:12, nrow = 3, ncol = 4)

# 14.
Mat[2, 3]

# 15.
colSums(Mat)

# 16.
esperimento <- list(
  Nome     = "Studio_Alpha",
  Dati     = Mat,
  Concluso = FALSE
)

# 17.
esperimento$Dati
esperimento[["Dati"]]
identical(esperimento$Dati, esperimento[["Dati"]])  # TRUE

# 18.
frutti <- c("mela", "Melone", "banana", "Mela verde")
logico_mela <- grepl("mela", frutti, ignore.case = TRUE)

# 19.
frutti[logico_mela]


# -----------------------------------------------------------------------
# SEZIONE 4: DATAFRAME
# -----------------------------------------------------------------------

# 20.
studenti <- data.frame(
  ID    = 1:5,
  Nome  = c("Leo", "Mia", "Ugo", "Ada", "Eli"),
  Corso = factor(c("A", "B", "A", "B", "A")),
  Voto  = c(28, NA, 25, 30, 18)
)

# 21.
table(studenti$Corso)

# 22.
studenti$Nome
studenti[["Nome"]]

# 23.
studenti[complete.cases(studenti), ]

# 24.
studenti[order(studenti$Voto, decreasing = TRUE), ]

# 25. Aggiungiamo livello "C" al fattore Corso
levels(studenti$Corso) <- c(levels(studenti$Corso), "C")

# 26.
nuova_riga <- data.frame(ID = 6, Nome = "Pio",
                         Corso = factor("C", levels = levels(studenti$Corso)),
                         Voto = 24)
studenti <- rbind(studenti, nuova_riga)

# 27.
studenti_attivi <- subset(studenti, Corso != "B")

# 28.
levels(studenti_attivi$Corso)
studenti_attivi$Corso <- droplevels(studenti_attivi$Corso)
levels(studenti_attivi$Corso)

# 29.
residenze <- data.frame(
  ID    = c(1, 3, 5, 6),
  Citta = c("Roma", "Milano", "Roma", "Napoli")
)

# 30.
merge(studenti, residenze, by = "ID", all = TRUE)

# 31.
library(tidyr)
pivot_longer(residenze, cols = Citta, names_to = "Variabile", values_to = "Valore")


# -----------------------------------------------------------------------
# SEZIONE 5: PROGRAMMAZIONE, APPLY E CICLI
# -----------------------------------------------------------------------

# 32.
saluto <- function(nome, citta) {
  paste0("Ciao ", nome, ", benvenuto a ", citta, "!")
}
saluto("Leo", "Padova")

# 33.
valuta_numero <- function(x) {
  if (x > 10) return("x è maggiore di 10")
  if (x < 10) return("x è minore di 10")
  return("x è uguale a 10")
}
valuta_numero(5)

# 34.
v <- c(5, -2, 0)
dplyr::case_when(
  v > 10  ~ "x è maggiore di 10",
  v < 10  ~ "x è minore di 10",
  TRUE    ~ "x è uguale a 10"
)

# 35.
radice <- function(x) {
  if (x < 0) stop("Impossibile calcolare la radice di un numero negativo")
  sqrt(x)
}
radice(9)

# --- FAMIGLIA APPLY ---

# 36.
P <- matrix(rnorm(12), nrow = 3, ncol = 4)
apply(P, 1, mean)   # media per ogni riga

# 37.
apply(P, 2, sum)    # somma per ogni colonna

# 38.
df_voti <- data.frame(Corso = factor(c("A","B","A","B")), Voto = c(28, 22, 26, 30))
tapply(df_voti$Voto, df_voti$Corso, mean)

# 39.
L <- list(a = 1:5, b = 10:15)
lapply(L, sum)

# --- CICLI ---

# 40a. Ciclo FOR (prodotto cumulativo)
divisione <- 1
for (i in 1:5) {
  divisione <- divisione * i
}
print(divisione)   # 120

# 40b. Ciclo WHILE
somma     <- 0
contatore <- 1
while (somma <= 50) {
  somma     <- somma + contatore
  contatore <- contatore + 1
}
print(contatore)


# -----------------------------------------------------------------------
# ESERCIZI AGGIUNTIVI
# -----------------------------------------------------------------------

# 41.
pari_dispari <- function(vettore) {
  for (n in vettore) {
    if (n %% 2 == 0) {
      cat(n, "è Pari\n")
    } else {
      cat(n, "è Dispari\n")
    }
  }
}
vettore_test <- c(4, 7, 10, 15, 22)
pari_dispari(vettore_test)

# 42.
conto <- 10
while (conto >= 0) {
  if (conto == 0) {
    cat("Partenza!\n")
    break
  }
  cat(conto, "\n")
  conto <- conto - 1
}

# 43.
calcola_fattoriale <- function(n) {
  if (n == 0) return(1)
  risultato <- 1
  for (i in 1:n) {
    risultato <- risultato * i
  }
  risultato
}
calcola_fattoriale(5)   # 120

# 44.
valuta_esame <- function(voti) {
  dplyr::case_when(
    voti < 18             ~ "Bocciato",
    voti >= 18 & voti <= 23 ~ "Sufficiente",
    voti >= 24 & voti <= 27 ~ "Buono",
    voti >= 28 & voti <= 30 ~ "Ottimo"
  )
}
voti <- c(15, 18, 25, 30, 22)
valuta_esame(voti)

# 45.
for (col in names(airquality)) {
  n_na <- sum(is.na(airquality[[col]]))
  if (n_na > 0) {
    cat("Colonna:", col, "- NA:", n_na, "\n")
  }
}

# 46.
contatore_testa <- 0
repeat {
  lancio <- sample(c("Testa", "Croce"), 1)
  if (lancio == "Testa") contatore_testa <- contatore_testa + 1
  if (contatore_testa == 3) break
}
cat("Ottenute 3 Teste!\n")

# 47.
trova_massimo <- function(vettore) {
  massimo_corrente <- vettore[1]
  for (x in vettore) {
    if (x > massimo_corrente) massimo_corrente <- x
  }
  massimo_corrente
}
trova_massimo(c(3, 7, 1, 9, 4))   # 9

# 48.
calcola_logaritmo <- function(x) {
  if (x <= 0) {
    warning("Attenzione: numero non valido")
    return(NA)
  }
  log(x)
}
calcola_logaritmo(-3)
calcola_logaritmo(10)
