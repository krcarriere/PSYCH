# Notes for One Way Between ANOVA

#######################
# Basic R: Using lm() # 
#    and anova()      #
#######################

# Making an linear model via lm()
iris_model <- iris |>
  lm(Petal.Length ~ Species, data=_)

# Get anova output via anova()
iris_model |> anova()

# Get linear model output via summary()
iris_model |> summary()

#################
# Understanding #
# Linear Models #
#################
iris |>
  group_by(Species) |>
  summarise(
    MeanPL = mean(Petal.Length, na.rm=TRUE),
    SDPL = round(sd(Petal.Length, na.rm=TRUE),2),
    nPL = sum(!is.na(Petal.Length)),
    sePL = round(SDPL/sqrt(nPL),2)
  )

# Notice how these means are the same means in the linear model.
# This will change when other covariates are included in the model.
# However, all ANOVAs are simply regressions.

# Judd, C. M., McClelland, G. H., & Ryan, C. S. (2017). Data analysis- A model comparison approach to regression, ANOVA, and beyond (3rd Edition). Routledge: New York, NY.

#################
# Using rstatix #
#################
# There are benefits to rstatix in other analyses - a repeated measures ANOVA, for instance.
# It is also helpful because rstatix can also be more straightforward for beginners in R.
# Since it can either take an equation, or it can take it straight as arguments.
library(rstatix)
iris |>
  anova_test(Petal.Length ~ Species)
#or
iris_model |> anova_test()
# or
iris |>
  anova_test(dv=Petal.Length,
             between=Species)

##################
# Post-Hoc Tests #
#  Get TukeyHSD  #
##################
# The same output (note, less descriptive) can be achieved via aov() and TukeyHSD()
iris_model |> aov() |> TukeyHSD()

##################
# Post-Hoc Tests #
#    Estimated   #
# Marginal Means #
##################
library(emmeans)
## We suggest emmeans() because it is functional across all types of lm and lmer models.
iris_model |> emmeans(~Species) |> pairs()

##################### 
# Planned Contrasts #
#####################

## 1. The sum of the coefficients for a particular contrast must equal zero. 
## 2. Groups of means that are to be averaged together are assigned the same coefficient.
## 3. Means that are not included in the comparison of a particular contrast are assigned a coefficient of 0. 
## 4. If there are A treatment groups, at most there can be (A-1) orthogonal contrasts (although there are many possible sets of orthogonal contrasts)
## 5. All of the pair-wise cross products (of the coefficients) must sum to zero across all contrasts. 

# Step Zero: Check the order of factors for the contrast.
iris_model |> emmeans(~Species)

# Step One: Create your contrast list.
Contrasts = list(setosa_vs_All = c(-2,1,1),
                 versicolor_v_virginica = c(0,-1, 1))

# Step Two: Run contrast(). 
iris_model |> emmeans(~Species) |> contrast(Contrasts)

#########################
# Plotting Your Results #
#########################
# We use cld() from the multcomp package to work with the emmeans package.
# *Important Note* - multcomp will load MASS which also has a select function.
# Because of this, we always load dplyr LAST in our list of libraries. This ensures dplyr
# functions, including select, are used.

# cld() is for compact letter display. It provides information about what pairwise comparisons
# are significantly different from each other through the non-sharing of letters (or numbers).
# we use mutate() because we want to remove the spaces that cld() outputs in the groups.
library(multcomp)
library(emmeans)
library(dplyr)
library(ggplot2)
iris_model |>
  emmeans(~Species) |>
  cld(adjust="sidak", Letters = letters) |>
  mutate(
    .group=gsub(" ", "", .group)
  ) |> 
  # This code is set for 1 factor plotting.
  # For two factor, Check x= and group=, fill=.
  ggplot(aes(x=Species, y=emmean, group=Species, label=.group))+
  geom_col(position="dodge", colour="black", aes(fill=factor(Species)))+
  scale_fill_manual(values=c("grey40", "grey", "grey100"))+
  labs(y="Petal Length", x="Species of Flower", fill="")+
  theme(plot.title = element_text(hjust = 0.5)) + 
  geom_errorbar(aes(ymin=emmean-SE, ymax=emmean+SE),
                width=.3,
                position=position_dodge(.9))+
  geom_text(aes(y=emmean+.5), 
            position=position_dodge(width=.9))

# Don't delete me!
saved <- "Y"