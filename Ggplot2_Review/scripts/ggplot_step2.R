# Great! You should have created an empty plot now.

#So, the next step we added a + sign to the end. That signifies a new line of code will be coming.
#We then want to create what ggplot calls "geoms". There are many types of geoms
#geom_point, geom_smooth, geom_line, geom_bar. We want to create lines. Which would you pick?

#The other ??? is color=. While you might think "blue!", what it's really asking is
#how do we want to divide our colors. We want to divide by the variable we grouped on.
#So, color=directionf.

graph <- ggplot2::ggplot(data=new_data, aes(x=stationname, y=Mean, group=directionf)) +
  geom_????(stat="identity", size=1.5, aes(color=?????))
