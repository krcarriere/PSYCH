#Two Way ANOVA Between

#lesson_dir <- file.path(path.package("swirl"), "Courses",
#                        "Psychology_Statistics", "Two_Way_ANOVA_[Between]")

.get_course_path <- function(){
  tryCatch(swirl:::swirl_courses_dir(),
           error = function(c) {file.path(find.package("swirl"),"Courses")}
  )
}

# Put initialization code in this file.
path_to_course <- file.path(.get_course_path(),
                            "Psychology_Statistics","Two_Way_ANOVA_[Between]")
try(dev.off(),silent=TRUE)
plot.new()

pathtofile <- function(fileName){
  mypath <- file.path(.get_course_path(),
                      "Psychology_Statistics","Two_Way_ANOVA_[Between]",
                      fileName)
}

datapath1 <- pathtofile("Maglio and Polman 2014 Experiment 1.csv")
image1 <- pathtofile("studygraph.png")
set.seed(131)
data <- read.csv(datapath1)

data$stationname[data$station==4] <- "Sherbourne"
data$stationname[data$station==3] <- "Bloor-Yorne"
data$stationname[data$station==2] <- "St.George"
data$stationname[data$station==1] <- "Spadina"
data$stationname <- factor(data$stationname, levels = c("Spadina", "St.George", "Bloor-Yorne", "Sherbourne"))
data$directionf[data$direction=="WEST"] <- "Traveling West"
data$directionf[data$direction=="EAST"] <- "Traveling East"

studygraph <- imager::load.image(image1)
