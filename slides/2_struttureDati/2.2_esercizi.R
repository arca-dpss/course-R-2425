# FATTORI

# 1. Crea un fattore composto dai livelli "ragno" "gatto" "nemo" e 9 elementi

# 2. Rinomina i livelli del fattore, attento che siano assegnati ai giusti elementi
# Es. "felino", "insetto", "pesce"

# 3. Crea un secondo fattore che includa solo due livelli del primo fattore, 
# (ricordati di escludere il livello che non serve più)

# 4. Inverti l'ordine dei due livelli, !inverti l'ordine != rinominare

# 5. Crea la variabile categoriale intervento così definita:

## [1] CBT         Psicanalisi CBT         Psicanalisi CBT         Psicanalisi
## [7] Controllo   Controllo   CBT        
## Levels: CBT Controllo Psicanalisi

# 5.1. Correggi nella variabile intervento la 7° e 8° osservazione con la voce Farmaci. 
#  Notate qualcosa di strano?

# In pratica è necessario prima aggiungere un livello al fattore e 
# poi aggiungere/modificare delle osservazioni appartenenti a quel livello.

# 6. Aggiungi alla variabile intervento le seguenti nuove osservazioni:
# c("Farmaci","Controllo","Farmaci")

intervento = c(intervento, as.factor(c("Farmaci","Controllo","Farmaci")))
str(intervento)

# cosa succede con questo e perche?
intervento_w = c(intervento, c("Farmaci","Controllo","Farmaci"))
str(intervento_w)
