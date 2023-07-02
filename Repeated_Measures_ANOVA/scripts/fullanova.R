# We left off here:
pwh_anova <- 
  HeymanLong |>
  anova_test(dv=PWH,
             wid=ResponseId,
             # Before this last ) and then the pipe, add a comma and hit enter.
             # We want to pass one final argument into our anova_test().
             # That argument is for effect.size="pes" for partial eta squared.
             within=c(PayLevel, PayForm)) |>
  get_anova_table(correction="GG")


