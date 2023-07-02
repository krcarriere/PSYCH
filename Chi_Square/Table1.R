x    <- c(1,   10, 10, 1)
xend <- c(10, 10, 1,   1)
y    <- c(1, 1, 10,   10)
yend <- c(1, 10,   10,   1)
line <- c(1:4)
box <- data.frame(xend, x, yend, y, line)
rm(x, xend, y, yend, line)
save <- iris |> ggplot()+
  geom_segment(data=box, aes(x=x, xend=xend, y=y, yend=yend))+
  theme_minimal()+
  theme(
    panel.grid=element_blank(),
    axis.text=element_blank()
  )+
  xlab("")+
  ylab("")+
  annotate("text", label="condition", x=6.5, y=7)+
  annotate("text", label="check", x=5.5, y=6)+
  annotate("text", label="regular", x=7.5, y=6)+
  
  annotate("text", label="repCor", x=3.5, y=6)+
  
  annotate("text", label="Told Lie", x=3.5, y=5)+
  annotate("text", label="19", x=5.5, y=5)+
  annotate("text", label="46", x=7.5, y=5)+
  
  annotate("text", label="Told Truth", x=3.7, y=4)+
  annotate("text", label="99", x=5.5, y=4)+
  annotate("text", label="69", x=7.5, y=4)+
  annotate("text", label="As a reminder, this was our contigency table.", y=9, x=5.5)

rm(box)

plot(save)