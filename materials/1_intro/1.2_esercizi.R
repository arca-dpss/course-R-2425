#   Esercizi Introduttivi

# 1. Crea gli oggetti x e y e assegna loro il valore 54 e 17, rispettivamente. 
x = 54
y = 17
#   1.1. Crea un oggetto k che è la somma di x e y
k = x + y
#   1.2. Definisci una proposizione che ti permetta di valutare se k
#   è un numero è pari. (tip: cosa ti ricorda %%).
k%%2 == 0 # resto della divisione dev'essere == 0, non lo è quindi non è pari

# 2. Esegui questo comando: 4 + 3 + ( 5 * 2 >= 10) e spiega il risultato
4 + 3 + ( 5 * 2 >= 10)
# esegue prima  5 * 2
4 + 3 + ( 10 >= 10)
# valuta se 10 >= 10, che è TRUE quindi 1 
4 + 3 + 1


# 3. Esegui le seguenti operazioni 4+3 | 5*2 >= 10,
#    Cosa osservi nell’ordine di esecuzione degli operatori?

4+3 | 5*2 >= 10 # 5*2 é uguale a 10, quindi TRUE
4+3|TRUE # numero diverso da 0 è TRUE

# 4. Crea gli oggetti a e b assegnando loro il valore 176 e 8 rispettivamente
a = 176
b = 8
# 4.1. Verifica se la divisione tra a e b è un numero dispari
a/b%%2!=0 # a / b e poi faccio il resto della divisione

# 5. Definisci una proposizione per valutare la seguente condizione 
# “x è un numero compreso tra -5 e -3 oppure è un numero compreso tra 3 e 5”.
# Testa tutti i possibili scenari: (cambia x )
x = 1
(x >= -5  & x <= -3 ) | (x >= 3 & x <= 5)
abs(x) >= 3 & abs(x) <= 5

# 6. Esegui le seguenti operazioni logiche tra stringhe e 
# prova prevedere il risultato prima di eseguire il codice:

"ehi" == "ehi"
"R" == "r" #case sensitive
"SPSS" != "SpSS" #case sensitive
"1" == 1 #i numeri li riconosce
"a" > "b" # le lettere vanno in ordine alfabetico di grandezza
"ciao" > "zebra"

