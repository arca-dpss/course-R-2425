# Esercizi Aggiuntivi

## Esercizi Introduzione--------------

# 1. Crea due oggetti a e b assegnando loro rispettivamente il valore 4 e 10
# 1.1. Crea l'oggetto c come prodotto di a e b
# 1.2. Verifica se c è minore di 40

# 2. Esegui ed interpreta: 7 - 2 + (8 / 2 <mean(x = c(8,8,8,8), trim = 0, na.rm = FALSE)
# 3.1. Esegui ed interpreta: 3*2 | 7-4 > 2
# 3.2. Esegui ed interpreta: 3*2 & 7-4 < 2
# Che cosa noti di differente tra le due proposizioni?

# 4. Crea due oggetti d e e assegnando loro rispettivamente il valore 3 e 8
# 4.1. verifica se d*e è un numero pari ? %%

# 5. Definisci una proposizione per valutare la seguente condizione:
# “x è un numero compreso tra -10 e -8 oppure è un numero compreso tra 8 e 10”
x = 9
# 5.1. se non hai usato la funzione abs(), scrivi una proposizione 
# equivalente usando abs(x) compreso tra 10 e 8. 
x = -9


# 6. Esegui le seguenti operazioni logiche tra stringhe e prova a prevedere il risultato prima 
# di eseguire il codice (i confronti sono case-sensitive e lessicografici). 
"hey" == "Hey"
"R" == "r"
"SPSS" != "spss"
"1" == 1
"a" > "b"
"cane" > "zebra"

# 6.1. Ripeti i confronti in modalità case-insensitive 
# applicando tolower() o toupper() alle stringhe prima del confronto.
# ?tolower
"hey" == "Hey"
"R" == "r"
"SPSS" != "spss"


# Esercizi vettori ------------------------------

# 1. Crea un vettore my_vect contenente i minuti di allenamento 
# registrati per sessione in palestra da 12 a 150.

# 1.1 Estrai il quarto e il penultimo elemento di my_vect
# ?length

# 1.2 Calcola la radice quadrata dei minuti in my_vect 

# 1.3 Crea l'oggetto s il cui valore è dato dalla somma dei minuti totali.

# 1.4 Assegna il valore s agli elementi di my_vect che hanno 
# minuti compresi tra 20–60 oppure tra 100–130 


# 2. Crea multipli_3 che è un vettore contenente i primi 10 multipli di 3 (3 compreso).
# ?seq


# 3. Crea my_lett1 con etichette di aree geografiche
# "NORD","CENTRO","SUD" ripetute 2 volte ciascuna. 
# ?rep


# 3.1 Crea my_lett1_new ordinando my_lett1 in
# ordine alfabetico (opzionale, vedi ?sort)

# 4. Crea il vettore num contenente i conteggi giornalieri di libri venduti (da 15 a 27). 
num = c(15:27)

# 4.1 Sostituisci con NA gli elementi di num multipli di 4.
num4 = (num%%4 == 0)
num[num4] = NA
num
# 4.2 Calcola la somma totale dei libri venduti escludendo gli NA.
sum(num, na.rm = TRUE)

# 5. Crea il vettore my_lett2 ripetendo il pattern di aree "NORD","CENTRO","SUD" due volte.

# 6. Verifica se i vettori my_lett1_new e my_lett2 sono identici


# ricorda true = 0 e false = 1
# voglio che siano tutti true, quindi la somma uguale alla lunghezza del vettore

# 6.2 Estrai gli elementi di my_lett1_new uguali a my_lett2. 


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


# Esercizi fattori ---------

# 1. Crea un fattore colori con i livelli "rosso", "verde", "blu", ciascuno ripetuto 3 volte.
# 1.1 Visualizza i livelli del fattore. 
# 1.2 Rinomina i livelli in "col_rosso", "col_verde", "col_blu".

# 2. Crea un fattore quarti con i livelli "Q1", "Q2", "Q3", "Q4", ciascuno ripetuto 2 volte. 
# 2.1 Rimuovi le osservazioni con livello "Q3". 
# 2.2 Usa droplevels() per eliminare i livelli non più presenti. 

# 3. Crea un fattore piatti con i livelli "primo", "secondo", "contorno", "dolce", ciascuno ripetuto 2 volte. 


# 3.1 Crea un nuovo fattore piatti_ord con l'ordine dei livelli invertito (usa levels in factor()).
# ?sort

#inverto l'ordine dei livelli


# 3.2 Reimposta il livello di riferimento su "dolce" usando ( prova ad usare la funzione relevel(), opzionale). 

# 4. Crea un fattore fiori con i livelli "rosa", "tulipano", "girasole". 
# 4.1 Aggiungi un nuovo livello "orchidea" e assegnalo a una nuova osservazione. 
# 4.2 Verifica che il nuovo livello compaia in levels() e usa droplevels se necessario. 

# 5. Crea un fattore reparti con le categorie "A", "B", "C", ciascuna ripetuta 4 volte. 
# 5.1 Cambia le prime 3 osservazioni in "D" # che succede? 
# 5.2 Controlla i livelli e, se rimangono livelli inutilizzati, rimuovili con droplevels(). 


# 6. Crea un vettore paesi = c("Italia","Francia","Spagna","Italia","Germania","Francia"). 
# 6.1 Trasformalo nel fattore paesi_fact con factor() o as.factor().
# 6.2 Crea paesi_num trasformando paesi_fact in intero. 
# 6.3 Crea paesi_fact_2 con factor() specificando levels e labels esplicitamente. 
# 6.4 Rinomina i livelli di paesi_fact_2 assegnando l'area geografica corrispondente (es. "EU_Ovest", ...).

# 7. Crea un fattore turni con i livelli "mattina","pomeriggio","notte" ripetuti 3 volte. 
# 7.1 Cambia l'ordine dei livelli a c("notte","pomeriggio","mattina") e verifica l'ordine in levels(). 


# 8. Crea un vettore numerico punti = c(10,20,10,30,20,40) e convertilo in fattore punti_f. 
# 8.2 Ottieni indietro i valori numerici corretti da punti_f.
# 8.3 Spiega perché as.integer(fattore) restituisce codici dei livelli e non i valori originali.

# 9. Crea il fattore classi = factor(rep(c("bronzo","argento","oro"), each=3)). 
# 9.1 Prova ad assegnare "platino" a classi[1:2];
#     verifica i livelli aggiornati. 

# 10. Crea fatt1 e fatt2 con gli stessi valori ma ordine dei livelli diverso. 
# 10.1 Confronta l'uguaglianza elemento-per-elemento (==) e confronta i livelli con levels(). 
# 10.2 Allinea l'ordine dei livelli con factor(..., levels=...) e ripeti il confronto. 



# Esercizi Liste e Matrici ----------------------------

# 1. Costruisci una lista chiamata "dati_lab" che includa:
#    - Un vettore con 4 numeri interi consecutivi partendo da 10
#    - Un vettore con i nomi di 4 colori c("rosso", "blu", "verde", "giallo")
#    - Un vettore logico con 4 valori c(TRUE, FALSE, TRUE,FALSE)

# 2. Accedi al terzo colore del vettore di caratteri

# 3. Denomina gli elementi della lista come "interi", "colori", "booleani"

# 4. Recupera il vettore degli interi e quello booleano utilizzando:
# 4.1  - Notazione con il simbolo $ (salva come "int1" e "bool1")

# 4.2 - Indicizzazione con doppie parentesi quadre (salva come "int2" e "bool2")

# 4.3 - Controlla l'equivalenza

# 5. Trasforma il vettore booleano in formato numerico salvandolo come "bool_num"

# 6. Genera una matrice A unendo per riga il vettore "int1" e "bool_num"


# 7. Inserisci la matrice "A" come quarto elemento della lista "dati_lab"


# 8. Costruisci una matrice P di 4 colonne in cui i valori 5, 10, 15 e 20
#    compaiono 6 volte ciascuno distribuiti rispettivamente 
#    nella prima, seconda, terza e quarta colonna



# 9. Genera una matrice Q contenente i primi 12 numeri pari positivi
#    organizzati su 4 righe e 3 colonne (usa seq() con argomento to= oppure length.out=)

# 10. Forma una matrice "D" selezionando la terza colonna di "P"
#     e la seconda riga di "Q"

# cosa succede?

# 11.   Elimina l'ultima colonna dalla matrice "P"
# 11.1  Controlla che "D" e "P" abbiano lo stesso numero di trighe con nrow()
# 11.2  Combina le due matrici per ottenere "Z" (usa cbind)

# 12. Estrai dalla matrice "Z":
# 12.1  Gli elementi nelle colonne dispari della penultima riga
# 12.2  Gli elementi della prima e ultima riga limitatamente alla seconda colonna.

