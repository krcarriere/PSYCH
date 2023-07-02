pooledvariance <- "$s^2_p = \\frac{((n_1-1)\\cdot s^2_1) + ((n_2-2)\\cdot s^2_2)}{n_1+n_2-2}$"
plot.equation <- function(equation){
  require(latex2exp)
  plot(TeX(equation), cex=1.5)
}
plot.equation(pooledvariance)