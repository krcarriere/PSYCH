plot1 <- concealed |>
  ggplot(aes(x=condition, y=moral)) +
  geom_violin(
    aes(fill=condition))+
  scale_fill_manual(values = c("#798E87","#C27D38","#CCC591"))+
  geom_boxplot(
    alpha = 0.3,
    width = .1,
    colour = "BLACK")+
  ylab("Perceived Morality")+
  theme_minimal()+
  theme(
    legend.position="none"
  )

plot(plot1)
rm(plot1)