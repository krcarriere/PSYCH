#Design

lesson_dir <- file.path(path.package("swirl"), "Courses",
                        "Psychology Statistics", "Design")

data <- father.son
# Code placed in this file fill be executed every time the
      # lesson is started. Any variables created here will show up in
      # the user's working directory and thus be accessible to them
      # throughout the lesson.

diffdata <- presidents

data_diff <- c()

lactose_intolerance <- c("Not Lactose Intolerant", "Not Lactose Intolerant", "Lactose Intolerant", "Lactose Intolerant")
beach_goer <- c("Not Beach Goer", "Beach Goer", "Not Beach Goer", "Beach Goer")
mean <- c(15, 100, 10, 95)
seminus <- c(5,5,5,5)
seplus <- c(5,5,5,5)
data_diff <- data.frame(lactose_intolerance, beach_goer, mean, seminus, seplus)
rm(lactose_intolerance, beach_goer, mean, seminus, seplus)

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
