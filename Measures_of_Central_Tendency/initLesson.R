
# Make path to lesson directory for convenience. Unfortunately 
# this variable will show up in the user's workspace. Alternatively,
# you could retype this file path every time you need it below.
lesson_dir <- file.path(path.package("swirl"), "Courses",
                        "Psychology_Statistics", "Measures_of_Central_Tendency")

### To make the data available, you have two options:

### 1) Make path to data and let user call read.csv(data_path)
data_path <- file.path(lesson_dir, "baseball.csv")
image <- file.path(lesson_dir, "bimodal.png")

### 2) Load data into a variable for the user
air <- read.csv(data_path, stringsAsFactors=FALSE)


baseball <- read.csv(data_path)
bimodal <- imager::load.image(image)
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



