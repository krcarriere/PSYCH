# This is where we left off.
plot <- 
  p_sum |>
  ggplot(aes(x=Target, y=mean, fill=Perspective)) +
  geom_col(color="black",
           width=0.5,
           linewidth=.2,
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
    legend.position = "top",
    legend.justification ="left")+
  ylab("Wise Reasoning")+
  xlab("")+
  geom_hline(yintercept=0, linewidth=.3)+
  geom_segment(y=0, yend=-.02, x=1.5, xend=1.5, linewidth=.2)