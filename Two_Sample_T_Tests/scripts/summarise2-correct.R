sum_hire <- 
  df |> 
  group_by(Condition) |> 
  summarise(
    Mean = mean(Hire_Rating, na.rm=TRUE),
    SD = sd(Hire_Rating, na.rm=TRUE),
    N = sum(!is.na(Hire_Rating))
    )
