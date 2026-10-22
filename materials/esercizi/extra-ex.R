# day1

# 1. Create the vector steps with the daily steps of one week:
#    8200, 10500, 6400, 12000, 9100, 4300, 11000
#    and name its elements "Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun".
# 1.1 Extract the weekend (Sat and Sun) both by name and by position.



# 2. On the steps vector:
# 2.1 Compute mean, median, standard deviation and range (?range).
# 2.2 Count the days with at least 10000 steps.
# 2.3 Which days are they? (?which, ?names)


# 3. Create the vector odd_numbers with the odd numbers from 1 to 39 using seq().
# 3.1 How many elements does it have?
# 3.2 Extract the last 3 elements, using length().


# 4. Given the vector
scores <- c(18, 25, NA, 30, 22, NA, 27)
# 4.1 Count the missing values. (?is.na)
# 4.2 Compute the mean, excluding the missing values.
# 4.3 Replace the missing values with that mean, rounded to the integer. (?round)



# 5. Create multiples_3, a vector containing the first 10 multiples of 3 (3 included).
# ?seq


# 6. Create my_lett1 with geographic area labels
# "NORTH","CENTRE","SOUTH" repeated 2 times each.
# ?rep


# 7.1 Create my_lett1_new by sorting my_lett1 in
# alphabetical order (optional, see ?sort)


# 8. Create the vector num containing the daily counts of books sold (from 15 to 27).
# 8.1 Replace with NA the elements of num that are multiples of 4.
# 8.2 Compute the total number of books sold, excluding NAs.

# 9. Create the vector my_lett2 by repeating 
# the pattern of areas "NORTH","CENTRE","SOUTH" twice.

# 10. Check whether the vectors my_lett1_new and my_lett2 are identical


# remember TRUE = 1 and FALSE = 0
# I want them all to be TRUE, so the sum .....

# 11 Extract the elements of my_lett1_new equal to my_lett2.


# 12. Assign grades based on the students' performance in terms of the number
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


