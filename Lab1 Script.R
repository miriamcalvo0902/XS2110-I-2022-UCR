#XS-2110 Métodos Estadísticos. Escuela de Estadística, UCR
#Laboratorio I. Introducción a R


#¿Qué es R y cómo se obtiene?
#R es un software libre especializado para el análisis estadístico. Al ser un lenguaje de 
#programación permite a los usuarios crear sus propias funciones de acuerdo a cada necesidad.
#Se descarga de http://cran.r-project.org/
#También pueden descargar RStudio de https://www.rstudio.com/ 

#¿Cómo funciona R? -Aspectos a considerar 

#1.  R es un programa que se desarrolla continuamente, tiene un conjunto de "paquetes" básicos
#(integrados), sin embargo,la mayoría de paquetes que estan diseñados con características 
#y funciones específicas. Estos paquetes deben instalarse de manera independiente.

#2.  R es un programa orientado a objetos ya que tanto las variables como las salidas o resultados, 
#las funciones, los datos, vectores, etc., se guardan como objetos con un nombre específico y 
#ademas, se almacenan en la memoria activa de R y no como archivos temporales. 

#3.  Los objetos que se almacenan una vez van a mantenerse activos a menos de que se eliminen o
#se reinicie la sesion siempre es necesario chequear que no existan objetos activos 

objects()  #vemos los objetivos activos
rm()  #eliminamos todo
rm(list=ls())

#4.  Comentarios "#"

#5.  Ejecutar comandos "Run" o "Ctrl + R"
#6.  Ayuda de R "help(nombre.del.comando)" o "?nombre.del.comando"

help(matrix)
?matrix

#6.  Nombres de objetos: usar puntos entre palabras, no usar mayusculas, ni caracteres especiales

#7.  Asignar un nombre a un objeto "<-"  o  "="

##############################################################################################################################


#Instalando paquetes. Hay dos formas:

#1. Descargar el paquete en un .zip e instalarlo "manualmente" 
#2. Descarga "online" 

install.packages("car")

#es común encontrar que los paquetes dependen de otros, estan relacionados o se recomieda su instalación,
#podemos solicitar que se instale todo lo necesario y lo recomendado

install.packages("car", dependencies = TRUE)

#Se puede instalar varios paquetes al mismo tiempo:

install.packages(c("dataframes2xls", "faraway", "rio", "MASS", "carData"))


#Siempre, sea cual sea el método, si se quiere usar, es necesario llamar a las librerías con el comando:
library(car)

library(dataframes2xls)
library(faraway)
library(rio)
library(MASS)
library(carData)


#   instalar los siguientes paquetes:

#car (métodos estadísticos útiles)
#dataframes2xls (data frames a Excel)
#faraway (métodos estadísticos útiles)
#foreign (convertir a R bases de datos de SPSS, SAS, SYSTAT, STATA, etc.)
#MASS (técnicas estadísticas)


#Operaciones aritmeticas basicas 

#sumar, restar, multiplicar, dividir 

((8+10-3)/3)*5

#suma
8+10

#resta 

(18)-3

#division 
15/3

#multiplicacion

5*5



#crear objetos

x<-8+10
x



#que se puede hacer con los objetos?

x-3

y<- x-3

x+y

#potencias
15**2
15^2

y^2



#raiz 

sqrt(8)  #esta es la raíz de 8

sqrt(y)

y**.5
#Operaciones estadisticas basicas 

mean()
var()
sd()   #sd es la desviación estándar


##Tipos de datos en R 

#1. Vectores 
#2. Matrices
#3. Hojas de datos (data frames)
#4. Listas

##contar el numero de elementos de un objeto 

length() # number of elements or components

##que tipo de dato es: numerico, categorico, 
class()  #

#cambiar tipos de datos 

as.matrix() 
as.factor() ##Variable cualitativa
as.numeric()##Variable cuantitativa

class(x)
x<-as.factor(x)
x
class(x)

##nombres de los objetos (etiquetas) 
names()  
names(x)

##eliminar objetos

remove(y)




######################################################################################## 
#Se pueden generar arreglos de datos ("data arrays") con la función "c()"

peso<-c(60, 72,  57, 90, 95, 72)

peso
length(peso)

#Y después se pueden realizar operaciones con los arreglos de datos, así 
#como aplicarles funciones


sum(peso)  #da la suma de los elementos del arreglo peso

altura<- c(1.75, 1.80, 1.65, 1.90, 1.74, 1.91)

indice.masa.corporal<-peso/altura^2

indice.masa.corporal   

round(indice.masa.corporal,1)   #limitar el numero de decimales a 1 


peso.promedio<-sum(peso)/length(peso)
peso.promedio
mean(peso)

#La función length() indica el tamaño del objeto, es decir, la cantidad 
#de elementos que lo componen.

length(altura)
length(peso)
cor(altura,peso) 
cor(altura,peso.promedio)  #diferente dimension
length(peso.promedio)

#La función mean() calcula directamente el promedio
peso.promedio<-mean(peso)
peso.promedio


#También se pueden hacer arreglos en forma de matriz:
pesoaltura<- rbind(peso, altura)
pesoaltura

pesoaltura<- cbind(peso, altura,indice.masa.corporal)
pesoaltura


#Nótese que como son arreglos de datos, el rbind produce la transpuesta 
#de cbind.  Esto no pasaría si los consideramos como matrices y vectores
#como vamos a ver.

#Con as.matrix() se define un objeto como matriz
pesoaltura2<- as.matrix(pesoaltura)
pesoaltura2

#La función dim() devuelve las dimensiones de la matriz
dim(pesoaltura2)


peso2<- as.matrix(peso)
altura2<- as.matrix(altura)

dim(peso2)
dim(altura2)

pesoaltura3<- as.matrix(rbind(peso2,altura2))
dim(pesoaltura3)
pesoaltura3



#Otras formas de crear arreglos de datos son con los siguientes comandos 

seq(4,9)  #  Crea un arreglo con 6 números: 4,5,6,7,8,9


#Esto también se puede conseguir con 

4:9

seq(4,9,2)
#También con el comando rep

rep(1,10)  # Crear 10 unos

rep(0:1, c(10,5))  #  Crear 10 ceros seguidos por 5 unos




#También se pueden "llamar" a subconjuntos de los arreglos de datos
#utilizando indexación

peso

peso[2]  #Se busca el peso en la posición 2

peso[2:4]

peso[c(1,3,6)]

pesoaltura2

pesoaltura2[2:4,1]
pesoaltura2[2:4,]

pesoaltura2[,2:3]

pesoaltura2[4,1]

#O alternativamente, eliminar entradas de los arreglos de datos
peso
peso[-3]

peso>85
which(peso>85)

#Veremos operaciones matriciales más adelante en el curso


######Convertir matrices en bases de datos (data.frame) #######
#########e importar bases de datos######

pesoaltura<- cbind(peso, altura,indice.masa.corporal)
pesoaltura

antropo<-data.frame(pesoaltura)
names(pesoaltura)
names(antropo)


antropo
pesoaltura    # Nótese las diferencias entre ambas


names(antropo)

# "$"es la forma de estrer solo una variable de un data frame y trabajar sobre ella 

antropo$peso
antropo$altura
antropo$indice.masa.corporal



#Podemos crear variables en las que recodificamos alguna variable existente
library(carData)
library(car)
obeso=recode(antropo$indice.masa.corporal, 'lo:29.99999=0; 30:hi=1')

obeso2=ifelse(antropo$indice.masa.corporal<30,0,1)

obeso3=1*(antropo$indice.masa.corporal>=30)
obeso
obeso2
obeso3

#Se debe actualizar la base de datos para agregar obeso
##antropo=data.frame(cbind(antropo,obeso)) 
antropo$obeso2<-obeso2
antropo

names(antropo)
antropo

antropo=data.frame(antropo[,1:4])
antropo

antropo2=data.frame(antropo[,1:3])
antropo2


#También podemos seleccionar datos

antropo$peso[antropo$obeso==1]  
#  Notese el doble signo de igual "==" para los condicionales


#Para hacer análisis estadístico es conveniente "llamar" 
#al data frame con el comando attach() (entonces ya no necesitamos escribir antropo$peso)

attach(antropo)

peso[obeso2==1]




#Para guardar datos, tenemos dos formas:
#1. especificando directamente, dentro del comando "save" el directorio de trabajo 

save(antropo, file='C:/Users/Gilbert BC/Documents/Teletrabajo/Metodos 2020/Metodos 2020/Laboratorios/Labo 1/antropo1.RData')

#2. especificando  desde el inicio el directorio de trabajo, para que todo lo que se haga, 
#se guarde ahi (recomendado)

setwd("C:/Users/Gilbert BC/Documents/Teletrabajo/Metodos 2020/Metodos 2020/Laboratorios/Labo 1/")

save(antropo, file= "data.RData")


############Utilizar bases de datos de otros software ################


#Con el paquete foreign se pude llamar bases de datos de otro software.
#Con el siguiente podrán traerse una base de datos de SPSS.

#install.packages('rio', dependencies = TRUE)

library(rio)
library(foreign)

#asignamos un nombre "basenuevaspss"
#especificamos el lugar en donde se encuentra

basenuevaspss=read.spss('antropomexicano.sav', to.data.frame=TRUE)
names(basenuevaspss)
#Es importante agregar el argumento "to.data.frame=T" para que lea 
#adecuadamente los datos .sav

#Como ya tenemos un directorio de trabajo especificado, solamente lo guardamos

save(basenuevaspss,file= 'basenuevaspss.Rdata')


#En el lugar en donde especificaron el directorio de trabajo esta el archivo
#pueden abrirlo de ahi mismo (con doble click), pero se abrira en R no en RStudio. 
#lo podemos abrir desde aqui escribiendo el nombre de la base

basenuevaspss

#Como el archivo tiene muchas observaciones, se pueden ver solamente
#las primeras con el comando head():

head(basenuevaspss)

#Se pueden obtener únicamente los nombres de las variables con:

names(basenuevaspss)

#o mejor, ver el archivo en otra ventana 

View(basenuevaspss)
