# Soluzioni esercizi data.frame

# 1. Costruzione del dataframe studenti
studenti <- data.frame(
  Cognome = factor(c("Rossi", "Bianchi", "Verdi", "Neri", "Gialli", 
                     "Blu", "Viola", "Rosa", "Grigi", "Marroni")),
  Voto = c(28, 24, 30, 22, 27, 25, 29, 23, 26, 30),
  Crediti = c(45, 60, 55, 38, 72, 50, 68, 42, 58, 65)
)

# 2. Recupero di colonne e sottoinsiemi

# 2.1 Colonna Voto con notazione $
studenti$Voto

# 2.2 Seconda colonna tramite indicizzazione numerica
studenti[, 2]

# 2.3 Cognomi degli studenti con più di 50 crediti
subset(studenti, Crediti > 50, select = Cognome)
studenti[studenti$Crediti > 50, "Cognome"]

# DIFFERENZA: 
# subset() restituisce un dataframe (anche se con una sola colonna)
# la notazione [ ] con nome colonna singolo restituisce un vettore (fattore)
# Per ottenere un dataframe con [ ], usare: studenti[studenti$Crediti > 50, "Cognome", drop = FALSE]


# 3. Aggiunta della colonna Corso
studenti$Corso <- c("Psicologia", "Medicina", "Psicologia", "Ingegneria", 
                    "Medicina", "Psicologia", "Medicina", "Ingegneria", 
                    "Psicologia", "Medicina")


# 4. Conteggio studenti per corso
table(studenti$Corso)


# 5. Filtraggio con voto > 27, solo Cognome e Crediti
subset(studenti, Voto > 27, select = c(Cognome, Crediti))
studenti[studenti$Voto > 27, c("Cognome", "Crediti")]


# 6. Creazione di studenti2 e combinazione con cbind()

# Creiamo studenti2 con 3 righe e le stesse colonne
studenti2 <- data.frame(
  Cognome = factor(c("Azzurri", "Arancioni", "Verdeacqua")),
  Voto = c(26, 29, 21),
  Crediti = c(48, 63, 55),
  Corso = c("Psicologia", "Ingegneria", "Medicina")
)

# Combinazione con rbind() (non cbind, perché vogliamo aggiungere righe!)
# NOTA: cbind() aggiunge colonne, rbind() aggiunge righe
studenti_completo <- rbind(studenti, studenti2)


# 7. Unione di dataframe con merge()
dati_a <- data.frame(Matricola = 1:5, 
                     Studente = c("Luca", "Maria", "Paolo", "Sofia", "Marco"))
dati_b <- data.frame(Matricola = c(2, 4, 6), 
                     Residenza = c("Torino", "Venezia", "Bologna"))

# Merge conservando tutte le righe di dati_a (left join)
registro <- merge(dati_a, dati_b, by = "Matricola", all.x = TRUE)


# 8. Aggiunta colonna Descrizione combinando stringhe
registro$Descrizione <- paste(registro$Studente, registro$Residenza, sep = "_")


# 9. Identificazione studenti con NA in Residenza
registro[is.na(registro$Residenza), "Studente"]


# 10. Estrazione osservazioni complete senza NA
registro_completo <- registro[complete.cases(registro), ]

# Oppure:
# registro_completo <- na.omit(registro)


# 11. Voto medio nel dataframe studenti (gestione NA)
mean(studenti$Voto, na.rm = TRUE)

# In questo caso non ci sono NA, ma l'argomento na.rm = TRUE 
# garantisce il calcolo anche in presenza di valori mancanti


# 12. Riordinamento per Crediti (dal più alto al più basso)
studenti_ordinati <- studenti[order(studenti$Crediti, decreasing = TRUE), ]
studenti_ordinati

