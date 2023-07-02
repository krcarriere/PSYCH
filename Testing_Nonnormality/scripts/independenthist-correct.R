indhist <- 
  Sharks |>
  ggplot(aes(x = PositiveRatings))+
  geom_histogram()+
  facet_wrap(~Condition)