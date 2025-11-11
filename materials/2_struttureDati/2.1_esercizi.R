# Esercizi vettori con soluzioni

# 1. Crea un vettore my_vect contenente i minuti di allenamento 
# registrati per sessione in palestra da 12 a 150.
my_vect = 12:150

# 1.1 Estrai il quarto e il penultimo elemento di my_vect"
# ?length
my_vect[c(4,length(my_vect)-1)]

# 1.2 Calcola la radice quadrata dei minuti in my_vect 
sqrt(my_vect)

# 1.3 Crea l'oggetto s il cui valore è dato dalla somma dei minuti totali.
s = sum(my_vect)

# 1.4 Assegna il valore s agli elementi di my_vect che hanno 
# minuti compresi tra 20–60 oppure tra 100–130 
my_vect[(my_vect>20 & my_vect<60) | (my_vect>100 & my_vect<130)] = s
my_vect
# 2. Crea multipli_3 che è un vettore contenente i primi 10 multipli di 3 (3 compreso). 
# ?seq
multipli_3 = seq(from = 3, by = 3, length.out = 10)
multipli_3
# 3. Crea my_lett1 con etichette di aree geografiche 
# "NORD","CENTRO","SUD" ripetute 2 volte ciascuna. 
# ?rep
my_lett1= rep(c("NORD","CENTRO","SUD"), each = 2)
my_lett1

# 3.1 Crea my_lett1_new ordinando my_lett1 in 
# ordine alfabetico (opzionale, vedi ?sort)
my_lett1_new = sort(my_lett1)

# 4. Crea il vettore num contenente i conteggi giornalieri di libri venduti (da 15 a 27). 
num = 15:27

# 4.1 Sostituisci con NA gli elementi di num multipli di 4.
num%%4 == 0 # quali numeri, se li divido per 4, mi danno resto == 0?
num[num%%4 == 0] = NA
# 4.2 Calcola la somma totale dei libri venduti escludendo gli NA.
sum(num, na.rm = TRUE)

# 5. Crea il vettore my_lett2 ripetendo il pattern di aree "NORD","CENTRO","SUD" due volte.
my_lett2 = rep(c("NORD","CENTRO","SUD"), times = 2) 
# 6. Verifica se i vettori my_lett1_new e my_lett2 sono identici 
my_lett1_new == my_lett2
sum(my_lett1_new == my_lett2) == length(my_lett1_new)
# ricorda true = 0 e false = 1
# voglio che siano tutti true, quindi la somma uguale alla lunghezza del vettore

# 6.2 Estrai gli elementi di my_lett1_new uguali a my_lett2. 
my_lett1_new[my_lett1_new == my_lett2]

# 7. Assegna i voti in base alla perfomance degli studenti in termini di numero
#    di risposte corrette ad un quiz e numero di progetti conclusi
# Dati:
quiz = c(14, 24, 26, 18)
names(quiz) = c("tizio","caio","sempronio","carlo") # nomi studenti
progetti    = c(1,  2,  3,  2)
names(progetti) = c("tizio","caio","sempronio","carlo") # nomi studenti
# Regole per un attestato di corso online:
# “30L” se lo studente ha risposto correttamente a più di 24 quiz e ha completato almeno 2 progetti, 
# “30” se ha risposto a 24 quiz e ha completato almeno 2 progetti, 
# “30meno” altrimenti. 
voti = rep(NA, length(quiz))
voti
quiz > 24 & progetti >= 2
voti[quiz > 24 & progetti >= 2] = "30L" 
voti[quiz == 24 & progetti >= 2] = "30" 
voti[is.na(voti)] = "30meno"
voti


