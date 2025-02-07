library(randomForest) # Bibliothèque de foret aleatoire
library(ggplot2)    # Visualisation des données
library(readxl)     # Bibliothèque de manipulation de données dans Excel
library(dplyr)      # Bibliothèque de manipulation de données statistiques
library(psych)     # Bibliothèque de statistiques descriptives
library(car)      # Bibliothèque de modèle de régression
library(caret)    # Bibliothèque pour Machine learning
library(pROC)     # Bibliothèque pour l'évaluation des modèles 

################################################################################
## Importation des donnees
Data <- read.csv("credit_risk_dataset.csv")

## Duplication du fichier source
DataD <- Data

## Voir la structure et type de mes donnees
str(DataD)
sapply(DataD, class)

## Resume descriptif de la base de donnees
summary(DataD)
colSums(is.na(DataD))


##Suppression des lignes contenent des valeurs manquantes (recommander)
Mydata <- na.omit(DataD)

## Convertion en facteur de la variable "loan_status"
Mydata$loan_status <- as.factor(Mydata$loan_status)

str(Mydata)
sapply(Mydata, class)

###############################################################################
###############################################################################
###############################################################################

## Modele de foret aleatoire
#set.seed(100)

fitControl <- trainControl(method = "cv", number = 3)

rf_model <- train(loan_status ~ ., 
                  data = Mydata,
                  method = "rf",
                  trControl = fitControl,
                  verbose = F)

rf_model

###############################################################################
###############################################################################
###############################################################################

##  Stocker le modèle
saveRDS(rf_model, "Credit_scoring.rds")

colnames(Mydata)

# Exemple d'utilisation du modele

Mydata_New <- data.frame(
  "person_age" = 20,
  "person_income" = 500000000,
  "person_home_ownership" = "RENT",
  "person_emp_length" = 5,
  "loan_intent" = "PERSONAL",
  "loan_grade" = "D",
  "loan_amnt" = 40000,
  "loan_int_rate" = 17,
  "loan_percent_income" = 0.6,
  "cb_person_default_on_file" = "Y",
  "cb_person_cred_hist_length" = 5
)

Mydata_New 

### Par un oui ou non
pred <- predict(rf_model, newdata = Mydata_New, type = "raw")
pred

### via une probabilite
pred1 <- predict(rf_model, newdata = Mydata_New, type = "prob")
pred1



















