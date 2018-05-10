#Great! You've done such a good job, I've filled in the rest for you. 

#Things to notice, the next line we changed the colors. 
#Then, we added labels - for the Y axis, and the X axis.
#We then changed how the y axis were divided.
#We then changed how the x axis was displayed.
#We then used this ggplot function called theme_bw() to change the looks.
#And the rest is not necessary to understand. 

graph <- ggplot2::ggplot(data=new_data, aes(x=stationname, y=Mean, group=directionf)) +
  geom_line(stat="identity", size=1.5, aes(color=directionf))+
  geom_point(shape=1, aes(color=directionf))+
  geom_errorbar(aes(ymax= Mean + SE, ymin = Mean - SE, color=directionf), width=.1)+
  scale_color_manual(values=c("darkgrey", "black")) +
  labs(y = "Spatial Distance", x="<-----West of Bay ------ Bay ----- East of Bay ----->") +
  scale_y_continuous(breaks=seq(0,4.5,.5), expand=c(0,0), limits = c(0,4.5))+
  scale_x_discrete(expand = c(0,0))+
  theme_bw()+
  theme(panel.border = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.line = element_blank(),
        legend.position="top", legend.title = element_blank())+
  theme(axis.text.x=element_text(angle=30, vjust=2))

