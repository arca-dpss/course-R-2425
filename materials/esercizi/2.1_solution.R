# Vector exercises - solutions

# 1. Create a vector my_vect containing the training minutes
# recorded per gym session, from 12 to 150.
my_vect <- 12:150

# 1.1 Extract the fourth and the second-to-last element of my_vect
# ?length
my_vect[c(4, length(my_vect) - 1)]

# 1.2 Compute the square root of the minutes in my_vect
sqrt(my_vect)

# 1.3 Create the object s whose value is the sum of the total minutes.
s <- sum(my_vect)

# 1.4 Assign the value s to the elements of my_vect that have
# minutes between 20–60 or between 100–130
my_vect[(my_vect >= 20 & my_vect <= 60) | (my_vect >= 100 & my_vect <= 130)] <- s


# 2. Create multiples_3, a vector containing the first 10 multiples of 3 (3 included).
# ?seq
multiples_3 <- seq(from = 3, by = 3, length.out = 10)
# or: multiples_3 <- seq(from = 3, to = 30, by = 3)
multiples_3


# 3. Create my_lett1 with geographic area labels
# "NORTH","CENTRE","SOUTH" repeated 2 times each.
# ?rep
my_lett1 <- rep(c("NORTH", "CENTRE", "SOUTH"), each = 2)
my_lett1


# 3.1 Create my_lett1_new by sorting my_lett1 in
# alphabetical order (optional, see ?sort)
my_lett1_new <- sort(my_lett1)
my_lett1_new

# 4. Create the vector num containing the daily counts of books sold (from 15 to 27).
num <- 15:27

# 4.1 Replace with NA the elements of num that are multiples of 4.
num[num %% 4 == 0] <- NA
num


# 4.2 Compute the total number of books sold, excluding NAs.
sum(num, na.rm = TRUE)

# 5. Create the vector my_lett2 by repeating
# the pattern of areas "NORTH","CENTRE","SOUTH" twice.
my_lett2 <- rep(c("NORTH", "CENTRE", "SOUTH"), times = 2)
my_lett2

# 6. Check whether the vectors my_lett1_new and my_lett2 are identical
my_lett1_new == my_lett2 # element by element

# remember TRUE = 1 and FALSE = 0
# I want them all to be TRUE, so the sum must be equal to the length of the vector
sum(my_lett1_new == my_lett2) == length(my_lett2) # FALSE: they are not identical

# the same, in one step
identical(my_lett1_new, my_lett2)

# 6.2 Extract the elements of my_lett1_new equal to my_lett2.
my_lett1_new[my_lett1_new == my_lett2]


# 7. Assign grades based on the students' performance in terms of the number
#    of correct answers to a quiz and the number of completed projects
# Data:
quiz <- c(14, 24, 26, 18)
names(quiz) <- c("alice","bob","charlie","carlo") # student names
projects    <- c(1,  2,  3,  2)
names(projects) <- c("alice","bob","charlie","carlo") # student names

# Rules for an online course certificate:
# "30L" (30 cum laude) if the student answered more than 24 quiz questions correctly
#  and completed at least 2 projects,
# "30" if they answered 24 quiz questions and completed at least 2 projects,
# "below30" otherwise.

# start with the "otherwise" grade for everyone, then overwrite it
grade <- rep("below30", length(quiz))
names(grade) <- names(quiz)

grade[quiz >= 24 & projects >= 2] <- "30"
grade[quiz > 24 & projects >= 2] <- "30L" # applied last, so it wins over "30"

grade
