# We left off here:
pwh_anova <- HeymanLong |>
  anova_test(dv=PWH,
             wid=ResponseId,
             # Add a pipe after this call
             within=c(PayLevel, PayForm)) |>
  # pass the function get_anova_table() and include inside of that
  # the argument correction="GG"
  # Then save and submit() in the console!
  get_anova_table(correction="GG")


