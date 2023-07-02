welchdf <- "$df= \\frac{(\\frac{s^2_1}{n_1} + \\frac{s^2_2}{n_2})^2}{\\frac{(\\frac{s_1^2}{n_1})^2}{n_1-1} + \\frac{(\\frac{s_2^2}{n_2})^2}{n_2-1}}$"

plot.equation <- function(equation){
  require(latex2exp)
  plot(TeX(equation), cex=1.5)
}

plot.equation(welchdf)