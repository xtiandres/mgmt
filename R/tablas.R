# TABLAS GABY TESIS

# LIBRERIAS
library(readr)
library(readxl)
library(dplyr)
library(tidyr)
library(ggplot2)
library(data.table)
library(tidyverse)
library(scales)
library(gt)
library(kableExtra)
library(webshot2)



# TABLA 1
a <- c("Se identifica con el paciente","Explica el procedimiento a realizar","Solicita consentimiento para realizar el examen","Calificacion total 20ptos")
b <- c(1,0,0,0)
c <- c(1,0,0,0)
d <- c(183,195,169,14.6)
e <- c(203,204,201,19.5)
f <- c("0.92(0.88-0.96)","0.9(0.9-1)","0.86(0.81-0.92)","NA")
g <- c(0.0004,0.2,0.000001,0.0001)

#data = data.frame(
#  Country = c("USA", "China", "India"),
#  Capitals = c("Washington D.C.", "Beijing", "New Delhi"),
#  Population = c(331, 1441, 1393),
#  GDP = c(21.43, 14.34, 2.87)
#)

x <- data.frame(a,b,c,d,e,f,g)
colnames(x) <- c("Componentes de evaluacion",
                 "Control (n=199)",
                 "Intervencion educativa (n=205)",
                 "control (n=199)",
                 "intervencion educativa (n=205)",
                 "RR IC95%",
                 "Valor p")
#x
#kbl(x)

#Bootstrap theme
#x %>%
#  kbl() %>%
#  kable_styling()

#Alternatives themes
#x %>%
#  kbl() %>%
#  kable_paper("hover", full_width = F)

#Alternatives themes 2
#x %>%
#  kbl(caption = "Grafico 1") %>%
#  kable_classic(full_width = F, html_font = "Cambria")

#Alternatives themes 3 
#x %>%
#  kbl() %>%
#  kable_minimal()

#Alternatives themes 4 **
#x %>%
#  kbl() %>%
#  kable_material(c("striped","hover"))

#Alternatives styling 1
#kbl(x) %>%
#  kable_styling(bootstrap_options = c("striped", "hover", "condensed", "responsive"))

#Alternatives styling with no_full_width **
#kbl(x) %>%
#  kable_paper(bootstrap_options = "striped", full_width = F)

#Alternatives styling with font size
#kbl(x) %>%
#  kable_styling(bootstrap_options = "striped", font_size = 13)

#Row spec *
#kbl(x) %>%
#  kable_paper("striped", full_width = F) %>%
#  column_spec(4:7, bold = T) %>%
#  row_spec(3:4, bold = T, color = "white", background = "#D7261E")

#Header row angle
#kbl(x) %>%
#  kable_paper("striped", full_width = F) %>%
#  row_spec(0, angle = -45)

#Grouped columns rows ***
kbl(x[,1:7], align = c("l", "c", "c", "c", "c", "l", "c")) %>%
  #kable_classic(full_width = F) %>%
  kable_paper(full_width = F) %>%
  add_header_above(c(" " = 1, "Pre (n=404)" = 2, "Post (n=404)" = 2, " " = 2)) %>%
  #save_kable(file = "/bkpfcm/cacp/udaviz/R/studio/mgmt/table1.html", self_contained = T)
  save_kable(file = "/bkpfcm/cacp/udaviz/R/studio/mgmt/table1.png", self_contained = T)




# TABLA 2
h <- c("Fantoma con tubo al vacio","Fantoma con jeringuilla","Fantoma")
i <- c("NA","NA","NA")
j <- c(8.283,8.366,9.034)
k <- c("NA","NA","NA")
l <- c(8.820,8.873,9.551)
m <- c("<0.001*","<0.001*","<0.001*")

y <- data.frame(h,i,j,k,l,m)
colnames(y) <- c("Comparacion de la puntuacion de la tecnica",
                 "Control (n=199)",
                 "Intervencion educativa (n=205)",
                 "control (n=199)",
                 "intervencion educativa (n=205)",
                 "Prepost test control e intervencion educativa")

kbl(y[,1:6], align = c("l", "c", "c", "c", "c", "c")) %>%
  kable_paper(full_width = F) %>%
  add_header_above(c(" " = 1, "Media Pre (n=404)" = 2, "Media Post (n=404)" = 2, "Valor P" = 1)) %>%
  pack_rows("Flebotomia", 1, 2) %>%
  pack_rows("Gasometria", 3, 3) %>%
  save_kable(file = "/bkpfcm/cacp/udaviz/R/studio/mgmt/table2.png", self_contained = T)




# TABLA 22
h1 <- c("In vivo con tubo al vacio","In vivo con jeringuilla","In vivo")
i1 <- c(8.095,8.196,8.296)
j1 <- c(8.780,9.088,9.234)
k1 <- c(8.357,8.513,8.583)
l1 <- c(9.293,9.478,9.649)
m1 <- c("<0.001**","<0.001**","<0.001**")

yy <- data.frame(h1,i1,j1,k1,l1,m1)
colnames(yy) <- c("Comparacion de la puntuacion de la tecnica",
                 "Control (n=199)",
                 "Intervencion educativa (n=205)",
                 "control (n=199)",
                 "intervencion educativa (n=205)",
                 "Prepost test control e intervencion educativa")

kbl(yy[,1:6], align = c("l", "c", "c", "c", "c", "c")) %>%
  kable_paper(full_width = F) %>%
  add_header_above(c(" " = 1, "Media Pre (n=404)" = 2, "Media Post (n=404)" = 2, "Valor P" = 1)) %>%
  pack_rows("Flebotomia", 1, 2) %>%
  pack_rows("Gasometria", 3, 3) %>%
  save_kable(file = "/bkpfcm/cacp/udaviz/R/studio/mgmt/table22.png", self_contained = T)





# TABLA 3
n <- c("Fantoma con jeringuilla","Fantoma con tubo al vacio","Fantoma")
o <- c("NA","NA","NA")
p <- c(84.390,65.854,65.366)
q <- c("","","")
r <- c("NA","NA","NA")
s <- c(87.805,72.683,76.634)
t <- c("0.2(0.026-1.536)0.137","0.296(0.126-0.605)","0.216(0.092-0.511)<0.001")

z <- data.frame(n,o,p,q,r,s,t)
colnames(z) <- c("Porcentaje para conseguir la muestra",
                 "Control (n=199)",
                 "Intervencion educativa (n=205)",
                 "OR(IC95%)Valor p",
                 "control (n=199)",
                 "intervencion educativa (n=205)",
                 "OR(IC95%)Valor de p")

kbl(z[,1:7], align = c("l", "c", "c", "l", "c", "c", "l")) %>%
  kable_paper(full_width = F) %>%
  add_header_above(c(" " = 1, "Pre (n=404)" = 2, " " = 1, "Post (n=404)" = 2, " " = 1)) %>%
  pack_rows("Flebotomia", 1, 2) %>%
  pack_rows("Gasometria", 3, 3) %>%
  save_kable(file = "/bkpfcm/cacp/udaviz/R/studio/mgmt/table3.png", self_contained = T)




# TABLA 33
n <- c("In vivo con jeringuilla","In vivo con tubo al vacio","In vivo")
o <- c(65.327,62.814,53.266)
p <- c(80.976,79.024,69.756)
q <- c("0.815(0.36-1.27)<0.001","0.802(0.36-1.245)<0.001","0.705(0.297-1.13)<0.001")
r <- c(79.397,75.879,66.834)
s <- c(97.561,94.634,88.293)
t <- c("2.34(1.38-3.29)<0.001","1.72(1.035-2.41)<0.001","1.32(0.802-1.838)<0.001")

w <- data.frame(n,o,p,q,r,s,t)
colnames(w) <- c("Porcentaje para conseguir la muestra",
                 "Control (n=199)",
                 "Intervencion educativa (n=205)",
                 "OR(IC95%)Valor p",
                 "control (n=199)",
                 "intervencion educativa (n=205)",
                 "OR(IC95%)Valor de p")

kbl(w[,1:7], align = c("l", "c", "c", "l", "c", "c", "l")) %>%
  kable_paper(full_width = F) %>%
  add_header_above(c(" " = 1, "Pre (n=404)" = 2, " " = 1, "Post (n=404)" = 2, " " = 1)) %>%
  pack_rows("Flebotomia", 1, 2) %>%
  pack_rows("Gasometria", 3, 3) %>%
  save_kable(file = "/bkpfcm/cacp/udaviz/R/studio/mgmt/table33.png", self_contained = T)




# TABLA 4, TABLA 441 Y TABLA 442
e1 <- c("Fantoma con jeringuilla","In vivo con jeringuilla","Fantoma con tubo al vacio","In vivo con tubo al vacio","Fantoma","In vivo")
f1 <- c("NA",140.6,"NA",156.5,"NA",152)
g1 <- c(175.4,125.4,200.4,138.1,180,110)
h1 <- c("<0.001","<0.001*","<0.001","<0.001*","<0.001","<0.001*")

y1 <- data.frame(e1,f1,g1,h1)
colnames(y1) <- c("Tiempo empleado para conseguir la muestra",
                  "Control (n=199)",
                  "Intervencion educativa (n=205)",
                  "Valor p")

#kbl(y1) %>%
#  kable_paper(full_width = F) %>%
#  add_header_above(c(" " = 1, "(n=404)" = 2, " " = 1)) %>%
#  pack_rows("Flebotomia", 1, 4) %>%
#  pack_rows("Gasometria", 5, 6) %>%
#  save_kable(file = "/bkpfcm/cacp/udaviz/R/studio/mgmt/table4.png", self_contained = T)



# TABLA 441 SOLO FANTOMA DE TABLA 4
a1 <- c("Fantoma con jeringuilla","Fantoma con tubo al vacio","Fantoma")
b1 <- c("NA","NA","NA")
c1 <- c(175.4,200.4,180)
d1 <- c("<0.001","<0.001","<0.001")

x1 <- data.frame(a1,b1,c1,d1)
colnames(x1) <- c("Tiempo empleado para conseguir la muestra",
                 "Control (n=199)",
                 "Intervencion educativa (n=205)",
                 "Valor p")

kbl(x1[,1:4], align = c("l", "c", "c", "c")) %>%
  kable_paper(full_width = F) %>%
  add_header_above(c(" " = 1, "(n=404)" = 2, " " = 1)) %>%
  pack_rows("Flebotomia", 1, 2) %>%
  pack_rows("Gasometria", 3, 3) %>%
  save_kable(file = "/bkpfcm/cacp/udaviz/R/studio/mgmt/table441.png", self_contained = T)




# TABLA 442 SOLO INVIVO DE TABLA 4
i1 <- c("In vivo con jeringuilla","In vivo con tubo al vacio","In vivo")
j1 <- c(140.6,156.5,152)
k1 <- c(125.4,138.1,110)
l1 <- c("<0.001*","<0.001*","<0.001*")

z1 <- data.frame(i1,j1,k1,l1)
colnames(z1) <- c("Tiempo empleado para conseguir la muestra",
                  "Control (n=199)",
                  "Intervencion educativa (n=205)",
                  "Valor p")

kbl(z1[,1:4], align = c("l", "c", "c", "c")) %>%
  kable_paper(full_width = F) %>%
  add_header_above(c(" " = 1, "(n=404)" = 2, " " = 1)) %>%
  pack_rows("Flebotomia", 1, 2) %>%
  pack_rows("Gasometria", 3, 3) %>%
  save_kable(file = "/bkpfcm/cacp/udaviz/R/studio/mgmt/table442.png", self_contained = T)
