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
#encsat21_1 <- read_excel("/home/xut/Documents/udaviz/R/studio/mgmt/data/Encuesta de satisfacción in vivo  2021-2022.xlsx")
#encsat21_2 <- read_csv("/home/xut/Documents/udaviz/R/studio/mgmt/data/Encuesta de satisfacción in vivo  2021-2022 (1).xlsx")
encsat22_1 <- read_excel("/home/xut/Documents/udaviz/R/studio/mgmt/data/Encuesta de satisfacción simulación 2022-2022.xlsx")

# CLEANING
es22_1c <- select(encsat22_1,
                  `4. [Considera adecuado el tiempo en la parte teória y de práctica]`,
                  `10. [Se siente en la capacidad de realizar de manera adecuada la toma de sangre arterial posterior a la práctica de laboratorio in vivo]`,
                  `11. [Se siente en la capacidad de interpretar las normas generales de bioseguridad posterior a la práctica de laboratorio con fantomas de simulación]`,
                  `13. [Se siente en la capacidad de interpretar tiempos de coagulación, INR, importancia de antiagregantes plaquetarios y anticoagulantes posterior a la práctica de laboratorio con fantomas de simulación]`,
                  `17. [El tutor fue una guía para usted durante la clase práctica]`)

# PREGUNTA4
dat224 <- count(es22_1c$`4. [Considera adecuado el tiempo en la parte teória y de práctica]`)
dat224 <- na.omit(dat224)
dat224 <- mutate(dat224, porcentaje = dat224$freq / sum(dat224$freq))
# PREGUNTA10
dat2210 <- count(es22_1c$`10. [Se siente en la capacidad de realizar de manera adecuada la toma de sangre arterial posterior a la práctica de laboratorio in vivo]`)
dat2210 <- na.omit(dat2210)
dat2210 <- mutate(dat2210, porcentaje = dat2210$freq / sum(dat2210$freq))
# PREGUNTA11
dat2211 <- count(es22_1c$`11. [Se siente en la capacidad de interpretar las normas generales de bioseguridad posterior a la práctica de laboratorio con fantomas de simulación]`)
dat2211 <- na.omit(dat2211)
dat2211 <- mutate(dat2211, porcentaje = dat2211$freq / sum(dat2211$freq))
# PREGUNTA13
dat2213 <- count(es22_1c$`13. [Se siente en la capacidad de interpretar tiempos de coagulación, INR, importancia de antiagregantes plaquetarios y anticoagulantes posterior a la práctica de laboratorio con fantomas de simulación]`)
dat2213 <- na.omit(dat2213)
dat2213 <- mutate(dat2213, porcentaje = dat2213$freq / sum(dat2213$freq))
# PREGUNTA17
dat2217 <- count(es22_1c$`17. [El tutor fue una guía para usted durante la clase práctica]`)
dat2217 <- na.omit(dat2217)
dat2217 <- mutate(dat2217, porcentaje = dat2217$freq / sum(dat2217$freq))

# Pie Chart - Pregunta 4 - GGPLOT OK
pie224 <- ggplot(dat224, aes(x = " ", y = porcentaje, fill = x)) +
  geom_col(color = 'black') +
  geom_text(aes(label = scales::percent(dat224$porcentaje)),
            position = position_stack(vjust = .5)) +
  coord_polar(theta = 'y') +
  guides(fill = guide_legend(title = 'Escala')) +
  scale_fill_brewer(palette = 10) +
  theme(axis.text = element_blank(),
        axis.ticks = element_blank(),
        axis.title = element_blank(),
        panel.grid = element_blank(),
        panel.background = element_rect(fill = "#ebf2ff"),
        plot.background = element_rect(fill = "#ebf2ff"),
        legend.background = element_rect(fill = "#ebf2ff"),
        legend.position = 'bottom') +
  labs(title = 'Pregunta 4 - 2022',
       subtitle = 'Considera adecuado el tiempo en la parte teória y de práctica')

# Pie Chart - Pregunta 10 - GGPLOT OK
pie2210 <- ggplot(dat2210, aes(x = " ", y = porcentaje, fill = x)) +
  geom_col(color = 'black') +
  geom_text(aes(label = scales::percent(dat2210$porcentaje)),
            position = position_stack(vjust = .5)) +
  coord_polar(theta = 'y') +
  guides(fill = guide_legend(title = 'Escala')) +
  scale_fill_brewer(palette = 10) +
  theme(axis.text = element_blank(),
        axis.ticks = element_blank(),
        axis.title = element_blank(),
        panel.grid = element_blank(),
        panel.background = element_rect(fill = "#ebf2ff"),
        plot.background = element_rect(fill = "#ebf2ff"),
        legend.background = element_rect(fill = "#ebf2ff"),
        legend.position = 'bottom') +
  labs(title = 'Pregunta 10 - 2022',
       subtitle = 'Se siente en la capacidad de realizar de manera adecuada la toma de sangre arterial posterior a la práctica de laboratorio in vivo')

# Pie Chart - Pregunta 11 - GGPLOT OK
pie2211 <- ggplot(dat2211, aes(x = " ", y = porcentaje, fill = x)) +
  geom_col(color = 'black') +
  geom_text(aes(label = scales::percent(dat2211$porcentaje)),
            position = position_stack(vjust = .5)) +
  coord_polar(theta = 'y') +
  guides(fill = guide_legend(title = 'Escala')) +
  scale_fill_brewer(palette = 10) +
  theme(axis.text = element_blank(),
        axis.ticks = element_blank(),
        axis.title = element_blank(),
        panel.grid = element_blank(),
        panel.background = element_rect(fill = "#ebf2ff"),
        plot.background = element_rect(fill = "#ebf2ff"),
        legend.background = element_rect(fill = "#ebf2ff"),
        legend.position = 'bottom') +
  labs(title = 'Pregunta 11 - 2022',
       subtitle = 'Se siente en la capacidad de interpretar las normas generales de bioseguridad posterior a la práctica de laboratorio con fantomas de simulación')

# Pie Chart - Pregunta 13 - GGPLOT OK
pie2213 <- ggplot(dat2213, aes(x = " ", y = porcentaje, fill = x)) +
  geom_col(color = 'black') +
  geom_text(aes(label = scales::percent(dat2213$porcentaje)),
            position = position_stack(vjust = .5)) +
  coord_polar(theta = 'y') +
  guides(fill = guide_legend(title = 'Escala')) +
  scale_fill_brewer(palette = 10) +
  theme(axis.text = element_blank(),
        axis.ticks = element_blank(),
        axis.title = element_blank(),
        panel.grid = element_blank(),
        panel.background = element_rect(fill = "#ebf2ff"),
        plot.background = element_rect(fill = "#ebf2ff"),
        legend.background = element_rect(fill = "#ebf2ff"),
        legend.position = 'bottom') +
  labs(title = 'Pregunta 13 - 2022',
       subtitle = 'Se siente en la capacidad de interpretar tiempos de coagulación, INR, importancia de antiagregantes plaquetarios y anticoagulantes posterior a la práctica de laboratorio con fantomas de simulación')

# Pie Chart - Pregunta 17 - GGPLOT OK
pie2217 <- ggplot(dat2217, aes(x = " ", y = porcentaje, fill = x)) +
  geom_col(color = 'black') +
  geom_text(aes(label = scales::percent(dat2217$porcentaje)),
            position = position_stack(vjust = .5),
            check_overlap = TRUE) +
  coord_polar(theta = 'y') +
  guides(fill = guide_legend(title = 'Escala')) +
  scale_fill_brewer(palette = 10) +
  theme(axis.text = element_blank(),
        axis.ticks = element_blank(),
        axis.title = element_blank(),
        panel.grid = element_blank(),
        panel.background = element_rect(fill = "#ebf2ff"),
        plot.background = element_rect(fill = "#ebf2ff"),
        legend.background = element_rect(fill = "#ebf2ff"),
        legend.position = 'bottom') +
  labs(title = 'Pregunta 17 - 2022',
       subtitle = 'El tutor fue una guía para usted durante la clase práctica')

ggsave(pie224, filename = '/home/xut/Documents/udaviz/R/studio/mgmt/data/pie224.png', width = 8, height = 6)
ggsave(pie2210, filename = '/home/xut/Documents/udaviz/R/studio/mgmt/data/pie2210.png', width = 8, height = 6)
ggsave(pie2211, filename = '/home/xut/Documents/udaviz/R/studio/mgmt/data/pie2211.png', width = 8, height = 6)
ggsave(pie2213, filename = '/home/xut/Documents/udaviz/R/studio/mgmt/data/pie2213.png', width = 8, height = 6)
ggsave(pie2217, filename = '/home/xut/Documents/udaviz/R/studio/mgmt/data/pie2217.png', width = 8, height = 6)

dev.off()