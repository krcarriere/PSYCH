graph <- ggplot2::ggplot(data=new_data, aes(x=stationname, y=Mean, group=directionf)) +
  geom_line(stat="identity", size=1.5, aes(color=directionf))+
  geom_point(shape=1, aes(color=directionf))+
  geom_errorbar(aes(ymax= Mean + SE, ymin = Mean - SE, color=directionf), width=.1)