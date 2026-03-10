# Esericizi dataframe

# 1. Costruisci un dataframe denominato studenti formato da:
# - Cognome (fattore): "Rossi", "Bianchi", "Verdi", "Neri", "Gialli", "Blu", "Viola", "Rosa", "Grigi", "Marroni"
# - Voto (numerico): 28, 24, 30, 22, 27, 25, 29, 23, 26, 30
# - Crediti (numerico): 45, 60, 55, 38, 72, 50, 68, 42, 58, 65

# 2. Recupera:
# 2.1 La colonna Voto utilizzando la notazione con $ 
# 2.2 La seconda colonna tramite indicizzazione numerica
# 2.3 I cognomi degli studenti che hanno più di 50 crediti
# (impiega sia subset() che la notazione [ ])
# Qual è la differenza nell'output restituito?

# 3. Inserisci nel dataframe studenti una colonna aggiuntiva denominata 
# Corso contenente il nome del corso di laurea di ciascuno studente
# "Psicologia", "Medicina", "Psicologia", "Ingegneria", "Medicina", 
# "Psicologia", "Medicina", "Ingegneria", "Psicologia", "Medicina"

# 4. Determina quanti studenti sono iscritti a ogni Corso (?table)

# 5. Filtra le osservazioni con voto superiore a 27 
# mantenendo solo le colonne Cognome e Crediti
# utilizza entrambi i metodi: subset() e [ ]

# 6. Genera un secondo dataframe studenti2 con 3 osservazioni, 
# a piacimento ma che abbia colonne compatibili per essere combinato con studenti 
# tramite cbind(), quindi unisci i due dataframe producendo studenti_completo


# 7. Considera questi due dataframe:
dati_a = data.frame(Matricola = 1:5, Studente = c("Luca", "Maria", "Paolo", "Sofia", "Marco"))
dati_b = data.frame(Matricola = c(2,4,6), Residenza = c("Torino", "Venezia", "Bologna"))
# Unisci dati_a e dati_b in un nuovo dataframe registro usando Matricola come chiave (?merge)
# conservando tutte le righe presenti in dati_a

# 8. Nel dataframe registro aggiungi la colonna Descrizione
# combinando Studente e Residenza in un'unica stringa (?paste, ?sprintf)

# 9. Identifica gli studenti in registro che hanno valore NA nella colonna Residenza (?is.na)

# 10. Estrai da registro solo le osservazioni complete senza alcun NA (vedi complete.cases())

# 11. Determina il voto medio nel dataframe studenti, gestendo eventuali valori NA

# 12. Riordina studenti in base ai Crediti dal più alto al più basso (?order)







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
trattamento_logic <- grepl("amento", studio$Condizione)
trattamento_logic

# Filtro delle righe con [ ]
studio[trattamento_logic, ]


# A2. Usa grepl() con ignore.case = TRUE per trovare
#     i partecipanti il cui Nome contiene la lettera "a"
#     (maiuscola o minuscola).
#     Quanti sono? (applica sum() al vettore logico)
ha_a <- grepl("a", studio$Nome, ignore.case = TRUE)
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

studio_long <- pivot_longer(
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
studio_wide <- pivot_wider(
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

studio_fill_down <- fill(studio, Eta, .direction = "down")

studio_fill_down[, c("ID", "Nome", "Eta")]

#     B3.2 Prova anche .direction = "up": cosa cambia?

studio_fill_up <- fill(studio, Eta, .direction = "up")

studio_fill_up[, c("ID", "Nome", "Eta")]


# =========================================================
# Esercizi – dataframe dentro una lista
# =========================================================

sessioni=list(
  giorno_1 = data.frame(
    Partecipante = c("Anna", "Bruno", "Carla"),
    RT_ms        = c(312, 287, NA)
  ),
  giorno_2 = data.frame(
    Partecipante = c("Diego", "Elena", "Fabio"),
    RT_ms        = c(298, NA, 305)
  ),
  giorno_3 = data.frame(
    Partecipante = c("Giulia", "Ivan"),
    RT_ms        = c(278, 320)
  )
)


# ── SEZIONE 1 – Accesso agli elementi della lista ─────────

# 1.1 Quanti elementi contiene sessioni?

# 1.2 Quali sono i nomi degli elementi?

# 1.3 Estrai il dataframe del giorno_2 in tre modi:
#     a) con $ e il nome
#     b) con [[ ]] e il nome tra virgolette
#     c) con [[ ]] e l'indice numerico
#     I tre risultati sono identici? Verificalo con identical().

# 1.4 Estrai solo la colonna RT_ms del giorno_1
#     usando due livelli di indicizzazione in una sola istruzione.

# 1.5 Estrai la prima riga del dataframe giorno_3.

# 1.6 Qual è la differenza tra sessioni[1] e sessioni[[1]]?
#     Prova entrambi e osserva la classe dell'output con class().


# ── SEZIONE 2 – Operazioni su un singolo dataframe ────────

# Lavora sul dataframe giorno_1.
# Per comodità puoi assegnarlo a un oggetto:
g1=sessioni$giorno_1

# 2.1 Quante righe e quante colonne ha g1? (?nrow, ?ncol)

# 2.2 Qual è il valore minimo di RT_ms in g1, ignorando gli NA?
#     (?min, argomento na.rm)

# 2.3 C'è almeno un NA in RT_ms? (?anyNA)
#     Quale riga contiene l'NA? (?is.na, ?which)

# 2.4 Estrai da g1 solo le righe complete (senza NA). (?complete.cases)

# 2.5 Aggiungi a g1 una colonna Giorno con il valore "giorno_1"
#     per tutte le righe.
#     Poi aggiorna l'elemento corrispondente nella lista:


# ── SEZIONE 3 – Modifica diretta nella lista ──────────────

# 3.1 Converti la colonna Partecipante di sessioni$giorno_1 in factor.
#     Verifica con class() e levels().


# ── SEZIONE 4 – Confronto tra giorni ──────────────────────

# 4.1 Calcola la media di RT_ms per giorno_1 e giorno_3
#     (entrambi senza NA). Quale giorno ha la media più bassa?

# 4.2 Costruisci manualmente un unico dataframe chiamato tutti
#     combinando i tre dataframe con rbind().
#     Prima assicurati che abbiano le stesse colonne.
#     (?rbind)

# 4.3 Nel dataframe tutti, quante osservazioni hanno RT_ms > 300?
