#Measures of Central Tendency

baseball <- read.csv("https://kevin-carriere-jyyd.squarespace.com/s/baseball.csv")
bimodal <- imager::load.image("https://static1.squarespace.com/static/5a1855c81f318d6ebcce6e54/5af4702e88251b5dfff59172/5af47078575d1f531c846f78/1525971626976/bimodal.png?format=1500w")
colors <- c("Mode", "Median", "Mean")
vlines <- c(2, 69.5, 136.2045)
vdf <- data.frame(vlines, colors)

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



