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
    fun.data = mean_cl_normal, 
    geom = "errorbar",  
    size = 1, 
    width = 0
  ) +
  geom_jitter(
    width=.10,
    alpha=0.3
  ) +
  # We'll pass the argument "Condition" into the x axis label (xlab())
  # We'll pass the argument "Natural logarithm of peak amplitude" into the y axis label (ylab())
  # We'll set the theme by passing the function theme_bw()
  # Inside of that theme_bw(), we'll set the base font size (base_size) to be equal to 12.
  # And you've done it!