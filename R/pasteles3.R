# PASTELES 3 - Encuesta de satisfaccion in vivo 2022-2022 - Mejorados

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

# Pie Chart - Pregunta 4
colors <- c('rgb(211,94,96)', 'rgb(128,133,133)', 'rgb(144,103,167)', 'rgb(171,104,87)', 'rgb(114,147,203)')

fi4 <- plot_ly(dat224, labels = ~x, values = ~porcentaje, type = 'pie',
               textposition = 'inside',
               textinfo = 'label+percent',
               insidetextfont = list(color = '#FFFFFF'),
               hoverinfo = 'text',
               text = ~paste('$', porcentaje, ' billions'),
               marker = list(colors = colors,
                             line = list(color = '#FFFFFF', width = 1)),
               #The 'pull' attribute can also be used to create space between the sectors
               showlegend = FALSE)
fi4 <- fi4 %>% layout(title = 'P4: Considera adecuado el tiempo en la parte teorica y practica',
                      xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
                      yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))

#fi4

# Pie Chart - Pregunta 10
colors <- c('rgb(211,94,96)', 'rgb(128,133,133)', 'rgb(144,103,167)', 'rgb(171,104,87)', 'rgb(114,147,203)')

f10 <- plot_ly(dat2210, labels = ~x, values = ~porcentaje, type = 'pie',
               textposition = 'inside',
               textinfo = 'label+percent',
               insidetextfont = list(color = '#FFFFFF'),
               hoverinfo = 'text',
               text = ~paste('$', porcentaje, ' billions'),
               marker = list(colors = colors,
                             line = list(color = '#FFFFFF', width = 1)),
               #The 'pull' attribute can also be used to create space between the sectors
               showlegend = FALSE)
f10 <- f10 %>% layout(title = 'P10: Se siente en la capacidad de realizar de manera adecuada la toma de sangre arterial posterior a la práctica de laboratorio in vivo',
                      xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
                      yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))

#f10

# Pie Chart - Pregunta 11
colors <- c('rgb(211,94,96)', 'rgb(128,133,133)', 'rgb(144,103,167)', 'rgb(171,104,87)', 'rgb(114,147,203)')

f11 <- plot_ly(dat2211, labels = ~x, values = ~porcentaje, type = 'pie',
               textposition = 'inside',
               textinfo = 'label+percent',
               insidetextfont = list(color = '#FFFFFF'),
               hoverinfo = 'text',
               text = ~paste('$', porcentaje, ' billions'),
               marker = list(colors = colors,
                             line = list(color = '#FFFFFF', width = 1)),
               #The 'pull' attribute can also be used to create space between the sectors
               showlegend = FALSE)
f11 <- f11 %>% layout(title = 'P11: Se siente en la capacidad de interpretar las normas generales de bioseguridad posterior a la práctica de laboratorio con fantomas de simulación',
                      xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
                      yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))

#f11

# Pie Chart - Pregunta 13
colors <- c('rgb(211,94,96)', 'rgb(128,133,133)', 'rgb(144,103,167)', 'rgb(171,104,87)', 'rgb(114,147,203)')

f13 <- plot_ly(dat2213, labels = ~x, values = ~porcentaje, type = 'pie',
               textposition = 'inside',
               textinfo = 'label+percent',
               insidetextfont = list(color = '#FFFFFF'),
               hoverinfo = 'text',
               text = ~paste('$', porcentaje, ' billions'),
               marker = list(colors = colors,
                             line = list(color = '#FFFFFF', width = 1)),
               #The 'pull' attribute can also be used to create space between the sectors
               showlegend = FALSE)
f13 <- f13 %>% layout(title = 'P13: Se siente en la capacidad de interpretar tiempos de coagulación, INR, importancia de antiagregantes plaquetarios y anticoagulantes posterior a la práctica de laboratorio con fantomas de simulación',
                      xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
                      yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))

#f13

# Pie Chart - Pregunta 17
colors <- c('rgb(211,94,96)', 'rgb(128,133,133)', 'rgb(144,103,167)', 'rgb(171,104,87)', 'rgb(114,147,203)')

f17 <- plot_ly(dat2217, labels = ~x, values = ~porcentaje, type = 'pie',
               textposition = 'inside',
               textinfo = 'label+percent',
               insidetextfont = list(color = '#FFFFFF'),
               hoverinfo = 'text',
               text = ~paste('$', porcentaje, ' billions'),
               marker = list(colors = colors,
                             line = list(color = '#FFFFFF', width = 1)),
               #The 'pull' attribute can also be used to create space between the sectors
               showlegend = FALSE)
#f17 <- f17 %>% layout(title = 'P17: El tutor fue una guía para usted durante la clase práctica',
#                      xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
#                      yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))

f17

# Para que funcione webshot, openssl updated
Sys.setenv(OPENSSL_CONF="/dev/null")
export(f17, file = 'test.png')

#dev.off()