sum_intellect <- 
  df |> 
  group_by(Condition) |> 
  summarise(
    Mean = mean(Intellect_Rating, na.rm=TRUE),
    SD = sd(Intellect_Rating, na.rm=TRUE)
    )
