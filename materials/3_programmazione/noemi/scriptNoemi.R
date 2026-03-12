# pulisco l'environment


# importo il dataset


# PULIZIA DEI DATI - dai dati grezzi agli aggregati 
# tolgo le colonne con informazioni non utili 
# (indirizzo IP, lingua di compilazione, ecc...)
# Nello specifico rimuovo 
# - dalla colonna 1 alla 18
# - la prima e la seconda riga


#cambio i nomi delle variabili, voglio che le colonne si chiamino:
# "consenso", "ITEM1", "ITEM2", "ITEM3", "ITEM4","ITEM5", "ITEM6", 
# "ITEM7", "ITEM8","ITEM9", "ITEM10", "ITEM11", "ITEM12", "ITEM13", 
# "ITEM14", "diagnosi"


# Trasformo i dati da stringa a numerici, usa case_when


# Rimuovo partecipanti con diagnosi cliniche, vedi colonna diagnosi


# controllo il dataset


####    GESTIONE ITEM-REVERSE    ####
# item_reverse = 6−item
# gli item reverse sono 11, 12, 13, 14




####   STATISTICHE DESCRITTIVE ITEM   ####

# Media -------------------------------------------------------------------------
# per applicare una stessa funzione alle colonne del dataset
# posso utilizzare la funzione apply, o un ciclo for....




# Stessa cosa per deviazione standard, range (i.e., minimo e massimo), 
# skweness (via formula o skew del pacchetto psych o skweness di moments),
# allora perchè non creare una funzione che faccia tutte le cose così
# da poterla utilizzare tutte le volte che mi serve calcolare queste statistiche?




####   PUNTEGGIO TOTALE   ####   di ogni partecipante ---------------------------
# creo una colonna, totale, data dalla somma di tutti gli item, vedi funzione rowsum
# attezione che la prima colonna contiene gli id






