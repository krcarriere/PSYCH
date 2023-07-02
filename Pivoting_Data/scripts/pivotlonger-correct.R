HeymanLong <-
  HeymanWide |>
  pivot_longer(
    cols = -"ResponseId",
    names_to = "Condition",
    values_to = "PHelp"
  )