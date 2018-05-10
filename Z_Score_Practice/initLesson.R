#Z Score Practice
ztable <- imager::load.image("https://static1.squarespace.com/static/5a1855c81f318d6ebcce6e54/5af4702e88251b5dfff59172/5af470bc88251b5dfff5b76a/1525969085645/ztable_example1.png?format=750w")

ztable_q2p1 <- imager::load.image("https://static1.squarespace.com/static/5a1855c81f318d6ebcce6e54/5af4702e88251b5dfff59172/5af470ba6d2a7325bf5762d6/1525969083676/z2p1.jpg?format=750w")

ztable_q2p2 <- imager::load.image("https://static1.squarespace.com/static/5a1855c81f318d6ebcce6e54/5af4702e88251b5dfff59172/5af470ba575d1f531c848006/1525969084482/z2p2.png?format=750w")

ztable_q3 <- imager::load.image("https://static1.squarespace.com/static/5a1855c81f318d6ebcce6e54/5af4702e88251b5dfff59172/5af470bb575d1f531c848008/1525969086325/zq3.jpg?format=1500w")

ztable_q4 <- imager::load.image("https://static1.squarespace.com/static/5a1855c81f318d6ebcce6e54/5af4702e88251b5dfff59172/5af470bb0e2e72187f9c1b1d/1525969092523/zq4.png?format=500w")

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
