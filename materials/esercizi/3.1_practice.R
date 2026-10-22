# Functions and conditional programming

# 0. Write a function in R that takes a number as input and
#    returns twice that number.


# 1. Define a function that computes the area of a right triangle
#    Area = (Base * Height) / 2
#    both using the return function and { }
#    and using a single line of code (without { } and return)


# 2. Define a function that prints a personalized birthday message
#    Write a function birthday(name, age) that takes as input the name and
#    the age of a person and returns a personalized message such as:
#    "Happy birthday, [name]!
#    Congratulations on your [age] years!".
#    Use the paste() and print() functions to format and print the message.


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
