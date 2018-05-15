# Psychology_Statistics


This course is designed to be a supplementary review for any Psychology Research Methods class for undergraduate students. It is heavy on concept learning, with small lessons on how to code answers and how to manipulate data. Further lessons getting deeper into the tidyverse and ggplot packages will be added. Individuals who want to jump right into the more coding heavy classes should begin at T Tests or take the two ANOVA classes. 

This course currently will teach individuals basic commands in the following libraries: plyr, dplyr, stats, psych, ggplot2. 

This course is recommended to be run in RStudio. Please download R- https://www.r-project.org/ and RStudio - https://www.rstudio.com/ first.

This course requires you also install the swirl package. Once RStudio has loaded, type "install.packages("swirl") into the console. 

Then, once it is installed, type "library(swirl)". To install this course, please run install_course("Psychology_Statistics"). You can also directly install from my github with install_course_github("krcarriere", "Psychology_Statistics").

##For Teachers

If you are a teacher looking to use this course in your classroom, please follow the following instructions.

1) Fork this repo.

2) In each lesson, there is a customTests.R file. Inside each is 2 google form links. You can update these google form links to google forms of your own. You can find a walkthrough of this more with https://github.com/seankross/Google_Forms_Course  install_course_github("seankross", "Google_Forms_Course") to see what the forms are doing.

3) Once you have completed these steps, follow the steps of http://swirlstats.com/swirlify/sharing.html to create a new .swc . (You'll need the swirlify package). Push the form changes + the new .swc to your fork of this repo.

4) Now, have students install_course_github("yourgitname", "Psychology_Statistics"). 

