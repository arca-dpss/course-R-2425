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
