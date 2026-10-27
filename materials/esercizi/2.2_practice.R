# Factor exercises

# 1. Create a factor colors with the levels "red", "green", "blue", each repeated 3 times.
colors <- rep(c("red", "green", "blue"), each = 3)
colors
colors <- as.factor(colors)

# equivalent
colors <- factor(x = rep(c("red", "green", "blue"), each = 3))
  
# 1.1 Show the levels of the factor.
levels(colors)

# 1.2 Rename the levels to "col_red", "col_green", "col_blue".
levels(colors) <- c("col_blue", "col_green", "col_red")

# 2. Create a factor quarters with the levels "Q1", "Q2", "Q3", "Q4", each repeated 2 times.
quarters <- factor(x = rep(c("Q1", "Q2", "Q3", "Q4"), each = 2))

# 2.1 Remove the observations with level "Q3".
quarters <- quarters[quarters!="Q3"]
quarters #check

# 2.2 Use droplevels() to remove the levels that are no longer present.
quarters <- droplevels(quarters)
quarters #check

# 3. Create a factor courses with the levels "starter", "main", "side", "dessert", each repeated 2 times.
courses <- factor(x = rep(c("starter", "main", "side", "dessert"), each = 2))
courses
# 3.1 Create a new factor courses_ord with 
# the order of the levels reversed (alphabetical)
# (use levels in factor()) 
# ?sort
levels(courses) # check output
sort(levels(courses), decreasing = TRUE) # check output


# reverse the order of the levels
courses_ord <- factor( x = courses, #use sort inside factor
                       levels = sort(levels(courses), decreasing = TRUE),
                       ordered = TRUE)

courses_ord <- factor( x = courses,
                       levels = c("starter","side", "main","dessert"),
                       ordered = TRUE)

# 3.2 Set the reference level to "dessert" (try using the relevel() function, optional).


# 4. Create a factor flowers with the levels "rose", "tulip", "sunflower".
flowers <- factor(x = c("rose", "tulip", "sunflower"))
flowers
# 4.1 Add a new level "orchid" and assign it to a new observation.
levels(flowers) <- c(levels(flowers), "orchid")
levels(flowers) <- c("rose", "sunflower", "tulip", "orchid")

flowers[length(flowers)+1] <- "orchid"
flowers
# 4.2 Check that the new level appears in levels() and use droplevels if needed.
levels(flowers)
droplevels(flowers)

# 5. Create a factor departments with the categories "A", "B", "C", 
# each repeated 4 times.
departments <- factor(x = rep(c("A", "B", "C"), each = 4),
                      levels = c("B", "C", "A"))    
departments  
# 5.1 Change the first 3 observations to "D" # what happens?
#departments[c(1,2,3)] <- "D" # wrong
levels(departments)
levels(departments) <- c(levels(departments), "D")
departments[c(1,2,3)]
departments[c(1,2,3)] <- c("D","A","B")
departments

# 5.2 Check the levels and, if unused levels remain, 
# remove them with droplevels().
levels(departments)
droplevels(departments)


# 6. Create a vector countries <- c("Italy","France","Spain","Italy","Germany","France").
# 6.1 Convert it to the factor countries_fact with factor() or as.factor().
# 6.2 Create countries_num by converting countries_fact to integer.
# 6.3 Create countries_fact_2 with factor(), explicitly specifying levels and labels.
# 6.4 Rename the levels of countries_fact_2 with the corresponding geographic area 
# (e.g. "EU_West", ...).


# 7. A nurse works two weeks. Every week has the same pattern of shifts:
#    "morning", "morning", "afternoon", "afternoon", "night", "night"
#    Create the factor shifts with the shifts of the two weeks (12 values),
#    using rep() with BOTH the each and the times arguments.
# 7.1 Change the order of the levels to c("night","afternoon","morning") and check the order in levels().

# 8. Create a numeric vector points <- c(10,20,10,30,20,40) 
# and convert it to the factor points_f.
# 8.2 Get back the correct numeric values from points_f.

# 9. Create the factor classes <- factor(rep(c("bronze","silver","gold"), each=3)).
# 9.1 Try to assign "platinum" to classes[1:2];
#     check the updated levels.

# 10. Create fact1 and fact2 with the same values but a different level order.
fact1 <- factor(c("A", "B", "C", "A"), levels = c("A", "B", "C"))
fact2 <- factor(c("A", "B", "C", "A"), levels = c("C", "B", "A"))
# 10.1 Compare them element by element (==) and compare the levels with levels().
# 10.2 Align the order of the levels with factor(..., levels=...) and repeat the comparison.


# 12. Create the factor sizes from c("M", "S", "L", "M", "XL", "S", "M").
# 12.1 Show the levels and the integer codes. In which order are the levels?
# 12.2 Reorder the levels as "S", "M", "L", "XL" and check the codes again.

# 13. Create the factor answers from c("yes", "no", "maybe", "yes", "yes", "no").
# 13.1 Compute the frequency of each answer. (?table)
# 13.2 Rename the levels with a capital letter ("Yes", "No", "Maybe"):
#      careful with the order of the levels!

# 14. Create the factor seasons with the season of each month, for two years:
#     every season lasts 3 months ("spring", "spring", "spring", "summer", ...)
#     and the same pattern repeats for 2 years. (rep() with each and times)
# 14.1 How many values does seasons have? Check with length().
# 14.2 Remove the observations equal to "winter". How many values are left?
# 14.3 Are the levels still 4? Remove the unused level. (?droplevels)

# 15. Create the ordered factor rating from c("low", "high", "medium", "low", "high"),
#     with the levels in the order "low" < "medium" < "high". (ordered argument)
# 15.1 Which observations are greater than "low"?

# 16. Create the factor points_f from the numeric vector c(3, 5, 3, 8, 5).
# 16.1 What does as.integer(points_f) return? Why?
# 16.2 Get back the original numbers.


# 17. A study compares three therapies. This is the therapy of each participant:
therapy <- factor(c("waitlist", "cbt", "mindfulness", "cbt",
                    "waitlist", "mindfulness", "cbt"))
# 17.1 Show the levels and the integer codes of therapy.
# 17.2 "waitlist" is the control group, so it should be the reference category.
#      Create therapy_ord with the levels in the order "waitlist", "cbt", "mindfulness".
#      (use levels in factor())
# 17.3 Check that the data did not change (?all) and compare table(therapy)
#      with table(therapy_ord): what is different?
# 17.4 Get the same reference category with relevel(). (?relevel)

# 18. Rename the levels of therapy_ord as "WL", "CBT", "MIND".
#     Before renaming, check the current order of the levels!
# 18.1 Check that each value was renamed correctly

# 19. Look at this code, but do NOT run it yet:
therapy_wrong <- therapy
levels(therapy_wrong) <- c("waitlist", "cbt", "mindfulness")
# 19.1 What do you think the first 3 values of therapy_wrong will be?

# 20. Using factor() with both levels and labels, create in ONE step therapy_new:
#     - the levels in the order "waitlist", "cbt", "mindfulness"
#     - renamed as "Waitlist", "CBT", "Mindfulness"

# 21 These are the symptoms of 6 participants:
symptoms <- c("mild", "severe", "moderate", "mild", "severe", "moderate")
#      Create the ordered factor symptoms_ord, with "mild" < "moderate" < "severe".
# 21.1 Which participants have symptoms more severe than "mild"?
#      How many are they? (?sum)

# 22. Predict, then check. Given
f <- factor(c("b", "a", "c", "a"))
#     before running each line, write what you expect as a comment:
# 22.1 levels(f)
# 22.2 as.integer(f)
# 22.3 factor(f, levels = c("c", "b", "a"))
# 22.4 levels(f) <- c("x", "y", "z"); f
