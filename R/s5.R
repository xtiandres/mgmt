library(readxl)
library(dplyr)
library(tidyr)
library(ggplot2)
library(scales)

notas <- read_excel("/home/xut/Documents/udaviz/R/studio/notas/data/NOTAS.xlsx", sheet = 3)

notas2 <- notas %>% mutate(examen = (Examen1*3.5/20) + (Examen2*3.5/18), pruebas = (`Tarea: Resumen del Video La Celula`*0.875/20) + (`Foro: ¿Cuál sería su criterio de alteración electrolítica?`*0.875/20) + (`Tarea: Realizar en una hoja un esquema gráfico nemotécnico de hiponatremia, hipopotasemia, hiperkalemia, hipokalemia, hipocalcemia , hipercalcemia.`*0.875/20) + (`Tarea: Realizar en una hoja un esquema gráfico nemotécnico de acidosis metabólica, alcalosis metabólica, acidosis y alcalosis respiratoria`*0.875/20) + (`Tarea: Realizar un esquema de renina angiotensina, aldosterona`*0.875/20) + (`Prueba`*0.875/6) + (`Tarea: Realizar en una hoja una nemotecnia de metabolismo del grupo HEM`*0.875/10) + (`Tarea: Tabla de Vitaminas y Minerales`*0.875/10), grupal = `Seminarios G` + `Tabla Vitaminas G` + `HEM G` + `RAA G` + `Electrolitos G` + `Prueba G` + `Laboratorios G`)

notasfinal <- notas2 %>% select(Nombres, Apellidos, Paralelo, examen:grupal) %>% mutate(nfinal = examen + pruebas + grupal)

notasfinal <-notasfinal %>% mutate(across(4:7, round, 2))

notasfinalm7 <- notasfinal %>% filter(Paralelo == "M7")
notasfinalm5 <- notasfinal %>% filter(Paralelo == "M5")
notasfinalm2 <- notasfinal %>% filter(Paralelo == "M2")

suspensos <- notasfinal %>% mutate(aprueba = ifelse(nfinal > 14, "SI", "NO"))

ggplot(notasfinal, aes(nfinal)) + 
  geom_dotplot(fill = "gold", color = "black") + 
  scale_x_continuous(breaks = seq(0, 20, 2)) + 
  labs(title = "Estudiantes M7, M5 y M2", x = "Nota Final", y = "")