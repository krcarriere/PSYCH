#lesson_dir <- file.path(path.package("swirl"), "Courses",
#                        "Psychology_Statistics", "Chi_Square")
.get_course_path <- function(){
  tryCatch(swirl:::swirl_courses_dir(),
           error = function(c) {file.path(find.package("swirl"),"Courses")}
  )
}

# Put initialization code in this file.
path_to_course <- file.path(.get_course_path(),
                            "Psychology_Statistics","Chi_Square")
try(dev.off(),silent=TRUE)
plot.new()

pathtofile <- function(fileName){
  mypath <- file.path(.get_course_path(),
                      "Psychology_Statistics","Chi_Square",
                      fileName)
}

dice <- c(rep(1, 10), rep(2, 10), rep(3, 13), rep(4, 23), rep(5, 23), rep(6, 21))

outcome <- c(rep("Improved", 61), rep("Not-Improved",44 ))
treatment <- c(rep("Not-Treated", 26), rep("Treated", 35), rep("Not-Treated", 29), rep("Treated", 15))
data <- data.frame(outcome, treatment)
data$outcome <- factor(data$outcome,levels(data$outcome)[c(2,1)])

chisquarepath <- pathtofile("chisquare.png")
chisquare <- imager::load.image(chisquarepath)
