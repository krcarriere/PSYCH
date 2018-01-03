#One Sample T Tests

lesson_dir <- file.path(path.package("swirl"), "Courses",
                        "Psychology_Statistics", "One_Sample_T_Tests")

image1 <- file.path(lesson_dir, "one-samplet.png")
image2 <- file.path(lesson_dir, "tdistribution_q1.png")


ttest  <- imager::load.image(image1)
ttable <- imager::load.image(image2)
scores <- c(62, 92, 75, 68, 83, 95)