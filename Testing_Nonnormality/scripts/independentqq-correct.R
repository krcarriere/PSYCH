# Our format should be relatively familiar.

# Take our data (Sharks) and then
# ggplot where aes() sample is our Response Variable
# (here, PositiveRatings), 

# and then the additional change is to add 
# facet_wrap() with one argument, ~Condition 

# The ~ is important - don't forget that!

indqq <- 
  Sharks |>
  ggplot(aes(sample=PositiveRatings))+
  geom_qq() + 
  geom_qq_line() +
  facet_wrap(~Condition)
