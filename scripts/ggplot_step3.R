# Well done. We can see we created lines. The next two layers of the plot we'll
# add is a geom_point() and then a geom_errorbar().

#geom_errorbar() is slightly different. the aes() for geom_errorbar takes 3 arguments.
#The last one is color=directionf, which I've filled in.

#The other two are ymax and ymin. We want to let the errorbars know where they should line up. 
# Both ymin and ymax are created by taking our Mean and either adding or subtracting our standard error.

#We have our mean and our standard errors in new_data. We just need to call them properly. Don't forget capitalization!

graph <- ggplot2::ggplot(data=new_data, aes(x=stationname, y=Mean, group=directionf)) +
  geom_line(stat="identity", size=1.5, aes(color=directionf))+
  ?????????(shape=1, aes(color=directionf))+
  geom_errorbar(aes(????= ???? + ??, ???? = ???? - ??, color=directionf), width=.1)