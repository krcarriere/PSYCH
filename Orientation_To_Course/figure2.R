circleFun <- function(center = c(0,0),diameter = 1, npoints = 100){
  r = diameter / 2
  tt <- seq(0,2*pi,length.out = npoints)
  xx <- center[1] + r * cos(tt)
  yy <- center[2] + r * sin(tt)
  return(data.frame(x = xx, y = yy))
}
dat <- circleFun(c(1,-1),2.3,npoints = 100)
triangle1 <- data.frame(x = c(3, 3, 4),
                      y= c(        
                        -.25, -1.5, -1.5))
triangle2 <- data.frame(x = c(3.05, 4.05, 4.05),
                        y= c(        
                          -.25, -.25, -1.5))
square3 <- data.frame( x= c(0.5, 0.5,
                            4.0, 4.0),
                       y= c(-.25, -5.0,
                            -5.0, -.25))
#geom_path will do open circles, geom_polygon will do filled circles
fig2 <- ggplot(dat,aes(x,y)) +
  
  geom_polygon(data=square3, aes(x=x,y=y),
               fill="#F5F5F4", color="grey")+
  geom_polygon(fill="#5775A3")+
  annotate(geom="text", x=1, y=-1, label="R",
           size=20, color="white")+
  geom_polygon(data=triangle1, aes(x=x,y=y),
               fill="white", color="grey")+
  geom_polygon(data=triangle2, aes(x=x,y=y),
               fill="white", color="white")+
  theme_void()

plot(fig2)
rm(square3, dat, circleFun, fig2, triangle1, triangle2)