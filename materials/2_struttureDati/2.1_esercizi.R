# Vettori -----------------------------------------------------------------

# 1. Crea un vettore "my_vect" contenente tutti i numeri da 4 a 133
my_vect = 4:133

# 1.1 Estrai il terzo e il penultimo elemento di "my_vect". ?length
my_vect[c(3,length(my_vect)-1)]

# 1.2 Calcola la radice quadrata di tutti gli elementi di "my_vect".
sqrt(my_vect)
# 1.3 Calcola la somma di tutti gli elementi di "my_vect"
sum(my_vect)
s = sum(my_vect)
# 1.4 Assegna come valore questa somma a tutti i valori di "my_vect" 
# compresi tra 6 e 56 e tra 93 e 120
my_vect[(my_vect>=6 & my_vect<=56) | (my_vect>=93 & my_vect<=120)] = s

# 2. Crea un vettore "multipli_3" che contenga i multipli di 3 da 3 a 30 
# utilizzando la funzione seq().
multipli_3 = seq(from = 3, to = 30, by = 3)
multipli_3

# 3. Genera un vettore "my_lett1" in cui le stringhe "A", "B", "C" 
# sono ripetute rispettivamente 2 volte ciascuna. "A","A", "B", "B", "C","C" 
# 3.1 Crea un vettore my_lett1_new che è uguale a my_lett1,
# ma cambia l'ordine degli elementi in modo che il vettore siano 
#in ordine alfabetico inverso. ?sort

my_lett1 = rep(c("A", "B", "C" ), each = 2)
my_lett1_new = sort(my_lett1, decreasing = TRUE)


# 4. Crea un vettore "num" con i valori da 5 a 15.
# 4.1 Sostituisci tutti i numeri divisibili per 4 con il valore NA.
num = 5:15
num[num%%4 == 0] = NA
# 4.2 Calcola la somma degli elementi di num, escludendo i valori NA.
sum(num, na.rm = T)

# 5. Crea un vettore my_lett2 che ripete il pattern di letter 
# "A", "B", "C", due volte.
# "A", "B", "C" "A", "B", "C"
my_lett2 = rep(c("A", "B", "C" ), times = 2)
# 5.1 Crea un vettore my_lett2_new, che è uguale a my_lett2 ma cambia l'ordine degli elementi 
# in modo che il vettore siano in ordine alfabetico  ?sort
my_lett2_new = sort(my_lett2)
  
# 6. Valuta se my_lett1_new è identico a my_lett2_new ?all.equal
all.equal(my_lett1_new,my_lett2_new)
my_lett1_new==my_lett2_new
# 6.1 Estrai gli elementi di my_lett1_new uguali a my_lett2_new
my_lett1_new[my_lett1_new == my_lett2_new]

# 7. Un’esame ha le seguenti regole per il voti:
#    Uno studente prende 30 se ha risposto correttamente
#    ad almeno 20 a scelta multiple a se ha completato almeno 2 lavori di gruppo
#    Se uno studete ha completato più di 20 domande, prende 30 e lode.
#    Scrivi il codice per determinare il voto di seguenti studenti:
#    Dati studenti, un valore per studente

domandeMultiple=c(10, 20, 25, 21)
lavoriGruppo=c(3, 2, 2, 3)

voti = c()

voti[domandeMultiple > 20 & lavoriGruppo >= 2] = "30L"
voti[domandeMultiple == 20 & lavoriGruppo >= 2] = "30"
voti[domandeMultiple < 20] = "meno"









