library(readxl)
library(dplyr)
library(tidyr)
library(ggplot2)

notas <- read_excel("/home/xut/Documents/udaviz/R/studio/notas/data/NOTAS.xlsx", sheet = 3)

plotdata <- notas %>% 
  count(Estado) %>% 
  mutate(pct = n / sum(n), pctlabel = paste0(round(pct*100), "%"))

#ggplot(plotdata, 
#       aes(reorder(Estado, n), n)) + 
#  geom_bar(stat = "identity") + 
#  geom_text(aes(label = n), vjust = -0.5) + 
#  labs(x = "Situación", y = "Cantidad", title = "Aprobados/Suspensos")

ggplot(plotdata, 
       aes(reorder(Estado, -pct), pct)) + 
  geom_bar(stat = "identity", fill = "indianred3", color = "black") + 
  geom_text(aes(label = pctlabel), vjust = -0.25) + 
  scale_y_continuous(labels = scales::percent) + 
  labs(x = "Situación", y = "Porcentajes", title = "Porcentajes de Aprobados/Suspensos")