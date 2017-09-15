#### load labraries ####

library(ggplot2)

install.packages("dplyr")
library(dplyr)

mean(df[df$Reactor.phase == "Control", "ph"])
levels(df$Reactor.phase)
####select####
physicochem <- select(df, ph, temp, Conductivity)
head(physicochem)
physicochem <- df %>% select(ph, temp, Conductivity)
physicochem.control <- df %>% 
  filter(Reactor.phase == "Control") %>% 
  select(ph, temp, Conductivity)
physicochem.control


##### Group by ####

meanph <- df %>% group_by(Reactor.phase) %>% 
  summarise(mean.ph = mean(ph),
        mean.d2 = mean(Diversity...D2),
            sd.ph = sd(ph))
mean.ph
meanph

#Challenge

df %>%
  filter(Reactor.cycle == 2) %>%
  summarise(mean_d2 = mean(Diversity...D2),
            mean_log_celldens = mean(log(Cell.density..cells.mL.)))
#new join tables

physicochem <- df %>% 
    select(sample_title, temp, ph, Conductivity)
        diversity <- df %>%
             select(sample_title, contains("Diversity"))
 #join data sets       
        meanph <- df %>%
          filter(Reactor.cycle == 2) %>% 
          group_by(Reactor.phase) %>%
          mutate(condratio=Conductivity/temp) %>% 
          summarise(mean.ph = mean(ph),
                    mean.d2 = mean(Diversity...D2),
                    sd.ph = sd(ph),
                    sd.d2 = sd(Diversity...D2),
                    avelog10.celldens = mean(log10(Cell.density..cells.mL.)),
                    mean.condrat = mean(condratio))
        
  