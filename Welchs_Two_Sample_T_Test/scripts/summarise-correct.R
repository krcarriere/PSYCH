sum_moral <- 
  concealed |> 
  group_by(condition) |> 
  summarise(
    Mean = mean(moral, na.rm=TRUE),
    SD = sd(moral, na.rm=TRUE),
    N = sum(!is.na(moral)),
    SE = SD/sqrt(N)
    )
