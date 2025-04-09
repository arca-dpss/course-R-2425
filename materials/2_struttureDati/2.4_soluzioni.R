# Soluzioni data.frame

# 1. Crea un dataframe ("my_df1") così composto
# - Nome (fattore) contenente i nomi di voi 10,
# - Eta (numerico) contenente la vostra età,
# - Altezza (numerico) contenente la vostra altezza in cm

my_df1 = data.frame(Nome = factor(c("Tereasa","Edoardo", "Giulia", "Martina", "Chiara", 
                             "Iris", "Anita", "Cinzia", "Giorgia")),  
                    Eta = c(25, 27, 23, 25, 28, NA,25,NA, NA), 
                    Altezza = c(165, 190, 172, 163, 160, NA,167,NA,NA))

# 2. Estrai:
# 2.1 Solo la colonna Eta (usando l'operatore $)
my_df1$Eta

# 2.2 La terza colonna (usando l'indice numerico).
my_df1[,3]

# 2.3 I valori di Nome per le persone con altezza maggiore di 170 cm.
# (utilizza sia funzione subset che [])
subset(my_df1, subset = Altezza > 170, select = "Nome")

my_df1$Nome[my_df1$Altezza > 170]

# 3. Aggiungi a my_df1 una nuova colonna chiamata
# Occhi (e inserisci il colore degli occhi)
my_df1$Occhi = c("verde", "verde", "marrone", "marrone", "marrone", NA, "marrone", NA, NA)

# 4. Calcola la frequenza di ogni colore degli Occhi
table(my_df1$Occhi)

# 5. Seleziona le righe in cui l'età è maggiore di 25 anni e
# le colonne nome e altezza
# utilizza sia funzione subset che []
subset(my_df1, Eta > 25, select = c("Nome", "Altezza"))
my_df1[my_df1$Eta > 25, c("Nome", "Altezza")]

# 6. Crea un altro dataframe ("my_df2") composto da tre righe
# e che abbia delle caratteristiche tali da poter
# essere unito a my_df1 che hai creato (rbind()), 
# unisci quindi i due dataframe creando my_df3

my_df2 = data.frame(Nome = "Margherita",Eta = 29, Altezza = 154, Occhi = "Verdi")

my_df3 = rbind(my_df1,my_df2)
my_df3

# 7. Supponi di avere questi due dataframe:
df1 = data.frame(ID = 1:5, Nome = c("Anna", "Bob", "Carlo", "Diana", "Eva"))
df2 = data.frame(ID = c(2,4,6), Citta = c("Roma", "Milano", "Napoli"))
# Crea my_df4 unendo i due data.frame utilizzando la colonna ID come chiave,
# mantenendo tutte le righe di df1. ?merge
my_df4 = merge(df1, df2, by = "ID", all.x = TRUE)
my_df4
# 8. In "my_df4" crea una terza colonna "Info"
# che unisca le informazioni Nome e Citta
my_df4$Info = paste(my_df4$Nome, my_df4$Citta, sep = "_")
my_df4
# 9. Seleziona le persone con NA per la colonna Citta ?is.na
my_df4[is.na(my_df4$Citta),]

# 10. Seleziona le persone che non hanno nessun NA ?complete cases
my_df4[complete.cases(my_df4),]

# 11. Calcola la media dell'età in my_df1, escludendo eventuali NA
mean(my_df1$Eta, na.rm = TRUE)

# 12. Ordina my_df1 in ordine decrescente di altezza
my_df1[order(my_df1$Altezza, decreasing = TRUE),]
