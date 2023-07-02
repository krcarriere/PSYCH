# This is where we left off.

# Remember, after each argument passed through geom_violin(), you need to add a comma.
# So, if the first was fill="black" be sure to write fill="black", 
# The last one, since it is the last of the list, does not need a comma.

plot <-
  Violin |>
  ggplot(aes(x=condition, y=value))+
  geom_violin(
    fill = "black",
    colour = "white",
    alpha = 0.15,
    draw_quantiles = 0.5
    ) + 
  facet_wrap(~muscle)