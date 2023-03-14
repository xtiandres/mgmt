# PASTELES - Encuesta de satisfaccion in vivo 2022-2022

# LIBRERIAS
library(dplyr)
library(tidyr)
library(plyr)
library(readr)
library(readxl)
library(ggplot2)
library(vcd)
library(ggridges)
library(data.table)
library(lubridate)
library(tidyverse)
library(RColorBrewer)
library(patchwork)
library(ggpubr)
library(EpiEstim)
library(lessR)
library(plotrix)
library(scales)

# DATASETS
#encsat21_2 <- read_csv("/home/xut/Documents/udaviz/R/studio/mgmt/data/Encuesta de satisfacción in vivo  2021-2022 (1).xlsx")
#encsat22_1 <- read_excel("/home/xut/Documents/udaviz/R/studio/mgmt/data/Encuesta de satisfacción simulación 2022-2022.xlsx")

abc <- data.frame(uno = c('a','b','c','d','e'),
                  dos = c('SI','NO','SI','SI','SI'),
                  tres = c('NO','NO','SI','NO','SI'))
abc <- mutate(abc,
              nd = ifelse(dos == 'SI',
                           1,
                           0),
              nt = ifelse(tres == 'SI',
                           1,
                           0))
