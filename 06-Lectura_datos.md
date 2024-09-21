# Lectura de Datos

En este capítulo revisaremos una tabla de datos extensa de la cual obtendremos varios resultados con varias herramientas que ya conocemos y algunas nuevas

R contiene una librería con datos reales que pueden ser usados, para acceder a ella debemos instalar el paquete **datasets** y escribir el comando `datasets::`y pulsar el tabulador; esta librería te será muy útil para practicar. 

En esta clase no utilizaremos los datos de la librería de `R`, sino que cargaremos un documento tipo csv de datos de becarios del SENECYT.

Para cargar datos csv en `R` escribimos el comando `read.csv()`, en el argumento colocaremos el directorio del archivo, sin embargo si el archivo se encuentra en la misma carpeta del proyecto basta con colocar el nombre del archivo y la extensión del mismo. 

Ahora si el archivo de datos es de tipo **xlsx** primero deberás instalar el paquete `readxl` y ejecutar el comando `read_excel()`


``` r
#Carguemos y almacenemos el archivo
incendio<- read.csv("./documentos/maate_incendio.csv")
```

Si queremos observar la tabla de datos podemos acceder a través del panel de entorno o con el comando `View()`


``` r
View(incendio)
```

Si quisiéramos ver parcialmente la información que tenemos podemos visualizar las 6 primeras filas de datos con el comando `head()`, también podemos visualizar las 6 últimas filas con el comando `tail()`.


``` r
# Visualización de las 6 primeras filas de datos
head(incendio)
#>   ANIO_REPORT DPA_PROVIN PROVINCIA DPA_CANTON  CANTON
#> 1        2022         17 PICHINCHA       1701   QUITO
#> 2        2022         17 PICHINCHA       1701   QUITO
#> 3        2022         17 PICHINCHA       1701   QUITO
#> 4        2022         17 PICHINCHA       1702 CAYAMBE
#> 5        2022         11      LOJA       1101    LOJA
#> 6        2022          7    EL ORO        705  CHILLA
#>   DPA_PARROQ PARROQUIA            EVENTO CAT_EVENTO
#> 1     170175      PIFO INCENDIO FORESTAL  Antropico
#> 2     170175      PIFO INCENDIO FORESTAL  Antropico
#> 3     170175      PIFO INCENDIO FORESTAL  Antropico
#> 4     170252  CANGAHUA INCENDIO FORESTAL  Antropico
#> 5     110151  CHANTACO INCENDIO FORESTAL  Antropico
#> 6      70550    CHILLA INCENDIO FORESTAL Epoca seca
#>   ALERTA_FECHA MES NIVEL_INF CALIF_EVEN CAT_CRUCE
#> 1    9/19/2021   9   Nivel 1    Nivel 1       aph
#> 2    9/10/2021   9   Nivel 1    Nivel 1       aph
#> 3    9/24/2021   9   Nivel 1    Nivel 1       aph
#> 4    9/23/2021   9   Nivel 2    Nivel 2       aph
#> 5    9/14/2021   9   Nivel 3    Nivel 1       bvp
#> 6    8/27/2021   8   Nivel 3    Nivel 2       bvp
#>                                NAM AREA_HA
#> 1                 PONCE PALUGUILLO      10
#> 2                 PONCE PALUGUILLO     100
#> 3                 PONCE PALUGUILLO      10
#> 4                          KAYAMBI      20
#> 5 CUENCA DEL RIO MALACATOS EN LOJA     140
#> 6                          CASACAY     140

#Visualización de las últimas 6 filas y columnas 7, 9 y 16
tail(incendio[,c(7,9,16)])
#>     PARROQUIA CAT_EVENTO AREA_HA
#> 58  SAN JOSE   Antropico    1230
#> 59 SAN MIGUEL  Antropico      10
#> 60 SAN MIGUEL  Antropico    1500
#> 61    CAYAMBE  Antropico     100
#> 62     TUFINO  Antropico     750
#> 63     TUFINO  Antropico     750
```

El comando `summary()` es una excelente manera de hacer una inspección inicial de una base de datos, este comando permite obtener un resumen de la información a través de un reporte de estadística descriptiva


``` r
summary(incendio)
#>   ANIO_REPORT     DPA_PROVIN      PROVINCIA        
#>  Min.   :2022   Min.   : 1.000   Length:63         
#>  1st Qu.:2022   1st Qu.: 3.000   Class :character  
#>  Median :2022   Median : 9.000   Mode  :character  
#>  Mean   :2022   Mean   : 9.651                     
#>  3rd Qu.:2022   3rd Qu.:17.000                     
#>  Max.   :2022   Max.   :18.000                     
#>                                                    
#>    DPA_CANTON      CANTON            DPA_PARROQ    
#>  Min.   : 101   Length:63          Min.   : 10154  
#>  1st Qu.: 302   Class :character   1st Qu.: 30252  
#>  Median : 901   Mode  :character   Median : 90112  
#>  Mean   : 967                      Mean   : 96747  
#>  3rd Qu.:1701                      3rd Qu.:170160  
#>  Max.   :1808                      Max.   :180856  
#>                                                    
#>   PARROQUIA            EVENTO           CAT_EVENTO       
#>  Length:63          Length:63          Length:63         
#>  Class :character   Class :character   Class :character  
#>  Mode  :character   Mode  :character   Mode  :character  
#>                                                          
#>                                                          
#>                                                          
#>                                                          
#>  ALERTA_FECHA            MES          NIVEL_INF        
#>  Length:63          Min.   : 2.000   Length:63         
#>  Class :character   1st Qu.: 8.000   Class :character  
#>  Mode  :character   Median : 9.000   Mode  :character  
#>                     Mean   : 8.683                     
#>                     3rd Qu.:10.000                     
#>                     Max.   :12.000                     
#>                                                        
#>   CALIF_EVEN         CAT_CRUCE             NAM           
#>  Length:63          Length:63          Length:63         
#>  Class :character   Class :character   Class :character  
#>  Mode  :character   Mode  :character   Mode  :character  
#>                                                          
#>                                                          
#>                                                          
#>                                                          
#>     AREA_HA      
#>  Min.   :  10.0  
#>  1st Qu.:  10.0  
#>  Median :  10.0  
#>  Mean   : 112.7  
#>  3rd Qu.:  30.0  
#>  Max.   :1500.0  
#>  NA's   :4
```

Ahora revisemos la dimensión de la tabla de datos `dim()`. ¿Cuántos registos tengo (número de filas) `nrow()` y cuantas variables registradas (número de columnas) `ncol()`? y ¿si quiesiera saber el nombre de las variables `colnames()`?


``` r
dim(incendio)
#> [1] 63 16
nrow(incendio)
#> [1] 63
ncol(incendio)
#> [1] 16
colnames(incendio)
#>  [1] "ANIO_REPORT"  "DPA_PROVIN"   "PROVINCIA"   
#>  [4] "DPA_CANTON"   "CANTON"       "DPA_PARROQ"  
#>  [7] "PARROQUIA"    "EVENTO"       "CAT_EVENTO"  
#> [10] "ALERTA_FECHA" "MES"          "NIVEL_INF"   
#> [13] "CALIF_EVEN"   "CAT_CRUCE"    "NAM"         
#> [16] "AREA_HA"
```

Ahora modifiquemos nuestro data frame de ejemplo para dejar únicamente las variables más relevantes

Vamos a eliminar todos los datos de la operadora y practicaremos varias maneras de realizarlo.


``` r
# Vamos con la más sencilla
incendio<- incendio[,-11]
```

Ahora practicaremos un comando de mucha utilidad `which()` este comando nos permite encontrar índices (es decir el número de orden) correspondientes a variables que cumplan con ciertas caracteríticas.


``` r
which(colnames(incendio)=="DPA_PROVIN")
#> [1] 2

#Ahora vamos a eliminar esta columna
#Primero almacenaré el índice de la variable a eliminar
borrar<- which(colnames(incendio)=="DPA_PROVIN")
#Ahora eliminamos la columna DPA_PROVIN
incendio<- incendio[,-borrar]
```

Ahora eliminaremos las columnas que en el nombre tengan la palabra OPERADORA. Utilizaremos el comando `grepl()`, este comando busca comulnas con una caracteritica especifica, en el argumento colocaremos dos items:
1. El patrón a buscar
2. En donde buscarmenos el patrón

**grepl** nos dará como resultado una veariable lógica indicándonos si cumple o no con la condición. Si observas bien el caso en el que borramos la columna TIPO_OPERADORA, te darás cuenta que antes de encontrar el índice encontramos un valor lógico. De manera similar realizaremos este caso


``` r
#Vamos paso a paso
#Primero obtendremos la variable lógica 
grepl("dpa", colnames(incendio), 
      ignore.case =TRUE)
#>  [1] FALSE FALSE  TRUE FALSE  TRUE FALSE FALSE FALSE FALSE
#> [10] FALSE FALSE FALSE FALSE FALSE
#He colocado un tercer item para indicar que no considere mayúsculas y minúsculas

#Ahora buscaremos el indicador y lo almacenaremos
borrar_2<- which(grepl("dpa",colnames(incendio), ignore.case = TRUE))

#Finalmente lo eliminaremos
incendio<- incendio[,-borrar_2]

#Hasta ahora el data frame se ve así
head(incendio)
#>   ANIO_REPORT PROVINCIA  CANTON PARROQUIA            EVENTO
#> 1        2022 PICHINCHA   QUITO      PIFO INCENDIO FORESTAL
#> 2        2022 PICHINCHA   QUITO      PIFO INCENDIO FORESTAL
#> 3        2022 PICHINCHA   QUITO      PIFO INCENDIO FORESTAL
#> 4        2022 PICHINCHA CAYAMBE  CANGAHUA INCENDIO FORESTAL
#> 5        2022      LOJA    LOJA  CHANTACO INCENDIO FORESTAL
#> 6        2022    EL ORO  CHILLA    CHILLA INCENDIO FORESTAL
#>   CAT_EVENTO ALERTA_FECHA NIVEL_INF CALIF_EVEN CAT_CRUCE
#> 1  Antropico    9/19/2021   Nivel 1    Nivel 1       aph
#> 2  Antropico    9/10/2021   Nivel 1    Nivel 1       aph
#> 3  Antropico    9/24/2021   Nivel 1    Nivel 1       aph
#> 4  Antropico    9/23/2021   Nivel 2    Nivel 2       aph
#> 5  Antropico    9/14/2021   Nivel 3    Nivel 1       bvp
#> 6 Epoca seca    8/27/2021   Nivel 3    Nivel 2       bvp
#>                                NAM AREA_HA
#> 1                 PONCE PALUGUILLO      10
#> 2                 PONCE PALUGUILLO     100
#> 3                 PONCE PALUGUILLO      10
#> 4                          KAYAMBI      20
#> 5 CUENCA DEL RIO MALACATOS EN LOJA     140
#> 6                          CASACAY     140
```

Recordemos que cuando observamos el resumen de variables nos indicaba que la fecha es tipo caracter, vamos a cambiar a tipo fecha, agregaremos una columna de hora que importaremos de un archivo csv y uniremos estas dos variables en una sola columna. Aquí practicaremos como agregar una nueva columna al data frame, uniremos dos datos en una sola columna, transformaremos a fecha y eliminaremos las columnas que ya han sido unificadas.


``` r
#cargamos un archivo tipo csv en un nuevo data frame
Hora<-read.csv("./documentos/hora.csv", header = FALSE)
#Unimos dos data frame
incendio<- cbind(incendio,Hora)
#Cambiamos el nombre de la columna agregada
colnames(incendio)[13]<- "ALERTA_HORA"
incendio$Fecha_Hora<-paste(incendio$ALERTA_FECHA, incendio$ALERTA_HORA)
incendio$Fecha_Hora<- as.POSIXct(incendio$Fecha_Hora, format= "%m/%d/%Y %H:%M:%OS")
#Borraremos las columnas que ya no necesitamos
incendio<- incendio[,which(!grepl("ALERTA",colnames(incendio)))]
```

Observe que cuando eliminamos las columnas de fecha y hora, a la estructura le agregamos **!** y si somos observadores también identificaremos que quitamos **-**; esto se debe a que el signo **!** es utilizado como negación.

¿Cómo ha quedado el data frame hasta el momento?


``` r
head(incendio)
#>   ANIO_REPORT PROVINCIA  CANTON PARROQUIA            EVENTO
#> 1        2022 PICHINCHA   QUITO      PIFO INCENDIO FORESTAL
#> 2        2022 PICHINCHA   QUITO      PIFO INCENDIO FORESTAL
#> 3        2022 PICHINCHA   QUITO      PIFO INCENDIO FORESTAL
#> 4        2022 PICHINCHA CAYAMBE  CANGAHUA INCENDIO FORESTAL
#> 5        2022      LOJA    LOJA  CHANTACO INCENDIO FORESTAL
#> 6        2022    EL ORO  CHILLA    CHILLA INCENDIO FORESTAL
#>   CAT_EVENTO NIVEL_INF CALIF_EVEN CAT_CRUCE
#> 1  Antropico   Nivel 1    Nivel 1       aph
#> 2  Antropico   Nivel 1    Nivel 1       aph
#> 3  Antropico   Nivel 1    Nivel 1       aph
#> 4  Antropico   Nivel 2    Nivel 2       aph
#> 5  Antropico   Nivel 3    Nivel 1       bvp
#> 6 Epoca seca   Nivel 3    Nivel 2       bvp
#>                                NAM AREA_HA
#> 1                 PONCE PALUGUILLO      10
#> 2                 PONCE PALUGUILLO     100
#> 3                 PONCE PALUGUILLO      10
#> 4                          KAYAMBI      20
#> 5 CUENCA DEL RIO MALACATOS EN LOJA     140
#> 6                          CASACAY     140
#>            Fecha_Hora
#> 1 2021-09-19 01:15:12
#> 2 2021-09-10 16:20:21
#> 3 2021-09-24 10:28:11
#> 4 2021-09-23 05:21:08
#> 5 2021-09-14 17:13:52
#> 6 2021-08-27 18:33:30

summary(incendio)
#>   ANIO_REPORT    PROVINCIA            CANTON         
#>  Min.   :2022   Length:63          Length:63         
#>  1st Qu.:2022   Class :character   Class :character  
#>  Median :2022   Mode  :character   Mode  :character  
#>  Mean   :2022                                        
#>  3rd Qu.:2022                                        
#>  Max.   :2022                                        
#>                                                      
#>   PARROQUIA            EVENTO           CAT_EVENTO       
#>  Length:63          Length:63          Length:63         
#>  Class :character   Class :character   Class :character  
#>  Mode  :character   Mode  :character   Mode  :character  
#>                                                          
#>                                                          
#>                                                          
#>                                                          
#>   NIVEL_INF          CALIF_EVEN         CAT_CRUCE        
#>  Length:63          Length:63          Length:63         
#>  Class :character   Class :character   Class :character  
#>  Mode  :character   Mode  :character   Mode  :character  
#>                                                          
#>                                                          
#>                                                          
#>                                                          
#>      NAM               AREA_HA      
#>  Length:63          Min.   :  10.0  
#>  Class :character   1st Qu.:  10.0  
#>  Mode  :character   Median :  10.0  
#>                     Mean   : 112.7  
#>                     3rd Qu.:  30.0  
#>                     Max.   :1500.0  
#>                     NA's   :4       
#>    Fecha_Hora                    
#>  Min.   :2021-02-13 06:49:19.00  
#>  1st Qu.:2021-08-05 07:44:18.00  
#>  Median :2021-09-09 13:35:15.00  
#>  Mean   :2021-09-05 18:19:12.97  
#>  3rd Qu.:2021-10-06 14:08:17.50  
#>  Max.   :2021-12-28 18:28:36.00  
#> 
```

Al observar el resumen del data frame, observamos que el la columna de área tenemos a NA, estos casilleros no tiene datos. Ahora supongamos que queremos eliminar las filas que no tienen datos de área afectada. (Ojo: No siempre se deberá borrar las filas que no tienen datos, dependerá del análisis que se quiera hacer)


``` r
incendio<- na.omit(incendio)
```

Para el manejo de data frame tenemos una herramienta muy potente: la función `subset()`. Dicha función permitir seleccionar filas y columnas a la vez, de la siguiente manera: 

**x**: Data frame de entrada.
**subset**: condición lógica que queramos usar para seleccionar las filas.
**select**: un vector que contenga el nombre de las columnas que queremos seleccionar (este argumento es necesario si queremos filtrar filas y columnas).

En nuestro ejemplo vamos a buscar datos de la provincia y el cantón que tengan área de afectación mayor a 5 kilómetros cuadraros y que estas áreas afectadas sean parte del Sistema Nacional de Áreas Protegidas snap. 


``` r
#Primero pasameros de HA a km2

incendio$AREA_KM2 = incendio$AREA_HA * 0.01

#Ahora obtenemos los datos solicitados

subset(incendio, subset = AREA_KM2 > 5 & CAT_CRUCE == "snap", select = c(PROVINCIA, CANTON))
#>     PROVINCIA              CANTON
#> 56     GUAYAS           GUAYAQUIL
#> 58 TUNGURAHUA SANTIAGO DE PILLARO
#> 60   COTOPAXI             SALCEDO
#> 62     CARCHI              TULCAN
```


## 📝 Ejercicio

Del paquete `datasets` almacene el conjunto de datos llamado **airquality** y obtenga los siguientes resultados. (Recuerde utilizar las herramientas que hemos aprendido, tambíen puede buscar otro camino, pero siempre a través de codificación)

1. En un data frame llamado **calidad_mayo** extraiga las 6 variables medidas para el mes de mayo. 
2. Elimine del data frame **calidad_mayo** las filas que contengan NA en cualquiera de las variables
3. De la información que le quedó en **calidad_mayo** alamacene unicamente las filas en donde la velocidad el viento sea mayor a 10 y la temperatura menor a 70.
4. Calcule cuantas filas quedaron descartadas después de depurar la información de mayo. 
5. Traduzque y Cambie los nombres de las columnas del data frame final de **calidad_mayo**
6. Añada a los datos de mayo una columna con la fecha completa (recuerde que todas las observaciones son del año es del año 1973)
