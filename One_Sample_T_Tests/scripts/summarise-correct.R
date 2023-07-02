sum_violence <- 
  violence |> 
  summarise(
    Mean = mean(C, na.rm=TRUE),
    SD = sd(C, na.rm=TRUE),
    N = sum(!is.na(C)),
    SE = SD/sqrt(N)
    ) |>
  round(2)
