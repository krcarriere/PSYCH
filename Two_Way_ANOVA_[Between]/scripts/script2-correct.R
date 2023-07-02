sumdata <- 
  buyhappy |>
  group_by(Mindset, Comp) |>
  summarise(
    mean = mean(Happiness, na.rm=TRUE),
    sd = sd(Happiness, na.rm=TRUE))