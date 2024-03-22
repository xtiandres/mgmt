#VIOLIN PLOTS WITH BOXPLOT

library(readxl)
library(dplyr)
library(tidyr)
library(ggplot2)
library(scales)
library(vcd)

notas <- read_excel("/home/xut/Documents/udaviz/R/studio/notas/data/NOTAS.xlsx", sheet = 3)
nfinal <- read_excel("/home/xut/Documents/udaviz/R/studio/notas/data/NOTAS.xlsx", sheet = 1)

ggplot(nfinal, 
       aes(Paralelo, Nota)) + 
  geom_violin(fill = "cornflowerblue") + 
  geom_boxplot(width = .2, fill = "orange", outlier.color = "orange", outlier.size = 2) + 
  labs(title = "Distribución de Notas por Paralelo - Tipo Violin con Boxplot")