# Data frame exercises - 20 exercises

# A small study: 8 participants, divided into a control and a treatment group.
# Over the exercises you will build, clean and combine their data.

# 1. Create the dataframe participants with these columns:
id <- c("P01", "P02", "P03", "P04", "P05", "P06", "P07", "P08")
group <- c("control", "treatment", "control", "treatment",
           "treatment", "control", "treatment", "control")
age <- c(22, 27, 31, 230, 24, 29, 21, 35)
sleep_hours <- c(7.5, 6, 8, 5.5, 6.5, 7, 4.5, 8.5)
# 1.1 Look at its structure, its dimensions and its column names.
#     (?str, ?dim, ?nrow, ?ncol, ?names)

# 2. Show the first 3 and the last 3 rows of participants. (?head, ?tail)
# 2.1 Use summary(): do you notice anything strange in the age column?

# 3. Extract the age column in three ways: with $, with [[ ]] and with [ ].
# 3.1 Which of the three returns a vector and which a dataframe? (?class)

# 4. Extract:
# 4.1 the age of the third participant, in two different ways
# 4.2 the whole row of participant "P05"
# 4.3 the id and group columns of the first 4 participants

# 5. Using [ ] and logical conditions, extract:
# 5.1 the participants who sleep less than 7 hours
# 5.2 the participants of the treatment group who sleep less than 7 hours
# 5.3 the ids of the participants younger than 25 or older than 30

# 6. Repeat exercise 5.2 using subset(), keeping only the id and sleep_hours columns.
# 6.1 How many participants are there? (?nrow)

# 7. On the iris dataset (available in R), use subset() to keep the "versicolor"
#    flowers with Sepal.Length greater than 6, with only the columns
#    Sepal.Length and Petal.Length.
# 7.1 How many flowers are there?

# 8. Two new participants joined the study:
new_participants <- data.frame(id = c("P09", "P10"),
                               group = c("control", "treatment"),
                               Age = c(26, 33),
                               sleep_hours = c(7, 6))
# 8.1 Try to add them to participants with rbind(). What happens? Why?
# 8.2 Fix the problem and add them, overwriting participants. How many rows are there now?

# 9. The age of participant "P04" is wrong: it is 23, not 230.
#    Correct it by selecting the right cell with a logical condition on id.

# 10. Add two new columns to participants:
# 10.1 sleep_minutes: the hours of sleep converted into minutes
# 10.2 age_group: "young" if the participant is younger than 25, "adult" otherwise (?ifelse)

# 11. Convert the columns group and age_group into factors. (?as.factor)
# 11.1 How many participants are there in each group? (?table)
# 11.2 Create a contingency table of group by age_group.

# 12. Create the column code joining id and group with an underscore,
#     for example "P01_control". (?paste)

# 13. Rename the column sleep_hours as sleep, then remove the column sleep_minutes.
#     (?names; to remove a column you can assign NULL to it)

# 14. These are the scores of a memory task:
scores <- data.frame(id = c("P01", "P02", "P03", "P05", "P06", "P07", "P09", "P10", "P11"),
                     score = c(18, 26, NA, 22, 27, NA, 30, 29, 19))
# 14.1 How many missing values are there in the score column? (?is.na)
# 14.2 Which ids have a missing score?
# 14.3 Compute the mean score, excluding the missing values.
# 14.4 Keep only the complete rows. (?complete.cases)

# 15. Merge participants and scores using id as the key (?merge):
# 15.1 keeping only the participants present in both dataframes
# 15.2 keeping all the participants (all.x = TRUE), and save it as study
# 15.3 How many rows do the two results have? Why is P11 missing?

# 16. Get the same result as 15.2 with left_join() from the dplyr package.
#     Check that it has the same number of rows as study.

# 17. Sort study:
# 17.1 by age, from the oldest to the youngest (?order)
# 17.2 by score, from the highest, and show only the first 3 rows (?head)

# 18. Compute the mean score of the control group and of the treatment group,
#     excluding the missing values (use [ ] and logical conditions).
# 18.1 Optional: get both means at once with tapply().

# 19. Save study as the file "study.csv" in your working directory, without
#     row names. (?write.csv)
# 19.1 Read it back with read.csv() and save it as study_imported.
# 19.2 Compare the structure of study and study_imported: what happened to the factors?
#      Convert group and age_group back into factors.

# 20. Putting it all together: starting from study,
#     - keep only the complete rows
#     - keep only the treatment group
#     - keep only the participants with a score above the mean score of study
#       (excluding the missing values)
#     - show only the columns id, age and score, sorted by score (highest first)
