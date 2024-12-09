# Soluzioni
# FATTORI

# 1. Crea un fattore "my_fact1" composto dai livelli "ragno" "gatto" "nemo", ogni fattore ha 3 elementi
# con il comando rep(), creo un vettore carattere 
# in cui "ragno", "gatto" ,"nemo" vengono ripetuti 3 volte, 
# il comando factor cre il fattore, che automaticamente avrà 3 livelli
my_fact1 = factor(rep(c("ragno", "gatto" ,"nemo"), each = 3))
my_fact1

# 2. Rinomina i livelli del fattore, attento che siano assegnati ai giusti elementi!
# Es. "felino", "insetto", "pesce"
levels(my_fact1) # ordine dei livelli è "gatto" "nemo"  "ragno"
# quando riassegno i nomi devo stare attenta all'ordine
levels(my_fact1) = c("felino","pesce","insetto") 
my_fact1
# è possibile anche utilizzare la funzione factor
# my_fact1 = factor(my_fact1, levels = c("ragno", "gatto" ,"nemo"),
#                     labels = c("felino","pesce","insetto"))

# 3. Crea un secondo fattore "my_fact2" che includa solo due livelli del primo fattore, 
# (ricordati di escludere il livello che non serve più, droplevels() ) 
# estraggo dal fattore my_fact1 tutti gli elementi diversi da "insetto"
my_fact2 = my_fact1[my_fact1 != "insetto"]
levels(my_fact2)
# mi ricordo di fare droplevels per escludere i livelli che non mi servono più
my_fact2 = droplevels(my_fact2)
my_fact2

# 4. Crea un terzo fattore my_fact3, identico a "my_fact2",
#  ma con l'ordine dei due livelli invertito del fattore 
# "my_fact2" (factor(....))
# è possibile riordinare i livelli attraverso la l'argomento levels,
# della funzione factor
my_fact3 = factor(my_fact3, levels = c("pesce","felino"))
my_fact3

# 5. Crea la variabile categoriale intervento così definita:

## [1] CBT         Psicanalisi CBT         Psicanalisi CBT         Psicanalisi
## [7] Controllo   Controllo   CBT        
## Levels: CBT Controllo Psicanalisi

# concateno il vettore carattere rep(c("CBT","Psicanalisi"), times = 3), con
# c("Controllo","Controllo","CBT"))
intervento = factor(c(rep(c("CBT","Psicanalisi"), times = 3), 
                      c("Controllo","Controllo","CBT")))
intervento

# 5.1. Correggi nella variabile intervento la 7° e 8° osservazione con la voce Farmaci. 
#  Notate qualcosa di strano?
intervento[7:8] = "Farmaci"

# In pratica è necessario prima aggiungere un livello al fattore e 
# poi aggiungere/modificare delle osservazioni appartenenti a quel livello.
# aggiungo il livello "Farmaci"
levels(intervento) = c("CBT", "Controllo", "Psicanalisi", "Farmaci")
intervento[7:8] = "Farmaci" 
# ora inserisco in posizione 7 e 8 l'osservazione farmaci
intervento

# 6. Aggiungi alla variabile intervento le seguenti nuove osservazioni:
# c("Farmaci","Controllo","Farmaci")

intervento = c(intervento, as.factor(c("Farmaci","Controllo","Farmaci")))
str(intervento) # devo utilizzare il comando as.factor
# altrimenti R coercizza tutto a carattere!!
# cosa succede con questo e perche?
intervento_w = c(intervento, c("Farmaci","Controllo","Farmaci"))
str(intervento_w)

