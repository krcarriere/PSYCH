vidmeans <-
  Sharks |> 
  filter(AudioVideo=="Video") |>
  group_by(Condition) |>
  summarise(
    mean = mean(NegativeRatings, na.rm=TRUE)  
  )