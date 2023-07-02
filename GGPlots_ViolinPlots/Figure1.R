fig1 <- iris |>
  ggplot(aes(x=Species, y=Petal.Length))+
  geom_violin(
    aes(fill=Species))+
  scale_fill_manual(values = c("#798E87","#C27D38","#CCC591"))+
  geom_boxplot(
    alpha = 0.3,
    width = .1,
    colour = "BLACK")+
  ylab("Petal Length of Flowers")+
  theme_minimal()+
  theme(
    legend.position="none"
  )

plot(fig1)
rm(fig1)