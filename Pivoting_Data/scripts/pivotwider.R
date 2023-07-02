# Using pivot_wider(), 
# Let's re-assign the dataset as HeymanWide2
____ <-
   # To do that, take our dataset, HeymanLong, and then pipe it into
   ____ |>
  pivot_wider(
    # id_cols wants to know what columns represent the individual.
    # This would also include any control variables and non-pivoted variables.
    id_cols = 
    # It also wants to know how to create the column names. 
    # Where should it draw the column names from?
    names_from =
    # It wants to know where to draw the values from. 
    # What column should it look at to get the values?
    values_from =
  )