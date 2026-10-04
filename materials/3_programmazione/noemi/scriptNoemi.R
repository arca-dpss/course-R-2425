# clear the environment
rm(list = ls())

# import the dataset
install.packages("readr")

library(readr)
dataNoemi <- read_csv("materials/3_programmazione/noemi/dataNoemi.csv")

# DATA CLEANING - from raw data to aggregates 
# remove the columns with useless information 
# (IP address, survey language, etc...)
# Specifically, I remove 
# - columns 1 to 17
# - the first and second rows
data = dataNoemi[-c(1:2),-c(1:17)] 

# - remove 15,17,18 
data = data[,-c(15,17,18)] # wrong items

# rename the variables, I want the columns to be called:
# "consent", "ITEM1", "ITEM2", "ITEM3", "ITEM4","ITEM5", "ITEM6", 
# "ITEM7", "ITEM8","ITEM9", "ITEM10", "ITEM11", "ITEM12", "ITEM13", 
# "ITEM14", "diagnosis"

names(data) = c("consent", "ITEM1", "ITEM2", "ITEM3", "ITEM4",
                "ITEM5", "ITEM6", "ITEM7", "ITEM8","ITEM9", 
                "ITEM10", "ITEM11", "ITEM12", "ITEM13", 
                 "ITEM14", "diagnosis")
names(data)

# Convert the data from strings to numbers, use case_when
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



# Remove participants with clinical diagnoses, see the diagnosis column
data2 = subset(data, subset = diagnosis == "no")
data2 = data[data$diagnosis == "si", ]


write_csv(data2, file = "materials/3_programmazione/noemi/dataNoemi_ok.csv")
save(data2, file = "materials/3_programmazione/noemi/dataNoemi_ok.rda")



# Check the dataset


####    HANDLING REVERSE ITEMS    ####
# item_reverse = 6−item
# the reverse items are 11, 12, 13, 14




####   ITEM DESCRIPTIVE STATISTICS   ####

# Mean --------------------------------------------------------------------------
# to apply the same function to the columns of the dataset
# I can use the apply function, or a for loop....




# Same thing for standard deviation, range (i.e., minimum and maximum), 
# skewness (via the formula, or skew from the psych package, or skewness from moments),
# so why not create a function that does all these things, so that
# I can use it every time I need to compute these statistics?




####   TOTAL SCORE   ####   of each participant ---------------------------------
# create a column, total, given by the sum of all the items, see the rowSums function
# careful: the first column contains the ids






