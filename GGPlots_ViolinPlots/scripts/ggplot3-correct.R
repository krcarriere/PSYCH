# This is where we left off.
plot <-
  Violin |>
  ggplot(aes(x=condition, y=value))+
  geom_violin(
    fill = "black", 
    colour = "white",
    alpha = 0.15,
    draw_quantiles = 0.5
  ) + 
  facet_wrap(~muscle)+
  stat_summary( 
    fun = mean, 
    geom = "point",
    size = 3
  ) +
  stat_summary(
    fun = mean,
    geom = "line", 
    aes(group=muscle),
    linewidth = 1
  ) +
  stat_summary(
    fun.data = mean_cl_normal, # We need to set the argument fun.data to be equal to mean_cl_normal
    #NOTICE: That is different than above (fun v. fun.data)
    geom = "errorbar",  # We want to set the shape (geom) to be equal to "errorbar".
    size = 1, # We want the width of the confidence interval line (size) to be equal to 1.
    width = 0 # But we want the width of the top of the error bars (width) to be equal to 0.
  ) +
  geom_jitter(# We also want to add a new shape, geom_jitter().
    width=.10, # where we set the width of the points (width) equal to .10,
    alpha=0.3 # and the transparency (alpha) of the points equal to 0.3
    ) 