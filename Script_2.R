# Importar datos a R proveniente de diferentes fuentes
# 10/02/25


# Importar datos  ---------------------------------------------------------

ocampo <-read.csv("Datos_Ocampo.csv", header = T)
ocampo
view(ocampo)

names(ocampo)

mean(ocampo$TEMP)#Se pone el signo de $ para nombrar a la variable
mean(ocampo$DIRS)

boxplot(ocampo$TEMP, col = "lightgreen",
        main = "Temperatura Ocampo") #nos da el valor minimo y maximo, los 
#cuartiles de los datos. Los sesgos nos dicen a donde se estan cargando los datos 

hist(ocampo$TEMP, col = "indianred",
     main = "Sitio Ocampo",
     xlab = "Temperatura (°C)",
     ylab = "Frecuencia") #Para crear un histograma

stem(ocampo$TEMP) #Gráfico de tallo y hojas 

boxplot(ocampo$VELR) #Esta grafica nos indica valores extremos, atipicos, fuera del rango

vivero <- read.csv("Vivero.csv", header = T)
vivero$Tratamiento <- as.factor(vivero$Tratamiento)

boxplot(vivero$IE ~ vivero$Tratamiento, col = "indianred",
        xlab = "Tratamiento",
        ylab = "IE") #se pone el simbolo de la ñ (~) para hacer dos graficas en
#funcion una de la otra

getwd() #Para saber en que directorio estas trabajando 

