chistogram <- violence |>
  ggplot(aes(x=C))+
  geom_histogram(binwidth=.2)+
  xlab("C possible values")+
  ylab("Frequency of observation")+
  geom_vline(xintercept=median(violence$C))

plot(chistogram)
