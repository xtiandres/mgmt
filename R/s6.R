library(readxl)
library(dplyr)
library(tidyr)
library(ggplot2)
library(scales)

notas <- read_excel("/home/xut/Documents/udaviz/R/studio/notas/data/NOTAS.xlsx", sheet = 3)

plotdata <- notas %>% 
  group_by(Paralelo, Estado) %>% 
  summarize(n = n()) %>% 
  mutate(pct = n/sum(n), lbl = scales::percent(pct))

ggplot(plotdata, 
       aes(Paralelo, pct, fill = Estado)) + 
  geom_bar(stat = "identity", position = "fill") + 
  scale_y_continuous(breaks = seq(0, 1, .2), label = percent) + 
  geom_text(aes(label = lbl), size = 3, position = position_stack(vjust = 0.5)) + 
  scale_fill_brewer(palette = "Set2") + 
  labs(y = "Porcentaje", fill ="Situacion", x = "Curso", title = "Porcentajes Bioqui") + 
  theme_minimal()