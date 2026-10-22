# Iterative programming

# 1. Use a for loop to compute the sum of the numbers from 1 to 30.
#    Start from an object total equal to 0 and add one number at a time.
#    Print the result at the end.


# 1.1 Write a function vector_sum() that takes a numeric vector and returns
#     the sum of its elements, using a for loop (without sum()).


# 2. Write a function vector_mean() that computes the mean of a vector
#    without using mean() (you can use your vector_sum() function).


# 3. Use a for loop and if ... else to print "Even" or "Odd"
#    for each number from 1 to 10.


# 4. Use a for loop to print "R is fantastic!" 5 times.


# 5. Use a while loop to count to 10, printing each number.


# 6. Use a repeat loop to simulate rolling a die until you get a 6.
#    Print each roll. (?sample, break)


# 7. Go through the columns of the iris dataset with a for loop:
#    - if the column is numeric, print its mean (rounded to 2 decimals)
#    - if the column is a factor, print its frequency table
#    (?is.numeric, ?is.factor, ?table)


# 8. Use a for loop to print the names of the first 3 columns of mtcars.


# 9. Use a for loop to simulate and print 10 values from a normal distribution
#    with mean 5 and standard deviation 2. (?rnorm)


# 10. Three groups, "A", "B" and "C", with 4 participants each.
#     Use two nested for loops (outer loop: groups, inner loop: participants)
#     to print a line for every participant of every group, like
#     "Group: A - Participant: 1"
# 10.1 How many lines are printed? Why?


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
