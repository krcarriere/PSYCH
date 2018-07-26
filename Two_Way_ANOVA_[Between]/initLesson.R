#Two Way ANOVA Between

swirl_options(swirl_logging = TRUE)

set.seed(131)
#data <- read.csv("https://kevin-carriere-jyyd.squarespace.com/s/Maglio-and-Polman-2014-Experiment-1.csv")
direction <- c("EAST","EAST","EAST","EAST","EAST","EAST","EAST","EAST","EAST","EAST","EAST","EAST","EAST","EAST","EAST","EAST","EAST","EAST","EAST","EAST","EAST","EAST","EAST","EAST","EAST","EAST","WEST","WEST","WEST","WEST","WEST","WEST","WEST","WEST","WEST","WEST","WEST","WEST","WEST","WEST","WEST","WEST","WEST","WEST","WEST","WEST","WEST","WEST","WEST","WEST","WEST","EAST","EAST","EAST","EAST","EAST","EAST","EAST","EAST","EAST","EAST","EAST","EAST","EAST","EAST","EAST","EAST","EAST","EAST","EAST","EAST","EAST","EAST","EAST","EAST","EAST","EAST","WEST","WEST","WEST","WEST","WEST","WEST","WEST","WEST","WEST","WEST","WEST","WEST","WEST","WEST","WEST","WEST","WEST","WEST","WEST","WEST","WEST","WEST","WEST","WEST","WEST","EAST","EAST","EAST","EAST","EAST","EAST","EAST","EAST","EAST","EAST","EAST","EAST","EAST","EAST","EAST","EAST","EAST","EAST","EAST","EAST","EAST","EAST","EAST","WEST","WEST","WEST","WEST","WEST","WEST","WEST","WEST","WEST","WEST","WEST","WEST","WEST","WEST","WEST","WEST","WEST","WEST","WEST","WEST","WEST","WEST","WEST","WEST","WEST","WEST","EAST","EAST","EAST","EAST","EAST","EAST","EAST","EAST","EAST","EAST","EAST","EAST","EAST","EAST","EAST","EAST","EAST","EAST","EAST","EAST","EAST","EAST","EAST","EAST","EAST","EAST","WEST","WEST","WEST","WEST","WEST","WEST","WEST","WEST","WEST","WEST","WEST","WEST","WEST","WEST","WEST","WEST","WEST","WEST","WEST","WEST","WEST","WEST","WEST","WEST","WEST")
orientation <- c(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2)
station <- c(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4)
subjective_distance <- c(5,4,3,3,4,1,4,4,5,3,2,4,5,3,3,4,2,4,4,5,2,3,4,5,5,4,2,4,3,3,2,4,3,3,2,1,2,4,3,2,2,5,2,2,4,3,2,1,2,2,3,3,1,4,1,3,3,2,4,3,3,3,2,4,1,2,3,3,3,2,4,5,3,3,1,3,3,2,3,1,1,2,1,3,1,2,1,3,1,1,1,2,2,1,1,1,3,1,1,2,1,3,1,2,2,3,1,1,2,1,3,2,1,1,2,1,3,1,2,1,1,1,2,2,1,1,1,5,1,5,2,3,1,1,2,4,2,3,3,2,1,2,2,1,4,1,1,2,3,2,2,4,1,1,4,3,3,4,5,2,3,4,2,1,3,3,2,4,3,4,2,1,2,2,3,2,4,2,5,4,5,3,4,4,3,5,6,2,5,5,4,3,4,5,4,2,5,3,4,5,5,3)
data <- data.frame(direction, orientation, station, subjective_distance)
rm(direction, orientation, station, subjective_distance)

data$stationname[data$station==4] <- "Sherbourne"
data$stationname[data$station==3] <- "Bloor-Yorne"
data$stationname[data$station==2] <- "St.George"
data$stationname[data$station==1] <- "Spadina"
data$stationname <- factor(data$stationname, levels = c("Spadina", "St.George", "Bloor-Yorne", "Sherbourne"))
data$directionf[data$direction=="WEST"] <- "Traveling West"
data$directionf[data$direction=="EAST"] <- "Traveling East"

#studygraph <- imager::load.image("https://static1.squarespace.com/static/5a1855c81f318d6ebcce6e54/5af4702e88251b5dfff59172/5af47071aa4a99656c862ed2/1525969019998/studygraph.png?format=1000w")
