# List and Matrix exercises - solutions

# 1. Build a list called "lab_data" that includes:
#    - A vector with 4 consecutive integers starting from 10
#    - A vector with the names of 4 colors
#    - A logical vector with 4 values

lab_data <- list(10:13, c("red", "blue", "green", "yellow"), c(TRUE, FALSE, TRUE, FALSE))

# 2. Access the third color of the character vector

lab_data[[2]][3]

# 3. Name the elements of the list "integers", "colors", "booleans"

names(lab_data) <- c("integers", "colors", "booleans")
str(lab_data)

# 4. Retrieve the integer vector and the boolean vector using:
#    - The $ notation (save them as "int1" and "bool1")

int1 <- lab_data$integers
bool1 <- lab_data$booleans

#    - Double square bracket indexing (save them as "int2" and "bool2")

int2 <- lab_data[[1]]
bool2 <- lab_data[[3]]

#    Check that they are equivalent

all.equal(int1, int2)
all.equal(bool1, bool2)

# 5. Convert the boolean vector to numeric format, saving it as "bool_num"

bool_num <- as.numeric(bool1)
bool_num # TRUE becomes 1, FALSE becomes 0

# 6. Create a matrix "A" by binding the vectors "int1" and "bool_num" by row
#    Look at its structure with str() and explain what you notice

A <- rbind(int1, bool_num)
A


# 7. Insert the matrix "A" as the fourth element of the list "lab_data"

lab_data[[4]] <- A
# or, giving it a name: lab_data$matrix <- A
str(lab_data)

# 8. Build a matrix "P" with 4 columns in which the values 5, 10, 15 and 20
#    appear 6 times each, placed respectively
#    in the first, second, third and fourth column

P <- matrix(rep(c(5, 10, 15, 20), each = 6), ncol = 4)
P

# 9. Create a matrix "Q" containing the first 12 positive even numbers
#    arranged in 4 rows and 3 columns (use seq() with the to= or length.out= argument)

Q <- matrix(seq(from = 2, by = 2, length.out = 12), nrow = 4, ncol = 3)
# or: Q <- matrix(seq(from = 2, to = 24, by = 2), nrow = 4, ncol = 3)
Q

# 10. Build a matrix "D" by selecting the third column of "P"
#     and the second row of "Q" (with cbind())

D <- cbind(P[, 3], Q[2, ])
D
# What happens? P[, 3] has 6 values but Q[2, ] only 3: R recycles the
# shorter vector (4, 12, 20, 4, 12, 20) to fill the 6 rows, without any warning
# because 6 is a multiple of 3.

# 11. Remove the last column from the matrix "P"

P <- P[, -4]
P

# Check that "D" and "P" have the same number of rows with nrow()

nrow(D) == nrow(P)

#     Combine the two matrices to obtain "Z" (use cbind)

Z <- cbind(P, D)
Z

# 12. Extract from the matrix "Z":
#     - The elements in the odd columns of the second-to-last row

Z[nrow(Z) - 1, seq(1, ncol(Z), by = 2)]

#     - The elements of the first and last row, limited to the second column

Z[c(1, nrow(Z)), 2]
