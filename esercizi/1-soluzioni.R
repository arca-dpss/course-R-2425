
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