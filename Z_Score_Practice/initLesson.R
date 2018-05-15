#Z Score Practice
#ztable <- imager::load.image("https://static1.squarespace.com/static/5a1855c81f318d6ebcce6e54/5af4702e88251b5dfff59172/5af470bc88251b5dfff5b76a/1525969085645/ztable_example1.png?format=750w")
#ztable_q2p1 <- imager::load.image("https://static1.squarespace.com/static/5a1855c81f318d6ebcce6e54/5af4702e88251b5dfff59172/5af470ba6d2a7325bf5762d6/1525969083676/z2p1.jpg?format=750w")
#ztable_q2p2 <- imager::load.image("https://static1.squarespace.com/static/5a1855c81f318d6ebcce6e54/5af4702e88251b5dfff59172/5af470ba575d1f531c848006/1525969084482/z2p2.png?format=750w")
#ztable_q3 <- imager::load.image("https://static1.squarespace.com/static/5a1855c81f318d6ebcce6e54/5af4702e88251b5dfff59172/5af470bb575d1f531c848008/1525969086325/zq3.jpg?format=1500w")
#ztable_q4 <- imager::load.image("https://static1.squarespace.com/static/5a1855c81f318d6ebcce6e54/5af4702e88251b5dfff59172/5af470bb0e2e72187f9c1b1d/1525969092523/zq4.png?format=500w")

z <- c(0.90, 0.91, 0.92, 0.93, 0.94, 0.95, 0.96, 0.97, 0.98, 0.99, 1.00)
percentmeantoz <- c(31.59, 31.86, 32.12, 32.38, 32.64, 32.89, 33.15, 33.40, 33.65, 33.89, 34.13)
percentintail <- c(18.41, 18.14, 17.88, 17.62, 17.36, 17.11, 16.85, 16.60, 16.35, 16.11, 15.87)
ztable <- data.frame(z, percentmeantoz, percentintail)
rm(z, percentmeantoz, percentintail)

z <- c(0.00, 0.01, 0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.10)
percentmeantoz <- c(0.00, 0.40, 0.80, 1.20, 1.60, 1.99, 2.39, 2.79, 3.19, 3.59, 3.98)
percentintail <- c(50.00, 49.60, 49.20, 48.80, 48.40, 48.01, 47.61, 47.21, 46.81, 46.41, 46.02)
ztable_q2p1 <- data.frame(z, percentmeantoz, percentintail)
rm(z, percentmeantoz, percentintail)

z <- c(0.50, 0.51, 0.52, 0.53, 0.90, 0.91, 0.92, 0.93)
percentmeantoz <- c(19.15, 19.50, 19.85, 20.19, 31.59, 31.86, 32.12, 32.38)
percentintail <- c(30.85, 30.50, 30.15, 29.81, 18.41, 18.14, 17.88, 17.62)
ztable_q2p2 <- data.frame(z, percentmeantoz, percentintail)
rm(z, percentmeantoz, percentintail)

z <- c(1.70, 1.71, 1.72, 1.73, 1.74, 1.75, 1.76, 1.77, 1.78, 1.79, 1.80, 1.81, 1.82, 1.83, 1.84, 1.85, 1.86, 1.87, 1.88, 1.89, 1.90, 1.91, 1.92, 1.93, 1.94, 1.95, 1.96, 1.97, 1.98, 1.99, 2.00, 2.01, 2.02, 2.023, 2.04, 2.05)
percentmeantoz <- c(45.54, 45.64, 45.73, 45.82, 45.91, 45.99, 46.08, 46.16, 46.25, 46.33, 46.41, 46.49, 46.56, 46.64, 46.71, 46.78, 46.86, 46.93, 46.99, 47.06, 47.13, 47.19, 47.26, 47.32, 47.38, 47.44, 47.50, 47.56, 47.61, 47.67, 47.72,47.78, 47.83, 47.88, 47.93, 47.98)
percentintail <- 50-percentmeantoz
ztable_q3 <- data.frame(z, percentmeantoz, percentintail)
rm(z, percentmeantoz, percentintail)

z <- c(0.80, 0.81, 0.82, 0.83, 0.84, 0.85, 0.86)
percentmeantoz <- c(28.81, 29.10, 29.39, 29.67, 29.95, 30.23, 30.51)
percentintail <- c(21.19, 20.90, 20.61, 20.33, 20.05, 19.7, 19.49)
ztable_q4 <- data.frame(z, percentmeantoz, percentintail)
rm(z, percentmeantoz, percentintail)

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
