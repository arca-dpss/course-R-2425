# Review exercises - solutions

# =========================================================
# A. Objects and operators
# =========================================================

# 1. Create the objects price and quantity, with the values 12.5 and 4.
# 1.1 Create the object total as the product of price and quantity.
# 1.2 Check whether total is greater than or equal to 50.
price <- 12.5
quantity <- 4
total <- price * quantity
total >= 50

# 2. Run and interpret:  (5 + 3) * 2 > 15 & !(10 %% 3 == 0)
#    Then remove the parentheses around 5 + 3 and run it again: what changes? Why?
(5 + 3) * 2 > 15 & !(10 %% 3 == 0)
5 + 3 * 2 > 15 & !(10 %% 3 == 0)
# without parentheses the multiplication is done first: 5 + 6 = 11, and 11 > 15 is FALSE

# 3. A year is a leap year if it is divisible by 4 and not by 100,
#    or if it is divisible by 400.
#    Write a statement that checks whether the object year is a leap year
#    and test it with 2024, 1900 and 2000. (%%)
year <- 2024
(year %% 4 == 0 & year %% 100 != 0) | year %% 400 == 0
year <- 1900
(year %% 4 == 0 & year %% 100 != 0) | year %% 400 == 0
year <- 2000
(year %% 4 == 0 & year %% 100 != 0) | year %% 400 == 0

# 4. Write a statement to evaluate the condition:
#    "the temperature t is below 0 or above 35"
#    Test it with t equal to -2, 20 and 38.
# 4.1 Write an equivalent statement using ! and the condition
#     "t is between 0 and 35".
t <- -2
t < 0 | t > 35
!(t >= 0 & t <= 35)
t <- 20
t < 0 | t > 35
!(t >= 0 & t <= 35)
t <- 38
t < 0 | t > 35
!(t >= 0 & t <= 35)

# 5. Try to predict the result, then run:
"apple" < "banana"
"Zebra" == "zebra"
"10" < "9"
TRUE + TRUE
# 5.1 Why is "10" < "9" TRUE? Why is TRUE + TRUE equal to 2?
# Strings are compared character by character: "1" comes before "9".
# In calculations TRUE counts as 1 and FALSE as 0.

# =========================================================
# B. Vectors
# =========================================================

# 6. Create the vector steps with the daily steps of one week:
#    8200, 10500, 6400, 12000, 9100, 4300, 11000
#    and name its elements "Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun".
# 6.1 Extract the weekend (Sat and Sun) both by name and by position.
steps <- c(8200, 10500, 6400, 12000, 9100, 4300, 11000)
names(steps) <- c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun")
steps[c("Sat", "Sun")]
steps[6:7]

# 7. On the steps vector:
# 7.1 Compute mean, median, standard deviation and range (?range).
# 7.2 Count the days with at least 10000 steps.
# 7.3 Which days are they? (?which, ?names)
mean(steps)
median(steps)
sd(steps)
range(steps)
sum(steps >= 10000)
names(which(steps >= 10000))

# 8. Create the vector odd_numbers with the odd numbers from 1 to 39 using seq().
# 8.1 How many elements does it have?
# 8.2 Extract the last 3 elements, using length().
odd_numbers <- seq(from = 1, to = 39, by = 2)
length(odd_numbers)
odd_numbers[(length(odd_numbers) - 2):length(odd_numbers)]

# 9. Given the vector
scores <- c(18, 25, NA, 30, 22, NA, 27)
# 9.1 Count the missing values. (?is.na)
# 9.2 Compute the mean, excluding the missing values.
# 9.3 Replace the missing values with that mean, rounded to the integer. (?round)
sum(is.na(scores))
mean_scores <- mean(scores, na.rm = TRUE)
mean_scores
scores[is.na(scores)] <- round(mean_scores)
scores

# 10. Create the vector cities1 in which "Rome", "Milan", "Naples" are repeated
#     3 times each (each =), and the vector cities2 in which the whole pattern
#     "Rome", "Milan", "Naples" is repeated 3 times (times =).
# 10.1 Compare them element by element: in how many positions are they equal?
# 10.2 Extract the elements of cities1 equal to cities2.
cities1 <- rep(c("Rome", "Milan", "Naples"), each = 3)
cities2 <- rep(c("Rome", "Milan", "Naples"), times = 3)
cities1 == cities2
sum(cities1 == cities2)
cities1[cities1 == cities2]

# 11. Given the temperatures in Celsius
temps_c <- c(12, 18, 25, 31, 7, 15)
# 11.1 Convert them to Fahrenheit (F = C * 9/5 + 32) and save them in temps_f.
# 11.2 Select the Celsius temperatures whose Fahrenheit value is above 70.
# 11.3 Replace the Celsius temperatures below 10 with 10.
temps_f <- temps_c * 9/5 + 32
temps_f
temps_c[temps_f > 70]
temps_c[temps_c < 10] <- 10
temps_c

# =========================================================
# C. Factors
# =========================================================

# 12. Create the factor sizes from c("M", "S", "L", "M", "XL", "S", "M").
# 12.1 Show the levels and the integer codes. In which order are the levels?
# 12.2 Reorder the levels as "S", "M", "L", "XL" and check the codes again.
sizes <- factor(c("M", "S", "L", "M", "XL", "S", "M"))
levels(sizes) # alphabetical order
as.integer(sizes)
sizes <- factor(sizes, levels = c("S", "M", "L", "XL"))
levels(sizes)
as.integer(sizes)

# 13. Create the factor answers from c("yes", "no", "maybe", "yes", "yes", "no").
# 13.1 Compute the frequency of each answer. (?table)
# 13.2 Rename the levels with a capital letter ("Yes", "No", "Maybe"):
#      careful with the order of the levels!
answers <- factor(c("yes", "no", "maybe", "yes", "yes", "no"))
table(answers)
levels(answers) # "maybe" "no" "yes"
levels(answers) <- c("Maybe", "No", "Yes")
answers

# 14. Create the factor seasons with "spring", "summer", "autumn", "winter",
#     each repeated 2 times.
# 14.1 Remove the observations equal to "winter".
# 14.2 Are the levels still 4? Remove the unused level. (?droplevels)
seasons <- factor(rep(c("spring", "summer", "autumn", "winter"), each = 2))
seasons <- seasons[seasons != "winter"]
levels(seasons) # "winter" is still a level
seasons <- droplevels(seasons)
levels(seasons)

# 15. Create the ordered factor rating from c("low", "high", "medium", "low", "high"),
#     with the levels in the order "low" < "medium" < "high". (ordered argument)
# 15.1 Which observations are greater than "low"?
rating <- factor(c("low", "high", "medium", "low", "high"),
                 levels = c("low", "medium", "high"), ordered = TRUE)
rating
rating > "low"
rating[rating > "low"]

# 16. Create the factor points_f from the numeric vector c(3, 5, 3, 8, 5).
# 16.1 What does as.integer(points_f) return? Why?
# 16.2 Get back the original numbers.
points_f <- factor(c(3, 5, 3, 8, 5))
as.integer(points_f) # the codes of the levels (1, 2, 3), not the original values
as.numeric(as.character(points_f))

# =========================================================
# D. Lists and matrices
# =========================================================

# 17. Create the list course with the elements:
#     - name: "Introduction to R"
#     - lessons: 5
#     - topics: "vectors", "factors", "lists", "dataframes", "loops"
#     - online: FALSE
#     Look at its structure with str().
course <- list(name = "Introduction to R",
               lessons = 5,
               topics = c("vectors", "factors", "lists", "dataframes", "loops"),
               online = FALSE)
str(course)

# 18. Extract the third topic of course using both $ and [[ ]].
# 18.1 What is the difference between course[3] and course[[3]]? (?class)
course$topics[3]
course[[3]][3]
class(course[3])   # a list with one element
class(course[[3]]) # the character vector itself

# 19. Modify the list course:
# 19.1 Add the element students, equal to 25.
# 19.2 Change the number of lessons to 6.
# 19.3 Remove the element online (assign NULL to it) and check the length of the list.
course$students <- 25
course$lessons <- 6
course$online <- NULL
length(course)
str(course)

# 20. Create the matrix M with 3 rows and 4 columns containing the numbers
#     from 1 to 12, filled by row.
# 20.1 Check its dimensions.
# 20.2 Extract the second row, the third column and the element in row 3, column 4.
M <- matrix(1:12, nrow = 3, ncol = 4, byrow = TRUE)
M
dim(M)
M[2, ]
M[, 3]
M[3, 4]

# 21. On the matrix M:
# 21.1 Extract the elements greater than 6.
# 21.2 Compute the sum of each row and of each column. (?rowSums, ?colSums)
# 21.3 Replace the elements greater than 6 with 0.
M[M > 6]
rowSums(M)
colSums(M)
M[M > 6] <- 0
M

# 22. Given the vectors
a <- 1:3
b <- c(10, 20, 30)
# 22.1 Join them by column and by row: what are the dimensions of the two matrices?
# 22.2 Try cbind(a, c(1, 2)): what happens? Why?
dim(cbind(a, b)) # 3 rows, 2 columns
dim(rbind(a, b)) # 2 rows, 3 columns
cbind(a, c(1, 2))
# c(1, 2) is shorter: R recycles it (1, 2, 1) and warns
# because 3 is not a multiple of 2

# =========================================================
# E. Data frames
# =========================================================

# 23. Create the dataframe books with the columns:
#     - title: "Emma", "Dracula", "Ulysses", "Frankenstein", "Persuasion"
#     - author: "Austen", "Stoker", "Joyce", "Shelley", "Austen"
#     - year: 1815, 1897, 1922, 1818, 1817
#     - pages: 474, 418, 730, 280, 249
#     Look at its structure and dimensions. (?str, ?nrow, ?ncol)
books <- data.frame(title = c("Emma", "Dracula", "Ulysses", "Frankenstein", "Persuasion"),
                    author = c("Austen", "Stoker", "Joyce", "Shelley", "Austen"),
                    year = c(1815, 1897, 1922, 1818, 1817),
                    pages = c(474, 418, 730, 280, 249))
str(books)
nrow(books)
ncol(books)

# 24. From books extract:
# 24.1 The pages column with $, and the second column with [[ ]].
# 24.2 The first row.
# 24.3 The titles of the books with more than 400 pages
#      (use both subset() and []).
books$pages
books[[2]]
books[1, ]
subset(books, subset = pages > 400, select = title)
books$title[books$pages > 400]

# 25. Add to books two new columns:
# 25.1 century: 19 if the book was published before 1900, 20 otherwise (?ifelse)
# 25.2 long: TRUE if the book has more than 400 pages
books$century <- ifelse(books$year < 1900, 19, 20)
books$long <- books$pages > 400
books

# 26. How many books does each author have? (?table)
# 26.1 Compute the mean number of pages for each author. (?tapply)
table(books$author)
tapply(books$pages, books$author, mean)

# 27. Sort books by year (from the oldest), then by number of pages
#     (from the longest), and show the first 3 rows. (?order, ?head)
books[order(books$year), ]
head(books[order(books$pages, decreasing = TRUE), ], n = 3)

# 28. Create the dataframe new_books with 2 books of your choice and the same
#     columns as books (including century and long), then join it to books
#     creating all_books. (?rbind)
new_books <- data.frame(title = c("Dubliners", "Mrs Dalloway"),
                        author = c("Joyce", "Woolf"),
                        year = c(1914, 1925),
                        pages = c(152, 194),
                        century = c(20, 20),
                        long = c(FALSE, FALSE))
all_books <- rbind(books, new_books)
all_books

# 29. Given the dataframe
ratings <- data.frame(title = c("Emma", "Dracula", "Beloved"), stars = c(4.5, 4.2, 4.8))
# 29.1 Merge books and ratings using title as the key, keeping all the rows of books. (?merge)
# 29.2 Which books have no rating? (?is.na)
# 29.3 Keep only the complete rows. (?complete.cases)
books_ratings <- merge(books, ratings, by = "title", all.x = TRUE)
books_ratings
books_ratings$title[is.na(books_ratings$stars)]
books_ratings[complete.cases(books_ratings), ]

# =========================================================
# F. Functions and conditional programming
# =========================================================

# 30. Write the function bmi(weight, height_cm) that returns the body mass index
#     (weight in kg divided by the squared height in meters), rounded to 1 decimal.
#     Test it with 70 kg and 175 cm.
bmi <- function(weight, height_cm){
  height_m <- height_cm / 100
  return(round(weight / height_m^2, 1))
}
bmi(70, 175)

# 31. Write the function bmi_class(b) that, using if ... else if ... else,
#     returns:
#     "underweight" if b < 18.5, "normal" if b < 25,
#     "overweight" if b < 30, "obese" otherwise.
bmi_class <- function(b){
  if (b < 18.5) {
    label <- "underweight"
  } else if (b < 25) {
    label <- "normal"
  } else if (b < 30) {
    label <- "overweight"
  } else {
    label <- "obese"
  }
  return(label)
}
bmi_class(bmi(70, 175))

# 32. bmi_class() does not work on a vector (try it). Write bmi_class2() that does
#     the same classification on a whole vector using dplyr::case_when()
#     (or nested ifelse()), and test it on:
bmi_values <- c(17.2, 22.5, 27.8, 31.4)
bmi_class2 <- function(b){
  dplyr::case_when(b < 18.5 ~ "underweight",
                   b < 25 ~ "normal",
                   b < 30 ~ "overweight",
                   TRUE ~ "obese")
}
bmi_class2(bmi_values)

# 33. Write the function describe_vec(x, na.rm = TRUE) that returns a sentence like
#     "n = 5, mean = 24.40, sd = 4.62"
#     where n is the number of non-missing values. (?sprintf)
#     Test it on c(18, 25, NA, 30, 22, NA, 27).
describe_vec <- function(x, na.rm = TRUE){
  sprintf("n = %d, mean = %.2f, sd = %.2f",
          sum(!is.na(x)), mean(x, na.rm = na.rm), sd(x, na.rm = na.rm))
}
describe_vec(c(18, 25, NA, 30, 22, NA, 27))

# 34. Write the function safe_sqrt(x) that:
#     - stops with the error "x must be numeric" if x is not numeric (?stop)
#     - if x contains negative values, gives the warning "negative values set to NA" (?warning)
#       and replaces them with NA
#     - returns the square root of x
#     Test it with c(4, 9, 16), c(4, -1, 9) and "a".
safe_sqrt <- function(x){
  if (!is.numeric(x)) {
    stop("x must be numeric")
  }
  if (any(x < 0)) {
    warning("negative values set to NA")
    x[x < 0] <- NA
  }
  return(sqrt(x))
}
safe_sqrt(c(4, 9, 16))
safe_sqrt(c(4, -1, 9))
safe_sqrt("a") # Error!

# 35. A museum charges €5 for children (under 12), €7 for seniors (65 or older)
#     and €10 for everyone else. Given the ages of a group of visitors
ages <- c(8, 35, 70, 15, 64, 3)
#     compute the price paid by each visitor and the total. (?ifelse)
prices <- ifelse(ages < 12, 5, ifelse(ages >= 65, 7, 10))
prices
sum(prices)

# =========================================================
# G. Loops and the apply family
# =========================================================

# 36. Use a for loop to compute the factorial of 6 (6 * 5 * 4 * 3 * 2 * 1)
#     and compare the result with factorial(6).
fact <- 1
for (i in 1:6) {
  fact <- fact * i
}
fact
fact == factorial(6)

# 37. Using the steps vector of exercise 6, write a for loop that prints for each day
#     a message like "Mon: 8200 steps - goal not reached"
#     (the goal is reached with at least 10000 steps). (?paste)
for (day in names(steps)) {
  if (steps[day] >= 10000) {
    print(paste0(day, ": ", steps[day], " steps - goal reached"))
  } else {
    print(paste0(day, ": ", steps[day], " steps - goal not reached"))
  }
}

# 38. You have €100 of savings, which grow by 15% every year.
#     Use a while loop to find after how many years they reach at least €200.
savings <- 100
years <- 0
while (savings < 200) {
  savings <- savings * 1.15
  years <- years + 1
}
years
savings

# 39. Create an empty 5 x 5 matrix mult_table and fill it with two nested for loops,
#     so that the element in row i and column j is i * j.
#     Compare it with outer(1:5, 1:5).
mult_table <- matrix(NA, nrow = 5, ncol = 5)
for (i in 1:5) {
  for (j in 1:5) {
    mult_table[i, j] <- i * j
  }
}
mult_table
all.equal(mult_table, outer(1:5, 1:5))

# 40. Given the list
measures <- list(a = c(2, 4, 6), b = c(10, 20, 30, 40), c = c(5, 15))
# 40.1 Use sapply() to compute the mean of each element.
# 40.2 Use lapply() to center each element (subtract its mean),
#      using an anonymous function.
# 40.3 Use apply() to find the maximum of each row of the matrix
#      matrix(1:12, nrow = 3, byrow = TRUE).
sapply(measures, mean)
lapply(measures, function(x) x - mean(x))
apply(matrix(1:12, nrow = 3, byrow = TRUE), MARGIN = 1, FUN = max)
