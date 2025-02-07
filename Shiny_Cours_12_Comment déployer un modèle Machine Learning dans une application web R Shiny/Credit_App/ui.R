#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)
library(shinydashboard)

# Define UI for application that draws a histogram
dashboardPage(
  
  dashboardHeader(title = "Credit Scoring"),
  
  dashboardSidebar(),
  
  dashboardBody(
    taBName = "features",
    fluidRow(box(valueBoxOutput("Score_prediction")),
             box(numericInput("var1", "Age du demandeur de credit", 
                              value = 18, min = 18))),
    
    fluidRow(box(numericInput("var2", "Revenu annuel du demandeur de credit", 
                              value = 1000, min = 0)),
             box(selectInput("var3", "Propriete immobiliere",
                             choices = c("RENT", "OWN", "MORTGAGE", "OTHER")))),
    
    fluidRow(box(numericInput("var4", "Depuis quand le demandeur du credit est-il en actiite professionelle?", 
                              value = 1, min = 0)),
             box(selectInput("var5", "Motif du pret bancaire",
                             choices = c("PERSONAL", "EDUCATION", "MEDICAL", "VENTURE", "HOMEIMPROVEMENT", "DEBTCONSOLIDATION")))),
    
    fluidRow(box(selectInput("var6", "Categorie du credit",
                             choices = c("A", "B", "C", "D", "E", "F", "G"))),
             box(numericInput("var7", "Montant du credit", 
                              value = 1000, min = 0))),
    
    fluidRow(box(numericInput("var8", "Taux d interet du credit (%)", 
                              value = 5, min = 0)),
             box(numericInput("var9", "Ratio Dette/Revenu du demandeur du credit (valeur entre 0 et 1)", 
                              value = 0.4, min = 0, max = 1))),
    
    fluidRow(box(selectInput("var10", "Le demandeur de credit est-il a decouvert bancaire?",
                             choices = c("Y", "N"))),
             box(numericInput("var11", "Echeance des credits en cours (e nombre d'annees)", 
                              value = 3, min = 0)))
  )
  
)
