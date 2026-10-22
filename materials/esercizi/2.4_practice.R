# Data frame exercises

# 1. Create a dataframe ("my_df1") made of:
# - Name (factor) containing the names of the people in the class,
# - Age (numeric) containing your age,
# - Height (numeric) containing your height in cm

# 2. Extract:
# 2.1 Only the Age column (using the $ operator)
# 2.2 The third column (using the numeric index)
# 2.3 The Name values of the people taller than 170 cm
# (use both the subset function and [])
# What do the two commands return?

# 3. Add to my_df1 a new column called
# Eyes (and fill in the eye color)

# 4. Compute the frequency of each Eyes color (?table)

# 5. Select the rows where age is greater than 25 and
# the Name and Height columns
# use both the subset function and []

# 6. Create another dataframe ("my_df2") made of three rows
# and with properties such that it can be
# joined to the my_df1 you created (rbind()), then join the two dataframes creating my_df3

# 7. Suppose you have these two dataframes:
df1 <- data.frame(ID = 1:5, Name = c("Anna", "Bob", "Carlo", "Diana", "Eva"))
df2 <- data.frame(ID = c(2,4,6), City = c("Rome", "Milan", "Naples"))
# Create my_df4 by merging the two data.frames using the ID column as the key (?merge),
# keeping all the rows of df1.

# 8. In "my_df4" create a third column "Info"
# that combines the Name and City information (?paste, ?sprintf)

# 9. Select the people with NA in the City column ?is.na()

# 10. Select the people without any NA (see the complete.cases() function)

# 11. Compute the mean age in my_df1, excluding any NA

# 12. Sort my_df1 in decreasing order of height (?order)
