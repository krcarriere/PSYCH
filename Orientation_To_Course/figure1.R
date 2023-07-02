circleFun <- function(center = c(0,0),diameter = 1, npoints = 100){
  r = diameter / 2
  tt <- seq(0,2*pi,length.out = npoints)
  xx <- center[1] + r * cos(tt)
  yy <- center[2] + r * sin(tt)
  return(data.frame(x = xx, y = yy))
}
dat <- circleFun(c(1,-1),2.3,npoints = 100)
square1 <- data.frame(x=c(0, 0,
                       2, 2),
                   y=c(-.75, -1.25,
                       -1.25, -.75))
square2 <- data.frame(x = c(  0.75, 0.75,
                              1.25, 1.25),
                      y= c(        
                        0.0, -2.0,
                        -2.0, 0.0))
square3 <- data.frame( x= c(0.5, 0.5,
                            4.0, 4.0),
                       y= c(-.25, -5.0,
                            -5.0, -.25))
#geom_path will do open circles, geom_polygon will do filled circles
fig1 <- ggplot(dat,aes(x,y)) +
  
  geom_polygon(data=square3, aes(x=x,y=y),
               fill="#F5F5F4", color="grey")+
  
  geom_polygon(fill="darkgreen")+
  geom_polygon(data=square2, aes(x=x,y=y),
               fill="white")+
  geom_polygon(data=square1, aes(x=x,y=y),
               fill="white")+
  theme_void()


plot(fig1)
rm(square1, square2, square3, dat, circleFun, fig1)