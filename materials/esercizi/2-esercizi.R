
# =========================================================
# 2.2 - Fattori
# =========================================================

# 1. Crea un fattore voti con i livelli "A", "B", "C", "D",
#    ciascuno ripetuto 4 volte.

voti = factor(x = rep(c("A", "B", "C", "D"), each = 4))
voti
# 1.1 Visualizza i livelli.
levels(voti)

# 1.2 Rinomina i livelli in "Ottimo", "Buono", "Sufficiente", "Insufficiente".
levels(voti) = c("Ottimo", "Buono", "Sufficiente", "Insufficiente")
levels(voti)

# 2. Crea un fattore "trasporti" con i livelli "auto", "bici", "treno", "bus",
#    ognuno ripetuto 3 volte.
trasporti = factor(x=rep(c("auto", "bici", "treno", "bus"), each = 3))

# 2.1 Rimuovi le osservazioni con livello "bus".
trasporti = trasporti[trasporti!="bus"]
trasporti
# 2.2 Usa droplevels() per eliminare i livelli inutilizzati.
trasporti = droplevels(trasporti)

# 2.3 Verifica con levels() che "bus" non esista più.
levels(trasporti)


# 3. Crea un vettore stringa: nazioni
nazioni = c("Francia","Italia","Spagna","Germania")

# 3.1 Trasforma in fattore
nazioni = as.factor(nazioni)

# 3.2 Versione numerica
as.integer(nazioni)

# 3.3 Fattore con livelli espliciti ordinati in modo alfabeticamente inverso ?sort
levels(nazioni) 
nazioni_fact2 = factor(x = nazioni, 
                       levels = sort(levels(nazioni), decreasing = TRUE))
levels(nazioni_fact2) 

# 3.4 Rinomina i livelli di "nazioni_fact2" con le rispettive capitali.
levels(nazioni_fact2) = c("Madrid","Roma","Berlino","Parigi") 
levels(nazioni_fact2)


# 4. Crea un fattore ordinato "dimensioni" con i livelli
#    "piccolo" < "medio" < "grande", con 5 osservazioni miste. 
# guarda argomento ordered

dimensioni = factor(x = c("piccolo","medio","grande","grande","medio"),
                    levels = c("piccolo","medio","grande"),
                    ordered = TRUE)
dimensioni
# 4.1 Aggiungi il livello "extra-grande".
levels(dimensioni) = c(levels(dimensioni),"extra-grande")
levels(dimensioni) 

# 4.2 Assegna "extra-grande" all'ultima osservazione.
dimensioni[length(dimensioni)] = "extra-grande"
dimensioni

