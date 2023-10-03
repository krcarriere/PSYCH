# Figure 1

Fig1 <- 
  data |>
  mutate(orientation = factor(orientation, levels = c("Westbound", "Eastbound")),
         station = factor(station, levels = c("Spadina", "St. George", "Bloor-Yonge", "Sherbourne"))
  ) |>
  dplyr::group_by(station, orientation) |>
  dplyr::summarise(
    mean = mean(subjective_distance, na.rm=TRUE),
    sd = sd(subjective_distance, na.rm=TRUE),
    n = sum(!is.na(subjective_distance)),
    se = sd/sqrt(n)
  ) |> 
  ggplot(aes(x=station, y=mean, group = orientation))+
  geom_line(aes(color=orientation),
            linewidth = 1.5)+
  geom_errorbar(aes(ymin=mean - se*1.96,
                    ymax=mean + se*1.96),
                width = 0.05, 
                linewidth = 0.2)+
  geom_point(aes(fill = orientation),
             color= "black",
             shape = 21,
             size = 2,
             stroke=.5)+
  scale_fill_manual(values = c("white", "white"))+
  scale_color_manual(values = c("grey", "black"))+
  ylab("Subjective Distance")+
  xlab("<--West of bay---Bay---East of bay-->")+
  theme(
    axis.line.x = element_blank(),
    axis.ticks.x = element_blank(),
    panel.background = element_blank(), 
    panel.grid = element_blank(),
    axis.text.x = element_text(face = "bold", angle = 45, hjust=1),
    axis.line.y = element_line(color="black", linewidth=0.1),
    legend.direction = "vertical",
    legend.justification = "left",
    legend.position = "top",
    legend.title = element_blank(),
    plot.caption = element_text(hjust=.5),
  )+
  expand_limits(y=c(0,5))+
  scale_y_continuous(breaks=seq(0,5,0.5))+
  labs(caption = "Fig. 1. Results from Study 1: subjective-distance rating as a function of the subway station being evaluated\n and the participant's crientation. All participants were physically located at the Bay Street station,\n at the midpoint between the St. George and Bloor-Yonce stations. Error bars indicate +1 SE")

plot(Fig1)
rm(Fig1)