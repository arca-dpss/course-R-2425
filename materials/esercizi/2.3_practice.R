# List and Matrix exercises
rm(list = ls())
# 1. Build a list called lab_data that includes:
#    - A vector with 4 consecutive integers starting from 10: 10:13
#    - A vector with the names of 4 colors: "red", "blue", "green", "yellow"
#    - A logical vector with 4 values: TRUE, FALSE, TRUE,FALSE
lab_data <- list(10:13, 
                 c("red", "blue", "green", "yellow"),
                 c(TRUE, FALSE, TRUE,FALSE))

length(lab_data)

# 2. Access the third color of the character vector
lab_data[[2]][3]
lab_data[[3]][2]

lab_data[c(1,3)]

# 3. Name the elements of the list "integers", "colors", "booleans"
# option 1
names(lab_data) <- c("integers", "colors", "booleans")
lab_data

# option2 
lab_data <- list(integers = 10:13, 
                 colors = c("red", "blue", "green", "yellow"),
                 booleans = c(TRUE, FALSE, TRUE,FALSE))

# 4. Retrieve the integer vector and the boolean vector using:
#    - The $ notation (save them as "int1" and "bool1")
int1 <- lab_data$integers
bool1 <- lab_data$booleans
#    - Double square bracket indexing (save them as "int2" and "bool2")
int2 <- lab_data[[1]]
bool2 <- lab_data[[3]]
#    Check that they are equivalent
sum(int1==int2) == length(int1)
sum(int1!=int2)
all.equal(int1,int2)

# 5. Convert the boolean vector to numeric format, 
# saving it as "bool_num"
bool_num <- as.numeric(lab_data$booleans)

# 6. Create a matrix "A" by binding the vectors "int1" and "bool_num" by row
A <- rbind(int1, bool_num)

# 7. Insert the matrix "A" as the fourth element of the list "lab_data"
length(lab_data)

lab_data[[length(lab_data) + 1]] <- A

lab_data$A <- A


lab_data[[2]] <- "hello"
lab_data

lab_data[[1]][3] <- 20

lab_data$integers[3] <- 20

lab_data$integers

lab_data$integers < 20
lab_data$integers[lab_data$integers < 20] <- 1
lab_data$integers
lab_data$integers
lab_data$A

lab_data$A <- rbind(lab_data$A,  lab_data$integers)
lab_data



# 8. Build a matrix "P" with 4 columns in which the values 5, 10, 15 and 20
#    appear 6 times each, placed respectively
#    in the first, second, third and fourth column
dat <- rep(c(5,10,15,20), each = 6)
P <- matrix(data = dat,nrow = 6, ncol = 4, byrow = FALSE )
P

# 9. Create a matrix "Q" containing the first 12 positive even numbers
#    arranged in 4 rows and 3 columns (use seq() 
# with the to= or length.out= argument)


# 10. Build a matrix "D" by selecting the third column of "P"
#     and the second row of "Q" (with cbind())


# 11. Remove the last column from the matrix "P"


# Check that "D" and "P" have the same number of rows with nrow()


# Combine the two matrices to obtain "Z" (use cbind)


# 12. Extract from the matrix "Z":
#     - The elements in the odd columns of the second-to-last row
#     - The elements of the first and last row, limited to the second column




