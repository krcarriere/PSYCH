fig3 <- pain |> 
  group_by(Feedback) |>
  summarise(
    mean = mean(Rotation, na.rm=TRUE),
    sd = sd(Rotation, na.rm=TRUE),
    n = sum(!is.na(Rotation)),
    cilow = mean - (1.96*(sd/sqrt(n))),# Maybe the CI is just calculated. 
    cihig = mean + (1.96*(sd/sqrt(n)))# This seems to work, regardless of whether this feels correct.
  ) |>
  mutate(
    Feedback = factor(Feedback, levels = c("Understated", "Accurate", "Overstated"))
  ) |> 
  ggplot(aes(x=Feedback, y=mean, group=Feedback))+
  xlab("Condition")+
  ylab("Mean Range of Motion to Pain Onset")+
  geom_point(shape=1, size=2.5)+
  geom_errorbar(aes(
    ymin=cilow,
    ymax=cihig),
    width=.3,                    
    position=position_dodge(.9))+
  theme_cowplot()

plot(fig3)