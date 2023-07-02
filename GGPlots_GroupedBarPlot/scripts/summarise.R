p_sum <- 
  # Fill in the dataset name.
  ____ |> 
  # use group_by() to group by our two factors, Target and Perspective.
  group_by(____, ____) |>
  summarise(
    # Get the mean of our response variable.
    mean = mean(____, na.rm=TRUE),
    # What is the function to get the standard deviation of something? Fill in.
    sd = ____(Wisdom, na.rm=TRUE),
    n = sum(!is.na(Wisdom)),
    # Remember that standard error is calculated as standard deviation / sqrt(n).
    # We have created new variables called sd and n that represent
    # standard deviation and n.
    se = ____/sqrt(____)
  )