# PASTELES - Encuesta de satisfaccion in vivo 2021-2022

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
encsat21_1 <- read_excel("/home/xut/Documents/udaviz/R/studio/mgmt/data/Encuesta de satisfacción in vivo  2021-2022.xlsx")
#encsat21_2 <- read_csv("/home/xut/Documents/udaviz/R/studio/mgmt/data/Encuesta de satisfacción in vivo  2021-2022 (1).xlsx")
#encsat22_1 <- read_csv("/home/xut/Documents/udaviz/R/studio/mgmt/data/Encuesta de satisfacción simulación 2022-2022.xlsx")

# CLEANING
es21_1c <- select(encsat21_1,
                  `1. [Considera adecuado el tiempo en la parte teória y de práctica]`,
                  `3. [Se siente en la capacidad de realizar una adecuada toma de sangre venosa con jeringuilla posterior a la práctica de laboratorio]`,
                  `4. [Se siente en la capacidad de realizar una adecuada toma de sangre venosa con vacutainer posterior a la práctica de laboratorio]`,
                  `5. [Se siente en la capacidad de realizar de manera adecuada la toma de sangre arterial posterior a la práctica de laboratorio]`,
                  `12. [El tutor fue una guía para usted durante la clase práctica]`)

# PREGUNTA1
dat1 <- count(es21_1c$`1. [Considera adecuado el tiempo en la parte teória y de práctica]`)
dat1 <- na.omit(dat1)
dat1 <- mutate(dat1, porcentaje = dat1$freq / sum(dat1$freq))
# PREGUNTA3
dat3 <- count(es21_1c$`3. [Se siente en la capacidad de realizar una adecuada toma de sangre venosa con jeringuilla posterior a la práctica de laboratorio]`)
dat3 <- na.omit(dat3)
dat3 <- mutate(dat3, porcentaje = dat3$freq / sum(dat3$freq))
# PREGUNTA4
dat4 <- count(es21_1c$`4. [Se siente en la capacidad de realizar una adecuada toma de sangre venosa con vacutainer posterior a la práctica de laboratorio]`)
dat4 <- na.omit(dat4)
dat4 <- mutate(dat4, porcentaje = dat4$freq / sum(dat4$freq))
# PREGUNTA5
dat5 <- count(es21_1c$`5. [Se siente en la capacidad de realizar de manera adecuada la toma de sangre arterial posterior a la práctica de laboratorio]`)
dat5 <- na.omit(dat5)
dat5 <- mutate(dat5, porcentaje = dat5$freq / sum(dat5$freq))
# PREGUNTA12
dat12 <- count(es21_1c$`12. [El tutor fue una guía para usted durante la clase práctica]`)
dat12 <- na.omit(dat12)
dat12 <- mutate(dat12, porcentaje = dat12$freq / sum(dat12$freq))

# Bar Plot OK
#ggplot(dat1,
#       aes(x, freq)) + geom_bar(stat = 'identity')
# Basic Pie Chart OK
#pie(dat1$freq) 
#pie <- pie(dat1$porcentaje, labels = paste0(scales::percent(dat1$porcentaje), '%')) 
#pie <- pie + legend('right', legend = c(dat1$x),
#                    fill =  c("white", "lightblue", "mistyrose"))
# 3D Pie Chart OK
#pie3D(dat1$porcentaje, labels = paste0(scales::percent(dat1$porcentaje), '%'), explode = .25)

# Pie Chart - Pregunta 1 - GGPLOT OK
pie1 <- ggplot(dat1, aes(x = " ", y = porcentaje, fill = x)) +
  geom_col(color = 'black') +
  geom_text(aes(label = scales::percent(dat1$porcentaje)),
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
  labs(title = 'Pregunta 1 - 2021',
       subtitle = 'Considera adecuado el tiempo en la parte teorica y de practica')

# Pie Chart - Pregunta 3 - GGPLOT OK
pie3 <- ggplot(dat3, aes(x = " ", y = porcentaje, fill = x)) +
  geom_col(color = 'black') +
  geom_text(aes(label = scales::percent(dat3$porcentaje)),
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
  labs(title = 'Pregunta 3 - 2021',
       subtitle = 'Se siente en capacidad de realizar una adecuada toma de sangre venosa con jeringuilla posterior al laboratorio')

# Pie Chart - Pregunta 4 - GGPLOT OK
pie4 <- ggplot(dat4, aes(x = " ", y = porcentaje, fill = x)) +
  geom_col(color = 'black') +
  geom_text(aes(label = scales::percent(dat4$porcentaje)),
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
  labs(title = 'Pregunta 4 - 2021',
       subtitle = 'Se siente en capacidad de realizar una adecuada toma de sangre venosa con vacutainer posterior al laboratorio')

# Pie Chart - Pregunta 5 - GGPLOT OK
pie5 <- ggplot(dat5, aes(x = " ", y = porcentaje, fill = x)) +
  geom_col(color = 'black') +
  geom_text(aes(label = scales::percent(dat5$porcentaje)),
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
  labs(title = 'Pregunta 5 - 2021',
       subtitle = 'Se siente en capacidad de realizar de manera adecuada la toma de sangre arterial posterior al laboratorio')

# Pie Chart - Pregunta 12 - GGPLOT OK
pie12 <- ggplot(dat12, aes(x = " ", y = porcentaje, fill = x)) +
  geom_col(color = 'black') +
  geom_text(aes(label = scales::percent(dat12$porcentaje)),
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
  labs(title = 'Pregunta 12 - 2021',
       subtitle = 'El tutor fue una guia para usted durante la clase practica')

ggsave(pie1, filename = '/home/xut/Documents/udaviz/R/studio/mgmt/data/pie1.png', width = 8, height = 6)
ggsave(pie3, filename = '/home/xut/Documents/udaviz/R/studio/mgmt/data/pie3.png', width = 8, height = 6)
ggsave(pie4, filename = '/home/xut/Documents/udaviz/R/studio/mgmt/data/pie4.png', width = 8, height = 6)
ggsave(pie5, filename = '/home/xut/Documents/udaviz/R/studio/mgmt/data/pie5.png', width = 8, height = 6)
ggsave(pie12, filename = '/home/xut/Documents/udaviz/R/studio/mgmt/data/pie12.png', width = 8, height = 6)

dev.off()