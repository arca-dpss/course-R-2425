#   Esercizi Lezione 1_intro

# 1. Crea gli oggetti x e y e assegna loro il valore 22 e 4, rispettivamente. 
#   Definisci una proposizione che ti permetta di valutare se la somma tra x e y 
#   è un numero è pari. (tip: cosa ti ricorda %%?).



# 2. Esegui le seguenti operazioni 4+3 | 5*2 >= 10,
#    Cosa osservi nell’ordine di esecuzione degli operatori?



# 3. Esegui questo comando: 4 + 3 + ( 5 * 2 >= 10) e spiega il risultato



# 4. Un’azienda ha le seguenti regole per i bonus:
#    Un dipendente riceve un bonus se ha lavorato più di 40 ore o ha completato almeno 3 progetti.
#    Se un dipendente ha completato più di 5 progetti, riceve un bonus doppio.
#    Scrivi il codice per determinare il bonus dei seguenti dipendenti:
#    Dati dipendenti

ore_lavorate=c(38, 42, 45, 39)
progetti_completati=c(2, 3, 6, 4)

# Condizioni bonus


# 5. Definisci una proposizione per valutare la seguente condizione 
# (ricordati di testare tutti i possibili scenari) 
# “x è un numero compreso tra -8 e -1 oppure è un numero compreso tra 1 e 8”.

# prima soluzione: (x >= -4 & x <= -2) | (x >= 2 & x <= 4)
(x >= -8 & x <= -2) | (x >= 2 & x <= 4) # FALSE
(x >= -4 & x <= -2) | (x >= 2 & x <= 4) # TRUE
(x >= -4 & x <= -2) | (x >= 2 & x <= 4) # FALSE
(x >= -4 & x <= -2) | (x >= 2 & x <= 4) # TRUE
(x >= -4 & x <= -2) | (x >= 2 & x <= 4) # FALSE

# seconda soluzione: abs(x) >= 2 & abs(x) <= 4

# 6. Esegui le seguenti operazioni logiche tra stringhe e 
# prova prevedere il risultato prima di eseguire il codice:

"ciao" == "ciao"
"R" == "r"
"SPSS" != "SpSS"
"1" == 1
"a" > "b"
"ciao" > "zebra"

