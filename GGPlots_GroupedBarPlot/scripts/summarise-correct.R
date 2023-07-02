p_sum <- 
  Paradox |>
  group_by(Target, Perspective) |>
  summarise(
    mean = mean(Wisdom, na.rm=TRUE),
    sd = sd(Wisdom, na.rm=TRUE),
    n = sum(!is.na(Wisdom)),
    se = sd/sqrt(n)
  )