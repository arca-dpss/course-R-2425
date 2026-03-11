# Esericizi dataframe

# 1. Costruisci un dataframe denominato studenti formato da:
# - Cognome (fattore): "Rossi", "Bianchi", "Verdi", "Neri", "Gialli", "Blu", "Viola", "Rosa", "Grigi", "Marroni"
# - Voto (numerico): 28, 24, 30, 22, 27, 25, 29, 23, 26, 30
# - Crediti (numerico): 45, 60, 55, 38, 72, 50, 68, 42, 58, 65

studenti = data.frame(Cognome = factor(c("Rossi", "Bianchi", "Verdi", "Neri", 
                                         "Gialli", "Blu", "Viola", "Rosa", 
                                         "Grigi", "Marroni")),
                      Voto = c(28, 24, 30, 22, 27, 25, 29, 23, 26, 30),
                      Crediti = c(45, 60, 55, 38, 72, 50, 68, 42, 58, 65))
str(studenti)

# 2. Recupera:
# 2.1 La colonna Voto utilizzando la notazione con $ 
studenti$Voto
# 2.2 La seconda colonna tramite indicizzazione numerica
studenti[[2]]

# 2.3 I cognomi degli studenti che hanno più di 50 crediti
# (impiega sia subset() che la notazione [ ])
# Qual è la differenza nell'output restituito?
subset(studenti, subset = Crediti > 50, select = Cognome)
Crediti = 1
studenti[studenti$Crediti > 50, 1]

studenti[studenti$Crediti > 50, c("Cognome", "Crediti")]


# 3. Inserisci nel dataframe studenti una colonna aggiuntiva denominata 
# Corso contenente il nome del corso di laurea di ciascuno studente
# "Psicologia", "Medicina", "Psicologia", "Ingegneria", "Medicina", 
# "Psicologia", "Medicina", "Ingegneria", "Psicologia", "Medicina"

studenti$Corso = factor(c("Psicologia", "Medicina", "Psicologia", "Ingegneria", 
                          "Medicina", "Psicologia", "Medicina", "Ingegneria", 
                          "Psicologia", "Medicina"))


# 4. Determina quanti studenti sono iscritti a ogni Corso (?table)

table(studenti$Corso)

# 5. Filtra le osservazioni con voto superiore a 27 
# mantenendo solo le colonne Cognome e Crediti
# utilizza entrambi i metodi: subset() e [ ]

subset(studenti, subset = Voto > 27, select = c(Cognome, Crediti))

studenti[studenti$Voto > 27, c("Cognome", "Crediti")]

# 6. Genera un secondo dataframe studenti2 con 3 osservazioni, 
# a piacimento ma che abbia colonne compatibili per essere combinato con studenti 
# tramite rbind(), quindi unisci i due dataframe producendo studenti_completo

studenti2 = data.frame(Cognome = factor(c("Baio","Bio","Beo")),
                       Voto = c(27,25,20),
                       Corso = factor(rep("Psicologia", 3)),
                       Crediti = c(30,60,80))

studenti_completo = rbind(studenti, studenti2)

# 7. Considera questi due dataframe:
dati_a = data.frame(Matricola = 1:5, 
                    Studente = c("Luca", "Maria", "Paolo", "Sofia", "Marco"))
dati_b = data.frame(Matricola = c(2,4,6), 
                    Residenza = c("Torino", "Venezia", "Bologna"))

# Unisci dati_a e dati_b in un nuovo dataframe registro usando Matricola 
# come chiave (?merge) conservando tutte le righe presenti in dati_a
registro = merge(x = dati_b, y = dati_a, by = "Matricola", 
                 all = TRUE)

# 8. Nel dataframe registro aggiungi la colonna Descrizione
# combinando Studente e Residenza in un'unica stringa (?paste, ?sprintf)
?paste

registro$Descrizione = paste(registro$Studente, 
                             registro$Residenza, sep = "")
registro

# 9. Identifica gli studenti in registro che hanno valore 
# NA nella colonna Residenza (?is.na)
is.na(registro$Residenza)
which(is.na(registro$Residenza))

registro[is.na(registro$Residenza), c("Studente", "Residenza")]

registro$Studente[is.na(registro$Residenza)]

registro$Studente[which(is.na(registro$Residenza))]

# 10. Estrai da registro solo le osservazioni complete senza alcun NA (vedi complete.cases())
complete.cases(registro)
registro[complete.cases(registro), ]

# 11. Determina il voto medio nel dataframe studenti, gestendo eventuali valori NA

mean(studenti$Voto, na.rm = TRUE)

# 12. Riordina studenti in base ai Crediti dal più alto al più basso (?order)
?order

order(studenti$Crediti, decreasing = TRUE)

studenti[order(studenti$Crediti, decreasing = TRUE),]


# =========================================================
# Esercizi – grepl/grep e tidyr
# Dataset: studio su partecipanti a un intervento psicologico
# =========================================================

# ── DATI ──────────────────────────────────────────────────

studio=data.frame(
  ID        = 1:8,
  Nome      = c("Anna", "Bruno", "Carla", "Diego",
                "Elena", "Fabio", "Giulia", "Ivan"),
  Condizione = c("Controllo",   "Trattamento", "Controllo",   "Trattamento",
                 "Trattamento", "Controllo",   "Trattamento", "Controllo"),
  Eta       = c(22, 25, NA, 28, 23, NA, 27, 24),
  Pre       = c(45, 38, 52, 41, 48, 36, 55, 43),
  Post      = c(48, 50, NA, 58, 51, 49, 57, NA)
)


# ── SEZIONE A – grepl / grep ───────────────────────────────

# A1. Usa grepl() per creare un vettore logico che indica
#     quali righe di studio hanno Condizione == "Trattamento"
#     senza usare ==, ma cercando la stringa "amento".
#     Poi usalo per filtrare le righe corrispondenti con [ ].

# grepl() restituisce un vettore logico lungo quanto studio$Condizione
trattamento_logic=grepl("amento", studio$Condizione)
trattamento_logic

# Filtro delle righe con [ ]
studio[trattamento_logic, ]


# A2. Usa grepl() con ignore.case = TRUE per trovare
#     i partecipanti il cui Nome contiene la lettera "a"
#     (maiuscola o minuscola).
#     Quanti sono? (applica sum() al vettore logico)
ha_a=grepl("a", studio$Nome, ignore.case = TRUE)
ha_a

sum(ha_a)   # 3

studio$Nome[ha_a]


# ── SEZIONE B – tidyr ──────────────────────────────────────

library(tidyr)

# B1. Usa pivot_longer() per portare studio in formato lungo:
#     le colonne Pre e Post diventano due colonne
#     chiamate Tempo (con i valori "Pre" e "Post")
#     e Punteggio (con i valori numerici).
#     Salva il risultato in studio_long.
#     Quante righe ha studio_long rispetto a studio? Perché?
#     (?pivot_longer)

studio_long=pivot_longer(
  studio,
  cols      = c(Pre, Post),   # le colonne da allungare
  names_to  = "Tempo",        # nuova colonna con i nomi "Pre"/"Post"
  values_to = "Punteggio"     # nuova colonna con i valori numerici
)

# B2. Riporta studio_long in formato largo con pivot_wider()
#     in modo da ricostruire Pre e Post.
#     Salva in studio_wide e verifica con identical()
#     che le colonne Pre e Post siano identiche all'originale.
#     (?pivot_wider, ?identical)
studio_wide=pivot_wider(
  studio_long,
  names_from  = Tempo,      # i valori "Pre"/"Post" diventano nomi di colonna
  values_from = Punteggio   # i valori tornano nelle rispettive celle
)

identical(studio_wide$Pre,  studio$Pre)    # TRUE
identical(studio_wide$Post, studio$Post)   # TRUE


# B3. La colonna Eta in studio contiene due NA.
#     B3.1 Usa fill() con .direction = "down" per propagare
#          verso il basso l'ultimo valore non-NA.
#          (?fill)

studio_fill_down=fill(studio, Eta, .direction = "down")

studio_fill_down[, c("ID", "Nome", "Eta")]

# B3.2 Prova anche .direction = "up": cosa cambia?

studio_fill_up=fill(studio, Eta, .direction = "up")

studio_fill_up[, c("ID", "Nome", "Eta")]

