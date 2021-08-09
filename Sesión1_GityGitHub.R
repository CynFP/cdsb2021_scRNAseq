# se descargó previamente, así que solo se carga
library("here") # busca la raiz del proyecto en el que se encuentre
#En ciertas ocasiones puede haber algun error, ya que puede chocar con otros paquetes (como plyr).
#para evitar esto podemos usar here::here (que básicamente aclara que la función solicitada es del paquete here)
here::here() #nos dice en que directorio estamos

#Podemos checar en qué directorio nos encontramos con getwd(), si no es el que deseamos podemos cambiarlo con setwd()

getwd() # regresa la path en donde nos encontramos
setwd("direccion/deseada") # nos lleva a la path indicada

#Pero con here podemos no especificar la path

getwd() # para checar en donde nos encontramos
here::here() # para checar dónde te encuentras

# nos movemos al subdirectorio R
setwd(here::here("R")) # podemos cambiar de directorio, aun así `here está en la raíz

# como ejemplo: vamos a guardar datos en archivo y cargarlos
a <- 1
c <- 23
save(a, c, file = here::here("datos-prueba.RData"))
# rm(a,c)
load(here::here("datos-prueba.RData"))

# creamos un directorio
dir.create(here::here("subdirectorio"), showWarnings = FALSE)
# podemos crear un archivo, indicando el subdirectorio, (en este caso el primer argumento)
#para ponder extensión "nombrearchivo.extensión"
file.create(here::here("subdirectorio", "nombrearchivo"))
# abrimos el nuevo archivo creado
file.show(here::here("subdirectorio", "nombrearchivo")) # podemos editarlo!!

# por ejemplo si quisieramos ver nuestros archivos del directorio
list.files(here::here(), recursive = TRUE)

#usethis puede ser más amigable, por ejemplo para la creación de nuevos archivos .
#R es capaz de agruparlos en la carpeta R (dando un orden al proyecto)

usethis::use_r("notas-prueba.R") # no importando en qué path estemos

#### Vinculando RStudio con Git y GitHub ####

#Crear cuenta en GitHub
#descargar Git

# paquetes que vamos a requerir
install.packages("gitcreds", "gert", "gh")

library("gitcreds", "gert", "gh")
#si genera error es mejor llamarlos individual
library(gitcreds)
library(gert)
library(gh)


# Para iniciar conexión con GitHub
usethis::create_github_token() # redirige a github donde eligiras nombre especifico del token
# copia el token para después ingresarlo con gitcreds_set()
gitcreds::gitcreds_set()
# aquí colocas el token (NO tu contraseña de github!!!)
#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

#El siguiente paso será configurar nuestro usuario de github en el archivo .gitconfig

# Configurar usuario de gitHub
usethis::edit_git_config() # que abre el archivo .gitconfig
# colocaremos nombre y correo de cuenta de github. SOLO borrar los # y respetar los demas espacios
# [user]
#   name = N O M B R E
#   email = correodeGithub

# inicializar el repositorio de Git
usethis::use_git() #

# conectar tu repositorio local de Git con los servidores de GitHub
usethis::use_github()

gh::gh_whoami() # para checar cómo quedó la configuración

# escribimos un nuevo archivo e indicamos dónde lo queremos
writeLines("hola", "R/prueba.R")
# también podemos hacerlo así
usethis::use_r("archivo-prueba-github.R") # añade archivo al directorio R del proyecto actual

# Por ejemplo podríamos probar añadir algo nuevo
gert::git_add("R/archivo-prueba-github.R")

# añadimos commit de lo que se hizo
gert::git_commit("se subio archivo prueba")

# nos da info de los commits
gert::git_log()

# sube tus cambios del repo local a los de github
gert::git_push() # COMANDO IMPORTANTE


############## ejercicio poscards #####

## Creen el RStudio project. Es MUY importante que el usuario debe sea igual que en github
usethis::create_project("CynFP.github.io")

#abri un nuevo proyecto pero salio un error
