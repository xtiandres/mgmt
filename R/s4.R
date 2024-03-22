library(readxl)
library(dplyr)
library(tidyr)
library(ggplot2)
library(scales)

notas <- read_excel("/home/xut/Documents/udaviz/R/studio/notas/data/NOTAS.xlsx", sheet = 3)

ggplot(notas, 
       aes(x = Nota, y = ..count.. / sum(..count..))) + 
  geom_histogram(fill = "cornflowerblue", color = "white") + 
  labs(title = "Histograma de Notas", y= "Porcentaje", x = "Calificación") + 
  scale_y_continuous(labels = scales::percent)