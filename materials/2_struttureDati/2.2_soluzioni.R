# 1. Crea un fattore frutti con i livelli "mela", "banana", e "arancia", 
# ciascuno ripetuto 3 volte.
frutti = factor(rep(c("mela", "banana", "arancia"), each = 3))

# 1.1 Visualizza i livelli del fattore.
levels(frutti)

# 1.2 Cambia i livelli in "frutto_rosso", "frutto_giallo", "frutto_arancione".
levels(frutti) = c("frutto_arancione", "frutto_giallo", "frutto_rosso")
levels(frutti)

# 2. Crea un fattore stagioni con i livelli "primavera", "estate", "autunno", "inverno", ciascuno ripetuto 2 volte.
stagioni = factor(rep(c("primavera", "estate", "autunno", "inverno"), each = 2))
stagioni
# 2.1 Rimuovi gli elementi con livello "autunno".
stagioni = stagioni[stagioni != "autunno"]
stagioni

# 2.2 Usa droplevels() per eliminare i livelli inutilizzati.
stagioni = droplevels(stagioni)


# 3. Crea un fattore sport_1 con i livelli "calcio", "tennis", "nuoto", "basket", 
# ciascuno ripetuto 2 volte. 
sport_1 = factor(rep(c("calcio", "tennis", "nuoto", "basket"), each = 2))

# 3.1 Crea un nuovo fattore sport_2 con l'ordine dei livelli invertito.
inlev = sort(levels(sport_1), decreasing = TRUE)
inlev
sport_2 = factor(sport_1, levels = inlev)

# opzione 2
sport_2_2 = factor(sport_1, levels = rev(levels(sport_1)))


# 4. Crea un fattore pianeti con i livelli "Mercurio", "Venere", "Terra".
pianeti = factor(c("Mercurio", "Venere", "Terra"))

# 4.1 Aggiungi un nuovo livello "Marte" e assegna questa nuova categoria a 
# una nuova osservazione.
levels(pianeti) = c(levels(pianeti), "Marte")
pianeti[length(pianeti)+1] = "Marte"

# 5. Crea un fattore gruppi con le categorie "X", "Y", "Z", ciascuna ripetuta 4 volte.
gruppi = factor(rep(c("X", "Y", "Z"), each = 4))

# 5.1 Cambia le osservazioni delle prime 4 posizioni in "W".
gruppi[1:4] = "W" #errore!


gruppi = factor(rep(c("X", "Y", "Z"), each = 4))
# 5.2 Aggiungi i livelli mancanti se necessario e verifica il risultato.
gruppi = factor(gruppi, levels = c(levels(gruppi), "W"))
gruppi[1:4] = "W"
print(gruppi)
levels(gruppi)

