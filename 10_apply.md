# Funciones de la familia Apply

La familia `apply` en un conjunto de funciones que nos permite ejecutar operaciones o bucles de manera más eficiente dentro de data.frames, matrices, listas o vectores. Estas funciones recorren cada elemento de una fila o una columna, según le hayamos indicado, y ejecuta la función requerida, devolviendo listas o vectores según la función `apply` aplicada.

## lapply

La función `lapply()` recorre una lista o un vector X y devuelve una **lista** con el resultado de F(x) para cada elemento.


``` r
v<- c(1,2,3,4,5)
potencia<- lapply(v,function(x) x^2)
potencia
#> [[1]]
#> [1] 1
#> 
#> [[2]]
#> [1] 4
#> 
#> [[3]]
#> [1] 9
#> 
#> [[4]]
#> [1] 16
#> 
#> [[5]]
#> [1] 25
```

Observa los resultados obtenidos, esta presentación no la hemos visto antes, los resultados de lapply se organizaron en una lista, una lista es otro tipo de organización de datos. 

## sapply

La función `sapply()` recorre una lista o un vector X y devuelve un **vector** con el resultado de F(x) para cada elemento.


``` r
v<- c(1,2,3,4,5)
potencia<- sapply(v,function(x) x^2)
potencia
#> [1]  1  4  9 16 25
```

## Practiquemos


``` r
#Funcion lapply
library(quantmod) 
AANG<- c('AMZN','AAPL','NFLX','GOOG')

calcula_rendimiento<- function(empresas,fecha_inicio,fecha_fin=Sys.Date()){
    xts_empresas <- getSymbols(empresas,src='yahoo',from=fecha_inicio, to=fecha_fin, auto.assign = F)
    df_empresas<- as.data.frame(xts_empresas)
    precio_apertura<- df_empresas[1,1]
    precio_actual<- df_empresas[nrow(df_empresas),6]
    rendimiento<- (precio_actual/precio_apertura)*100
    rendimiento
  } 
 
l_rendimiento= lapply(AANG,calcula_rendimiento,'2020-01-01','2020-12-31')
l_rendimiento
#> [[1]]
#> [1] 175.2453
#> 
#> [[2]]
#> [1] 176.7521
#> 
#> [[3]]
#> [1] 160.8678
#> 
#> [[4]]
#> [1] 129.3473

# Elijamos el mejor
# unlist, convierte la lista en vector
# recuerdas ¿qué hacía which?
AANG[which.max(unlist(l_rendimiento))] 
#> [1] "AAPL"
```

Haremos lo mismo con `sapply`. La F(x) a emplear será la misma que codificamos en la sección de lapply, por lo que solo tendremos que emplear la función `sapply`


``` r
v_rendimiento=sapply(AANG,calcula_rendimiento,'2020-01-01','2020-12-31')
v_rendimiento
#>     AMZN     AAPL     NFLX     GOOG 
#> 175.2453 176.7521 160.8678 129.3473

names(v_rendimiento[which.max(v_rendimiento)])
#> [1] "AAPL"
```

¿ Te diste cuenta que fue lo que omitimos al emplear las funciones **apply**?

## apply

La función aplly recorre un array, matriz o data frame y devuelve un vector para cada elemento con el resultado de F(x) a lo largo de la coordenada indicada. En el argumento debemos colocar tres requerimeintos:

1. La matriz, array o data frame a analizar
2. el sentido de la operación (MARGIN = 1 hará la opearción por filas, MARGIN = 2 hará la opearción por columnas)
3. La función a ejecutar

Para el ejemplo de aplicación calcularemos el índice de masa corporal de algunos Superhéroes


``` r
# Armemos el Data Frame
df_superheroes<- data.frame(Nombre= c("Batman","Superman","Wonder Woman",
                                      "Iron Man", "Capitana Marvel", "Capitán América"),
                            Peso= c(95,107,75,102,56.25,108), 
                            Estatura=c(1.87,1.90,1.83,1.85,1.80,1.87), 
                            Editorial= c("DC","DC","DC","Marvel","Marvel","Marvel"))

#Calcular IMC

calcula_metros<- function(row){
  altura<- as.numeric(row['Estatura'])
  peso<- as.numeric(row['Peso'])
  imc<-round(peso/altura^2,1)
  val<- ifelse(imc<18.5,'Bajo Peso',
               ifelse(imc<25,'Normal',
                      ifelse(imc<30,'Sobrepeso','Obesidad')))
  return(c(imc=imc,observaciones=val))
}
(imc<- apply(df_superheroes,1,calcula_metros))
#>               [,1]        [,2]        [,3]     [,4]       
#> imc           "27.2"      "29.6"      "22.4"   "29.8"     
#> observaciones "Sobrepeso" "Sobrepeso" "Normal" "Sobrepeso"
#>               [,5]        [,6]      
#> imc           "17.4"      "30.9"    
#> observaciones "Bajo Peso" "Obesidad"
(df_superheroes_imc<- cbind(df_superheroes,t(imc)))
#>            Nombre   Peso Estatura Editorial  imc
#> 1          Batman  95.00     1.87        DC 27.2
#> 2        Superman 107.00     1.90        DC 29.6
#> 3    Wonder Woman  75.00     1.83        DC 22.4
#> 4        Iron Man 102.00     1.85    Marvel 29.8
#> 5 Capitana Marvel  56.25     1.80    Marvel 17.4
#> 6 Capitán América 108.00     1.87    Marvel 30.9
#>   observaciones
#> 1     Sobrepeso
#> 2     Sobrepeso
#> 3        Normal
#> 4     Sobrepeso
#> 5     Bajo Peso
#> 6      Obesidad

# Calcular el peso medio por editorial
# split divide el data frame en función de grupos
l_superheores<- split(df_superheroes_imc,df_superheroes_imc$Editorial)
mean(l_superheores[['DC']]$Peso)
#> [1] 92.33333
mean(l_superheores[['Marvel']]$Peso)
#> [1] 88.75
```
