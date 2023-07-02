# Using pivot_longer(), 
# Let's re-assign the dataset as HeymanLong
____ <-
   # To do that, take our dataset, HeymanWide, and then pipe it into
   ____ |>
  pivot_longer(
    # You have the choice:
    # You can either choose to list the columns you do not want to pivot (ResponseId).
    # To do that, -c("ResponseId"),
    # You could also list the columns you DO want to pivot (there were 8).
    # To do that, c("Column1", "Column2", "Column3", "etc"),
    cols = 
    # Let's call the new factor variable we'll create "Condition",
    names_to =
    # And let's call the new response variable we'll be creating "PHelp"
    values_to =
  )