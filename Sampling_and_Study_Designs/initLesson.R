lesson_dir <- file.path(path.package("swirl"), "Courses",
                        "Psychology_Statistics", "Sampling_and_Study_Designs")

negskew <- rbeta(10000,8,2)
posskew <- rbeta(5000,1,1)
noskew  <- rbeta(10000,2,2)

x = seq(-1, 1, by = 0.01)
y = 1 - abs(x)
p1 = qplot(x, geom = 'blank') + 
  geom_point(aes(y = y), colour = 'blue') + 
  geom_point(aes(y = -y), colour = 'red')


noskew <- rnorm(2000, mean=2, sd=2)
lowend <- rnorm(2000, mean=1, sd=1)
data <- data.frame(lowend, noskew)

example <- ggplot(data=data, aes(x=noskew)) + 
  geom_histogram(aes(y=0.5*..density..), fill = "blue", alpha = 0.2) +
  geom_histogram(aes(x=lowend, y=0.5*..density..), fill = "red", alpha = 0.2)+
  xlab("") + 
  ylab("")
example
