library(ggplot2)
library(UsingR)

scatterplot <- ggplot2::ggplot(data=data, aes(x=fheight, y=sheight)) + 
  geom_point(aes(colour = "Son's Height")) +
  ylab("Son's Height") + 
  xlab("Father's Height") + 
  scale_color_manual(name='', values=c("black")) +
  guides(color=guide_legend(override.aes=list(shape=c(1),linetype=c(1))))+
  theme(legend.position="bottom")
scatterplot

scatterplot

scatterplot_line <- ggplot2::ggplot(data=data, aes(x=fheight, y=sheight)) + 
  geom_point(aes(colour = "Son's Height")) +
  geom_smooth(aes(colour="Fitted Values"),method="lm", se=FALSE) +
  ylab("Son's Height") + 
  xlab("Father's Height") +
  scale_color_manual(name='', values=c("red", "black")) +
  guides(color=guide_legend(override.aes=list(shape=c(NA, 16),linetype=c(1,0)))) +
  theme(legend.position="bottom")
scatterplot_line


differential_graph <- ggplot(data_diff, aes(x=beach_goer, y=mean, group=lactose_intolerance))+
  geom_bar(stat="identity", position="dodge", colour="black", aes(fill=lactose_intolerance))+
  scale_fill_manual(values=c("grey40", "grey"))+
  labs(y="How Many Shark Attacks Reported", x="Do You Go to the Beach Frequently", fill="")+
  theme(legend.position = c(0.65, 0.8))+
  theme(plot.title = element_text(hjust = 0.5)) + 
  geom_errorbar(aes(ymin=mean-seminus, ymax=mean+seplus),
                width=.3,                    # Width of the error bars
                position=position_dodge(.9))
differential_graph