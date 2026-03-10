# soluzioni df complex

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
# SOLUZIONI – dataframe dentro una lista
# =========================================================

sessioni <- list(
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


# ── SEZIONE 1 ─────────────────────────────────────────────

# 1.1
length(sessioni)   # 3

# 1.2
names(sessioni)    # "giorno_1" "giorno_2" "giorno_3"

# 1.3
sessioni$giorno_2
sessioni[["giorno_2"]]
sessioni[[2]]
identical(sessioni$giorno_2, sessioni[["giorno_2"]])   # TRUE
identical(sessioni$giorno_2, sessioni[[2]])            # TRUE

# 1.4
sessioni$giorno_1$RT_ms          # oppure:
sessioni[["giorno_1"]][["RT_ms"]]
sessioni[[1]][[2]]               # con doppio indice numerico
# [1] 312 287  NA

# 1.5
sessioni$giorno_3[1, ]
#   Partecipante RT_ms
# 1       Giulia   278

# 1.6
class(sessioni[1])    # "list"   → restituisce una lista con un elemento
class(sessioni[[1]])  # "data.frame" → restituisce direttamente il dataframe
# [ ] è come ritagliare una sezione della lista (il contenitore rimane);
# [[ ]] estrae il contenuto dell'elemento.


# ── SEZIONE 2 ─────────────────────────────────────────────

g1 <- sessioni$giorno_1

# 2.1
nrow(g1)   # 3
ncol(g1)   # 2

# 2.2
min(g1$RT_ms, na.rm = TRUE)   # 287

# 2.3
anyNA(g1$RT_ms)          # TRUE
which(is.na(g1$RT_ms))   # 3  → terza riga (Carla)

# 2.4
g1[complete.cases(g1), ]
#   Partecipante RT_ms
# 1         Anna   312
# 2        Bruno   287

# 2.5
g1$Giorno <- "giorno_1"
sessioni$giorno_1 <- g1
sessioni$giorno_1
#   Partecipante RT_ms   Giorno
# 1         Anna   312 giorno_1
# 2        Bruno   287 giorno_1
# 3        Carla    NA giorno_1


# ── SEZIONE 3 ─────────────────────────────────────────────

# 3.1
names(sessioni$giorno_2)[names(sessioni$giorno_2) == "RT_ms"] <- "Tempo_ms"
names(sessioni$giorno_2)   # "Partecipante" "Tempo_ms"

# 3.2
# RT_ms è già presente in giorno_3 → non serve aggiungerla.
# Se si provasse ad aggiungere una colonna con lo stesso nome,
# R creerebbe "RT_ms.1" oppure sovrascriverà il valore esistente.
# Osserva:
sessioni$giorno_3$RT_ms   # 278 320 → già presente

# 3.3
sessioni$giorno_1$Partecipante <- factor(sessioni$giorno_1$Partecipante)
class(sessioni$giorno_1$Partecipante)    # "factor"
levels(sessioni$giorno_1$Partecipante)   # "Anna" "Bruno" "Carla"


# ── SEZIONE 4 ─────────────────────────────────────────────

# 4.1
mean(sessioni$giorno_1$RT_ms, na.rm = TRUE)   # 299.5  (media di 312 e 287)
mean(sessioni$giorno_3$RT_ms)                 # 299    (278 + 320) / 2
# giorno_3 ha la media leggermente più bassa (299 vs 299.5)

# 4.2
# Prima aggiungiamo la colonna Giorno anche a giorno_2 e giorno_3,
# e allineiamo i nomi delle colonne (giorno_2 ha "Tempo_ms" invece di "RT_ms")

sessioni$giorno_2$Giorno <- "giorno_2"
sessioni$giorno_3$Giorno <- "giorno_3"

# Ripristina il nome RT_ms in giorno_2 per uniformità
names(sessioni$giorno_2)[names(sessioni$giorno_2) == "Tempo_ms"] <- "RT_ms"

tutti <- rbind(sessioni$giorno_1, sessioni$giorno_2, sessioni$giorno_3)
tutti
#    Partecipante RT_ms   Giorno
# 1          Anna   312 giorno_1
# 2         Bruno   287 giorno_1
# 3         Carla    NA giorno_1
# 4         Diego   298 giorno_2
# 5         Elena    NA giorno_2
# 6         Fabio   305 giorno_2
# 7        Giulia   278 giorno_3
# 8          Ivan   320 giorno_3

nrow(tutti)   # 8

# 4.3
sum(tutti$RT_ms > 300, na.rm = TRUE)   # 3  (Anna 312, Fabio 305, Ivan 320)

tutti[!is.na(tutti$RT_ms) & tutti$RT_ms > 300, ]
#   Partecipante RT_ms   Giorno
# 1         Anna   312 giorno_1
# 6        Fabio   305 giorno_2
# 8         Ivan   320 giorno_3
