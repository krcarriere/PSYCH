# Mann Whitney U-Test

# We'll just use the iris dataset.

###############
# Data set up #
###############

iris <- iris |> 
  dplyr::mutate(
    virgiversi = case_when(
      Species=="virginica" ~ 0,
      Species=="versicolor" ~ 1
    )
  )

###############
# group_by(). #
#     and     #
# summarise() #
###############

# We use these dplyr functions to get summarised data.

iris |>
  group_by(virgiversi) |>
  summarise(
    mean = mean(Petal.Width)
  )

######################
#  psych::kurtosi()  #
#       and.         #
#moments::kurtosis() #
######################
# Again, we're not going to cover the mathematical differences here.
# We do think the authors should have clarified they were reporting
# Mardia's test for skew and kurtosis.

  iris  |>
  group_by(virgiversi) |>
  summarise(
    kurtPSY = psych::kurtosi(Petal.Width),
    kurtMEM = moments::kurtosis(Petal.Width),
    skewDAT = skew(Petal.Width) 
  )

##################
# shapiro_test() #
##################
# library(rstatix)

iris |>
  dplyr::group_by(virgiversi) |>
  rstatix::shapiro_test(Petal.Width)

# If p<.05,  it's a flag that maybe you should consider Mann-Whitney! There's more to test of course than just this.

# The things to remember about Shapiro Wilk is that it has low power when N is small.
# (It will struggle to detect a true effect if the effect does exist).

# But it becomes hyper sensitive (Inflated Type I Error Rate) when N is large.

##############
#  geom_qq() #
# in ggplot2 #
##############
# library(ggplot2)
iris |>
  ggplot(aes(sample = Petal.Width)) +
  geom_qq() +  # This plots the observed 
  geom_qq_line() # 

# The line represents where the observations should fall if they were distributed on 
# a normal distribution. Basically, it plots the quantiles of the actual data against
# what the data of a theoretical normally distributed quantile.

##########
# hist() #
##########

iris |>
  pull(Petal.Width) |>
  hist()

#################
# wilcox.test() #
#################
library(stats)
iris |>
  wilcox.test(Petal.Width ~ virgiversi, data=_)


#######################
# Getting the Z Score #
#######################

# Many times, papers report the Z statistic instead of the V or W that R outputs.
# It is straightforward to calculate the Z - it is simply just part of the p value.

# Given a Mann Whitney Test, save it.
testoutput <- iris |>
  wilcox.test(Petal.Width ~ virgiversi, data=_)


# Pass the p.value variable of the new object
testoutput$p.value

# Into qnorm and divide by two.
qnorm(testoutput$p.value/2)

# You could do this without saving anything. 
iris |>
  wilcox.test(Petal.Width ~ virgiversi, data=_) |> 
  _$p.value %>%
  `/`(2) |>
  qnorm() |>
  round(2)



# Don't delete me!
saved <- "Y"
