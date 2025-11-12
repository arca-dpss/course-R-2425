# Esercizi fattori

# 1. Crea un fattore colori con i livelli "rosso", "verde", "blu", ciascuno ripetuto 3 volte.
colori = factor(rep(c("rosso", "verde", "blu"), each = 3))

# 1.1 Visualizza i livelli del fattore. 
levels(colori)

# 1.2 Rinomina i livelli in "col_rosso", "col_verde", "col_blu".
levels(colori) = c("col_blu", "col_rosso", "col_verde")

# 2. Crea un fattore quarti con i livelli "Q1", "Q2", "Q3", "Q4", ciascuno ripetuto 2 volte. 
quarti = factor(rep(c("Q1", "Q2", "Q3", "Q4"), each = 2))

# 2.1 Rimuovi le osservazioni con livello "Q3". 
quarti = quarti[quarti != "Q3"]

# 2.2 Usa droplevels() per eliminare i livelli non più presenti. 
quarti = droplevels(quarti)
levels(quarti)

# 3. Crea un fattore piatti con i livelli "primo", "secondo", "contorno", "dolce", ciascuno ripetuto 2 volte. 
piatti = factor(rep(c("primo", "secondo", "contorno", "dolce"), each = 2))

# 3.1 Crea un nuovo fattore piatti_ord con l'ordine dei livelli invertito (usa levels in factor()).
# ?sort
piatti_ord = factor(piatti, levels = sort(levels(piatti), decreasing = TRUE))
levels(piatti_ord)

# 3.2 Reimposta il livello di riferimento su "dolce" usando ( prova ad usare la funzione relevel(), opzionale). 
piatti_ord = relevel(piatti_ord, ref = "dolce")
levels(piatti_ord)

# 4. Crea un fattore fiori con i livelli "rosa", "tulipano", "girasole". 
fiori = factor(c("rosa", "tulipano", "girasole"))

# 4.1 Aggiungi un nuovo livello "orchidea" e assegnalo a una nuova osservazione. 
levels(fiori) = c(levels(fiori), "orchidea")
fiori[4] = "orchidea"

# 4.2 Verifica che il nuovo livello compaia in levels() e usa droplevels se necessario. 
levels(fiori)

# 5. Crea un fattore reparti con le categorie "A", "B", "C", ciascuna ripetuta 4 volte. 
reparti = factor(rep(c("A", "B", "C"), each = 4))

# 5.1 Cambia le prime 3 osservazioni in "D" # che succede? 
reparti[1:3] = "D"
# Genera NA perché "D" non è un livello valido

# 5.2 Controlla i livelli e, se rimangono livelli inutilizzati, rimuovili con droplevels(). 
levels(reparti)
# Per aggiungere correttamente "D":
reparti = factor(rep(c("A", "B", "C"), each = 4))
levels(reparti) = c(levels(reparti), "D")
reparti[1:3] = "D"
levels(reparti)

# 6. Crea un vettore paesi = c("Italia","Francia","Spagna","Italia","Germania","Francia"). 
paesi = c("Italia", "Francia", "Spagna", "Italia", "Germania", "Francia")
# 6.1 Trasformalo nel fattore paesi_fact con factor() o as.factor().
paesi_fact = factor(paesi)
# oppure: paesi_fact = as.factor(paesi)

# 6.2 Crea paesi_num trasformando paesi_fact in intero. 
paesi_num = as.integer(paesi_fact)

# 6.3 Crea paesi_fact_2 con factor() specificando levels e labels esplicitamente. 
paesi_fact_2 = factor(paesi, 
                      levels = c("Italia", "Francia", "Spagna", "Germania"),
                      labels = c("Italia", "Francia", "Spagna", "Germania"))

# 6.4 Rinomina i livelli di paesi_fact_2 assegnando l'area geografica corrispondente (es. "EU_Ovest", ...).
levels(paesi_fact_2) = c("EU_Sud", "EU_Ovest", "EU_Sud", "EU_Centro")
paesi_fact_2 = factor(paesi_fact_2, 
                      levels = c("Italia", "Francia", "Spagna", "Germania"),
                      labels = c("Italia", "Francia", "Spagna", "Germania"))

# 7. Crea un fattore turni con i livelli "mattina","pomeriggio","notte" ripetuti 3 volte. 
turni = factor(rep(c("mattina", "pomeriggio", "notte"), each = 3))

# 7.1 Cambia l'ordine dei livelli a c("notte","pomeriggio","mattina") e verifica l'ordine in levels(). 
turni = factor(turni, levels = c("notte", "pomeriggio", "mattina"))
levels(turni)

# 8. Crea un vettore numerico punti = c(10,20,10,30,20,40) e convertilo in fattore punti_f. 
punti = c(10, 20, 10, 30, 20, 40)
punti_f = factor(punti)

# 8.2 Ottieni indietro i valori numerici corretti da punti_f.
as.numeric(levels(punti_f))

# 8.3 Spiega perché as.integer(fattore) restituisce codici dei livelli e non i valori originali.
as.integer(punti_f)
# as.integer() converte i codici interni dei livelli (1,2,3...), 
# non i valori originali. Per ottenere i valori originali bisogna 
# prima convertire in carattere e poi in numerico.

# 9. Crea il fattore classi = factor(rep(c("bronzo","argento","oro"), each=3)). 
classi = factor(rep(c("bronzo", "argento", "oro"), each = 3))

# 9.1 Prova ad assegnare "platino" a classi[1:2];
#     verifica i livelli aggiornati. 
levels(classi) = c(levels(classi), "platino")
classi[1:2] = "platino"
levels(classi)

# 10. Crea fatt1 e fatt2 con gli stessi valori ma ordine dei livelli diverso. 
fatt1 = factor(c("A", "B", "C", "A"), levels = c("A", "B", "C"))
fatt2 = factor(c("A", "B", "C", "A"), levels = c("C", "B", "A"))

# 10.1 Confronta l'uguaglianza elemento-per-elemento (==) e confronta i livelli con levels(). 
fatt1 == fatt2
levels(fatt1)
levels(fatt2)

# 10.2 Allinea l'ordine dei livelli con factor(..., levels=...) e ripeti il confronto. 
fatt2 = factor(fatt2, levels = c("A", "B", "C"))
fatt1 == fatt2
levels(fatt1)
levels(fatt2)
