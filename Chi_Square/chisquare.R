
chisquare <- "$\\chi^2 = \\sum_{row=1}^{r}\\sum_{column=1}^{c}\\frac{(O_{row,column}-E_{row,column})^2}{E_{row,column}}$"
plot.equation <- function(equation){
  require(latex2exp)
  plot(TeX(equation), cex=1.5)
}

plot.equation(chisquare)