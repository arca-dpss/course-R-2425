# Factor exercises - solutions

# 1. Create a factor colors with the levels "red", "green", "blue", each repeated 3 times.
colors <- factor(rep(c("red", "green", "blue"), each = 3))

# 1.1 Show the levels of the factor.
levels(colors)

# 1.2 Rename the levels to "col_red", "col_green", "col_blue".
# the levels are in alphabetical order: "blue", "green", "red"
levels(colors) <- c("col_blue", "col_green", "col_red")

# 2. Create a factor quarters with the levels "Q1", "Q2", "Q3", "Q4", each repeated 2 times.
quarters <- factor(rep(c("Q1", "Q2", "Q3", "Q4"), each = 2))

# 2.1 Remove the observations with level "Q3".
quarters <- quarters[quarters != "Q3"]

# 2.2 Use droplevels() to remove the levels that are no longer present.
quarters <- droplevels(quarters)
levels(quarters)

# 3. Create a factor courses with the levels "starter", "main", "side", "dessert", each repeated 2 times.
courses <- factor(rep(c("starter", "main", "side", "dessert"), each = 2))

# 3.1 Create a new factor courses_ord with the order of the levels reversed (use levels in factor()).
# ?sort
courses_ord <- factor(courses, levels = sort(levels(courses), decreasing = TRUE))
levels(courses_ord)

# 3.2 Set the reference level to "dessert" (try using the relevel() function, optional).
courses_ord <- relevel(courses_ord, ref = "dessert")
levels(courses_ord)

# 4. Create a factor flowers with the levels "rose", "tulip", "sunflower".
flowers <- factor(c("rose", "tulip", "sunflower"))

# 4.1 Add a new level "orchid" and assign it to a new observation.
levels(flowers) <- c(levels(flowers), "orchid")
flowers[4] <- "orchid"

# 4.2 Check that the new level appears in levels() and use droplevels if needed.
levels(flowers)

# 5. Create a factor departments with the categories "A", "B", "C", each repeated 4 times.
departments <- factor(rep(c("A", "B", "C"), each = 4))

# 5.1 Change the first 3 observations to "D" # what happens?
departments[1:3] <- "D"
# It produces NA (with a warning) because "D" is not a valid level

# 5.2 Check the levels and, if unused levels remain, remove them with droplevels().
levels(departments)
# To add "D" correctly:
departments <- factor(rep(c("A", "B", "C"), each = 4))
levels(departments) <- c(levels(departments), "D")
departments[1:3] <- "D"
levels(departments)

# 6. Create a vector countries <- c("Italy","France","Spain","Italy","Germany","France").
countries <- c("Italy", "France", "Spain", "Italy", "Germany", "France")
# 6.1 Convert it to the factor countries_fact with factor() or as.factor().
countries_fact <- factor(countries)
# or: countries_fact <- as.factor(countries)

# 6.2 Create countries_num by converting countries_fact to integer.
countries_num <- as.integer(countries_fact)

# 6.3 Create countries_fact_2 with factor(), explicitly specifying levels and labels.
countries_fact_2 <- factor(countries,
                           levels = c("Italy", "France", "Spain", "Germany"),
                           labels = c("Italy", "France", "Spain", "Germany"))

# 6.4 Rename the levels of countries_fact_2 with the corresponding geographic area (e.g. "EU_West", ...).
# the levels are in the order set above: "Italy", "France", "Spain", "Germany"
levels(countries_fact_2) <- c("EU_South", "EU_West", "EU_SouthWest", "EU_Central")
countries_fact_2

# 7. Create a factor shifts with the levels "morning","afternoon","night" repeated 3 times.
shifts <- factor(rep(c("morning", "afternoon", "night"), each = 3))

# 7.1 Change the order of the levels to c("night","afternoon","morning") and check the order in levels().
shifts <- factor(shifts, levels = c("night", "afternoon", "morning"))
levels(shifts)

# 8. Create a numeric vector points <- c(10,20,10,30,20,40) and convert it to the factor points_f.
points <- c(10, 20, 10, 30, 20, 40)
points_f <- factor(points)

# 8.2 Get back the correct numeric values from points_f.
as.numeric(as.character(points_f))

# 8.3 Explain why as.integer(factor) returns the level codes and not the original values.
as.integer(points_f)
# as.integer() converts the internal codes of the levels (1,2,3...),
# not the original values. To get the original values you must
# first convert to character and then to numeric.

# 9. Create the factor classes <- factor(rep(c("bronze","silver","gold"), each=3)).
classes <- factor(rep(c("bronze", "silver", "gold"), each = 3))

# 9.1 Try to assign "platinum" to classes[1:2];
#     check the updated levels.
levels(classes) <- c(levels(classes), "platinum")
classes[1:2] <- "platinum"
levels(classes)

# 10. Create fact1 and fact2 with the same values but a different level order.
fact1 <- factor(c("A", "B", "C", "A"), levels = c("A", "B", "C"))
fact2 <- factor(c("A", "B", "C", "A"), levels = c("C", "B", "A"))

# 10.1 Compare them element by element (==) and compare the levels with levels().
fact1 == fact2
levels(fact1) == levels(fact2)

# 10.2 Align the order of the levels with factor(..., levels=...) and repeat the comparison.
fact2 <- factor(fact2, levels = c("A", "B", "C"))
fact1 == fact2
levels(fact1) == levels(fact2)
