#Two Way ANOVA Between
set.seed(131)
data <- read.csv("https://kevin-carriere-jyyd.squarespace.com/s/Maglio-and-Polman-2014-Experiment-1.csv")

data$stationname[data$station==4] <- "Sherbourne"
data$stationname[data$station==3] <- "Bloor-Yorne"
data$stationname[data$station==2] <- "St.George"
data$stationname[data$station==1] <- "Spadina"
data$stationname <- factor(data$stationname, levels = c("Spadina", "St.George", "Bloor-Yorne", "Sherbourne"))
data$directionf[data$direction=="WEST"] <- "Traveling West"
data$directionf[data$direction=="EAST"] <- "Traveling East"

#studygraph <- imager::load.image("https://static1.squarespace.com/static/5a1855c81f318d6ebcce6e54/5af4702e88251b5dfff59172/5af47071aa4a99656c862ed2/1525969019998/studygraph.png?format=1000w")
