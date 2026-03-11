# Installo i pacchetti che mi servono

# install.packages("dplyr")
# install.packages("tidyr")
# install.packages("remotes")
# remotes::install_github("beauchamplab/raveio")

# Carico i pacchetti -----
library(dplyr)
library(tidyr)
library(raveio)

# Leggi file -----
data = raveio::read_eeg_marker("~/course-R-2425/materials/2_struttureDati/sara/dataSara")

# controllo la struttura
str(data)

# Modifica il data.frame che è contenuto in data
# dov'è?
data$content

# Bisogna eliminare le righe da 1:49
data$content[-c(1:49),]


data$content = data$content[-(1:49),]
data$content


# Colonna Descritption
# Per ogni volta che appare: S 10, S 12 o S 14, 
# le successive 5 osservazioni, al posto di essere S 1 
# devono essere : S 10; S 12; S 14

# creo una colonna location per essere sicura
# di svoglere la procedura correttamente
data$content$location = data$content$Description

# Assegno NA quando location S 1
data$content$location[data$content$location == "S  1"] = NA

# Attraverso la funzione fill del pacchetto tidyr
# possono riempire gli NA come se tirassi giù la casella di excel

data$content = data$content |>  # il comando |> concatena più operazioni
  fill(location, .direction = "down") # riempio gli NA


# Ora elimino le righe che risultano S 10, S 12 , S 14 alla colonna Description
# poichè non sono rilevanti
# NB alla colonna description avrò S 12 .. S 1 ecc.
# Mentre nella colonna location ho tutto S 12 S 14 ecc, non più S 1
# in poche parole tengo solo le righe in cui description è S 1

data$content = data$content[data$content$Description == "S  1",]


# Dopo aver controllato di aver fatto giusto,
# ispezionato il dataframe, sostituisco alla colonna Description
# la colonna location

data$content$Description = data$content$location


# Poi elimino la colonna location (l'ultima)
data$content = data$content[,-ncol(data$content)]


# Se voglio tenere solo l'informazione del numero 
# cioè 14 senza S, posso utilizzare la funzione ?grep
# che mi permette di scovare pattern di stringe
# e che posso utilizzare per selezionare elementi
# di della variabile Description
data$content$Description[grep("S 14", data$content$Description)] = "14"
data$content$Description[grep("S 12", data$content$Description)] = "12"
data$content$Description[grep("S 10", data$content$Description)] = "10"


# ultima consegna vuole che teniamo solo le righe 
# per cui description è uguale a 14, 12, 10 
# questo è già stato fatto prima tenenod solamente S  1 alla colonna description
table(data$content$Description)



# ---- WRITE ---- chatgpt------------------------------

path_in  <- "~/course-R-2425/materials/2_struttureDati/sara/dataSara"
path_out <- "~/course-R-2425/materials/2_struttureDati/sara/dataSara_processed.vmrk"

# 1. Get header from the original file (everything before the first Mk line)
original_lines <- readLines(path_in)
first_mk_idx   <- which(grepl("^Mk\\d+=", original_lines))[1]
header_lines   <- original_lines[1:(first_mk_idx - 1)]

# 2. Check actual column names (run this once to verify)
# print(names(data$content))
# Expected: something like MarkerNumber, Type, Description, StartPosition, Size, Channel

# 3. Renumber markers sequentially
data$content$MarkerNumber <- seq_len(nrow(data$content))

# 4. Rebuild marker lines
mk_lines <- with(data$content,
                 paste0("Mk", MarkerNumber, "=",
                        Type, ",",
                        Description, ",",
                        StartPosition, ",",
                        Size, ",",
                        Channel)
)

# 5. Write the file
writeLines(c(header_lines, mk_lines), con = path_out, useBytes = FALSE)

# 6. Verify the output
cat(readLines(path_out)[1:30], sep = "\n")

