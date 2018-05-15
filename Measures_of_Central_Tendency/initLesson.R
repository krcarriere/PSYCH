#Measures of Central Tendency

baseball <- read.csv("https://kevin-carriere-jyyd.squarespace.com/s/baseball.csv")
#bimodal <- imager::load.image("https://static1.squarespace.com/static/5a1855c81f318d6ebcce6e54/5af4702e88251b5dfff59172/5af47078575d1f531c846f78/1525971626976/bimodal.png?format=1500w")
colors <- c("Mode", "Median", "Mean")
vlines <- c(2, 69.5, 136.2045)
vdf <- data.frame(vlines, colors)

Age <- rep(c(15:39), 3)
Year <- c(rep("1991", 25), rep("1995", 25), rep("1999", 25))
RandomError <- rnorm(n=75,mean = .005, sd=.002) 
Rate <- rep(c( .019, .03, .035, .05, .076, .083, .081, .076, .076, .081, .084, .09, .1, .105, .11, .105, .098, .09, .078, .065, .06, .047, .04, .032, .02))+RandomError
data <- data.frame(Age, Year, Rate)

bimodal <- ggplot2::ggplot(data=data, aes(x=Age, y=Rate, color=Year, linetype=Year))+
  geom_line(size=1.2) +
  scale_x_continuous(breaks=seq(15,39,1))+
  scale_y_continuous(breaks=seq(0.00,0.14,0.02))+
  theme_bw()+
  labs(title="Figure 3. Bimodality in Type I First-Birth Rates, U.S. Women, 1990s")+
  theme(plot.title = element_text(size=10, hjust=FALSE, face="bold"))+
  theme(legend.position = c(0.3, 0.1))+
  guides(colour = guide_legend(nrow = 1))+
  theme(legend.title=element_blank())+
  scale_color_manual(values=c("black", "grey20", "grey80"))+
  theme(panel.grid.major.x = element_blank(), panel.grid.minor.x = element_blank(), panel.grid.minor.y = element_blank())+
  theme(legend.background = element_rect(color="black", size=.2))
  
rm(Age, Year, RandomError, Rate, data)

negskew <- rbeta(10000,8,2)
posskew <- rbeta(10000,2,8)
noskew  <- rbeta(10000,2,2)
data <- data.frame(negskew, posskew, noskew)

mean_median_mode <- ggplot(baseball, aes(atbats)) + geom_histogram(bins=80) + geom_vline(data=vdf, aes(xintercept=vlines, color=colors))
# Code placed in this file fill be executed every time the
# lesson is started. Any variables created here will show up in
# the user's working directory and thus be accessible to them
# throughout the lesson.

example <- ggplot(data=data, aes(x=noskew)) + 
  geom_freqpoly(aes(color="")) + 
  geom_freqpoly(data=data, aes(x=posskew, color="Quiz 2")) + 
  geom_freqpoly(data=data, aes(x=negskew, color="Quiz 3")) + 
  xlab("") + 
  ylab("")

sample_double <- baseball$doub[1:5]



