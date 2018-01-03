#Two Way ANOVA Mixed

lesson_dir <- file.path(path.package("swirl"), "Courses",
                        "Psychology_Statistics", "Two_Way_ANOVA_[Mixed]")

datapath1 <- file.path(lesson_dir, "Zhang et al. 2014 Study 3.csv")

swirl_options(swirl_logging = TRUE)
set.seed(131)
data <- read.csv(datapath1)

data$participantid <- seq.int(nrow(data))
data <- data[ , !names(data) %in% c("T1_Predicted_Interest_Composite", 
                                    "T2_Actual_Interest_Composite", "T2_Detailed", 
                                    "T2_Memory", "Amount_Underestimated_Interest", 
                                    "T1_Ord_PredT2_Curious", "T1_Ord_PredT2_Enjoy", 
                                    "T1_Ord_PredT2_Interesting", "T1_Ord_PredT2_Meaningful", 
                                    "T1_Ord_PredT2_Surprise", "T1_Ord_Extra", 
                                    "T1_Extra_PredT2_Curious", "T1_Extra_PredT2_Enjoy", 
                                    "T1_Extra_PredT2_Interesting", "T1_Extra_PredT2_Meaningful", 
                                    "T1_Extra_PredT2_Surprise", "T1_Extra_Extraord", 
                                    "T2_Enjoy", "T2_Meaningful", 
                                    "T2_Surprise", "T2_Interesting", 
                                    "T1_Predicted_Interesting", "Predicted_Enjoy", 
                                    "Predicted_Meaningful", "Predicted_Surprise", 
                                    "Year", 
                                    "filter_.", 
                                    "YOUNG.OLD")]

data <- reshape(data, direction="long", idvar=c("participantid"),
                varying = list(c("T1_Extraordinariness", "T2_Extraordinariness"), 
                               c("T1_Predicted_Curious", "T2_Actual_Curious")), 
                v.names = c("Extraordinariness", "Curiousity"), times = c("time1", "time2"))
data$Condition <- as.factor(data$Condition)
data$Condition <- plyr::revalue(data$Condition, c("1"="Ordinary", "2"="Extraordinary"))
data$time <- as.factor(data$time)
data$time <- plyr::revalue(data$time, c("time1"="First Time", "time2"="Three Months Later"))
data$Gender <- as.factor(data$Gender)
data$Gender <- plyr::revalue(data$Gender, c("1"="Male", "2"="Female"))
data$participantid <- as.factor(data$participantid)
rownames(data) <- c()
data <- data[order(data$time) , ]

data2 <- data[data$time=="Three Months Later",]
data2 <- data2[rep(1:nrow(data2),each=2),]
data2$time <- as.numeric(data2$time)
data2$time <- data2$time + rep(0:1)
data2$time <- as.factor(data2$time)
data2$time <- plyr::revalue(data2$time, c("2"="Three Months Later", "3"="Six Months Later"))
data2<- data2[data2$time=="Six Months Later",]

extended_data <- rbind(data, data2)

rm(data2)

data <- data[order(data$participantid) , ]


new_data <- plyr::ddply(data, 
                        c("time", "Condition"), 
                        summarise, 
                        N = sum(!is.na(Curiousity)),
                        Mean = mean(Curiousity, na.rm=TRUE),
                        SD = sd(Curiousity, na.rm=TRUE),
                        SE = SD/sqrt(N)
                        )
new_data$time <- plyr::revalue(new_data$time, c("First Time"="Time 1 (Predicted)", "Three Months Later"="Time 2 (Actual)"))
new_data$Condition <- plyr::revalue(new_data$Condition, c("Ordinary"="Ordinary Experiences", "Extraordinary"="Extraordinary Experiences"))

graph <- ggplot2::ggplot(data=new_data, aes(x=time, y=Mean, group=Condition)) +
  geom_line(stat="identity", size=1.5, aes(color=Condition, linetype=Condition))+
  annotate("text", x = .9, y = 3.73, label = "3.73", size=5)+
  annotate("text", x = .9, y = 4.24, label = "4.24", size=5)+
  annotate("text", x = 2.15, y = 4.2, label = "4.27", size=5)+
  annotate("text", x = 2.15, y = 4.5, label = "4.39", size=5)+
  geom_point(shape=1, aes(color=Condition))+
  geom_errorbar(aes(ymax= Mean + SE, ymin = Mean - SE, color=Condition), width=.1)+
  scale_color_manual(values=c("black", "black")) +
  labs(y = "Curiousity", x="") +
  scale_y_continuous(breaks=seq(3.0,5.0,.2),expand=c(0,0),limits = c(3.0,5.0))+
  theme_bw()+
  theme( 
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.border = element_blank(),
        axis.line = element_line(),
        axis.line.x = element_line(color = "black"), 
        axis.line.y = element_line(color = "black"),
        legend.title=element_blank(),
        legend.justification=c(0,0),
        legend.position=c(0,.8)
        )
