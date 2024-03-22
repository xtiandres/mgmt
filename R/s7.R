#MOSAICOS

library(readxl)
library(dplyr)
library(tidyr)
library(ggplot2)
library(scales)
library(vcd)

notas <- read_excel("/home/xut/Documents/udaviz/R/studio/notas/data/NOTAS.xlsx", sheet = 3)
nfinal <- read_excel("/home/xut/Documents/udaviz/R/studio/notas/data/NOTAS.xlsx", sheet = 1)

tabla <- xtabs(~Estado + `Matrícula` + Sexo, nfinal)

ftable(tabla)

#mosaic(tabla, main = "Información de Cursos")

mosaic(tabla, 
       shade = TRUE, 
       legend = TRUE, 
       labeling_args = list(set_varnames = c(Sexo = "Género", Estado = "Aprobo/Reprobro", `Matrícula` = "Número de Matrícula")), 
       set_labels = list(Estado = c("No", "Si"), `Matrícula` = c("1ra", "2da", "3ra"), Sexo = c("F", "M")), main = "Cursos información")