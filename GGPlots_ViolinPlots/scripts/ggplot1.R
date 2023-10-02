# This is where we left off.

# Remember, after each argument passed through geom_violin(), you need to add a comma.
# So, if the first was fill="black" be sure to write fill="black", 
# The last one, since it is the last of the list, does not need a comma.

plot <- 
  Violin |>
  ggplot(aes(x=condition, y=value))+
  geom_violin(
    # We want the inside of the shape (fill) to be "black"
    # the outline of the shape (color) to be "white", 
    # the transparency of the shape (alpha) to be .15,
    # a line to be drawn at the 0.5 quantile (draw_quantiles),
  ) + 
  facet_wrap(~muscle)


#   