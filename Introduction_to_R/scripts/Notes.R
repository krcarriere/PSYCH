# Intro to R Notes

## Assignment
#R is happy to do things for you without saving its work. 
# For example, we could ask R to calculate the mean of 2, 4, and 100 by:
mean(c(2,4,100))

# But nothing was saved. Instead, if we want to keep that number moving 
# forward, we need to be sure we're assigning it something.
 #We will always use a left pointing arrow to denote the idea of assigning. 
mean_of_three <- mean(c(2,4,100))

# Nothing will happen in the console, but instead, this value is now in our Environment. 
# We can always see that value by just typing into R:
mean_of_three

## Values vs. variables
# There are two main things we can assign. If we were to write:
value <- c("Dr. C", "Dr. K")
# This would store a value into our Environment under Values. 
# This is different than creating a variable.

data <- iris
data$var <- rep(c("Dr. C", "Dr. K"), 75)
# This creates a variable called var.
# To understand this, we first state that we want things stored within the 
# dataframe we call data, and then, we use the dollar sign to signify that this 
# will be a new variable in the data.

## Brackets
# We can understand things in terms of lists (like above, where value was a list of two names) 
# and data frames. Data frames are actually just lists organized in columns.
# Brackets are one of the many ways in which we can subset data.
# If we use a comma in the middle of a bracket, we can specify specific rows
# (left side) or columns (right side). If there is no comma, r treats it as if 
# you're simply asking for the nth element in the list of lists, which would 
# be the nth column. You can also call columns by passing through their character
# name of the column -- an important lesson that will be useful later.
head(data[,1]) #Column
head(data[1]) #Also column
data[1,] #Rows
head(data["Sepal.Length"]) #another way to call the column.
# Brackets have more uses, especially when it comes to digging inside of statistical output
# and other functions. There's a lot of 'secret' things deep within functions 
# that []'s can tell us about that we can then use pluck to grab. 

# Getting Help
# We can always type ? followed by a function name (like, ?c ) into the Console
# to learn more about it. The best place to look is the Arguments part, 
# and then immediately scroll to the examples section.

# Basic Functions ()
# Functions are things that have some letters on one side (many times, a word, 
# or a shortened word), and an open and closed parantheses on the other ().
# We call this thing() a function. Functions take *arguments*, or things we put
# inside of the parantheses. Different functions take different amounts of arguments,
# but if there are multiple arguments to pass through the function, we would want
# to always separate it with a comma.

## c()
# Above, we used c() to create a list of two things. This is our first function!
# Lists are many times called *vectors* in coding. If we want to list multiple 
# things, we probably want to assume we are using c() unless otherwise noted.

## ' - ' 
# - is one way in R we say not. Typically, - will be used in terms of saying NOT 
# this variable or NOT this list of things. 

## is.na()
# is.na() returns a vector (list) of TRUE or FALSE. NA is R's term for missingness.
# That is, is.na() will return a TRUE if something is missing and a FALSE if it
# is not-missing. We generally will use is.na() with the NOT, that is, to say 
# !is.na(), to give us a list of TRUE if something is present, and only FALSE if
# something is not present. 

## names()
# names() will tell us the names of all columns in a dataset. 

## head()
# head() will give us the first six rows of all columns in a dataset.

## tail()
# tail() will give us the last six rows of all columns in a dataset. 

## table()
# table() will give us the cross-tabulation of one to two variables in a dataset and give the counts.
table(data$Species)
table(data$Species, data$var)

# In what we are learning below, we can also call tables through piping.
data |> 
  dplyr::select(Species, var) |> 
  table()

## ls()
# ls() lists everything in your environment.

## rm()
# rm() removes things from your environment. You can use rm(list=ls()) to remove
# everything from your environment.
rm(mean_of_three)


## Logical Operators
# We can use < , >, == , >= , <=  for most things. If we want to use equal to,
# R understands this as equivalent to, which requires the use of a double equal 
# sign. A single equal sign will not work -- a single equal sign acts like our 
# <- assignment operator. We can also use these at any point on variables in 
# our data.

2+2==4
data$Sepal.Length > 6
table(data$Sepal.Length > 6)

## !
# An exclamation mark is used to say NOT. More specifically, it is primarily 
# used to say NOT when we are considering statements of TRUE or FALSE. It will 
# flip things for us. An important thing to think about for ! is the use of 
# paranthesis. That is, we have to be clear about what we're NOT'ing.

2+2==4
!(2+2==4)
2+3==4
!(2+3==4)
table(!(data$Sepal.Length > 6))
#Notice how compared to above, this ! had
#that we wrap data$Sepal.Length > 6 in ().


### factor()
# see also: relevel; reorder factors
# Factoring just tells R that this is a categorical variable. 
# We generally use this to reorder the factors. For example, Species is kept in
# alphabetical order.
levels(iris$Species)
# Yet, using factor(), we can change that order.
library(dplyr)
iris <- iris |>
  mutate(
    Species = factor(Species, 
                     levels = c("versicolor",
                                "virginica",
                                "setosa")))
levels(iris$Species)

# Basic Math Functions
## mean()
# Gets the global mean of some variable or object.

mean(iris$Sepal.Length)

iris |>
  pull(Sepal.Length) |>
  mean()

## sd()
# Gets the standard deviation of some variable or object.
sd(iris$Sepal.Length)

iris |> 
  pull(Sepal.Length) |>
  sd()

## se
# Calculates the standard error of some variable or object. 
# The se is the standard deviation divided by the square root of n. 
# There is no function for standard error, so instead, we have to write the math
# ourselves. The way this is written covers for the possibility of missingness 
# of the variable of interest. 
sd(iris$Sepal.Length)/
  sqrt(
    sum(
      !is.na(iris$Sepal.Length)
      )
    )


############################
# Citations for the Course #
#      - Data Based -      # 
############################
# Chen, E. Y., Chee, M. X., & Feldman, G. (2023). Revisiting the Differential Centrality of Experiential and Material Purchases to the Self: Replication and Extension of Carter and Gilovich (2012). Collabra: Psychology, 9(1), 57785. https://doi.org/10.1525/collabra.57785
# Connors, S., Khamitov, M., Moroz, S., Campbell, L., & Henderson, C. (2016). Time, money, and happiness: Does putting a price on time affect our ability to smell the roses? Journal of Experimental Social Psychology, 67, 60–64. https://doi.org/10.1016/j.jesp.2015.08.005
# Grossmann, I., & Kross, E. (2014). Exploring Solomon’s Paradox: Self-Distancing Eliminates the Self-Other Asymmetry in Wise Reasoning About Close Relationships in Younger and Older Adults. Psychological Science, 25(8), 1571–1580. https://doi.org/10.1177/0956797614535400
# Harvie, D. S., Broecker, M., Smith, R. T., Meulders, A., Madden, V. J., & Moseley, G. L. (2015). Bogus Visual Feedback Alters Onset of Movement-Evoked Pain in People With Neck Pain. Psychological Science, 26(4), 385–392. https://doi.org/10.1177/0956797614563339
# Hennefield, L., & Markson, L. (2017). Four-year-old Children Align their Preferences with those of their Peers. Collabra: Psychology, 3(1), 14. https://doi.org/10.1525/collabra.89
# Heyman, T., Vankrunkelsven, H., Voorspoels, W., White, A., Storms, G., & Verheyen, S. (2020). When Cheating is an Honest Mistake: A Critical Evaluation of the Matrix Task as a Measure of Dishonesty. Collabra: Psychology, 6(1), 12. https://doi.org/10.1525/collabra.294
# Imada, H., Chan, W. F., Ng, Y. K., Man, L. H., Wong, M. S., Cheng, B. L., & Feldman, G. (2022). Rewarding More Is Better for Soliciting Help, Yet More So for Cash Than for Goods: Revisiting and Reframing the Tale of Two Markets With Replications and Extensions of Heyman and Ariely (2004). Collabra: Psychology, 8(1), 32572. https://doi.org/10.1525/collabra.32572
# Le Forestier, J. M., Page-Gould, E., & Chasteen, A. L. (2022). Concealment stigma: The social costs of concealing. Journal of Experimental Social Psychology, 101, 104340. https://doi.org/10.1016/j.jesp.2022.104340
# Maglio, S. J., & Polman, E. (2014). Spatial Orientation Shrinks and Expands Psychological Distance. Psychological Science, 25(7), 1345–1352. https://doi.org/10.1177/0956797614530571
# Mazar, A., & Wood, W. (2022). Illusory Feelings, Elusive Habits: People Overlook Habits in Explanations of Behavior. Psychological Science, 33(4), 563–578. https://doi.org/10.1177/09567976211045345
# Nalborczyk, L. (2022). Re-analysing the Data From Moffatt et al. (2020): What Can We Learn From an Under-powered Absence of Difference? Collabra: Psychology, 8(1), 33059. https://doi.org/10.1525/collabra.33059
# Nosal, A. P., Keenan, E. A., Hastings, P. A., & Gneezy, A. (2016). The Effect of Background Music in Shark Documentaries on Viewers’ Perceptions of Sharks. PLOS ONE, 11(8), e0159279. https://doi.org/10.1371/journal.pone.0159279
# Wylie, J., & Gantman, A. (2023). Doesn’t everybody jaywalk? On codified rules that are seldom followed and selectively punished. Cognition, 231, 105323. https://doi.org/10.1016/j.cognition.2022.105323
############################
# Citations for the Course #
#    - Non-Data Based -    # 
############################
# Abdi, H. (2010). The greenhouse-geisser correction. In N. Salkind (Ed.), Encyclopedia of research design (pp. 1–10). Sage.
# Bakeman, R. (2005). Recommended effect size statistics for repeated measures designs. Behavior Research Methods, 37(3), 379–384. https://doi.org/10.3758/BF03192707
# Bakker, M., & Wicherts, J. M. (2014). Outlier removal, sum scores, and the inflation of the type I error rate in independent samples t tests: The power of alternatives and recommendations. Psychological Methods, 19(3), 409–427. https://doi.org/10.1037/met0000014
# Bonett, D. G. (2015). Interval Estimation of Standardized Mean Differences in Paired-Samples Designs. Journal of Educational and Behavioral Statistics, 40(4), 366–376. https://doi.org/10.3102/1076998615583904
# Campbell, M. J. (2006). Teaching non-parametric statistics to students in health sciences. ICOTS 7. IASE, ISI Salvador, Bahia, Brazil.
# de Winter, J. C. F. (2013). Using the Student’s t-test with extremely small sample sizes. Practical Assessment, Research, and Evaluation, 18(10). https://doi.org/10.7275/E4R6-DJ05
# Delacre, M., Lakens, D., & Leys, C. (2017). Why Psychologists Should by Default Use Welch’s t-test Instead of Student’s t-test. International Review of Social Psychology, 30(1), 92–101. https://doi.org/10.5334/irsp.82
# Hart, A. (2001). Mann-Whitney test is not just a test of medians: Differences in spread can be important. British Medical Journal, 323(7309), 391–393. https://doi.org/10.1136/bmj.323.7309.391
# Haverkamp, N., & Beauducel, A. (2017). Violation of the Sphericity Assumption and Its Effect on Type-I Error Rates in Repeated Measures ANOVA and Multi-Level Linear Models (MLM). Frontiers in Psychology, 8, 1841. https://doi.org/10.3389/fpsyg.2017.01841
# Healy, K. (2018). Data visualization: A practical introduction. Princeton University Press.
# Hector, A., von Felten, S., & Schmid, B. (2010). Analysis of variance with unbalanced data: An update for ecology & evolution. Journal of Animal Ecology, 79(2), 308–316. https://doi.org/10.1111/j.1365-2656.2009.01634.x
# Heiss, A. (2016, April 25). Convert logistic regression standard errors to odds ratios with R. Andrew Heiss. https://www.andrewheiss.com/blog/2016/04/25/convert-logistic-regression-standard-errors-to-odds-ratios-with-r/
# Lakens, D. (2013). Calculating and reporting effect sizes to facilitate cumulative science: A practical primer for t-tests and ANOVAs. Frontiers in Psychology, 4. https://doi.org/10.3389/fpsyg.2013.00863
# Navarro, D. (2019). Learning statistics with R: A tutorial for psychology students and other beginners (E. Kothe, Trans.; Bookdown Edition). Self-Published. https://learningstatisticswithr.com/book/
# Nordstokke, D. W., & Zumbo, B. D. (2007). A Cautionary Tale about Levene’s Tests for Equal Variances. Journal of Educational Research and Policy Studies, 7(1), 1–14.
# Osborne, J. (2019). Notes on the use of data transformations. Practical Assessment, Research, and Evaluation, 8(6). https://doi.org/10.7275/4VNG-5608
# Razali, N. M., & Wah, Y. B. (2011). Power comparisons of Shapiro-Wilk, Kolmogorov-Smirnov, Lilliefors and Anderson-Darling tests. Journal of Statistical Modeling and Analytics, 2(1), 21–33.
# Ruxton, G. D., & Beauchamp, G. (2008). Time for some a priori thinking about post hoc testing. Behavioral Ecology, 19(3), 690–693. https://doi.org/10.1093/beheco/arn020
# Schmider, E., Ziegler, M., Danay, E., Beyer, L., & Bühner, M. (2010). Is It Really Robust?: Reinvestigating the Robustness of ANOVA Against Violations of the Normal Distribution Assumption. Methodology, 6(4), 147–151. https://doi.org/10.1027/1614-2241/a000016
# Shaw, R. G., & Mitchell-Olds, T. (1993). Anova for Unbalanced Data: An Overview. Ecology, 74(6), 1638–1645. https://doi.org/10.2307/1939922
# Silge, J., & Robinson, D. (2017). Text mining with R: A tidy approach (First edition). O’Reilly.
# Wickham, H., Averick, M., Bryan, J., Chang, W., McGowan, L., François, R., Grolemund, G., Hayes, A., Henry, L., Hester, J., Kuhn, M., Pedersen, T., Miller, E., Bache, S., Müller, K., Ooms, J., Robinson, D., Seidel, D., Spinu, V., … Yutani, H. (2019). Welcome to the Tidyverse. Journal of Open Source Software, 4(43), 1686. https://doi.org/10.21105/joss.01686
# Wickham, H., Çetinkaya-Rundel, M., & Grolemund, G. (2023). R for Data Science (2e ed.). https://r4ds.hadley.nz/

# don't delete me!
saved <- "Y"