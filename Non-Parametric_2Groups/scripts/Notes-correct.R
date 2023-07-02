# Non-Parametric Notes 
library(datarium) #for data

# Checking the assumption for symmetry
# We recommended in the lesson a basic visual check of the histogram of the differences.
selfesteem |> 
  mutate(
    td23 = t2-t3
  ) |>
  ggplot(aes(x=td23))+
  geom_histogram()+
  geom_vline(aes(xintercept=median(td23)))

# Others use cut-offs on kurtosis and/or skew. 
library(moments)
selfesteem |> 
  mutate(
    td23 = t2-t3) |>
  summarise(
    kurt_td23 = kurtosis(td23),
    skew_td23 = skewness(td23)
  )

# wilcox.test()
# If paired=FALSE, it is a Mann Whitney U-Test/Wilcoxon rank sum test.
# If paired=TRUE, Wilcoxon Sign Rank Test.
wilcox.test(selfesteem$t2, selfesteem$t3, paired=TRUE)

# wilcox_test()
library(rstatix)
library(dplyr)
# wilcox_test() is the rstatix function for the non-parametrics.
# However, it requires that the data is in the long format.
# To understand this code, we recommend checking the Pivoting Data Module.

# We use dplyr:: to tell R explicitly that we want select() from the dplyr package.
selfesteem |>
  dplyr::select(-t1) |>
  pivot_longer(cols = c(t2,t3),
               names_to = "Time",
               values_to = "SelfEsteemScore") |>
  wilcox_test(SelfEsteemScore ~ Time, paired=TRUE)

library(dplyr)
# filter()
# We can use dplyr to filter our data to things that evaluate as TRUE.
iris |>
  filter(Species!="setosa") |>
  select(Species) |>
  table()

# Compare this to that:
iris |>
  #filter(Species!="setosa") |>
  select(Species) |>
  table()


#######################
# Getting the Z Score #
#######################

# Many times, papers report the Z statistic instead of the V or W that R outputs.
# It is straightforward to calculate the Z - it is simply just part of the p value.

# Given a Wilcox.Test, save it.
testoutput <- wilcox.test(selfesteem$t2, selfesteem$t3, paired=TRUE)

# Pass the p.value variable of the new object
testoutput$p.value

# Into qnorm and divide by two.
qnorm(testoutput$p.value/2)

saved <- "Y"