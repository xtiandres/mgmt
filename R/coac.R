# COAC LISTADO

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
library(ggrepel)
library(plotly)
library(webshot)

# DATASETS
bdcos <- read_excel("/home/xut/Documents/udaviz/R/studio/mgmt/data/BASE DE DATOS DE TRABAJO COCEDE CEDULAS.xlsx")

# INTERSECT
soluc <- intersect(bdcos$`CEDULAS COCEDE`, bdcos$`CEDULAS CERTIFICADOS DE APORTACION COOPERATIVA`)
soluc <- data.frame(soluc)
write.csv(soluc, "/home/xut/Documents/udaviz/R/studio/mgmt/solucion.csv", row.names = FALSE)
#dev.off()