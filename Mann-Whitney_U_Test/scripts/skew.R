# Here's the prior correct answer. Follow the comments to add skew in.


sumdata.kurtosis  <-
  memory  |>
  group_by( condition ) |>
  summarise(
    kurtPSY = psych::kurtosi(age_recall),
    kurtMEM = moments::kurtosis(age_recall) #Add a comma here, since we're adding a new variable.
    _______ = ____(_dependentvariable) # Name the new value skewDAT, being equal to skew() of our DV. 
  )
    
  