# Vector exercises

# 1. Create a vector my_vect containing the training minutes
# recorded per gym session, from 12 to 150 (all numbers between 12 and 150, ?seq)

# 1.1 Extract the fourth and the second-to-last element of my_vect
# ?length

# 1.2 Compute the square root of the minutes in my_vect

# 1.3 Create the object s whose value is the sum of the total minutes.

# 1.4 Assign the value s to the elements of my_vect that have
# minutes between 20–60 or between 100–130


# 2. Create multiples_3, a vector containing the first 10 multiples of 3 (3 included).
# ?seq


# 3. Create my_lett1 with geographic area labels
# "NORTH","CENTRE","SOUTH" repeated 2 times each.
# ?rep


# 3.1 Create my_lett1_new by sorting my_lett1 in
# alphabetical order (optional, see ?sort)

# 4. Create the vector num containing the daily counts of books sold (from 15 to 27).

# 4.1 Replace with NA the elements of num that are multiples of 4.


# 4.2 Compute the total number of books sold, excluding NAs.

# 5. Create the vector my_lett2 by repeating 
# the pattern of areas "NORTH","CENTRE","SOUTH" twice.

# 6. Check whether the vectors my_lett1_new and my_lett2 are identical


# remember TRUE = 1 and FALSE = 0
# I want them all to be TRUE, so the sum .....

# 6.2 Extract the elements of my_lett1_new equal to my_lett2.


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

