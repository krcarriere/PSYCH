#I've set up some code below using what is called piping from the dplyr package.

#Piping is visually appealing in the sense we can just read things from left to right.

#What this says is we're creating a new variable called variable name. We're starting with some data.

#We then 'pipe' (%>%) and group the data by our independent variable. Here, Species.

#We then take these groups of data, and we want to summarize them.

#We want to summarize them by 4 following things: The amount of observations per group (N).

#The average (or mean) of each group based on our independent variable.

#The standard deviation of our independent variable on each group. 

#And then the standard error, which is equal to standard deviation / square root of N.

VARIABLENAME <- data %>% group_by(INDEPENDENTVARIABLE) %>% summarize(N = sum(!is.na(DEPENDENTVARIABLE)), 
                                                 Mean = mean(DEPENDENTVARIABLE, na.rm=TRUE),
                                                 SD = sd(DEPENDENTVARIABLE, na.rm=TRUE),
                                                 SE = SD/sqrt(N))

#Fill in the following:
#VARIABLENAME should be called sum_data.
#INDEPENDENTVARIABLE should be called Species.
#DEPENDENTVARIABLE should be called Petal.Length.

#When you've fixed the above code, save it and type submit() into the console. 
