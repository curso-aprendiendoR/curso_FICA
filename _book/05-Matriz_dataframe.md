# Data Frames

Recordemos que un vector es un objeto en una sola dimensión, es decir hemos formados columnas independientes. En este capítulo formaremos datos estructurados a través de data frames.

Los data frames son un cojunto de vectores de la **misma longitud**, sin embargo, no necesariamente del mismo tipo, lo que hace que tengan una vetaja sobre las matrices que son otro tipo de dato estructuraro de R que  permiten almacenar distintas variables siempre y cuando tengan la misma longitud y el mismo tipo de dato.Esto es bastante limitante ya que en la vida real nuestros datos tendrán variables de todo tipo. Para crear data frames se utliza el comando `data.frame()` teniendo como argumento los vectores que queremos incluir, siempre separados por comas.

Crearemos una tabla de datos de la nómina de estudiantes, este data frame está compuesto por variables de tipo caracter y variable tipo numéricas. 


``` r
# Crearemos una tabla de datos de la nómina de estudiantes 

nomina_estudiantes <- data.frame(nombre= c("Ana","Lucía","Romina", "Helena", "Santiago", "Joel"), 
                                 apellido = c("Cárdenas","Yépez","Lema","Torres","Campos","López" ),
                                 edad =c(20,19,22,25,24,21))
print(nomina_estudiantes)
#>     nombre apellido edad
#> 1      Ana Cárdenas   20
#> 2    Lucía    Yépez   19
#> 3   Romina     Lema   22
#> 4   Helena   Torres   25
#> 5 Santiago   Campos   24
#> 6     Joel    López   21
```

Observemos el data frame obtenido, miramos como cada vector ha formado una columna con el encabezado asignado, supongamos que queremos cambiar el encabezado de la columna (esta acción es muy común y bastante útil), utilizaremos el comando `colnames()`.


``` r
colnames(nomina_estudiantes) <- c('Nombre','Apellido',"Edad")
nomina_estudiantes
#>     Nombre Apellido Edad
#> 1      Ana Cárdenas   20
#> 2    Lucía    Yépez   19
#> 3   Romina     Lema   22
#> 4   Helena   Torres   25
#> 5 Santiago   Campos   24
#> 6     Joel    López   21
```
Revisemos cuantas columnas y cuantas filas tenemos


``` r
ncol(nomina_estudiantes)
#> [1] 3
nrow(nomina_estudiantes)
#> [1] 6
```

De la misma manera que podemos acceder a la información de un vector, podemos hacerlo en un data frame. Recordando los siguiente `[fila,colunma]`


``` r
#Accederemos a la información de la primera fila, segunda columna
nomina_estudiantes[1,2]
#> [1] "Cárdenas"

#Seleccionar más de un elemnto del data frame
nomina_estudiantes[2,c(2,3)]
#>   Apellido Edad
#> 2    Yépez   19
nomina_estudiantes[2,c("Nombre","Apellido")]
#>   Nombre Apellido
#> 2  Lucía    Yépez
nomina_estudiantes[c(1,3),c(1,3)]
#>   Nombre Edad
#> 1    Ana   20
#> 3 Romina   22

# Información de una columna
nomina_estudiantes[,3]
#> [1] 20 19 22 25 24 21

#Podemos acceder a la información de una columan de manera rápida de la siguiente manera
nomina_estudiantes$Apellido
#> [1] "Cárdenas" "Yépez"    "Lema"     "Torres"   "Campos"  
#> [6] "López"
```

## 📝 Ejercicio

1. Agregar una columna al data frame **nomina_estudiantes** llamada calificaciones, y regristre las siguientes calificaciones finales: 8.2, 5.4, 8.0, 7.5, 7.0, 6.2. 
2. Almacene en un data frame llamado **orden_menor_a_mayor** el regristro de estudiantes según la edad. Para ordenar utilice el comando `order()` busque información en la ayudas de R.
3. Del data frame ordenado extraiga y almacene en una variable llamada **Aprobados** a las personas que obtuvieron mayor o igual a 7. **No se olvide que se aprende a programar, programando** por lo que debe pensar como codificar para que R sea quien identifique y extariga a quienes tienen más o igual a 7.
