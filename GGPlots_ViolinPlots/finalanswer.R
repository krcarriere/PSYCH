# We made minor changes to the Rmd code that creates their plot.
# First, stat="count" is unneeded for the violin plot in this study.
# Second, show.legend=FALSE in each object is not needed since there is no color. 
# We add the theme(legend.position="none") to the Notes file in its place.
# Third, we move around the ordering for educational purposes.
# We add stat_summary for a geom_point to also provide a tangible way to plot Fig 3.
# aes(group=muscle) is not needed for this either.
# There was a scale_color_brewer() and scale_fill_brewer(), but no aes() was ever called for either.
# Therefore, we move that to the notes.
save <- 
  Violin  |>
  # plots the data
  ggplot(aes(x = condition, y = value) ) +
  facet_wrap(~muscle)+
  # violin plots
  geom_violin(
    fill = "black",
    alpha = 0.15,
    colour = "white",
    draw_quantiles = 0.5
  ) +
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
    geom = "errorbar", size = 1, width = 0
  ) +
  facet_wrap(~muscle, ncol = 3)+
  geom_jitter(width=.10, alpha=0.3) + 
  
  # geom_quasirandom(alpha = 0.3) +
  labs(x = "Condition", 
       y = "Natural logarithm of peak amplitude") +
  theme_bw(base_size = 12)
plot(save)