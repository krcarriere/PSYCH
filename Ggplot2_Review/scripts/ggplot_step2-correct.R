graph <- ggplot2::ggplot(data=new_data, aes(x=stationname, y=Mean, group=directionf))+
  geom_line(stat="identity", size=1.5, aes(color=directionf))
