
# =========================================================
# 1.2 - Introduzione: Oggetti, Operatori, Logica
# =========================================================

# 1. Crea gli oggetti p e q e assegna loro i valori 38 e 6.

# 1.1 Calcola il resto della divisione tra p e q e salvalo come oggetto resto

# 1.2 Valuta p è divisibile per q.



# 2. Esegui il comando seguente e spiega il risultato:
# 10 > 3 + (2 * 4 < 9)



# 3. Crea gli oggetti m = 5 e n = 15.

# 3.1 Verifica se m elevato al quadrato è minore di n.

# 3.2 Verifica se m è dispari OPPURE n è multiplo di 4.


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

# 1.1 Calcola la media e la mediana di prezzi.

# 1.2 Seleziona solo i prezzi maggiori di 25.

# 1.3 Sostituisci i valori maggiori di 30 con NA.

# 1.4 Ricalcola la media attezione!.



# 2. Crea un vettore colori in cui "rosso", "verde", "blu"
#    sono ripetuti 3 volte ciascuno (ogni colore in blocco, usa each =).

# 2.1 Seleziona solo gli elementi uguali a "verde".



# 3. Crea un vettore punteggi con i valori: 78, 45, 92, 60, 88, 34, 71, 55.

# 3.1 Estrai il secondo e l'ultimo elemento.

# 3.2 Conta quanti punteggi sono >= 70.

# 3.3 Sostituisci tutti i punteggi < 50 con il valore 50



# 4. Un professore assegna la lode se lo studente ha risposto correttamente
#    a più di 18 domande su 20 E ha consegnato tutti e 3 i compiti a casa.
#    Altrimenti prende 30 se ha risposto ad almeno 16 domande e consegnato
#    almeno 2 compiti. Altrimenti 28
#    Calcola il risultato per questi studenti:
risposte_corrette = c(19, 16, 20, 14, 17)
compiti_casa     = c(3,  2,  3,  3,  1)
# Crea un vettore risultato con "Lode", "30", o "28".



# =========================================================
# 2.2 - Fattori
# =========================================================

# 1. Crea un fattore voti con i livelli "A", "B", "C", "D",
#    ciascuno ripetuto 4 volte.

# 1.1 Visualizza i livelli.

# 1.2 Rinomina i livelli in "Ottimo", "Buono", "Sufficiente", "Insufficiente".



# 2. Crea un fattore "trasporti" con i livelli "auto", "bici", "treno", "bus",
#    ognuno ripetuto 3 volte.

# 2.1 Rimuovi le osservazioni con livello "bus".

# 2.2 Usa droplevels() per eliminare i livelli inutilizzati.

# 2.3 Verifica con levels() che "bus" non esista più.



# 3. Crea un vettore stringa:

# 3.1 Trasforma in fattore

# 3.2 Versione numerica

# 3.3 Fattore con livelli espliciti ordinati in modo alfabeticamente inverso ?sort

# 3.4 Rinomina i livelli di "nazioni_fact2" con le rispettive capitali.




# 4. Crea un fattore ordinato "dimensioni" con i livelli
#    "piccolo" < "medio" < "grande", con 5 osservazioni miste. 
# guarda argomento ordered

# 4.1 Aggiungi il livello "extra-grande".

# 4.2 Assegna "extra-grande" all'ultima osservazione.
