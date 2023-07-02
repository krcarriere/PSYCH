# This is where we left off.

plot <-
  Violin |>
  ggplot(aes(x=condition, y=value))+
  geom_violin(
    fill = "black",
    colour = "white",
    alpha = 0.15,
    draw_quantiles = 0.5,
    position = position_dodge(0.8)
  ) + 
  facet_wrap(~muscle)+
  stat_summary(
    # We want the function (fun) to be set to mean
    # We want to represent this mean (geom) to a "point" with 
    # We want the size (size) to be set to 3,
    # Lastly, we want the position to be equal to position_dodge(0.8)
  ) +
  stat_summary(
    # Repeat what you did above a second time below. (Truly, copy and paste!). 
    # The only difference here should be geom should equal "line"
    # And instead of size=3, have it say linewidth=1
    # We also need to add one more argument, where we set the aes() of group to be equal to muscle.
  ) 