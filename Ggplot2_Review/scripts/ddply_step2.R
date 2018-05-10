#Great! What you've done is create a new dataset, with 8 observations (remember, there were 8 conditions),
#and created a new variable called N in this dataset, that counted up the number of observations in each group.

#I've added a few more things we want to create. Notice what has changed:

#(1) After N=sum(!is.na(subjective_distance)) I added a comma. Every comma means we're going to create new variables.

#When we're done making new variables, we don't have a comma anymore.

#(2) We want to create three other variables. Mean, SD (for standard deviation), and SE.

#(3): Some important functions you might want to know, are mean(), sd(), and sqrt().

#(4) We know SE is equal to Standard Deviation divided by the square root of N..

# Edit what I've given below. You need to add in the dependent variables, 
#the function names, and figure out how to calculate standard error.
#Hint: Why did we calculate N in the first step? How might that be used in the SE?
#Don't forget capitalization rules!

new_data <- plyr::ddply(data, 
                        c("directionf", "stationname"), 
                        summarise, 
                        N = sum(!is.na(subjective_distance)),
                        Mean = functionname(dependentvariable, na.rm=TRUE),
                        SD = functionname(dependentvariable, na.rm=TRUE),
                        SE = typeinyourequationhere
                        )
