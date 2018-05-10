#Validity Part 2
library(ggplot2)
# Code placed in this file fill be executed every time the
      # lesson is started. Any variables created here will show up in
      # the user's working directory and thus be accessible to them
      # throughout the lesson.
eyecolors <-  c("darkblue", "darkgreen", "brown")

#Shows three bars of all three colors.

eyecolor <- c("Green Eyes", "Blue Eyes", "Blue Eyes", 
              "Green Eyes", "Brown Eyes", "Brown Eyes", 
              "Green Eyes", "Blue Eyes", "Brown Eyes")
col4 <- c(1,2,2,1,3,3,1,2,3)
data <- data.frame(eyecolor, col4)
plot1 <- ggplot(data=data, aes(col4, fill=eyecolor)) +
  geom_bar(position="fill", fill=c("darkblue", "khaki4", "darkgreen"))+
  xlab("Groups")+
  ylab("Proportion of Eye Colors in each Group")+
  theme(legend.position="bottom")+
  guides(fill=guide_legend(nrow=1,byrow=TRUE))+
  scale_fill_manual(values=c("darkblue", "khaki4", "darkgreen"))+
  scale_x_discrete(breaks=c(1,2,3))+
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


#Two groups, mixed blue and green.
eyecolor <- c("Green Eyes", "Blue Eyes", "Blue Eyes", 
              "Green Eyes", 
              "Green Eyes", "Blue Eyes")
col1 <- c("Receives Drug","Doesn't Receive Drug","Doesn't Receive Drug",
          "Receives Drug",
         "Doesn't Receive Drug",  "Receives Drug")
data <- data.frame(eyecolor,col1)
eyecolors <-  c("darkblue", "darkgreen", "brown")
plot2 <- ggplot(data=data, aes(col1, fill=eyecolor)) +
  geom_bar(position="fill")+
  xlab("Groups")+
  ylab("Proportion of Eye Colors in each Group")+
  theme(legend.position="bottom")+
  guides(fill=guide_legend(nrow=1,byrow=TRUE))+
  scale_color_manual(values=eyecolors, name="")+
  scale_fill_manual(values=eyecolors, name="")+
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


eyecolor <- c("Green Eyes", "Blue Eyes", "Blue Eyes", 
              "Green Eyes", "Brown Eyes", "Brown Eyes" )
col2 <- c("Receives Drug","Doesn't Receive Drug","Doesn't Receive Drug",
          "Receives Drug","Receives Drug","Doesn't Receive Drug")
data <- data.frame(eyecolor,col2)
plot3 <- ggplot(data=data, aes(col2, fill=eyecolor)) +
  geom_bar(position="fill", na.rm=TRUE)+
  xlab("Groups")+
  ylab("Proportion of Eye Colors in each Group")+
  theme(legend.position="bottom")+
  guides(fill=guide_legend(nrow=1,byrow=TRUE))+
  scale_color_manual()+
  scale_fill_manual(values=c("darkblue", "khaki4", "darkgreen"))+
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

eyecolor <- c("Green Eyes", "Blue Eyes", 
              "Brown Eyes", "Brown Eyes", 
              "Green Eyes", "Blue Eyes")
col3 <- c("Receives Drug","Doesn't Receive Drug",
          "Receives Drug","Doesn't Receive Drug",
          "Doesn't Receive Drug","Receives Drug")
data<- data.frame(eyecolor, col3)
plot4 <- ggplot(data=data, aes(col3, fill=eyecolor)) +
  geom_bar(position="fill")+
  xlab("Groups")+
  ylab("Proportion of Eye Colors in each Group")+
  theme(legend.position="bottom")+
  guides(fill=guide_legend(nrow=1,byrow=TRUE))+
  scale_fill_manual(values=c("darkblue", "khaki4", "darkgreen"))+
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


rm(col1, col2, col3, col4, eyecolor)
