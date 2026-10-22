# Apply family exercises - solutions

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
rts
length(rts)
str(rts) # 4, 3 and 5 values

means_for <- rep(NA, length(rts))
for (i in 1:length(rts)) {
  means_for[i] <- mean(rts[[i]])
}
means_for

means_sapply <- sapply(rts, mean)
means_sapply

by_hand <- c(dora = mean(rts$dora),
             eli  = mean(rts$eli),
             fred = mean(rts$fred))
all.equal(by_hand, means_sapply)

# 2. sapply() is a compact for loop.
# 2.1 Write a for loop that prints the square of 1, 2, 3 and 4.
# 2.2 Get the same numbers with sapply() and an anonymous function.
#     What is the difference between the two outputs?
for (x in 1:4) {
  print(x^2)
}
sapply(1:4, function(x) x^2)
# the for loop prints 4 separate results; sapply() collects them in one vector

# 3. Apply length() to each element of rts, once with lapply() and once with sapply().
# 3.1 What is the class of the two results? (?class)
lapply(rts, length)
sapply(rts, length)
class(lapply(rts, length)) # list
class(sapply(rts, length)) # integer vector: sapply() simplified the result

# 4. Write the function count_slow(x) that returns how many values of x
#    are greater than 500.
# 4.1 Test it on one element: count_slow(rts$dora)
# 4.2 Apply it to each element of rts with sapply().
count_slow <- function(x) {
  sum(x > 500)
}
count_slow(rts$dora)
sapply(rts, count_slow)

# 5. Use sapply() with an anonymous function to compute, for each participant,
#    the proportion of trials slower than 500 ms. (mean() of a logical vector)
# 5.1 What is x the first time the function runs? Compute that result by hand.
sapply(rts, function(x) mean(x > 500))
# the first time, x is rts$dora: 2 values out of 4 are above 500
mean(rts$dora > 500)

# 6. Use sapply() with range() on rts. What does sapply() return now? Why?
sapply(rts, range)
# range() returns 2 values (minimum and maximum) for each participant,
# so sapply() returns a matrix: 2 rows, one column per participant

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
scores
apply(scores, MARGIN = 1, FUN = mean) # 4 results, one per student
apply(scores, MARGIN = 2, FUN = max)  # 3 results, one per test
apply(scores, MARGIN = 1, FUN = function(x) max(x) - min(x))

# 8. Use apply() on the numeric columns of the iris dataset (columns 1 to 4)
#    to compute the standard deviation of each column.
apply(iris[, 1:4], MARGIN = 2, FUN = sd)

# 9. Here are the reaction times of 9 trials in three conditions:
trials <- data.frame(rt = c(410, 450, 430, 520, 560, 540, 650, 610, 700),
                     condition = rep(c("low", "medium", "high"), each = 3))
# 9.1 Print trials, then use tapply() to compute the mean rt of each condition.
# 9.2 Compute the mean of the "low" condition by hand, with [ ] and a logical condition,
#     and check that it is the same as in 9.1.
# 9.3 Use tapply() on iris to count the flowers of each Species with
#     Sepal.Width above 3. (?sum)
trials
tapply(trials$rt, INDEX = trials$condition, FUN = mean)
# the groups are in alphabetical order (high, low, medium), not in the order of the data
mean(trials$rt[trials$condition == "low"])
tapply(iris$Sepal.Width, INDEX = iris$Species, FUN = function(x) sum(x > 3))

# 10. Use vapply() on rts to compute the median of each participant,
#     declaring that each result is a single number (FUN.VALUE = numeric(1)).
# 10.1 What happens if you use range() instead of median()? Why?
vapply(rts, FUN = median, FUN.VALUE = numeric(1))
vapply(rts, FUN = range, FUN.VALUE = numeric(1)) # Error!
# range() returns 2 values, but we told vapply() to expect 1

# 11. Use mapply() and rep() to create, in one command, the three vectors
#     5 5 5    10 10    15
#     (rep() takes the value to repeat and the number of times)
# 11.1 Write by hand the same result with list() and three calls of rep().
mapply(rep, c(5, 10, 15), c(3, 2, 1))
list(rep(5, 3), rep(10, 2), rep(15, 1))

# 12. Use mapply() to simulate three samples of 4 values from normal distributions,
#     with these means and standard deviations: (?rnorm)
mus <- c(0, 50, 100)
sigmas <- c(1, 10, 20)
#     Use set.seed(2026) first, so the results are reproducible.
# 12.1 What do the rows and the columns of the result contain?
# 12.2 Run it again with SIMPLIFY = FALSE: what changes?
set.seed(2026)
mapply(function(m, s) rnorm(4, mean = m, sd = s), mus, sigmas)
# one column per sample (m = 0, s = 1; m = 50, s = 10; m = 100, s = 20),
# one row per simulated value
set.seed(2026)
mapply(function(m, s) rnorm(4, mean = m, sd = s), mus, sigmas, SIMPLIFY = FALSE)
# the same numbers, but as a list with one element per sample

# 13. Use replicate() to roll two dice and add them up (?sample):
# 13.1 first only 5 times, to see what replicate() does
# 13.2 then 1000 times, saving the result in sums.
#      Which sum is the most frequent? (?table) Plot it with barplot(table(sums)).
#      Use set.seed(2026) first.
set.seed(2026)
replicate(n = 5, expr = sum(sample(1:6, size = 2, replace = TRUE)))
sums <- replicate(n = 1000, expr = sum(sample(1:6, size = 2, replace = TRUE)))
table(sums)
names(which.max(table(sums))) # 7 is the most frequent sum
barplot(table(sums))
