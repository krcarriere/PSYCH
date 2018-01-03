lesson_dir <- file.path(path.package("swirl"), "Courses",
                        "Psychology_Statistics", "Validity_&_Reliability")

t <- seq(0,2*pi,length=1000) 
coords <- t(rbind( 10+sin(t)*2, 10+cos(t)*2)) 
coords2 <- t(rbind( 10+sin(t)*.5, 10+cos(t)*.5))
coords3 <- t(rbind( 10+sin(t)*1, 10+cos(t)*1)) 
coords4 <- t(rbind( 10+sin(t)*1.5, 10+cos(t)*1.5)) 

highrelilowvalidityx <- c(9, 9.08, 8.9, 8.7, 9.1, 8.8, 8.8, 9.0, 9.05, 8.85)
highrelilowvalidityy <- c(11, 10.8, 10.7, 11.1, 11.2, 10.9, 10.7, 11.1, 10.95, 10.89)
highrelilowvalidity <- (cbind(rep(highrelilowvalidityx, 100), rep(highrelilowvalidityy, 100)))

lowrelilowvalidityx <- c(11.5, 8.3, 10.2, 9.8, 10.3, 10.8, 8.5, 9.3, 11.2, 8.1)
lowrelilowvalidityy <- c(11, 9.08, 11.8, 9.5, 8.2, 11, 10.2, 11.1, 9.2, 8.8)
lowrelilowvalidity <- (cbind(rep(lowrelilowvalidityx, 100), rep(lowrelilowvalidityy, 100)))

highrelihighvalidityx <- c(9.6, 10, 10.2, 9.8, 10.1, 9.9, 10.05, 9.95, 9.85, 10.05)
highrelihighvalidityy <- c(10.05, 9.85, 9.95, 10.05, 9.9, 10.1, 9.8, 10.2, 10, 9.6)
highrelihighvalidity <- (cbind(rep(highrelihighvalidityx, 100), rep(highrelihighvalidityy, 100)))


data <- data.frame(t, coords, coords2, coords3, coords4, highrelilowvalidity,lowrelilowvalidity, highrelihighvalidity )

graph1 <- ggplot(data=data, aes(x=X1, y=X2))+
  geom_point(color="#da3f3d")+
  geom_point(aes(x=X1.1, y=X2.1), color="#da3f3d")+
  geom_point(aes(x=X1.2, y=X2.2), color="#da3f3d")+
  geom_point(aes(x=X1.3, y=X2.3), color="#da3f3d")+
  theme_bw()+
  xlab("")+
  ylab("")+
  geom_point(aes(x=X1.4, y=X2.4)) #high rel low validity

graph2 <- ggplot(data=data, aes(x=X1, y=X2))+
  geom_point(color="#da3f3d")+
  geom_point(aes(x=X1.1, y=X2.1), color="#da3f3d")+
  geom_point(aes(x=X1.2, y=X2.2), color="#da3f3d")+
  geom_point(aes(x=X1.3, y=X2.3), color="#da3f3d")+
  theme_bw()+
  xlab("")+
  ylab("")+
  geom_point(aes(x=X1.5, y=X2.5)) #low rel low validity

graph3 <- ggplot(data=data, aes(x=X1, y=X2))+
  geom_point(color="#da3f3d")+
  geom_point(aes(x=X1.1, y=X2.1), color="#da3f3d")+
  geom_point(aes(x=X1.2, y=X2.2), color="#da3f3d")+
  geom_point(aes(x=X1.3, y=X2.3), color="#da3f3d")+
  theme_bw()+
  xlab("")+
  ylab("")+
  geom_point(aes(x=X1.6, y=X2.6)) #high rel high validity

rm(coords, coords2, coords3, coords4, 
   highrelihighvalidity, highrelihighvalidityx, highrelihighvalidityy,
   lowrelilowvalidity, lowrelilowvalidityx, lowrelilowvalidityy,
   highrelilowvalidity, highrelilowvalidityx, highrelilowvalidityy,
   t)

studentid <- c(1,2,3,4,5)
rater1 <- c(7,6,3,2,1)
rater2 <- c(7,6,3,2,3)
data <- data.frame(studentid, rater1, rater2)

rm(studentid, rater1,rater2)

# Code placed in this file fill be executed every time the
      # lesson is started. Any variables created here will show up in
      # the user's working directory and thus be accessible to them
      # throughout the lesson.