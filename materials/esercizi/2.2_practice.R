# Factor exercises

# 1. Create a factor colors with the levels "red", "green", "blue", each repeated 3 times.
# 1.1 Show the levels of the factor.
# 1.2 Rename the levels to "col_red", "col_green", "col_blue".

# 2. Create a factor quarters with the levels "Q1", "Q2", "Q3", "Q4", each repeated 2 times.
# 2.1 Remove the observations with level "Q3".
# 2.2 Use droplevels() to remove the levels that are no longer present.

# 3. Create a factor courses with the levels "starter", "main", "side", "dessert", each repeated 2 times.

# 3.1 Create a new factor courses_ord with the order of the levels reversed (alphabetical)
# (use levels in factor()) 
# ?sort

# reverse the order of the levels

# 3.2 Set the reference level to "dessert" (try using the relevel() function, optional).

# 4. Create a factor flowers with the levels "rose", "tulip", "sunflower".
# 4.1 Add a new level "orchid" and assign it to a new observation.
# 4.2 Check that the new level appears in levels() and use droplevels if needed.

# 5. Create a factor departments with the categories "A", "B", "C", each repeated 4 times.
# 5.1 Change the first 3 observations to "D" # what happens?
# 5.2 Check the levels and, if unused levels remain, remove them with droplevels().

# 6. Create a vector countries <- c("Italy","France","Spain","Italy","Germany","France").
# 6.1 Convert it to the factor countries_fact with factor() or as.factor().
# 6.2 Create countries_num by converting countries_fact to integer.
# 6.3 Create countries_fact_2 with factor(), explicitly specifying levels and labels.
# 6.4 Rename the levels of countries_fact_2 with the corresponding geographic area 
# (e.g. "EU_West", ...).


# 7. Create a factor shifts with the levels "morning","afternoon","night" repeated 3 times.
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
