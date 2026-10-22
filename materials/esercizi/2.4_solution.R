# Data frame exercises - solutions

# 1. Create a dataframe ("my_df1") made of:
# - Name (factor) containing the names of the people in the class,
# - Age (numeric) containing your age,
# - Height (numeric) containing your height in cm

my_df1 <- data.frame(Name = factor(c("Alice", "Ben", "Clara", "David", "Emma",
                                     "Frank", "Grace", "Henry", "Irene")),
                     Age = c(25, 27, 23, 25, 28, NA, 25, NA, NA),
                     Height = c(165, 190, 172, 163, 160, NA, 167, NA, NA))
str(my_df1)

# 2. Extract:
# 2.1 Only the Age column (using the $ operator)
my_df1$Age

# 2.2 The third column (using the numeric index)
my_df1[, 3]

# 2.3 The Name values of the people taller than 170 cm
# (use both the subset function and [])
# What do the two commands return?
subset(my_df1, subset = Height > 170, select = "Name")
# subset() returns a dataframe, and drops the rows where Height is NA

my_df1$Name[my_df1$Height > 170]
# [] on the column returns a vector (a factor here), with an NA for each missing Height

# 3. Add to my_df1 a new column called
# Eyes (and fill in the eye color)
my_df1$Eyes <- c("green", "green", "brown", "brown", "brown", NA, "brown", NA, NA)

# 4. Compute the frequency of each Eyes color (?table)
table(my_df1$Eyes)

# 5. Select the rows where age is greater than 25 and
# the Name and Height columns
# use both the subset function and []
subset(my_df1, Age > 25, select = c("Name", "Height"))
my_df1[my_df1$Age > 25, c("Name", "Height")]
# with [] the people whose Age is NA come back as rows full of NA:
# subset() drops them. With [] you can drop them yourself with !is.na()
my_df1[!is.na(my_df1$Age) & my_df1$Age > 25, c("Name", "Height")]

# 6. Create another dataframe ("my_df2") made of three rows
# and with properties such that it can be
# joined to the my_df1 you created (rbind()), then join the two dataframes creating my_df3
# (same column names, same number of columns)

my_df2 <- data.frame(Name = c("Jack", "Kate", "Leo"),
                     Age = c(29, 31, 24),
                     Height = c(154, 180, 168),
                     Eyes = c("green", "blue", "brown"))

my_df3 <- rbind(my_df1, my_df2)
my_df3

# 7. Suppose you have these two dataframes:
df1 <- data.frame(ID = 1:5, Name = c("Anna", "Bob", "Carlo", "Diana", "Eva"))
df2 <- data.frame(ID = c(2,4,6), City = c("Rome", "Milan", "Naples"))
# Create my_df4 by merging the two data.frames using the ID column as the key (?merge),
# keeping all the rows of df1.
my_df4 <- merge(df1, df2, by = "ID", all.x = TRUE)
my_df4

# 8. In "my_df4" create a third column "Info"
# that combines the Name and City information (?paste, ?sprintf)
my_df4$Info <- paste(my_df4$Name, my_df4$City, sep = "_")
my_df4

# 9. Select the people with NA in the City column ?is.na()
my_df4[is.na(my_df4$City), ]

# 10. Select the people without any NA (see the complete.cases() function)
my_df4[complete.cases(my_df4), ]

# 11. Compute the mean age in my_df1, excluding any NA
mean(my_df1$Age, na.rm = TRUE)

# 12. Sort my_df1 in decreasing order of height (?order)
my_df1[order(my_df1$Height, decreasing = TRUE), ]
