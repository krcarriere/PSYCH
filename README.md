# PSYCH


This course - Psychological Statistics You Can Handle (PSYCH) - is meant to be paired with an Undergraduate Research Methods or Statistics course. It is meant to help teach students basic statistics using R in an interactive framework. We take open data and replicate the results (or discuss why sometimes we cannot replicate the results). Future directions of this course include a lesson on sum of squares and additional practice using the tidyverse and ggplot2 packages. Students interact with many packages throughout this course, with the main ones being the tidyverse (dplyr, tidyr, purrr, ggplot2), rstatix, and emmeans. 

This course does not cover Baysian Statistics.

This course was supported through the Society for the Improvement of Psychological Science (SIPS) Grants-In-Aid to Reduce Barriers to Improving Psychological Science.

This course is recommended to be run in RStudio. Please download R- https://www.r-project.org/ and RStudio - https://www.rstudio.com/ first.

This course requires you also install the swirl package. Once RStudio has loaded, type "install.packages("swirl") into the console. 

Then, once it is installed, type "library(swirl)". To install this course, please run install_course("PSYCH"). You can also directly install from my github with install_course_github("krcarriere", "PSYCH").

## For Teachers

If you are a teacher looking to use this course in your classroom, please follow the following instructions.

1) Fork this repo.

2) In each lesson, there is a customTests.R file. Inside each is 2 google form links. You can update these google form links to google forms of your own. You can find a walkthrough of this more with https://github.com/seankross/Google_Forms_Course  install_course_github("seankross", "Google_Forms_Course") to see what the forms are doing.

3) Once you have completed these steps, follow the steps of http://swirlstats.com/swirlify/sharing.html to create a new .swc . (You'll need the swirlify package). Push the form changes + the new .swc to your fork of this repo.

4) Now, have students install_course_github("yourgitname", "PSYCH"). 

