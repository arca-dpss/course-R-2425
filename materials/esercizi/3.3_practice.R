# Apply family exercises

# For every exercise: first look at the input, then think about
# WHAT function you apply and to WHICH elements, then run the code.

# 1. Here are the reaction times (in ms) of three participants:
rts <- list(dora = c(480, 530, 610, 450),
            eli  = c(700, 650, 720),
            fred = c(390, 420, 470, 500, 440))
# 1.1 Print rts: how many elements does it have? How many values does each element contain?
# 1.2 Compute the mean of each participant with a for loop, saving the results
#     in a vector means_for (create it first with rep(NA, ...)).
# 1.3 Do the same with sapply(), saving the results in means_sapply.
# 1.4 Write by hand what sapply() does: c(dora = mean(rts$dora), ...)
#     and check that the result is the same as means_sapply. (?all.equal)


# 2. sapply() is a compact for loop.
# 2.1 Write a for loop that prints the square of 1, 2, 3 and 4.
# 2.2 Get the same numbers with sapply() and an anonymous function.
#     What is the difference between the two outputs?

# 3. Apply length() to each element of rts, once with lapply() and once with sapply().
# 3.1 What is the class of the two results? (?class)

# 4. Write the function count_slow(x) that returns how many values of x
#    are greater than 500.
# 4.1 Test it on one element: count_slow(rts$dora)
# 4.2 Apply it to each element of rts with sapply().

# 5. Use sapply() with an anonymous function to compute, for each participant,
#    the proportion of trials slower than 500 ms. (mean() of a logical vector)
# 5.1 What is x the first time the function runs? Compute that result by hand.

# 6. Use sapply() with range() on rts. What does sapply() return now? Why?

# 7. Here are the scores of 4 students (rows) in 3 tests (columns):
scores <- matrix(c(24, 28, 30,
                   18, 22, 25,
                   30, 29, 27,
                   21, 19, 26), nrow = 4, byrow = TRUE,
                 dimnames = list(c("gia", "hugo", "ivo", "jan"),
                                 c("test1", "test2", "test3")))
# 7.1 Print scores. Before running the next commands, say how many results you expect.
# 7.2 Use apply() to compute the mean of each student (rows).
# 7.3 Use apply() to compute the maximum of each test (columns).
# 7.4 Use apply() with an anonymous function to compute, for each student,
#     the difference between the best and the worst score.

# 8. Use apply() on the numeric columns of the iris dataset (columns 1 to 4)
#    to compute the standard deviation of each column.

# 9. Here are the reaction times of 9 trials in three conditions:
trials <- data.frame(rt = c(410, 450, 430, 520, 560, 540, 650, 610, 700),
                     condition = rep(c("low", "medium", "high"), each = 3))
# 9.1 Print trials, then use tapply() to compute the mean rt of each condition.
# 9.2 Compute the mean of the "low" condition by hand, with [ ] and a logical condition,
#     and check that it is the same as in 9.1.
# 9.3 Use tapply() on iris to count the flowers of each Species with
#     Sepal.Width above 3. (?sum)

# 10. Use vapply() on rts to compute the median of each participant,
#     declaring that each result is a single number (FUN.VALUE = numeric(1)).
# 10.1 What happens if you use range() instead of median()? Why?

# 11. Use mapply() and rep() to create, in one command, the three vectors
#     5 5 5    10 10    15
#     (rep() takes the value to repeat and the number of times)
# 11.1 Write by hand the same result with list() and three calls of rep().

# 12. Use mapply() to simulate three samples of 4 values from normal distributions,
#     with these means and standard deviations: (?rnorm)
mus <- c(0, 50, 100)
sigmas <- c(1, 10, 20)
#     Use set.seed(2026) first, so the results are reproducible.
# 12.1 What do the rows and the columns of the result contain?
# 12.2 Run it again with SIMPLIFY = FALSE: what changes?

# 13. Use replicate() to roll two dice and add them up (?sample):
# 13.1 first only 5 times, to see what replicate() does
# 13.2 then 1000 times, saving the result in sums.
#      Which sum is the most frequent? (?table) Plot it with barplot(table(sums)).
#      Use set.seed(2026) first.
