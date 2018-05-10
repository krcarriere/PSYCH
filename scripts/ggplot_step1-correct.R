#The first step is to create our empty plot. 

#GGPlot works by building layers. First, we lay down the bottom layer (the white space).

#Then we continue to add more and more things on top.

#So, let's build our first layer! We have this new dataset, called new_data.

#aes() mean aesthetics. Our X axis will be stationname, and our y (what we're measuring) is Mean now (remember, we changed it!).

#We'll add another thing called group, which we'll say group is directionf. 

#Fill in the below based on that information.

graph <- ggplot2::ggplot(data=new_data, aes(x=stationname, y=Mean, group=directionf))
