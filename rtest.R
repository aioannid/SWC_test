df <- read.csv("Metadata.csv")
library(ggplot2)

#start plotting 
ggplot(data = df, aes( x = Timepoint,  y = ph, fill = Reactor.cycle )) +
geom_point(shape = 21, size = 4 )

df$Reactor.cycle <- factor(df$Reactor.cycle)

#Store ggplot object

p1 <- ggplot(data = df, aes( x = Timepoint,  y = ph, fill = Reactor.phase )) +
  geom_point(shape = 21, size = 4, alpha = .5 )
p2 <- p1 + theme_bw() + geom_line()

#let's facet
p3 <- p2 + facet_grid(~Reactor.cycle)
p3
df$Reactor.phase
levels(df$Reactor.phase)
p4 <- p2 + facet_grid(Reactor.phase~Reactor.cycle)
p4
p4 + geom_line(aes(color = Reactor.phase))
##########################
###Right conductivity####