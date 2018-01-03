#Great! You've done such a good job, I've filled in the rest for you. 

#Things to notice, the next line we changed the colors. 
#Then, we added labels - for the Y axis, and the X axis.
#We then changed how the y axis were divided.
#We then changed how the x axis was displayed.
#We then used this ggplot function called theme_bw() to change the looks.
#And the rest is not necessary to understand. 

graph <- ggplot2::ggplot(data=sum_data, aes(x=Species, y=Mean)) +
  geom_bar(stat="identity", size=1.5, aes(fill=Species))+
  geom_errorbar(aes(ymax= Mean + SE, ymin = Mean - SE), width=.1)+
  scale_fill_manual(values=colors)+ 
  labs(y="Petal Length") +
  theme_bw()+
  theme(panel.border = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.line = element_blank(),
        legend.position="top", legend.title = element_blank())

