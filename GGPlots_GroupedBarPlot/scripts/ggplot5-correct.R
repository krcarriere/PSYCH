# I took the liberty of adding in the rest of the themes.
# Just look to see if you can notice any differences.
# There's nothign to add here, just type submit() !
plot <- 
  p_sum |>
  ggplot(aes(x=Target, y=mean, fill=Perspective)) +
  geom_col(color="black",
           width=0.5,
           size=.2,
           position=position_dodge(.5)) +
  scale_fill_manual(values=c("darkgrey", "white"))+
  geom_errorbar(aes(ymin=mean-se,
                    ymax=mean+se),
                width=.1,
                linewidth=.2,
                position=position_dodge(.5))+
  scale_y_continuous(breaks=seq(-.80, .60, 0.2),
                   labels =  number_format(accuracy = 0.01))+
  expand_limits( y=c(-.8, .60))+
  theme(
    legend.justification ="left",
    legend.position = "top",
    legend.title = element_blank(),
    legend.text = element_text(face="bold"),
    legend.key.size= unit(.25, "cm"),
    panel.grid = element_blank(),
    panel.background = element_blank(),
    axis.line.y = element_line(linewidth = .2, colour = "black"),
    axis.text.x = element_text(face="bold"),
    plot.caption = element_text(hjust = 0))+
  ylab("Wise Reasoning")+
  xlab("")+
  geom_hline(yintercept=0, size=.3)+
  geom_segment(y=0, yend=-.02, x=1.5, xend=1.5, size=.2)