# Functions and conditional programming

# 0. Write a function in R that takes a number as input and
#    returns twice that number.
myfun <- function(num){
  twice <- num*2
  return(twice)
}

# 1. Define a function that computes the area of a right triangle
#    Area = (Base * Height) / 2

area <- function(base, height){
  a = (base * height) / 2
  return(a)
}

r_area <- function(height, width){
  r_a <- height*width
  return(r_a)
}

r_area(4,4)
area(4,4)


# 2. Define a function that prints a personalized birthday message
#    Write a function birthday(name, age) that takes as input the name and
#    the age of a person and returns a personalized message such as:
#    "Happy birthday, [name]!
#    Congratulations on your [age] years!".
#    Use the paste() and print() functions to format and print the message.

birthday <- function(name){
  mess <- paste("Happy birthday, ", name,"!", sep ="")
  return(mess)
}

birthday(name = "Ece")
  
  
birthday_age <- function(name, age){
  print(paste("Happy birthday, ", name,"! ", sep = ""))
  print(paste("Congratulations on your ", age, " years!",
              sep =""))
}
birthday_age("Agata",21)

birthday_age <- function(name, age){
  mess <- paste("Happy birthday, ", name,"! ", 
                "Congratulations on your ", age, " years!",
                sep ="")
  return(mess)
}

# 3. Define a function that computes the maximum and minimum value of a numeric vector "z".
z <- c(4:19, NA, 3:8)
#    and returns a sentence such as:
#    "The maximum value of the vector is ... and the minimum value is ..."
#    using sprintf() or paste().


# Conditional programming

# 4. Define a function parity_check() that takes a number as input and
#    returns a string:
#    "even" if the number is even,
#    "odd" if the number is odd.  (?ifelse)

parity_check <- function(x){
  m <- ifelse(x%%2 == 0, "even", "odd")
  return(m)
}

parity_check(x = c(3,4,6,9))

x = c(3,4,6,9)
ifelse(x%%2 == 0, "even", "odd")



arca <- data.frame(name = c("ece","ilayda",
                            "agata", "laura", "eva",
                            "elisa", "maddalena",
                            "matteo",  "chiara"),
                   age = c(24, 27, 21, 21, 23, 25, 23, 23,
                           26),
                   degree = c("erasmus","erasmus", "bachelor",
                              "bachelor","erasmus", "bachelor",
                              "master", "master","intern"))

arca$age>23

arca$age_cat <- ifelse(arca$age>23, "old","young")
arca

library(dplyr)
arca$age>23
arca$age<= 23 & arca$age > 21

arca$age_cat2 <- case_when(arca$age>23 ~ "old",
                           arca$age<= 23 & arca$age > 21 ~ "young",
                           arca$age == 21 ~ "baby",
                           TRUE ~ "error")

arca

# 5. Define a function make_odd() that takes a number as input and
#    returns a number:
#    if the number is even, 1 must be added to it
#    if the number is odd, it stays the same (ifelse)



# 6. Define a function transform_num() that, given a number,
#    returns:
#    Twice the number if it is greater than 10,
#    Half the number if it is less than 5,
#    The number itself otherwise.
#
#    use if ... else if ... else ...


# 7. Given the vector
values <- rnorm(100, 0, 10)
#    Define a function class_abs() that classifies a numeric value
#    according to its absolute value:
#
#    abs(value) < 5: "Small",
#    5 <= abs(value) < 10: "Medium",
#    10 <= abs(value): "Large".
#
#    Use a series of nested ifelse() to assign a variable
#    value_chr with the corresponding labels.


# 8. Use case_when to assign a variable
#    value_chr with the corresponding labels. (dplyr::case_when)


# 9. Create a function that takes a vector and checks whether it is numeric.
#    If it is not, throw an error with the message "Non-numeric input".


# 10. A shop offers discounts as follows:
#     10% discount for orders above €100.
#     20% discount for orders above €200.
#     No discount for orders below €100.
#     Create a vector with the order values and
#     compute the total with the discount applied.
