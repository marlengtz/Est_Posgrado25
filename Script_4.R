#03/marzo/2025
#Clase 6, semana 7
#Pruebas de t de una cola para cuando hay diferencias 
#EJERCICIO 2

costal <- c(87.7, 80.01, 77.28, 78.76, 81.52, 74.2, 80.71, 79.5, 77.87, 81.94, 80.7,
            82.32, 75.78, 80.19, 83.91, 79.4, 77.52, 77.62, 81.4, 74.89, 82.95,
            73.59, 77.92, 77.18, 79.83, 81.23, 79.28, 78.44, 79.01, 80.47, 76.23,
            78.89, 77.14, 69.94, 78.54, 79.7, 82.45, 77.29, 75.52, 77.21, 75.99,
            81.94, 80.41, 77.7)

mean (costal)
length(costal)
plot(density(costal),
     main = "Gráfica densidad costales",
     xlab = "Peso costales",
     ylab = "Densidad",
     col = "blue",
     lwd = 2)#grafica los datos como una curva para ver la distibución de los datos

#Agregar valores de media observada y peso declarado de costales 
abline(v = mean(costal), col = "green", lwd = 2, lty = 2)#lwd es para el grosor de la linea y lty para el diseño de la linea (pinteada, discontinua)
abline(v = 80, col = "red", lwd = 2, lty = 2)#abline es para crear una linea vertical 
text(85, 0.06, "Media teoretica")


hist(costal)
abline(h=8, col= "red")
#ho el valor de los costales es de 80kg
#h1 la media observada es menor a lo declarado de 80kg

#Prueba de t de una cola

t.test(costal, mu = 80, alternative = "less") #se esta especificando para una cola, estamso declarando que hay menos peso que el mencionan  
t.test(costal, mu = 80)#Si no especificamos solo nos da si hay diferencias 


# Bucar datos en R --------------------------------------------------------

View(sleep)
sleep

boxplot(sleep$extra ~ sleep$group, col = "pink")
shapiro.test(sleep$extra)
bartlett.test(sleep$extra, sleep$group)

t.test(sleep$extra ~ sleep$group, var.equal = T)

View(airquality)
airquality
summary(airquality)

#El promedio de los cuatro meses y la media de un solo mes compararla con este promedio del resto de los meses 

aire <- airquality

mean(airquality$Temp)

mayo <- subset(aire$Temp, aire$Month == 5)
mean(mayo)

t.test(mayo, mu = mean(aire$Temp), alternative = "l")

aire$cent <- (aire$Temp-32)/1.8
boxplot(aire$cent ~ aire$Month, col = "indianred")

shapiro.test(aire$cent)
shapiro.test(mayo)

bartlett.test(aire$cent ~ aire$Month) #Prueba de varianza 

boxplot(aire$Ozone ~ aire$Month)
boxplot(aire$Wind ~ aire$Month)

bartlett.test(aire$Wind ~ aire$Month)#Prueba de varianza

aire$Month <- as.factor(aire$Month) #Para convertir los meses en factor, porque estaba en integral 
wind.aov <- aov(aire$Wind ~ aire$Month)
summary(wind.aov) #hay diferencias significativas valor de p menor a 0.05

TukeyHSD(wind.aov) #Algunos meses presentan diferencias significativas valor de p menor a 0.05

#la correlacion es positiva cuando a medida que aumenta x auemnta y, correlacion negativa aumenta x disminuye y 

cor.test(aire$Wind, aire$Temp)#la correlacion es negativa, a medida que aumenta la temperatura disminuye el viento
plot(aire$Temp, aire$Wind, pch = 20) #Graficar la nube de puntos pch es el numero de caracter

#temperatura con radiacion solar

plot(aire$Temp ~ aire$Solar.R)
cor.test(aire$Temp, aire$Solar.R)

#ozono con temperatura

plot(aire$Ozone ~ aire$Temp, pch = 20, col = "green")
cor.test(aire$Ozone, aire$Temp)

boxplot(aire$Ozone ~ aire$Month, col = "purple")
0.69^2


