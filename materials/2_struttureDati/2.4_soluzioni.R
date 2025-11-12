# Soluzioni esercizi data.frame

# 1. Costruisci un dataframe denominato studenti formato da:
# - Cognome (fattore): "Rossi", "Bianchi", "Verdi", "Neri", "Gialli", "Blu", "Viola", "Rosa", "Grigi", "Marroni"
# - Voto (numerico): 28, 24, 30, 22, 27, 25, 29, 23, 26, 30
# - Crediti (numerico): 45, 60, 55, 38, 72, 50, 68, 42, 58, 65

studenti <- data.frame(
  Cognome = factor(c("Rossi", "Bianchi", "Verdi", "Neri", "Gialli", 
                     "Blu", "Viola", "Rosa", "Grigi", "Marroni")),
  Voto = c(28, 24, 30, 22, 27, 25, 29, 23, 26, 30),
  Crediti = c(45, 60, 55, 38, 72, 50, 68, 42, 58, 65)
)

# 2. Recupera:
# 2.1 La colonna Voto utilizzando la notazione con $ 
# 2.2 La seconda colonna tramite indicizzazione numerica
# 2.3 I cognomi degli studenti che hanno più di 50 crediti
# (impiega sia subset() che la notazione [ ])
# Qual è la differenza nell'output restituito?

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


# 3. Inserisci nel dataframe studenti una colonna aggiuntiva denominata 
# Corso contenente il nome del corso di laurea di ciascuno studente
# "Psicologia", "Medicina", "Psicologia", "Ingegneria", "Medicina", 
# "Psicologia", "Medicina", "Ingegneria", "Psicologia", "Medicina"
studenti$Corso <- c("Psicologia", "Medicina", "Psicologia", "Ingegneria", 
                    "Medicina", "Psicologia", "Medicina", "Ingegneria", 
                    "Psicologia", "Medicina")


# 4. Determina quanti studenti sono iscritti a ogni Corso (?table)
table(studenti$Corso)


# 5. Filtra le osservazioni con voto superiore a 27 
# mantenendo solo le colonne Cognome e Crediti
# utilizza entrambi i metodi: subset() e [ ]
subset(studenti, Voto > 27, select = c(Cognome, Crediti))
studenti[studenti$Voto > 27, c("Cognome", "Crediti")]


# 6. Genera un secondo dataframe studenti2 con 3 osservazioni, 
# a piacimento ma che abbia colonne compatibili per essere combinato con studenti 
# tramite rbind(), quindi unisci i due dataframe producendo studenti_completo

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


# 7. Considera questi due dataframe:
dati_a = data.frame(Matricola = 1:5, Studente = c("Luca", "Maria", "Paolo", "Sofia", "Marco"))
dati_b = data.frame(Matricola = c(2,4,6), Residenza = c("Torino", "Venezia", "Bologna"))
# Unisci dati_a e dati_b in un nuovo dataframe registro usando Matricola come chiave (?merge)
# conservando tutte le righe presenti in dati_a

# Merge conservando tutte le righe di dati_a (left join)
registro <- merge(dati_a, dati_b, by = "Matricola", all.x = TRUE)


# 8. Nel dataframe registro aggiungi la colonna Descrizione
# combinando Studente e Residenza in un'unica stringa (?paste, ?sprintf)
registro$Descrizione <- paste(registro$Studente, registro$Residenza, sep = "_")


# 9. Identifica gli studenti in registro che hanno valore NA nella colonna Residenza (?is.na)
registro[is.na(registro$Residenza), "Studente"]


# 10. Estrai da registro solo le osservazioni complete senza alcun NA (vedi complete.cases())
registro_completo <- registro[complete.cases(registro), ]

# Oppure:
# registro_completo <- na.omit(registro)


# 11. Determina il voto medio nel dataframe studenti, gestendo eventuali valori NA
mean(studenti$Voto, na.rm = TRUE)

# In questo caso non ci sono NA, ma l'argomento na.rm = TRUE 
# garantisce il calcolo anche in presenza di valori mancanti


# 12. Riordina studenti in base ai Crediti dal più alto al più basso (?order)
studenti_ordinati <- studenti[order(studenti$Crediti, decreasing = TRUE), ]
studenti_ordinati

