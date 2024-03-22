# TABLAS - 2023

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
tabla1 <- read_excel("/bkpfcm/cacp/udaviz/R/studio/mgmt/data/Control y Estudio TOTAL 31 julio 2023 Final.xlsx")

# MUJERES
tmujer <- filter(tabla1,
                 Género == 'MUJER')

# HOMBRES
tvaron <- filter(tabla1,
                 Género == 'HOMBRE')

# MUJERES CONTROL
tmu_co <- filter(tmujer,
                 `Control / Estudio` == 'Control')

# MUJERES ESTUDIO
tmu_es <- filter(tmujer,
                 `Control / Estudio` == 'Estudio')

# HOMBRES CONTROL
tva_co <- filter(tvaron,
                 `Control / Estudio` == 'Control')

# HOMBRES ESTUDIO
tva_es <- filter(tvaron,
                 `Control / Estudio` == 'Estudio')

table(tabla1$Ano)

# 2021 CONTROL
t_21_c <- filter(tabla1,
                 Ano == "2021-2022" &
                   `Control / Estudio` == 'Control')

# 2021 ESTUDIO
t_21_e <- filter(tabla1,
                 Ano == "2021-2022" &
                   `Control / Estudio` == 'Estudio')

# 2022 CONTROL
t_22_c <- filter(tabla1,
                 Ano == "2022-2022" &
                   `Control / Estudio` == 'Control')

# 2022 ESTUDIO
t_22_e <- filter(tabla1,
                 Ano == "2022-2022" &
                   `Control / Estudio` == 'Estudio')

# PROMEDIO/AVERAGE DE CONTROL
aver_c <- c(mean(tmu_co$Edad), mean(tva_co$Edad))
print(mean(aver_c))

# PROMEDIO/AVERAGE DE ESTUDIO
aver_e <- c(mean(tmu_es$Edad), mean(tva_es$Edad))
print(mean(aver_e))
