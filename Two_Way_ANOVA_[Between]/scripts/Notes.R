# Notes for the Factorial ANOVA Module

############################
# Types of Sum of Squares  #
############################
# Hector, A., von Felten, S., & Schmid, B. (2010). Analysis of variance with unbalanced data: An update for ecology & evolution. Journal of Animal Ecology, 79(2), 308–316. https://doi.org/10.1111/j.1365-2656.2009.01634.x
# Shaw, R. G., & Mitchell-Olds, T. (1993). Anova for Unbalanced Data: An Overview. Ecology, 74(6), 1638–1645. https://doi.org/10.2307/1939922

# First, let us prove that there is equality when data is balanced.
iris$Grouping <- rep(c("A", "B"), 75, replace=TRUE)
###################
# Balanced Design #
###################
library(dplyr)
iris |> select(Grouping, Species) |> table()

library(rstatix)
iris |>
  anova_test(Petal.Length ~ Grouping*Species, type=1)

iris |>
  anova_test(Petal.Length ~ Grouping*Species, type=2)

iris |>
  anova_test(Petal.Length ~ Grouping*Species, type=3)

# All three have the same F statistics.
## Now let us unbalance the design.
#####################
# Unbalanced Design #
#####################
iris_unbalanced <- iris |> dplyr::slice_head(n=125)
iris_unbalanced |> select(Grouping, Species) |> table()
# Virginica has 25 less observations.
iris_unbalanced |>
  anova_test(Petal.Length ~ Grouping*Species, type=1)
# Grouping F = 1.596; Species F= 943.303, Moderation F = .328
iris_unbalanced |>
  anova_test(Petal.Length ~ Grouping*Species, type=2)
# Grouping F = .643; Species F= 943.303, Moderation F = .328
iris_unbalanced |>
  anova_test(Petal.Length ~ Grouping*Species, type=3)
# Grouping F = .852; Species F= 942.403, Moderation F = .328

#############################
# Unbalanced Design: Type 1 #
#############################

# Type 1 Sum of Squares in unbalanced designs cares about order.
# It will calculate SS [1st] on a blank model, then SS [2nd] on a model with the [1st].

iris_unbalanced |>
  anova_test(Petal.Length ~ Grouping*Species, type=1)
# Grouping F = 1.596; Species F= 943.303, Moderation F = .328
iris_unbalanced |>
  anova_test(Petal.Length ~ Species*Grouping, type=1)
# Grouping F = 0.643; Species F= 943.779, Moderation F = .328

##################
# Other Packages #
# To run ANOVAs  #
##################
# For consistency, we try to keep our analysis within the same package.
# However, there are other packages that handle typing of ANOVAs as well, mainly
# car with Anova(). 
model <- iris_unbalanced |> lm(Petal.Length ~ Species*Grouping, data=_)
car::Anova(model, type="II")

# Base R has two ANOVA functions, aov() and anova().
# For the most part, we use aov(), and reserve anova() for the comparison between models.
# There are other deeper R reasons to use aov(), but that is beyond the scope of the class.
# aov() can take a formula
iris_unbalanced |> aov(Petal.Length ~ Species*Grouping, data=_)
# or it can take a linear model
model |> aov()
# But either way, we want to pipe summary() at the end to get our p values.
iris_unbalanced |> aov(Petal.Length ~ Species*Grouping, data=_) |> summary()
model |> aov() |> summary()
# However, both aov() and anova() are not great at thinking about type of sums of squares.


###############
#  Planned    #
# Comparisons #
###############
# Ruxton, G. D., & Beauchamp, G. (2008). Time for some a priori thinking about post hoc testing. Behavioral Ecology, 19(3), 690–693. https://doi.org/10.1093/beheco/arn020
# Step 1: Print the marginal means out so you know what you're looking at.
library(emmeans)
iris |>
  lm(Sepal.Width ~ Species + Petal.Width, data=_) |>
  emmeans(~Species) 

# Step 2: Create a list of contrasts.
# The benefit of planned comparisons is shown below.
# You can compare [1] against [many others], something that is beyond
# the power of basic Tukey post-hoc tests.

# We find this paper (see cite below) extremely approachable in discussing planned comparisons,
# which outlines the notion of orthogonal comparisons (such as below).


ContrastList = list(setosa_v_all = c(-2,1,1),
                    versi_v_virgin = c(0,1,-1))

# Step 3:
iris |>
  lm(Sepal.Width ~ Species + Petal.Width, data=_) |>
  emmeans(~Species) |>
  contrast(ContrastList, adjust="sidak")

########
# Post #
# Hocs #
########

# There are many ways to get post-hoc tests. We use emmeans() and pairs() from 
# the emmeans package to generate them throughout this course. We find that being
# consistent in our method can help reduce the amount of coding that is needed to be
# memorized. This method works both with lm() and an aov() object.

iris |>
  lm(Sepal.Width ~ Species + Petal.Width, data=_) |>
  emmeans(~Species) |>
  pairs(adjust="tukey")

########### 
#   Sig   #
# Letters #
###########

# This is a great way to plot estimated marginal means from a variety of models.
# The output is a dataset with means, standard errors, and confidence intervals,
# providing you with many options for what you would like to plot.

iris |>
  lm(Sepal.Width ~ Species + Petal.Width, data=_) |>
  emmeans(~Species) |>
  multcomp::cld(Letters=letters)

# For a brief example, see something like:
iris |>
  lm(Sepal.Width ~ Species + Petal.Width, data=_) |>
  emmeans(~Species) |>
  multcomp::cld(Letters=letters) |>
  # This next line of code removes the space so the letters line up.
  mutate(.group=gsub(" ", "", .group)) |>
  # Then we just plot! For example, using geom_point() and geom_errorbar(). 
  ggplot(aes(x= Species, y=emmean, label=.group)) +
  geom_point(shape=15, size=4) +
  geom_errorbar(aes(ymin=lower.CL,  
                    ymax=upper.CL),
                width=0.2, size=0.7) +
  theme_bw() +
  theme(axis.title=element_text(face="bold"),
        axis.text=element_text(face="bold"),
        plot.caption=element_text(hjust=0)) +
  ylab("Sepal Widths") +
  geom_text(nudge_x=0, nudge_y=.35, color="black")

# The plot code changes a bit if it was two factors. 
# Since this is the Two-Way ANOVA, we also provide that information.

mtcars |>
  mutate(
    am = recode_factor(am, "0"="Automatic", "1"="Manual"),
    vs = recode_factor(vs, "0"="V-Shaped", "1"="Straight")
  ) |>
  lm(mpg ~ am*vs, data=_) |>
  emmeans(~am*vs) |>
  multcomp::cld(Letters=letters) |>
  # This next line of code removes the space so the letters line up.
  mutate(.group=gsub(" ", "", .group)) |>
  # We add group=the other factor
  ggplot(aes(x=am, y=emmean, group=vs, label=.group))+
  # we add position=position_dodge(.9)
  geom_bar(stat="identity", position=position_dodge(.9), colour="black", aes(fill=vs))+
  scale_fill_manual(values=c("grey40", "grey"))+
  labs(y="Miles Per Gallon", x="Transmission Type", fill="")+
  theme(plot.title = element_text(hjust = 0.5)) + 
  # we add position=position_dodge(.9)
  geom_errorbar(aes(
    ymin=emmean-SE,
    ymax=emmean+SE),
    width=.3, 
    position=position_dodge(.9))+
  # We change how we call geom_text by telling against position=position_dodge(.9)
  geom_text(aes(y=emmean+3), 
            position=position_dodge(width=.9))


##############################
# Summarise via dplyr review #
##############################
library(dplyr)

# We had a brief example of grouping to get means and standard deviations.

mtcars |>
  # This just has to be done, sorry! Ignore.
  mutate(
    am = recode_factor(am, "0"="Automatic", "1"="Manual"),
    vs = recode_factor(vs, "0"="V-Shaped", "1"="Straight")
  ) |>
  group_by(am, vs) |>
  summarise(
    mean = mean(mpg, na.rm=TRUE),
    sd = sd(mpg, na.rm=TRUE),
    N = sum(!is.na(mpg)),
    se = sd/sqrt(N)
  )


# don't delete me!
saved <- "Y"

rm(iris, iris_unbalanced)