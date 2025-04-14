# ESAME

# 1. Crea due oggetti a e b, assegnando loro il valore 15 e 7
a = 15
b = 7
# 1.1. Scrivi un'espressione per valutare se a è minore di b 
(a < b) == TRUE

# 1.2. Scrivi un'espressione per valutare se la differenza tra a e b è 
#.     un numero dispari
(a - b) %% 2 != 0

# 2. Crea un vettore "numeri" contenente i numeri interi da 5 a 15
numeri = 5:15

# 2.1. Estrai il terzo e il penultimo elemento
c(numeri[3], numeri[length(numeri)-1])


# 2.2. Calcola la somma di tutti gli elementi presenti nel vettore
sum(numeri)

# 2.3. Sostituisci tutti i numeri dispari con il valore 0
numeri[numeri %% 2 != 0] = 0
numeri

# 2.4. Conta quanti numeri pari ci sono nel vettore
sum(numeri %% 2 == 0)


# 3. Crea un vettore "colori" in cui i colori "rosso", "verde", "blu" 
# sono ripetuti 3 volte ciascuno attraverso la funzione rep()
# Risultato: "rosso" "rosso" "rosso" "verde" "verde" "verde" "blu" "blu" "blu"
colori=rep(c("rosso", "verde", "blu"), each = 3)
colori

# 4. Crea un fattore "mesi" con i livelli "gen", "feb", "mar", "apr", 
# ciascuno ripetuto 3 volte.
mesi=factor(rep(c("gen", "feb", "mar", "apr"), each = 3))
mesi

# 4.1. Modifica il livello "apr" in "primavera".
levels(mesi)[levels(mesi) == "apr"] = "primavera"
mesi

# 5. Crea un fattore "frutta" con i livelli "mela", "banana", "arancia", 
# ciascuno ripetuto 4 volte.
frutta=factor(rep(c("mela", "banana", "arancia"), each = 4))
frutta

# 5.1. Rimuovi le osservazioni con il livello "banana"
frutta=frutta[frutta != "banana"]
frutta

# 5.2. Usa droplevels() per aggiornare i livelli.
frutta=droplevels(frutta)
frutta

# 5.3. Cambia tutte le osservazioni di "mela" in "pera".
levels(frutta)[levels(frutta) == "mela"] = "pera"
frutta

# 6. Crea un fattore stato_civile con i livelli "single", "sposato", "divorziato".
stato_civile=factor(c("single", "sposato", "divorziato"))

# 6.1. Aggiungi un nuovo livello "vedovo"
levels(stato_civile)=c(levels(stato_civile), "vedovo")
stato_civile

# 6.2. Assegna questa categoria a due nuove osservazioni
stato_civile=c(stato_civile, factor(c("vedovo", "vedovo")))
stato_civile

# 7. Crea una lista "info_persona" composta da:
# Un vettore numerico con l'età: 25
# Un vettore carattere con il nome: "Alice"
# Un vettore logico con lo stato lavorativo: TRUE (occupato)
info_persona=list(25, "Alice", TRUE)


# 7.1. Estrai il nome della persona all'interno della lista "info_persona" 
info_persona[[2]]

# 7.2. Nomina i tre elementi della lista come "eta", "nome" e "occupato"
names(info_persona)=c("eta", "nome", "occupato")

# 7.3. Estrai l'età sia attraverso il nome che con l'indice numerico, 
# verificando che i due risultati siano identici.
info_persona$eta
info_persona[[1]]
info_persona$eta==info_persona[[1]]

# 8. Crea una matrice "N" di dimensione 3x3, dove 
# la prima riga contiene i numeri 2,4,6, 
# la seconda riga contiene i numeri 8,10,12, e 
# la terza riga contiene i numeri 14,16,18
N=matrix(c(2,4,6,8,10,12,14,16,18), nrow = 3, byrow = TRUE)
N
# 9. Crea un dataframe "studenti" così composto:
# Matricola (fattore) con 5 numeri di matricola,"001", "002", "003", "004", "005"
# Voto (numerico) con i voti degli esami 28, 22, 30, 25, 27
# Corso (fattore) con i corsi di studio "Informatica", "Matematica", "Informatica", "Matematica", "Informatica"
studenti=data.frame(
  Matricola = factor(c("001", "002", "003", "004", "005")),
  Voto = c(28, 22, 30, 25, 27),
  Corso = factor(c("Informatica", "Matematica", "Informatica", "Matematica", "Informatica"))
)

# 9.1. Estrai solo la colonna Voto (usando l'operatore $)
studenti$Voto

# 9.2. Estrai la seconda colonna usando l'indicizzazione []
studenti[,2]

# 9.3. Estrai le matricole degli studenti che hanno un voto superiore a 25
# Usando subset:
# Usando l'indicizzazione []:
subset(studenti, Voto > 25)$Matricola
studenti$Matricola[studenti$Voto > 25]


# 9.4. Aggiungi al dataframe "studenti" una nuova colonna chiamata "Anno" e 
# inserisci l'anno di corso (ad esempio, 1, 2, 3) per ciascuno studente.
studenti$Anno=c(1, 2, 3, 1, 2)
studenti


