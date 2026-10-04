# Dataframe Recap exercises

# 1. Create a dataframe called "students_df" with the following columns:
#    - StudentID (character) containing 8 made-up student ID numbers
#    - Degree (factor) containing 8 degree course names
#    - GPA (numeric) containing 8 grade point averages
students_df = data.frame(
  StudentID = c("12345678", "23456789", "34567890", "45678901", "56789012", "67890123", "78901234", "89012345"),
  Degree = factor(c("Computer Science", "Biology", "Physics", "Chemistry", "Mathematics", "Computer Science", "Biology", "Physics")),
  GPA = c(27.5, 28.3, 26.8, 29.1, 27.9, 26.2, 28.7, 27.4)
)

# 2. Extract:
# 2.1 Only the Degree column (using the $ operator)
# 2.2 The second column (using the numeric index)
# 2.3 The StudentID values of the students with GPA above 27
#     (use both the subset function and [])
#     Compare the output of the two commands


# 3. Add to students_df a new column called
#    EnrollmentYear (and fill in the enrollment year for each student)

# 4. Compute the frequency of each Degree course (use the table() function)

# 5. Select the rows where GPA is greater than 26 and
#    the StudentID and Degree columns
#    use both the subset function and []

# 6. Create another dataframe ("new_students") made of three rows
#    and with properties such that it can
#    be joined to students_df (rbind()), then join the two dataframes 
#    creating students_complete


# 7. Suppose you have these two dataframes:
df_students = data.frame(
  StudentID = c("12345", "67890", "11223", "44556", "99887"),
  Name = c("Luca", "Anna", "Marco", "Giulia", "Sara")
)
df_exams = data.frame(
  StudentID = c("67890", "11223", "78901"),
  Exam = c("Mathematics", "Physics", "Chemistry"),
  Grade = c(28, 30, 27)
)
# Create students_exams by merging the two data.frames using the StudentID column as the key,
# keeping all the rows of df_students (use the merge() function)

students_exams = merge(x = df_students, y = df_exams, 
                       by = "StudentID", all.x = TRUE ) 

# 8. In "students_exams" create a third column "Details"
#    that combines the Name and Exam information (use paste())

Details=paste(students_exams$Name, students_exams$Exam, sep="")
students_exams$Details=Details

# 9. Select the students with NA in the Exam column (use is.na())
is.na(students_exams$Exam)
students_exams[is.na(students_exams$Exam), "StudentID"]


# 10. Select the students without any NA (use the complete.cases() function)

# 11. Compute the mean of the grades in df_exams, excluding any NA

# 12. Sort students_df in increasing order of GPA (use the order() function)
