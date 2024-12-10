# Soluzioni data.frame

# 1. Crea un dataframe ("my_df1") così composto
# -  Nome (fattore) contenente i nomi di voi 10,
# -  Eta (numerico) contenente la vostra età,
# -  Altezza (numerico) contenente la vostra altezza in cm

my_df1 = data.frame(Nome = factor(c("Cinzia","Emanuela","Ilaria",
                            "Luca","Emanuele","Beatrice",
                            "Renan","Michela","Lorenzo",
                            "Marta")),
                   Età = as.numeric(round(runif(10, 24,35))),
                   Altezza = as.numeric(round(runif(10, 150,180))))

# 2. Estrai:
# 2.1 Solo la colonna Nome (usando l'operatore $)
# 2.2 La seconda colonna (usando l'indice).
# 2.3 I valori di altezza per le persone con età maggior a 24 anni.
#     (utilizza sia funzione subset che [])
# Cosa forniscono in output i due comandi?

my_df1$Nome
my_df1[,2]
my_df1$Altezza[my_df1$Età>24] 
subset(my_df1, subset = Età > 24, select = Altezza)

# 3. Aggiungi a my_df1 una nuova colonna chiamata 
# Provincia (e inserisci la provincia di nascita, abbreviata)
my_df1$Provincia = c("VE","BA","TO","RM","PD","PD","CA","TR","VR","FI")

# 4. Calcola la frequenza di ogni Provincia (?table)
table(my_df1$Provincia)

# 4. Seleziona le righe in cui l'altezza è minore o uguale di 160 cm e
# e le colonne nome e età
# utilizza sia funzione subset che []
my_df1[my_df1$Altezza<160, 1:2]
my_df1[my_df1$Altezza<160, c("Nome","Età")]
subset(my_df1, subset = Altezza < 160, select = c(Nome,Età))


# 5. Crea un altro dataframe ("my_df2") composto da due righe 
# e che abbia delle caratteristiche tali da poter 
# essere unito a my_df1 che hai creato (rbind()), unisci quindi i due dataframe creando my_df3

my_df2 = data.frame(Nome = c("Carlo","Chiara"), Età = c(28,29), Altezza = c(180,173), 
                    Provincia = c("VE","VE"))
my_df3 = rbind(my_df1,my_df2)
my_df3

# 6. supponi di avere questi due dataframe
my_df4 = data.frame(
 ID = c(1, 2, 3, 4),
 Nome = c("Alice", "Bob", "Clara", "Marco") )

my_df5=data.frame(
   ID = c(3, 4),
   Età = c(22, 27)
 )

# Crea my_df6 unendo i due data.frame  utilizzando la colonna ID come chiave, (?merge)
# mantenendo tutte le righe di entrambi i data.frame.

my_df6 = merge(my_df4,my_df5, by = "ID", all = TRUE)
my_df6

# 7. In "my_df6" crea una terza colonna "codice" 
# che unisca le informazioni nome e età (?paste, ?sprintf)

my_df6$codice = paste(my_df6$Nome, my_df6$Età, sep = "_")
my_df6

# 8. Seleziona le persone con NA per la colonna Età ?is.na()
my_df6[is.na(my_df6$Età),]

# 9. Seleziona le persone che non hanno nessun NA (vedi la funzione complete.cases())
my_df6[complete.cases(my_df6),]

