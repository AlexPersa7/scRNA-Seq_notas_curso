
# checar en dónde se encuentran las rutas de las librerías
.libPaths() 



# 2 Ejercicio usando usethis, here y postcards
####################################################################################
# 2.1 here
library("here") # busca la raiz del proyecto en el que se encuentre

# En ciertas ocasiones puede haber algun error, ya que puede chocar con otros paquetes 
# (como plyr). para evitar esto podemos usar here::here (que básicamente aclara que la 
# función solicitada es del paquete here)

here::here()

# Podemos checar en qué directorio nos encontramos con getwd(), si no es el que deseamos 
# podemos cambiarlo con setwd()

getwd() # regresa la path en donde nos encontramos
setwd("direccion/deseada") # nos lleva a la path indicada

# Pero con here podemos no especificar la path

getwd() # para checar en donde nos encontramos
here::here() # para checar dónde te encuentras

# A continuación ofrecemos algunos ejemplos de cómo podría emplearse here::here

# como ejemplo: vamos a guardar datos en archivo y cargarlos
a <- 1
c <- 23
save(a, c, file = here::here("datos-prueba.RData"))

# rm(a,c)
load(here::here("datos-prueba.RData"))

# creamos un directorio
dir.create(here::here("subdirectorio"), showWarnings = FALSE)
# podemos crear un archivo, indicando el subdirectorio, (en este caso el primer argumento)
file.create(here::here("subdirectorio", "nombrearchivo.txt"))
# abrimos el nuevo archivo creado
file.show(here::here("subdirectorio", "nombrearchivo.txt")) # podemos editarlo!!

# por ejemplo si quisieramos ver nuestros archivos del directorio
list.files(here::here(), recursive = TRUE)


####################################################################################

# 2.2 usethis

# usethis puede ser más amigable, por ejemplo para la creación de nuevos archivos .R es capaz de
# agruparlos en la carpeta R (dando un orden al proyecto)

usethis::use_r("notas-prueba.R") # no importando en qué path estemos



######################################################################################

# 2.3 Vinculando RStudio con Git y GitHub

install.packages(c("gitcreds", "gert", "gh")) 
# install.packages("gitcreds")
# install.packages("gert")
# install.packages("gh")

library("gitcreds")
library("gert")
library("gh")


usethis::create_github_token()
gitcreds::gitcreds_set() # aquí colocas el token (NO tu contraseña de github!!!)

usethis::edit_git_config()


