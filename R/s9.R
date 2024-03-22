#BOX PLOTS

library(readxl)
library(dplyr)
library(tidyr)
library(ggplot2)
library(scales)
library(vcd)

notas <- read_excel("/home/xut/Documents/udaviz/R/studio/notas/data/NOTAS.xlsx", sheet = 3)
nfinal <- read_excel("/home/xut/Documents/udaviz/R/studio/notas/data/NOTAS.xlsx", sheet = 1)

#ggplot(nfinal, 
#       aes(Paralelo, Nota)) + 
#  geom_boxplot() + 
#  labs(title = "Distribución de Notas por Paralelo")

#ggplot(nfinal, 
#       aes(Paralelo, Nota)) + 
#  geom_boxplot(notch = TRUE, fill = "cornflowerblue", alpha = .7) + 
#  labs(title = "Distribución de Notas por Paralelo")

ggplot(nfinal, 
       aes(Paralelo, Nota)) + 
  geom_boxplot(notch = FALSE, fill = "cornflowerblue", alpha = .7) + 
  labs(title = "Distribución de Notas por Paralelo")