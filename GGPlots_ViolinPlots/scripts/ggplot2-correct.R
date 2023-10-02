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
    fun = mean, # We want the function (fun) to be set to mean
    geom = "point", # We want this shape (geom) to equal "point"
    size = 3 # We want the size (size) to be set to 3,
    
  ) +
  stat_summary(
    fun = mean,
    geom = "line", # The only differences here should be geom should equal "line"
    linewidth = 1, # And instead of size=3, have it say linewidth=1
    # We also need to add one more argument, where we set the aes() of group to be equal to muscle.
    aes(group=muscle)
    
  ) 