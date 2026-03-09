
# =========================================================
# 1.2 - Introduzione: Oggetti, Operatori, Logica
# =========================================================

# 1. Crea gli oggetti p e q e assegna loro i valori 38 e 6.
p = 342
q = 6

# 1.1 Calcola il resto della divisione tra p e q e salvalo come oggetto resto
resto = p%%q

# 1.2 Valuta p è divisibile per q.
resto == 0

# 2. Esegui il comando seguente e spiega il risultato:
# 10 > 3 + (2 * 4 < 9)
10 > 3 + (2 * 4 < 9)

# 3. Crea gli oggetti m = 5 e n = 15.
m = 5; n = 15

# 3.1 Verifica se m elevato al quadrato è minore di n.
m^2 < 15

# 3.2 Verifica se m è dispari OPPURE n è multiplo di 4.
m%%2 != 0 | n%%4 == 0

# 4. Definisci una proposizione per valutare la condizione:
# "z è un numero compreso tra 10 e 20 oppure è negativo".
# Testa almeno tre valori di z: 5, -3, 15.

# 5. Esegui queste operazioni logiche su stringhe e prevedi il risultato:
"Ciao" == "ciao"
"banana" < "mela"
"100" == 100



# =========================================================
# 2.1 - Vettori
# =========================================================

# 1. Crea un vettore prezzi con i numeri pari da 2 a 40
#    usando la funzione seq().
prezzi = seq(from = 2, to = 40, by = 2)

# 1.1 Calcola la media e la mediana di prezzi.
media = mean(prezzi)
med = median(prezzi)

# 1.2 Seleziona solo i prezzi maggiori di 25.
prezzi[prezzi > 25]

# 1.3 Sostituisci i valori maggiori di 30 con NA.
prezzi[prezzi > 30] = NA

# 1.4 Ricalcola la media attezione!.
mean(prezzi, na.rm = TRUE)

# 2. Crea un vettore colori in cui "rosso", "verde", "blu"
#    sono ripetuti 3 volte ciascuno (ogni colore in blocco, usa each =).
colori = rep(c("rosso", "verde", "blu"), each = 3)

# 2.1 Seleziona solo gli elementi uguali a "verde".
colori[colori == "verde"]

# 3. Crea un vettore punteggi con i valori: 78, 45, 92, 60, 88, 34, 71, 55.
punteggi = c(78, 45, 92, 60, 88, 34, 71, 55)

# 3.1 Estrai il secondo e l'ultimo elemento.
punteggi[c(2, length(punteggi))]

# 3.2 Conta quanti punteggi sono >= 70.
sum(punteggi>=70)

# 3.3 Sostituisci tutti i punteggi < 50 con il valore 50
punteggi[punteggi<50] = 50

# 4. Un professore assegna la lode se lo studente ha risposto correttamente
#    a più di 18 domande su 20 E ha consegnato tutti e 3 i compiti a casa.
#    Altrimenti prende 30 se ha risposto ad almeno 16 domande e consegnato
#    almeno 2 compiti. Altrimenti 28
#    Calcola il risultato per questi studenti:
risposte_corrette = c(19, 16, 20, 14, 17)
compiti_casa     = c(3,  2,  3,  3,  1)
# Crea un vettore risultato con "Lode", "30", o "28".

risultato = rep("28",length(compiti_casa))

risultato[risposte_corrette >= 16 & compiti_casa >= 2]  = "30"
risultato[risposte_corrette > 18 & compiti_casa == 3]  = "Lode"

risultato

# =========================================================
# 2.2 - Fattori
# =========================================================

# 1. Crea un fattore voti con i livelli "A", "B", "C", "D",
#    ciascuno ripetuto 4 volte.
voti = factor(rep(c("A","B","C","D"), each = 4))

# 1.1 Visualizza i livelli.
levels(voti)

# 1.2 Rinomina i livelli in "Ottimo", "Buono", "Sufficiente", "Insufficiente".
levels(voti) = c("Ottimo", "Buono", "Sufficiente", "Insufficiente")

# 2. Crea un fattore "trasporti" con i livelli "auto", "bici", "treno", "bus",
#    ognuno ripetuto 3 volte.
trasporti = factor(rep(c("auto","bici","treno","bus"), each = 3))

# 2.1 Rimuovi le osservazioni con livello "bus".
trasporti_filt = trasporti[trasporti != "bus"]

# 2.2 Usa droplevels() per eliminare i livelli inutilizzati.
trasporti_filt = droplevels(trasporti_filt)

# 2.3 Verifica con levels() che "bus" non esista più.
levels(trasporti_filt)

# 3. Crea un vettore stringa:
nazioni = c("Italia", "Francia", "Germania", "Italia", "Spagna", "Francia")

# 3.1 Trasforma in fattore
nazioni_fact = factor(nazioni)

# 3.2 Versione numerica
nazioni_num = as.integer(nazioni_fact)

# 3.3 Fattore con livelli espliciti ordinati in modo alfabeticamente inverso ?sort
nazioni_fact2 = factor(nazioni, levels = sort(unique(nazioni), decreasing = TRUE))

# 3.4 Rinomina i livelli di "nazioni_fact2" con le rispettive capitali.
levels(nazioni_fact2) = c("Parigi","Madrid", "Berlino", "Roma")

# 4. Crea un fattore ordinato "dimensioni" con i livelli
#    "piccolo" < "medio" < "grande", con 5 osservazioni miste. 
# guarda argomento ordered
dimensioni = factor(
  c("piccolo","grande","medio","piccolo","grande"),
  levels  = c("piccolo","medio","grande"),
  ordered = TRUE
)

# 4.1 Aggiungi il livello "extra-grande".
dimensioni = factor(dimensioni,
                    levels  = c(levels(dimensioni), "extra-grande"),
                    ordered = TRUE)

# 4.2 Assegna "extra-grande" all'ultima osservazione.
dimensioni[length(dimensioni)] = "extra-grande"
dimensioni

# =========================================================
# 2.3 - Liste e Matrici
# =========================================================

# 1. Crea una lista studente contenente:
#    - una stringa (es. "Giulia")
#    - un vettore numerico con 5 voti (es. da 24 a 30)
#    - un valore logico

studente = list("Giulia", c(24, 26, 28, 30, 27), TRUE)

# 1.1 Estrai il secondo voto usando l'indicizzazione numerica.
studente[[2]][2]   # 26

# 1.2 Assegna i nomi "nome", "voti", "promosso" agli elementi.
names(studente) = c("nome","voti","promosso")

# 1.3 Estrai il vettore voti usando il nome ($).
studente$voti

# 1.4 Calcola la media dei voti estratti.
mean(studente$voti)   # 27

# 2. Crea una matrice "P" di 4 righe e 3 colonne,
#    riempita con i numeri da 1 a 12, per righe (byrow = TRUE).
P = matrix(1:12, nrow = 4, ncol = 3, byrow = TRUE)

# 2.1 Estrai la seconda riga.
P[2, ]

# 2.2 Estrai la terza colonna.
P[, 3]

# 2.3 Calcola la somma di ogni colonna (?colSums).
colSums(P)

# 3. Crea una matrice "Q" di 3 righe usando il vettore 1:9,
#    riempita per colonne (default).
Q = matrix(1:9, nrow = 3)

# 3.1 Trasponi la matrice (?t).
t(Q)

# 3.2 Moltiplica P per Q elemento per elemento (P * Q). Funziona? Perché?
P*Q

# 4. Crea una matrice "R_mat" di 2 righe dove:
#    - La prima riga contiene i multipli di 2 da 2 a 8
#    - La seconda riga contiene i multipli di 3 da 3 a 12
R_mat = matrix(c(seq(2, 8, by = 2),
                 seq(3, 12, by = 3)),
               nrow = 2, byrow = TRUE)

# 4.1 Seleziona gli elementi della prima riga nelle colonne pari.
R_mat[1, c(2, 4)]   # 4  8

# 4.2 Aggiungi la matrice "R_mat" alla lista "studente".
studente$R_mat = R_mat

# =========================================================
# 2.4 - Data Frame
# =========================================================

# 1. Crea un dataframe "libri" con le colonne:
#    - Titolo (character): 5 titoli a scelta
#    - Autore (character): 5 autori a scelta
#    - Anno (numeric): 5 anni di pubblicazione
#    - Pagine (numeric): 5 valori numerici
#    - Letto (logical): se il libro è stato letto
libri = data.frame(
  Titolo = c("Il nome della rosa","1984","Dune","Fondazione","Neuromante"),
  Autore = c("Umberto Eco","George Orwell","Frank Herbert",
             "Isaac Asimov","William Gibson"),
  Anno   = c(1980, 1949, 1965, 1951, 1984),
  Pagine = c(502, 328, 412, 255, 271),
  Letto  = c(TRUE, TRUE, FALSE, FALSE, TRUE)
)

# 2. Estrai:
# 2.1 Solo la colonna Anno (usando $).
libri$Anno

# 2.2 La seconda e quarta colonna (usando l'indicizzazione []).
libri[, c(2, 4)]

# 2.3 I Titoli dei libri con più di 300 pagine
#     (usa sia subset() che []).
subset(libri, Pagine > 300, select = Titolo)
libri[libri$Pagine > 300, "Titolo"]

# 3. Aggiungi una colonna "Genere" al dataframe "libri".
libri$Genere = c("Romanzo storico","Distopico","Fantascienza",
                 "Fantascienza","Cyberpunk")

# 4. Calcola la frequenza di ogni valore di "Genere" con table().
table(libri$Genere)

# 5. Seleziona i libri pubblicati dopo il 2000 e non ancora letti.
#    Usa sia subset() che [].
subset(libri, Anno > 2000 & !Letto)
libri[libri$Anno > 2000 & !libri$Letto, ]
# (con questi dati nessun libro soddisfa entrambe le condizioni)

# 6. Considera questi due dataframe:
df_a = data.frame(CodiceISBN = c("A1", "B2", "C3", "D4"),
                  Titolo     = c("Dune", "1984", "Neuromante", "Fondazione"))
df_b = data.frame(CodiceISBN = c("B2", "C3", "E5"),
                  Prezzo     = c(12.50, 9.90, 15.00))
# 6.1 Unisci i due dataframe con merge(), mantenendo tutte le righe.
merged = merge(df_a, df_b, by = "CodiceISBN", all = TRUE)

# 6.2 Crea una colonna "Info" che unisca Titolo e Prezzo in una stringa.
merged$Info = paste(merged$Titolo,
                    ifelse(is.na(merged$Prezzo), "N/D",
                           paste0("€", merged$Prezzo)),
                    sep = " - ")
# 6.3 Seleziona i libri senza prezzo (NA).
merged[is.na(merged$Prezzo), ]

# 6.4 Ordina il dataframe unito per Prezzo in ordine crescente (?order).
merged[order(merged$Prezzo), ]


# =========================================================
# 3.1 - Funzioni e Programmazione Condizionale
# =========================================================

# 1. Scrivi una funzione "quadrato()" che riceve un numero e
#    restituisce il suo quadrato.
#    Scrivila in due modi: con return() e senza.

# 2. Scrivi una funzione "saluto(nome, ora)" che restituisce:
#    "Buongiorno, [nome]!" se ora < 12
#    "Buon pomeriggio, [nome]!" se 12 <= ora < 18
#    "Buonasera, [nome]!" altrimenti
#    Usa if / else if / else.

# 3. Scrivi una funzione "descrivi_vettore(v)" che:
#    - Calcola media, mediana e deviazione standard di v
#    - Gestisce i valori NA (na.rm = TRUE)
#    - Restituisce una stringa formattata con sprintf()
v_test = c(5, 10, NA, 15, 7, NA, 3)

# 4. Scrivi una funzione "classifica_bmi(bmi)" che restituisce:
#    "Sottopeso" se bmi < 18.5
#    "Normopeso" se 18.5 <= bmi < 25
#    "Sovrappeso" se 25 <= bmi < 30
#    "Obeso" se bmi >= 30
#    Usa dplyr::case_when() E una versione con ifelse() nested.

# 5. Scrivi una funzione "valida_input(x)" che:
#    - Lancia un errore con stop() se x non è numerico
#    - Lancia un warning con warning() se x contiene NA
#    - Restituisce la somma di x (na.rm = TRUE)

# 6. Un cinema applica prezzi variabili:
#    €5 per bambini (età <= 12)
#    €8 per ragazzi (13 <= età <= 17)
#    €10 per adulti (18 <= età <= 64)
#    €7 per anziani (età >= 65)
#    Dato il vettore:
eta_spettatori = c(8, 35, 16, 70, 12, 45, 17, 66)
#    Calcola il costo del biglietto per ciascuno usando ifelse() o case_when().


# =========================================================
# 3.2 - Programmazione Iterativa
# =========================================================

# 1. Usa un ciclo for per calcolare il fattoriale di 7.
#    Inizializza fattoriale = 1 e moltiplica per ogni i da 1 a 7.

# 2. Scrivi una funzione "conta_vocali(stringa)" che conta le vocali
#    in una stringa. Usa strsplit() per dividere la stringa in caratteri
#    e un ciclo for per contare.
#    Testa con: "programmazione in R"

# 3. Usa un ciclo while per trovare il più piccolo numero intero n
#    tale che n^2 > 500. Stampa n e n^2.

# 4. Usa un ciclo for per scorrere le colonne del dataset iris e:
#    - Per le colonne numeriche, stampa il range (max - min).
#    - Per le colonne fattore, stampa il numero di livelli.

# 5. Usa un ciclo repeat per simulare il lancio di una moneta
#    finché non escono 3 "testa" consecutive.
#    Stampa ogni lancio e il numero totale di lanci necessari.

# 6. Simula i dati di un esperimento di memoria:
#    - 3 gruppi: "Controllo", "Caffè", "Riposo"
#    - 30 partecipanti per gruppo
#    - Punteggio di memoria: distribuzione normale
#      Controllo: mean=70, sd=10; Caffè: mean=78, sd=9; Riposo: mean=75, sd=8
#    Crea un dataframe con colonne: Gruppo, Partecipante, Punteggio.
#    Stampa le prime 10 righe e la media per gruppo con aggregate().

# 7. Implementa una funzione "normalizza(v)" che porta un vettore
#    nell'intervallo [0, 1] usando la formula:
#    z_i = (x_i - min(x)) / (max(x) - min(x))
#    Usa un ciclo for per il calcolo.
#    Testa con: c(3, 7, 1, 9, 4).
