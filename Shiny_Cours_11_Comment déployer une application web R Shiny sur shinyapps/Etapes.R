#Les etapes pour déployer une application web R Shiny sur shinyapps.io

###   1) S'enregistrer sur le site shinyapps.io (via son compte google recommande)
###   2) Suivre les instructions de la page d'acceuil https://www.shinyapps.io/admin/#/dashboard

##### Etape 1 – Installer rsconnect ##### 

##  Le package rsconnect peut être installé directement depuis CRAN. 
##  Pour vous assurer que vous disposez de la dernière version, exécutez le code suivant dans votre console R :
install.packages('rsconnect')



##### Etape 2 – Autoriser le compte ##### 

##  Le package rsconnect doit être autorisé sur votre compte à l'aide 
##  d'un jeton et d'un secret. Pour ce faire, cliquez sur le bouton Copier 
##  ci-dessous et nous copierons toute la commande dont vous avez besoin dans 
##  votre presse-papiers. Collez-la dans votre console R pour autoriser votre compte. 
##  Une fois que vous avez correctement saisi la commande dans R, 
##  cet ordinateur est désormais autorisé à déployer des applications Shiny pour R sur votre compte shinyapps.io.
rsconnect::setAccountInfo(name='hecgibs',
                          token='B74E356D5D8A8C64CE718BDFEE162DE4',
                          secret='XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')


 
##### Etape 3 – Déployer ##### 

##  Une fois le package rsconnect configuré, vous êtes prêt à déployer votre première application. 
##  Si vous n'avez pas encore écrit d'application, vous pouvez également consulter 
##  le Guide de démarrage pour obtenir des instructions sur la façon de déployer 
##  notre application de démonstration. Exécutez le code suivant dans votre console R.
library(rsconnect)
rsconnect::deployApp('path/to/your/app')

