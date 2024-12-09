# Soluzioni
# OPERATORI

# 1. Crea gli oggetti x e y e assegna loro il valore 22 e 4, rispettivamente. 
#   Definisci una proposizione che ti permetta di valutare se la somma tra x e y 
#   è un numero è pari. (tip: cosa ti ricorda %%?).
# creo l'oggetto x
x = 22
# creo l'oggetto y
y = 4
# sommo x a y, e attaverso il comando %%2, valuto il resto della divisione 
# se il resto == zero allora il numero è pari
sumxy = x+y
sumxy%%2 == 0
#oppure
(x+y)%%2 == 0


# 2.  Cosa osservi nell’ordine di esecuzione degli operatori?
# Esempio con | 
4 + 3 | 5 * 2 > 10
# operatori matematici prima quindi
5 * 2 
# operatori matematici prima quindi
4 + 3 
# operatori relazionali secondi
10 > 10
# per ultimi i logici
# qui abbiamo da un lato 7 e dall'altro TRUE
7 | FALSE
# R valuta 7 come non zero (non FALSE) #è una novità per me 
TRUE | FALSE
# Risultato è TRUE

# ESEMPIO con &
4 + 3 & 5 * 2 > 10
# operatori matematici prima quindi
5 * 2 
# operatori matematici prima quindi
4 + 3
# operatori relazionali secondi
10 > 10 # FALSE
# per ultimii logici
TRUE & FALSE #  FALSE, perchè dovrebbero essere entrambi TRUE per risulare TRUE


# 3. Esegui questo comando: 4 + 3 + ( 5 * 2 >= 10) e 
# spiega il risultato: 8
4 + 3 + ( 5 * 2 >= 10) 
# prima le operazioni moltiplicazioni tra parentesi quindi
4 + 3 + (10 >= 10)
# poi quello che c'è tra parentesi
10 >= 10 # questo è TRUE e true == 1, quindi
4 + 3 + 1

# 4. Un’azienda ha le seguenti regole per i bonus:
#    Un dipendente riceve un bonus se ha lavorato più di 40 ore o ha completato almeno 3 progetti.
#    Se un dipendente ha completato più di 5 progetti, riceve un bonus doppio.
#    Scrivi il codice per determinare il bonus dei seguenti dipendenti:
#    Dati dipendenti

ore_lavorate=c(38, 42, 45, 39)
progetti_completati=c(2, 3, 6, 4)

# Condizioni bonus
# quando le ore lavorate sono maggiori di 40 oppure i progetti >= a 3
bonus=(ore_lavorate > 40) | (progetti_completati >= 3)
# altro bonus quando i progetti sono maggiori di 5
bonus_doppio=progetti_completati > 5

print(bonus)
print(bonus_doppio)


# 5. Definisci una proposizione per valutare la seguente condizione 
# “x è un numero compreso tra -8 e -1 oppure è un numero compreso tra 1 e 8”.

# prima soluzione:
x = -2 # prima affermazione vera e seconda false
(x >= -8 & x <= -1) | (x >= 1 & x <= 8) # TRUE
x = 2# prima affermazione falsa e seconda vera
(x >= -8 & x <= -1) | (x >= 1 & x <= 8) # TRUE
x = -10 # entrambe false
(x >= -8 & x <= -1) | (x >= 1 & x <= 8) # FALSE

# seconda soluzione: abs(x) >= 2 & abs(x) <= 4
abs(x) >= 2 & abs(x) <= 8
# è possibile utilizzare il valore assoluto


# 6. Esegui le seguenti operazioni logiche tra stringhe e 
# prova prevedere il risultato prima di eseguire il codice:

"ciao" == "ciao"
"R" == "r" # case sesitive
"SPSS" != "SpSS" # case sesitive
"1" == 1 # coercizzazione
"a" > "b" # a è più piccolo di b perchè viene prima nell'alfabeto
"ciao" > "zebra" # stesso discorso
 



