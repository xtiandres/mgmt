library(readxl)
library(dplyr)
library(tidyr)
library(ggplot2)

notas <- read_excel("/home/xut/Documents/udaviz/R/studio/notas/data/NOTAS.xlsx", sheet = 3)

plotdata1 <- notas %>% 
  count(Estado) %>% 
  arrange(desc(Estado)) %>% 
  mutate(prop = round(n*100/sum(n),1),lab.ypos = cumsum(prop) - 0.5*prop)

plotdata1$label <- paste0(plotdata1$Estado, "\n", round(plotdata1$prop), "%")

ggplot(plotdata1, 
       aes("", prop, fill = Estado)) + 
  geom_bar(width = 1, stat = "identity", color = "black") + 
  geom_text(aes(y = lab.ypos, label = label), color = "black") + 
  coord_polar("y", start = 0, direction = -1) + 
  theme_void() + 
  theme(legend.position = "FALSE") + 
  labs(title = "Estado Estudiantes")