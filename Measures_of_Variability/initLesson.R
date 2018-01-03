#Measures of Variability

lesson_dir <- file.path(path.package("swirl"), "Courses",
                        "Psychology_Statistics", "Measures_of_Variability")

image1 <- file.path(lesson_dir, "variance.png")
image2 <- file.path(lesson_dir, "standarddeviation.png")


data <- data.frame(UCBAdmissions)
formula <- imager::load.image(image1)
formula2 <- imager::load.image(image2)
calculate_me <- c(512, 89, 120, 53, 24)
# Code placed in this file fill be executed every time the
      # lesson is started. Any variables created here will show up in
      # the user's working directory and thus be accessible to them
      # throughout the lesson.

set.seed(131)
men <- c(rep("male", 50), rep("female", 50), rep("male", 50), rep("female", 50))
highsd <- c(rep("low SD",100), rep("high SD", 100))
highsd_men <- rnorm(50, mean=4, sd=4)
highsd_women <- rnorm(50, mean=8, sd=3)
lowsd_men <- rnorm(50, mean=4, sd=.5)
lowsd_women <- rnorm(50, mean=8, sd=.3)
scores <- c(lowsd_men, lowsd_women, highsd_men, highsd_women)

data_e <- data.frame(men, highsd, scores)
example <- ggplot2::ggplot(data=data_e, aes(x=men, y=scores, group=highsd)) + 
  geom_point(position = "jitter") + 
  facet_grid(.~ highsd) 
  #geom_hline(yintercept=8, color="red") +
  #geom_hline(yintercept=4, color="blue") + 
  #geom_vline(xintercept=1, color="red") +
  #geom_vline(xintercept=2, color="blue")

rm(men, highsd, highsd_men, highsd_women, lowsd_men, lowsd_women, scores)