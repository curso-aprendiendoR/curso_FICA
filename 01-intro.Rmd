# (PART) Antes de Empezar {-}

# Instalación

## ¿Qué es R y Rstudio?

R es un software **libre** especializado en la estadística y el análisis de datos; además es importante tener presente que R es un **lenguaje de programación**, es decir es nuestro idioma, nuestro español, con el que lograremos comunicarnos con el computador.

La estructura de código abierto y la facilidad de compartir es una ventaja que permite tener flexibilidad y personalización, facilitando el desarrollo de paquetes y extensiones que amplían las capacidades de R.

Ahora si decimos que R es el idioma que permite la comunicación, y que nuestra comunicación será escrita nos preguntaremos: ¿Cuál es el canal que nos permitirá comunicarnos? De la misma manera que el mismo texto en español puede ser escrito en una carta, un correo, un mensaje de texto, en programación se puede usar diferentes **entornos de desarrollo integrado IDE**, siendo nuestro IDE **RStudio**.

## ¿Cómo los Instalo?

Recuerda que tanto para instalar R, RStudio y algunos paquetes se necesita conexión a internet.

### Empezaremos instalando R

1. Para instalar R hay que ingresar en <https://cran.r-project.org/> y seleccionar la instalación acorde al sistema operativo que uses.

2. Para sistemas operativos **Windows**, hacer clik en `install R for the first time`

3. En la siguiente pantalla hacer click en `Download R for Windows`. Actualmente la última versión disponible es: R-4.4.1 y solo se encuentra disponible para 64 bit. 

4. Una vez se haya descargado el instalador, lo ejecutamos haciendo doble click y seguimos los pasos de instalación predeteminados.


### Instalación de RStudio

1. Para instalar RStudio debe ingresar en <https://posit.co/download/rstudio-desktop/#download> y hacer click en `Download RStudio Desktop for Windows`

2. Después de descargar el instalador, lo ejecutamos haciendo doble click y seguimos los pasos de instalación predeteminados.

3. Finalmente, tras la instalación tendrás en el escritorio o en su defecto podrás buscar en la barra de tareas RStudio y estamos listos para empezar.

**Recuerda que aunque no vayamos a usar la consola de R; RStudio no se ejecutará a menos que hayas instalado previamente R**

Les dejo un video recopilado de Youtube, que puede servirles si aún no pueden intalar R y Rstudio

<div>
<p style = 'text-align:center;'>
<iframe width="560" height="315" src="https://www.youtube.com/embed/hbgzW3Cvda4?si=JFL_hIChsx7KEltc" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
</div>
</p>

## Intalación de Paquetes

Cuando Instalamos R y Rstudio, se instalan 7 paquetes básicos con las funciones mínimas para poder operar. Sin embargo, recordemos que **R es un software libre**, por lo que existen códigos hechos por otros usuarios y validados por el equipo de CRAN, a este conjunto de funciones, datos y documentación sobre las funciones se les llama **paquetes o librerías** y podrán ser instalados según las necesidades. 
Actualmente existen 21254 paquetes que incrementan las potencialidades de R.

Para ocupar una librería de R debe descargarse mediante `install.packages("nombre de la librería")`, este proceso se realizará una sola vez. Una vez instalada la librería, debemos decirle a R que queremos utilizarla con `library("nombre de la librería")`. Recuerda que siempre que inicies sesión será necesario acudir a la librería nuevamente.

