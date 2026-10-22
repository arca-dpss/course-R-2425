# Functions and conditional programming - solutions

# 0. Write a function in R that takes a number as input and
#    returns twice that number.

double_num <- function(x) {
  return(x * 2)
}
double_num(4)


# 1. Define a function that computes the area of a right triangle
#    Area = (Base * Height) / 2
#    both using the return function and { }
#    and using a single line of code (without { } and return)

area_tri1 <- function(base, height){
  A <- (base * height) / 2
  return(A)
}
area_tri1(3, 4)

area_tri2 <- function(base, height) (base * height) / 2
area_tri2(3, 4)


# 2. Define a function that prints a personalized birthday message
#    Write a function birthday(name, age) that takes as input the name and
#    the age of a person and returns a personalized message such as:
#    "Happy birthday, [name]!
#    Congratulations on your [age] years!".
#    Use the paste() and print() functions to format and print the message.

birthday <- function(name, age){
  print(paste0("Happy birthday, ", name, "!"))
  print(paste("Congratulations on your", age, "years!"))
}

birthday("Alex", 29)


# 3. Define a function that computes the maximum and minimum value of a numeric vector "z".
z <- c(4:19, NA, 3:8)
#    and returns a sentence such as:
#    "The maximum value of the vector is ... and the minimum value is ..."
#    using sprintf() or paste().

max_min <- function(x, na.rm = TRUE){

  minx <- min(x, na.rm = na.rm)
  maxx <- max(x, na.rm = na.rm)

  # %i is replaced by the values, in order: first maxx, then minx
  sentence <- sprintf("The maximum value of the vector is %i and the minimum value is %i",
                      maxx, minx)
  return(sentence)
}
max_min(z)


# Conditional programming

# 4. Define a function parity_check() that takes a number as input and
#    returns a string:
#    "even" if the number is even,
#    "odd" if the number is odd.  (?ifelse)

# with if ... else
parity_check <- function(x){
  if (x %% 2 == 0){
    sentence <- "even"
  } else {
    sentence <- "odd"
  }
  return(sentence)
}
parity_check(2)

# with ifelse()
parity_check <- function(x){
  ifelse(x %% 2 == 0, "even", "odd")
}
parity_check(2)
parity_check(1:6) # ifelse() is vectorized, so it also works on a vector


# 5. Define a function make_odd() that takes a number as input and
#    returns a number:
#    if the number is even, 1 must be added to it
#    if the number is odd, it stays the same (ifelse)

make_odd <- function(x){
  ifelse(x %% 2 == 0, x + 1, x)
}
make_odd(2)
make_odd(3)


# 6. Define a function transform_num() that, given a number,
#    returns:
#    Twice the number if it is greater than 10,
#    Half the number if it is less than 5,
#    The number itself otherwise.
#
#    use if ... else if ... else ...

transform_num <- function(x){

  if (x > 10){
    value <- x * 2
  } else if (x < 5) {
    value <- x / 2
  } else {
    value <- x
  }
  return(value)
}

transform_num(0.4)
transform_num(7)
transform_num(12)


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

class_abs1 <- function(x){
  value_chr <- ifelse(abs(x) < 5, yes = "Small",
                      no = ifelse(abs(x) >= 5 & abs(x) < 10,
                                  "Medium",
                                  "Large"))
  return(value_chr)
}
class_abs1(8)
class_abs1(values)


# 8. Use case_when to assign a variable
#    value_chr with the corresponding labels. (dplyr::case_when)

class_abs2 <- function(x){
  value_chr <- dplyr::case_when(abs(x) < 5 ~ "Small",
                                abs(x) >= 5 & abs(x) < 10 ~ "Medium",
                                TRUE ~ "Large")
  return(value_chr)
}
class_abs2(values)

# the two functions give the same result
all.equal(class_abs1(values), class_abs2(values))


# 9. Create a function that takes a vector and checks whether it is numeric.
#    If it is not, throw an error with the message "Non-numeric input".

check_num <- function(vect) {
  if (!is.numeric(vect)) {
    stop("Non-numeric input")
  }
  return(mean(vect))
}
check_num(1:5)
check_num(c("A", "B"))  # Error!!!


# 10. A shop offers discounts as follows:
#     10% discount for orders above €100.
#     20% discount for orders above €200.
#     No discount for orders below €100.
#     Create a vector with the order values and
#     compute the total with the discount applied.

orders <- c(50, 150, 250, 90)
discounts <- ifelse(orders > 200, 0.2, ifelse(orders > 100, 0.1, 0))
discounted_total <- orders - (orders * discounts)
discounted_total
