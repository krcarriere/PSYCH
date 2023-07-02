HeymanWide2 <-
  HeymanLong |>
  pivot_wider(
    id_cols = "ResponseId",
    names_from = "Condition",
    values_from = "PHelp"
  )