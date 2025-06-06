#Semana 7
#10/03/2025
# Regresión lineal

geyser <- read.csv("erupciones.csv", header = T)

plot(geyser$waiting, geyser$eruptions, pch = 19,
     xlab = "Tiempo de espera (min)",
     ylab = "Duración (min)")

cor(geyser$waiting, geyser$eruptions)
cor.test(geyser$waiting, geyser$eruptions) #Si hay una asociacion lineal entre el tiempo de espera es 
#alta y significativa por lo tanto lso datos provienen de una regresion lineal

g.lm <- lm(geyser$eruptions ~ geyser$waiting) #Primero va la variable dependiente y despues la independiente
g.lm
summary(g.lm)

#para asegurar que la linea de tendencia pase por el centro 
#GRAFICAR LA LINEA DE TENDENCIA CENTRAL
plot(geyser$waiting, geyser$eruptions, pch = 19,
     xlab = "Tiempo de espera (min)",
     ylab = "Duración (min)")
abline(g.lm, col = "red")

#para correr un codigo solo se le pone source y se agarra el script 
source("Script_5.R")

-1.8 + 0.07+60

g.lm$coefficients[1]+g.lm$coefficients[2]*60

geyser$yprima <- g.lm$fitted.values

geyser$residuales <- g.lm$residuals

g.lm$coefficients
sum(geyser$residuales)

geyser$res2 <- geyser$residuales^2

sum(geyser$res2)/270 #varianza del modelo

mod.lm <- anova(g.lm) #Regresión lineal del modelo, aplicar una anova al modelo lineal 
mod.lm

sum(geyser$res2)





