lesson_dir <- file.path(path.package("swirl"), "Courses",
                        "Psychology_Statistics", "Z_Score_Practice")

imagepath1 <- file.path(lesson_dir, "ztable_example1.png")
imagepath2 <- file.path(lesson_dir, "z2p1.jpg")
imagepath3 <- file.path(lesson_dir, "z2p2.png")
imagepath4 <- file.path(lesson_dir, "zq3.jpg")
imagepath5 <- file.path(lesson_dir, "zq4.png")

ztable <- imager::load.image(imagepath1)

ztable_q2p1 <- imager::load.image(imagepath2)

ztable_q2p2 <- imager::load.image(imagepath3)

ztable_q3 <- imager::load.image(imagepath4)

ztable_q4 <- imager::load.image(imagepath5)

normal_prob_area_plot <- function(lb, ub, mean = 0, sd = 1, limits = c(mean - 3 * sd, mean + 3 * sd)) {
  x <- seq(limits[1], limits[2], length.out = 100)
  xmin <- max(lb, limits[1])
  xmax <- min(ub, limits[2])
  areax <- seq(xmin, xmax, length.out = 100)
  area <- data.frame(x = areax, ymin = 0, ymax = dnorm(areax, mean = mean, sd = sd))
  (ggplot()
    + geom_line(data.frame(x = x, y = dnorm(x, mean = mean, sd = sd)),
                mapping = aes(x = x, y = y))
    + geom_ribbon(data = area, mapping = aes(x = x, ymin = ymin, ymax = ymax))
    + scale_x_continuous(limits = limits))
}


lb <- -Inf
ub <- 23000
mean = 23230
sd = 2932.50
limits = c(23230 - 3 * 2932.50, 23230 + 3 * 2932.50)
x <- seq(limits[1], limits[2], length.out = 100)
xmin <- max(lb, limits[1])
xmax <- min(ub, limits[2])
areax <- seq(xmin, xmax, length.out = 100)
area <- data.frame(x = areax, ymin = 0, ymax = dnorm(areax, mean = mean, sd = sd))

lb2 <- 25875
ub2 <- Inf
limits2 = c(23230 - 3 * 2932.50, 23230 + 3 * 2932.50)
xmin2 <- max(lb2, limits2[1])
xmax2 <- min(ub2, limits2[2])
areax2 <- seq(xmin2, xmax2, length.out = 100)
area2 <- data.frame(x = areax2, ymin = 0, ymax = dnorm(areax2, mean = mean, sd = sd))

discovery <-ggplot() + 
  geom_ribbon(data = area2, mapping = aes(x = x, ymin = ymin, ymax = ymax)) + 
  geom_vline(xintercept=23230, color="red") + 
  geom_line(data.frame(x = x, y = dnorm(x, mean = mean, sd = sd)),mapping = aes(x = x, y = y)) + 
  geom_ribbon(data = area, mapping = aes(x = x, ymin = ymin, ymax = ymax)) + 
  scale_x_continuous(limits = limits) 
