#Chi Square

swirl_options(swirl_logging = TRUE)


dice <- c(rep(1, 10), rep(2, 10), rep(3, 13), rep(4, 23), rep(5, 23), rep(6, 21))

outcome <- c(rep("Improved", 61), rep("Not-Improved",44 ))
treatment <- c(rep("Not-Treated", 26), rep("Treated", 35), rep("Not-Treated", 29), rep("Treated", 15))
data <- data.frame(outcome, treatment)
data$outcome <- factor(data$outcome,levels(data$outcome)[c(2,1)])

#chisquare <- imager::load.image("https://static1.squarespace.com/static/5a1855c81f318d6ebcce6e54/5af4702e88251b5dfff59172/5af47047575d1f531c8460c5/1525968968763/chisquare.png?format=500w")

chisquare <- "$\\chi^2 = \\sum{i=1}{R}\\sum{j=1}{C}\\frac{(o_i_j-e_i_j)^2}{e_i_j} $"
#chisquare <- "t = $\\frac{\\bar{x}_1-\\bar{x}_2}{\\sqrt{s^2(\\frac{1}{n_1}+\\frac{1}{n_2})}}$"
#variance <- "s^2 = $\\frac{\\sum{i=1}{n_1}(x_i-\\bar{x}_1)^2$ + $\\sum{j=1}{n_2}(x_j-\\bar{x}_2)^2$}{n_1 + n_2 - 2}$"

plot.equation <- function(equation){
  require(latex2exp)
  plot(TeX(equation), cex=2)
}
