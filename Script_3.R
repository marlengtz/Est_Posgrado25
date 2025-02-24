#Semana 5 Analisis de datos 
#24/02/2025

library(repmis)

localidad <- source_data("https://www.dropbox.com/s/fbrwxypacjgeayj/Datos_Rascon_Anova.csv?dl=1")

boxplot(localidad$DAP ~ localidad$Paraje)

#Normalidad de diametro
shapiro.test(localidad$DAP)

#Nomrlaidad edad 
shapiro.test(localidad$EDAD)

#Hisogrma de diametro
hist(localidad$DAP)

d50 <- rnorm(50,mean = 0, sd =1)
hist(d50)

d100 <- rnorm(100, mean = 0, sd =1)
hist(d100)

d1000 <- rnorm(1000, mean = 0, sd =1)
hist(d1000)

#Transformacion de datos x (DAP) usando log10

localidad$DAP_log <- round(log10(localidad$DAP + 1),2)
hist(localidad$DAP_log)

library(e1071)#Esta paqueteria nos sirvepara calcular el sesgo de los datos 

skewness(localidad$DAP) #Esta funcion es para medir el sesgo de los datos, si nos da 0 no tiene sesgo,si nos da 0.5 medianamente sesgado y entre -1 y 1 es muy sesgado
skewness(localidad$DAP_log)

#Prueba de normalidad a los datos transformados 
shapiro.test(localidad$DAP_log)

#Se le calculo la raiz cuadrada a los datos para hacerlos normales
localidad$sqrt <- round(sqrt(localidad$DAP),2)
skewness(localidad$sqrt)

shapiro.test(localidad$sqrt)
#La raiz cuadrada nos sirve para transformar los datos en normales 

#Histograma de la raiz cuadrada
hist(localidad$sqrt, col = "pink")
                                              
#Analisis de varianza aov

dap.aov <- aov(localidad$sqrt ~ localidad$Paraje)

dap.aov
summary(dap.aov)#Nos da el resumen de la base de datos del analisis de la prueba de varianza
boxplot(localidad$sqrt ~ localidad$Paraje,
        col = "indianred",
        xlab = "Parajes",
        ylab = "DAP (cm)")
text(1,7,"b")
text(2,7, "c")
text(3,7, "a")
text(4,7, "bc")
mtext("Mediciones", side = 4) #Para poner textos en el lado de la grafica por ejemplo climograma

#Para agregar las letras para la diferenciacion podemos utilizar la libreria multcompview

#Comprobacion y contrastes de medias con Prueba de Tukey

TukeyHSD(dap.aov)
plot(TukeyHSD(dap.aov), las =1)#S







