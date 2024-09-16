# (PART) Primeros Pasos: Variables y Lectura de Datos {-}

# Variables 

¿Con qué tipo de datos podemos trabajar?

R es un lenguaje de programación y entorno de desarrollo especializado en análisis estadístico, por lo que todo proceso lo basaremos en torno a variables matemáticas, sin embargo recordemos que una variable matemática puede ser un valor **numérico** o un valor **no numérico**. Por lo que en este capítulo se describirá diferentes tipo de variables que será de utilidad más adelante.

## Variables Numéricas

Las variables numéricas, son aquellas que representan números, sean entero como **edad** o decimales como la **estatura** y con ellas se pueden realizar operaciones aritméticas.

Con los datos numéricos podemos realizar todas las operaciones matemáticas como: sumar (+), restar (-), multiplicar (*), dividir (/), obtener el resto de la división %%, la raíz cuadrada sqrt(), el valor absoluto abs(), obtener una potencia (^), etc.


``` r
## Asignando las variables

a <- 5
b <- -2

#Suma - Resta - Multiplicación

a + b
#> [1] 3
a - b
#> [1] 7
a*b
#> [1] -10

#División

a/b
#> [1] -2.5
a%/%b
#> [1] -3
a%%b
#> [1] -1

#Potencia y raíz

a^2
#> [1] 25
sqrt(b)
#> Warning in sqrt(b): NaNs produced
#> [1] NaN

# NaN es un número que no está definido

sqrt(abs(b))
#> [1] 1.414214
```

## Variable de tipo caracter (texto)

Dentro de las variables no numéricas, se encuentran las variables cualitativas, por ejemplo, el nombre de una persona o su estado civil.


``` r
#Asignemos variables de tipo texto
nombre = "Lucía"
apellido <- "Álvarez"
```

Las variables ya están asignadas, y se pueden observar en el panel de entorno, pero no observamos ningún resultado. Vamos a imprimir el resultado y utilizaremos la función `print()`. 


``` r
#Impresión de resultados

print(nombre)
#> [1] "Lucía"
```

Las cadenas de texto son un tipo especial de dato, que no puede ser operada aritméticamente ya que no son datos numéricos, sin embargo se puede concatenar diferentes variables o varias cadenas de texto.
Una de las opciones para concatenar es la función `paste()`.


``` r
# Practiquemos
edad <- 31
paste(nombre, apellido,"tiene", edad, 'años')
#> [1] "Lucía Álvarez tiene 31 años"
```

Por default esta función agrega espacio por separador, sin embargo se puede configurar agregado `,sep="(el separador deseado)"`


``` r
paste(nombre, apellido,"tiene", edad, 'años', sep = "-")
#> [1] "Lucía-Álvarez-tiene-31-años"
```

## Variables Lógicas o Booleanas

A la pregunta **¿usted tiene hermanos?**, la respuesta será un variable lógica. Si tiene hermanos la respuesta será `TRUE` y `FALSE` si no tiene hermanos.


``` r
a < 8
#> [1] TRUE
b == 12
#> [1] FALSE

#Hagamos otro ejemplo

#Vamos a crear una secuencia y después comprobaremos si un número está contenido en la secuencia

c <- 3:10
6%in%c
#> [1] TRUE

# A la misma secuencia le preguntaremos si alguno de los elementos es 2

all(c == 2)
#> [1] FALSE
```

Si tuvieramos dudas del tipo de variable con la que estamos trabajando podemos recurrir al comando `class()` 


``` r
class(a)
#> [1] "numeric"
class(nombre)
#> [1] "character"
```

## Fechas

Uno de los tipos de datos a los que tal vez tengamos que enfrentarnos es a las **fechas**. Si observamos: `16-09-2024` podemos facilmente comprender que estamos hablando de un día, mes y año específico, es decir un instante en el tiempo con el que podríamos operar, podríamos sumar un día o restar un mes y seguir sabiendo que tenemos una fecha en concreto.
Sin embargo para R `16-09-2024` esto es una cadena de texto que no tiene el mismo significado que nosotros le hemos dado 


``` r
fecha<- "2024-09-16"
class(fecha)
#> [1] "character"

#Sumemos un día es decir 86400 segundos
fecha + 86400
#> Error in fecha + 86400: non-numeric argument to binary operator
```

Entonces es necesario convertir una cadena de texto en **Fecha**, que aunque la seguiremos visualizando como un texto `R` la almacenará como un número, el número de segundos transcurridos desde el 1 de enero de 1970. Para realizar esta transformación solo se requiere del comando `as.POSIXct()` o como lista con el comando `as.POSIXLT()`


``` r
f<- as.POSIXct("2024-09-16 10:20")
print(f)
#> [1] "2024-09-16 10:20:00 -05"
f + 86400
#> [1] "2024-09-17 10:20:00 -05"
```

y ¿qué sucede si tengo mi fecha en otro formato? `R` no te entenderá y tendremos que explicarle cual es el formato que hemos ingresado

``` r
# Ingresaré la fecha en el formato: día/año/año
as.POSIXct("16/09/2024")
#> [1] "0016-09-20 LMT"

#¿Cómo hago que R me comprenda?

as.POSIXct("16/09/2024", format = "%d/%m/%Y")
#> [1] "2024-09-16 -05"
```

Una fecha se puede expresar de muchos formatos, y cada uno se codifica de manera diferente, puedes acceder a las ayudas de `R` para encontrar el formato que requieras `?as.POSIXct`

Tanto as.POSIXct, como as.POSIXlt, se encuentran dentro de los paquetes básicos de `R`, sin embargo también se cuenta con el paquete `{lubridate}` con diferentes funciones para trabajar con fechas. 

## 📝 Ejercicio

* El fin de semana salió a comer a un restaurante en donde la comida le costó $16, para obtener el valor total debe agregarle el impuesto del valor agregado del 15% y 5% de servicios y propina.

1. Almacene en una variable llamada **total** el valor total cancelado.
2. Imprima la frase: **La comida ha costado: **
3. Si usted salió de su casa con $25, imprima una cadena de texto que exprese cuánto dinero le sobró

* Calcula los días y años que han pasado desde la fecha de tu cumpleaños hasta el día de hoy.
