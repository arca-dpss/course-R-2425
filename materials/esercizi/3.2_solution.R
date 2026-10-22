# Iterative programming - solutions

# 1. Use a for loop to compute the sum of the numbers from 1 to 30.
#    Start from an object total equal to 0 and add one number at a time.
#    Print the result at the end.
total <- 0
for (i in 1:30) {
  total <- total + i
}
print(total)


# 1.1 Write a function vector_sum() that takes a numeric vector and returns
#     the sum of its elements, using a for loop (without sum()).
vector_sum <- function(vect) {
  total <- 0
  for (element in vect) {
    total <- total + element
  }
  return(total)
}
vector_sum(1:30)


# 2. Write a function vector_mean() that computes the mean of a vector
#    without using mean() (you can use your vector_sum() function).
vector_mean <- function(vect) {
  total <- vector_sum(vect)
  return(total / length(vect))
}
vector_mean(1:30)
mean(1:30) # check


# 3. Use a for loop and if ... else to print "Even" or "Odd"
#    for each number from 1 to 10.
for (i in 1:10) {
  if (i %% 2 == 0) {
    print("Even")
  } else {
    print("Odd")
  }
}


# 4. Use a for loop to print "R is fantastic!" 5 times.
for (i in 1:5) {
  print("R is fantastic!")
}


# 5. Use a while loop to count to 10, printing each number.
counter <- 1
while (counter <= 10) {
  print(counter)
  counter <- counter + 1
}


# 6. Use a repeat loop to simulate rolling a die until you get a 6.
#    Print each roll. (?sample, break)
repeat {
  roll <- sample(1:6, 1)
  print(roll)
  if (roll == 6) break
}


# 7. Go through the columns of the iris dataset with a for loop:
#    - if the column is numeric, print its mean (rounded to 2 decimals)
#    - if the column is a factor, print its frequency table
#    (?is.numeric, ?is.factor, ?table)
for (i in 1:ncol(iris)) {
  if (is.numeric(iris[, i])) {
    print(paste("Mean of", colnames(iris)[i], ":", round(mean(iris[, i]), 2)))
  } else if (is.factor(iris[, i])) {
    print(paste("Frequency table of", colnames(iris)[i], ":"))
    print(table(iris[, i]))
  }
}


# 8. Use a for loop to print the names of the first 3 columns of mtcars.
for (i in 1:3) {
  print(colnames(mtcars)[i])
}


# 9. Use a for loop to simulate and print 10 values from a normal distribution
#    with mean 5 and standard deviation 2. (?rnorm)
for (i in 1:10) {
  print(rnorm(1, mean = 5, sd = 2))
}


# 10. Three groups, "A", "B" and "C", with 4 participants each.
#     Use two nested for loops (outer loop: groups, inner loop: participants)
#     to print a line for every participant of every group, like
#     "Group: A - Participant: 1"
# 10.1 How many lines are printed? Why?
groups <- c("A", "B", "C")
for (group in groups) {     # outer loop: groups
  for (subj in 1:4) {       # inner loop: participants
    print(paste("Group:", group, "- Participant:", subj))
  }
}
# 12 lines: for each of the 3 groups, the inner loop runs completely (4 times)


# 11. Simulate a reaction time (in ms) for each participant of exercise 10,
#     and save the results in a matrix rt with 4 rows (participants)
#     and 3 columns (groups A, B and C).
#     The mean RT is 600 ms in group A, 550 in group B and 500 in group C:
means <- c(600, 550, 500)
# 11.1 Create the empty matrix rt (filled with NA) and name its columns "A", "B", "C".
# 11.2 Fill it with two nested for loops (j for the columns, i for the rows), using
#      round(rnorm(1, mean = means[j], sd = 60)). Use set.seed(123) first.
# 11.3 Compute the mean RT of each group (?colMeans). Which group is the fastest?
# 11.4 Repeat the simulation with 30 participants per group: save the number of
#      participants in an object n_subj, so that you only need to change one number.
rt <- matrix(NA, nrow = 4, ncol = 3)
colnames(rt) <- groups
rt

set.seed(123)
for (j in 1:3) {       # columns: groups
  for (i in 1:4) {     # rows: participants
    rt[i, j] <- round(rnorm(1, mean = means[j], sd = 60))
  }
}
rt

colMeans(rt)
names(which.min(colMeans(rt))) # the fastest group has the lowest mean RT

# with n_subj, the number of participants appears only once
n_subj <- 30
rt <- matrix(NA, nrow = n_subj, ncol = 3)
colnames(rt) <- groups

set.seed(123)
for (j in 1:3) {
  for (i in 1:n_subj) {
    rt[i, j] <- round(rnorm(1, mean = means[j], sd = 60))
  }
}
head(rt)
colMeans(rt) # with more participants the means get closer to 600, 550 and 500
