# Create a new dataset called sumdata. It will be assigned the following:
sumdata <- 
  # Take your data, buyhappy, and then (|>)
  ________ |>
  # group_by Mindset and Comp, and then (|>)
  ________(_______, ____) |>
  # summarise(  the data by passing in 
  _________(
    # mean = to equal mean() of Happiness, ensuring we set na.rm=TRUE,
    ____ = ____(_________, __.__=____),
    # We then did the second one for you. 
    sd = sd(Happiness, na.rm=TRUE)
    )