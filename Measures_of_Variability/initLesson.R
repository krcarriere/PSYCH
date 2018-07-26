#Measures of Variability

#formula <- imager::load.image("https://static1.squarespace.com/static/5a1855c81f318d6ebcce6e54/5af4702e88251b5dfff59172/5af4707e1ae6cf37588f6dac/1525970376649/variance.png?format=1000w")
#formula2 <- imager::load.image("https://static1.squarespace.com/static/5a1855c81f318d6ebcce6e54/5af4702e88251b5dfff59172/5af4707e6d2a7325bf575418/1525970376650/standarddeviation.png?format=1000w")

standdev <- "s^2 = $\\frac{\\sum{}{}(X_i-\\bar{x})^2}{n-1}$ so s= $\\sqrt{\\frac{\\sum{}{}(X_i-\\bar{x})^2}{n-1}}$"
variancepop <- "variance of a population = $\\frac{\\sum{}{}(X_i-\\mu)^2}{N}$"
variancesamp <- "variance of a sample = $\\frac{\\sum{}{}(X_i-\\bar{x})^2}{n-1}$"

plot.equation <- function(equation){
  require(latex2exp)
  plot(TeX(equation), cex=2)
}

data <- data.frame(UCBAdmissions)
calculate_me <- c(512, 89, 120, 53, 24)

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

rm(men, highsd, highsd_men, highsd_women, lowsd_men, lowsd_women, scores)

swirl_options(swirl_logging = TRUE)