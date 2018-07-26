#Measures of Central Tendency

swirl_options(swirl_logging = TRUE)


#baseball <- read.csv("https://kevin-carriere-jyyd.squarespace.com/s/baseball.csv")
#CREATE DATASET.
name <- c("A Beltre", "C Izturis", "S Green", "E Karros", "P Lo Duca", "M Grudzielanek", "B Jordan", "D Roberts","M Grissom", "A Cora", "D Hansen", "H Bocachica", "C Kreuter", "J Reboulet", "O Perez", "K Ishii","H Nomo", "A Ashby", "O Daal", "K Brown", "D Ross", "G Carrara", "G Anderson", "D Erstad","T Glaus", "D Eckstein", "T Salmon", "B Molina", "A Kennedy", "S Spiezio", "B Fullmer", "O Palmeiro","J Nieves", "B Gil", "J Fabregas", "J DaVanon", "J Ramirez", "A Amezaga", "R Ortiz", "J Washburn","K Appier", "S Schoeneweis", "A Sele", "C Bellinger")
team <-c("LA","LA","LA","LA","LA","LA",
         "LA","LA","LA","LA","LA","LA",
         "LA","LA","LA","LA","LA","LA",
         "LA","LA","LA","LA","ANA","ANA",
         "ANA","ANA","ANA","ANA","ANA","ANA",
         "ANA","ANA","ANA","ANA","ANA","ANA",
         "ANA","ANA","ANA","ANA","ANA","ANA","ANA","ANA")
pos<-c("3B", "SS", "OF","1B","C","2B","OF","OF",
       "OF","SS","1B","OF","C","2B","P","P","P","P","P",
       "P","C","P","OF","OF","3B","SS","OF","C","2B",
       "1B","DH","OF","2B","2B","C","OF","OF","SS",
       "P","P","P","P","P","1B")
games <- c( 88,84,84,81,80,79,76,67,59,53,47,43,26,32,16,15,17,14,23,9,3,37,86,79,82,78,84,74,76,81,71,52,39,26,23,16,20,5,2,2,2,2,1,2)
atbats <- c( 320,313,311,308,301,277,276,225,165,94,71,62,58,41,34,32,29,26,17,16,4,3,350,332,306,303,298,270,248,244,238,120,91,68,59,30,24,10,7,5,2,2,2,1)
runs <- c( 32,32,62,30,41,31,47,38,26,15,8,11,5,2,1,1,2,4,0,2,0,0,54,50,55,57,52,22,34,34,39,21,16,5,7,3,5,2,0,0,0,0,0,0)
hits <- c( 76,72,87,90,98,68,76,68,44,28,20,13,15,9,5,4,2,5,1,5,0,0,102,103,74,82,84,71,74,65,64,37,27,22,13,5,7,5,0,1,0,0,1,0)
doub <- c( 13,20,17,16,23,16,17,9,10,7,5,3,4,2,3,0,2,0,1,1,0,0,29,14,15,14,27,14,19,18,22,6,2,4,1,3,0,2,0,0,0,0,0,0)
trip <- c( 2,1,1,0,1,0,3,2,0,4,0,0,0,0,0,0,0,0,0,0,0,0,2,2,1,3,0,0,5,0,4,1,0,0,0,0,1,0,0,0,0,0,0,0)
hr <- c( 7,1,26,9,5,4,13,2,10,2,1,3,1,0,0,0,0,1,0,1,0,0,15,6,15,4,14,1,2,4,10,0,0,2,0,1,1,0,0,0,0,0,0,0)
rbi <- c(29,24,68,42,38,28,44,20,33,11,13,7,9,2,0,2,2,4,2,2,0,0,63,51,58,41,55,34,24,39,30,10,6,11,4,4,5,2,0,0,0,0,0,0)
totbases <- c(114,97,184,133,138,96,138,87,84,49,28,25,22,11,8,4,4,8,2,9,0,0,180,139,136,114,153,88,109,95,124,45,29,32,14,11,12,7,0,1,0,0,1,0)

baseball <- data.frame(name, team, pos, games, atbats, runs, hits, doub, trip, hr, rbi, totbases)
rm(name, team, pos, games, atbats, runs, hits, doub, trip, hr, rbi, totbases)

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
  geom_freqpoly(aes(color="Quiz 1")) + 
  geom_freqpoly(data=data, aes(x=posskew, color="Quiz 2")) + 
  geom_freqpoly(data=data, aes(x=negskew, color="Quiz 3")) + 
  xlab("") + 
  ylab("")

sample_double <- baseball$doub[1:5]



