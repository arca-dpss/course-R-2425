# Esercizi Recap dataframe

# 1. Crea un dataframe chiamato "studenti_df" con le seguenti colonne:
#    - Matricola (carattere) contenente 8 numeri di matricola inventati
#    - Corso (fattore) contenente 8 nomi di corsi di laurea
#    - MediaVoti (numerico) contenente 8 medie voti
studenti_df = data.frame(
  Matricola = c("12345678", "23456789", "34567890", "45678901", "56789012", "67890123", "78901234", "89012345"),
  Corso = factor(c("Informatica", "Biologia", "Fisica", "Chimica", "Matematica", "Informatica", "Biologia", "Fisica")),
  MediaVoti = c(27.5, 28.3, 26.8, 29.1, 27.9, 26.2, 28.7, 27.4)
)

# 2. Estrai:
# 2.1 Solo la colonna Corso (usando l'operatore $)
# 2.2 La seconda colonna (usando l'indice numerico)
# 2.3 I valori di Matricola per gli studenti con MediaVoti superiore a 27
#     (utilizza sia la funzione subset che [])
#     Confronta l'output dei due comandi


# 3. Aggiungi a studenti_df una nuova colonna chiamata
#    AnnoIscrizione (e inserisci l'anno di iscrizione per ogni studente)

# 4. Calcola la frequenza di ogni Corso di laurea (usa la funzione table())

# 5. Seleziona le righe in cui la MediaVoti è maggiore di 26 e
#    le colonne Matricola e Corso
#    utilizza sia la funzione subset che []

# 6. Crea un altro dataframe ("nuovi_studenti") composto da tre righe
#    e che abbia delle caratteristiche tali da poter
#    essere unito a studenti_df (rbind()), unisci quindi i due dataframe 
#    creando studenti_completo


# 7. Supponi di avere questi due dataframe:
df_studenti = data.frame(
  Matricola = c("12345", "67890", "11223", "44556", "99887"),
  Nome = c("Luca", "Anna", "Marco", "Giulia", "Sara")
)
df_esami = data.frame(
  Matricola = c("67890", "11223", "78901"),
  Esame = c("Matematica", "Fisica", "Chimica"),
  Voto = c(28, 30, 27)
)
# Crea studenti_esami unendo i due data.frame utilizzando la colonna Matricola come chiave,
# mantenendo tutte le righe di df_studenti (usa la funzione merge())

studenti_esami = merge(x = df_studenti, y = df_esami, 
                       by = "Matricola", all.x = TRUE ) 

# 8. In "studenti_esami" crea una terza colonna "Dettagli"
#    che unisca le informazioni Nome e Esame (usa paste())

Dettagli=paste(studenti_esami$Nome, studenti_esami$Esame, sep="")
studenti_esami$Dettagli=Dettagli

# 9. Seleziona gli studenti con NA per la colonna Esame (usa is.na())
is.na(studenti_esami$Esame)
studenti_esami[is.na(studenti_esami$Esame), "Matricola"]


# 10. Seleziona gli studenti che non hanno nessun NA (usa la funzione complete.cases())

# 11. Calcola la media dei voti in df_esami, escludendo eventuali NA

# 12. Ordina studenti_df in ordine crescente di MediaVoti (usa la funzione order())
