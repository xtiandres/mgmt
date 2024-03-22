#DENSITY PLOTS

library(readxl)
library(dplyr)
library(tidyr)
library(ggplot2)
library(scales)
library(vcd)

notas <- read_excel("/home/xut/Documents/udaviz/R/studio/notas/data/NOTAS.xlsx", sheet = 3)
nfinal <- read_excel("/home/xut/Documents/udaviz/R/studio/notas/data/NOTAS.xlsx", sheet = 1)

ggplot(nfinal, 
       aes(Nota, fill = Paralelo)) + 
  geom_density(alpha = 0.4)