library(readxl)
library(dplyr)
library(tidyr)
library(ggplot2)

notas <- read_excel("/home/xut/Documents/udaviz/R/studio/notas/data/NOTAS.xlsx", sheet = 3) 

ggplot(notas, 
       aes(Apellidos, Nota, color = Estado)) + 
  geom_point(alpha = .7) + 
  geom_smooth(method = "lm", se = FALSE) + 
  scale_y_continuous(breaks = seq(6, 18, 2)) + 
  facet_wrap(~Paralelo) +
  labs(title = "Notas Finales", subtitle = "Bioquímica")