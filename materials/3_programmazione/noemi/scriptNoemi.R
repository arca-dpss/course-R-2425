# pulisco l'environment
rm(list = ls())

# importo il dataset
install.packages("readr")

library(readr)
dataNoemi <- read_csv("materials/3_programmazione/noemi/dataNoemi.csv")

# PULIZIA DEI DATI - dai dati grezzi agli aggregati 
# tolgo le colonne con informazioni non utili 
# (indirizzo IP, lingua di compilazione, ecc...)
# Nello specifico rimuovo 
# - dalla colonna 1 alla 17
# - la prima e la seconda riga
data = dataNoemi[-c(1:2),-c(1:17)] 

# - rimuovo 15,17,18 
data = data[,-c(15,17,18)] # item errati

# cambio i nomi delle variabili, voglio che le colonne si chiamino:
# "consenso", "ITEM1", "ITEM2", "ITEM3", "ITEM4","ITEM5", "ITEM6", 
# "ITEM7", "ITEM8","ITEM9", "ITEM10", "ITEM11", "ITEM12", "ITEM13", 
# "ITEM14", "diagnosi"

names(data) = c("consenso", "ITEM1", "ITEM2", "ITEM3", "ITEM4",
                "ITEM5", "ITEM6", "ITEM7", "ITEM8","ITEM9", 
                "ITEM10", "ITEM11", "ITEM12", "ITEM13", 
                 "ITEM14", "diagnosi")
names(data)

# Trasformo i dati da stringa a numerici, usa case_when
table(data$ITEM1)
unique(data$ITEM1)

str_num = function(x){
  dplyr::case_when(x == "( 1 ) Per niente vero" ~ 1,
                   x == "( 2 ) Poco vero" ~ 2,
                   x == "( 3 ) Abbastanza vero" ~ 3,
                   x == "( 4 ) Molto vero" ~ 4,
                   x == "( 5 ) Completamente vero" ~ 5,
                   TRUE ~ 111)
}
str_num(x = data$ITEM1)
prova = str_num(x = data$ITEM1)
table(prova)
table(as.factor(data$ITEM1))
data$ITEM1



# Rimuovo partecipanti con diagnosi cliniche, vedi colonna diagnosi
data2 = subset(data, subset = diagnosi == "no")
data2 = data[data$diagnosi == "si", ]


write_csv(data2, file = "materials/3_programmazione/noemi/dataNoemi_ok.csv")
save(data2, file = "materials/3_programmazione/noemi/dataNoemi_ok.rda")



# Controllo il dataset


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






