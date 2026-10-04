# Install the packages I need

# install.packages("dplyr")
# install.packages("tidyr")
# install.packages("remotes")
# remotes::install_github("beauchamplab/raveio")

# Load the packages -----
library(dplyr)
library(tidyr)
library(raveio)

# Read the file -----
data = raveio::read_eeg_marker("~/course-R-2425/materials/2_struttureDati/sara/dataSara")

# check the structure
str(data)

# Modify the data.frame contained in data
# where is it?
data$content

# Rows 1:49 must be removed
data$content[-c(1:49),]


data$content = data$content[-(1:49),]
data$content


# Description column
# Every time S 10, S 12 or S 14 appears, 
# the following 5 observations, instead of being S 1, 
# must be: S 10; S 12; S 14

# create a location column to make sure
# I carry out the procedure correctly
data$content$location = data$content$Description

# Assign NA when location is S 1
data$content$location[data$content$location == "S  1"] = NA

# With the fill function from the tidyr package
# I can fill the NAs, like dragging down a cell in excel

data$content = data$content |>  # the |> operator chains several operations
  fill(location, .direction = "down") # fill the NAs


# Now I remove the rows that are S 10, S 12 , S 14 in the Description column
# since they are not relevant
# NB in the description column I will have S 12 .. S 1 etc.
# While in the location column I have only S 12 S 14 etc, no more S 1
# in short, I keep only the rows where description is S 1

data$content = data$content[data$content$Description == "S  1",]


# After checking that I did it right
# and inspecting the dataframe, I replace the Description column
# with the location column

data$content$Description = data$content$location


# Then I remove the location column (the last one)
data$content = data$content[,-ncol(data$content)]


# If I want to keep only the number information, 
# i.e. 14 without S, I can use the ?grep function,
# which lets me find string patterns
# and which I can use to select elements
# of the Description variable
data$content$Description[grep("S 14", data$content$Description)] = "14"
data$content$Description[grep("S 12", data$content$Description)] = "12"
data$content$Description[grep("S 10", data$content$Description)] = "10"


# the last request is to keep only the rows 
# where description is equal to 14, 12, 10 
# this was already done before by keeping only S  1 in the description column
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

