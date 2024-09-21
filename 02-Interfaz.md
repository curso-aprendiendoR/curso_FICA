# Interfaz de RStudio

* **Consola: ** En la consola podemos ejecutar órdenes y también es la sección en donde se mostrarán los resultados. 

<div class="figure" style="text-align: center">
<img src="./imagen/consola.png" alt="Consola de R" width="75%" />
<p class="caption">(\#fig:consola)Consola de R</p>
</div>

* **Entorno de variables: ** Si observas la imagen anterior, se ha utilizado la consola como una calculadora, sin embargo, implicitamente hemos realizado un proceso muy importante en la programación, **la asiganción**, que consiste en almacenar un valor en una variable, cuando se asigna una variable  se realiza una reserva de memoria.

Para realizar una asignación en `R` se debe tener en cuenta tres elementos:

1. El nombre de la variable
2. El operador de asignación que puede ser: <- o =
3. El datos a asignar

Practiquemos, en la consola escribiremos:


``` r
a <- 30
b = 12
```


¿Pero en donde puedo visulaizar las variables que hemos creado? 
El panel de entorno es en donde se irán guardando los objetos con los que trabajemos.

<div class="figure" style="text-align: center">
<img src="./imagen/entorno.png" alt="Entorno de R" width="75%" />
<p class="caption">(\#fig:entorno)Entorno de R</p>
</div>

* **Archivos/Plots/Ayuda: ** Este cuadrante se encuentra en la parte inferior derecha de la pantalla y tiene varios paneles, entre ellos tenemos la pestaña `Files` en donde se muestran los documentos del directorio del proyecto en donde se está trabajando actualmente. En el panel también se tiene las pestañas: `Plots` en donde se mostrarán los gráficos resultantes, `Packages` los paquetes instalados, `Hepl`en donde se podrá busrcar la documentación de las funciones.

<div class="figure" style="text-align: center">
<img src="./imagen/Archivos.png" alt="Panel de Archivos de R" width="75%" />
<p class="caption">(\#fig:Archivos)Panel de Archivos de R</p>
</div>

Además si se escribe en la consola `? Nombre de la función` se activará el panel de ayuda con la información de la función 


``` r
? read.csv
```

<div class="figure" style="text-align: center">
<img src="./imagen/ayuda.png" alt="Panel de Ayuda" width="75%" />
<p class="caption">(\#fig:ayuda)Panel de Ayuda</p>
</div>

## ¿ Y En dónde Programamos?

Recordemos que cuando hablábamos de RStudio, hacíamos el simil con el canal de comunicación, por lo que la última parte del interfaz que nos falta revisar es justamente en donde vamos a progamar. Así que abriremos un Script. Un **Script** no es más que un archivo de texto en el que se escribe las intrucciones para comunicarnos con R.

¿Podríamos comunicarnos a través de la consola? **Si** sin embargo cuando cierres RStudio, perderás todo. 

* **Vamos a abrir nuestro primer Script** haciendo click en `File<< New File<< R Script` Tras abrirlo se desplegará una cuarta ventana en donde empezaremos a trabajar. Recuerda que este archivo se puede guardar tecleando `Ctrl + s` o haciendo click en `Save current Documents`

<div class="figure" style="text-align: center">
<img src="./imagen/script.png" alt="Apertura de Script" width="75%" />
<p class="caption">(\#fig:script)Apertura de Script</p>
</div>

<div class="figure" style="text-align: center">
<img src="./imagen/scriptp2.png" alt="Script" width="75%" />
<p class="caption">(\#fig:scriptp2)Script</p>
</div>
