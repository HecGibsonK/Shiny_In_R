#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)
library(DT)
library(psych)
iris$Species <-  NULL  # Pour ne pas afficher la colonne non numeric

##################################################
# Define UI for application that draws a histogram
ui <- fluidPage(
  
  sidebarLayout(
    
    sidebarPanel(
      
      h3("Voici la barre laterale ou se trouve les inputs"),
      selectInput("Vars", "Choisissez une variable :", choices = names(iris))
    ),
    
    mainPanel(
      
      h3("Voici le panneau principal ou on affiche les sorties"),
      tabsetPanel(
        tabPanel("Data", DTOutput("iris_data")),
        tabPanel("Resume", verbatimTextOutput("Summary")),
        tabPanel("Stat_Desc", verbatimTextOutput("Describe")),
        tabPanel("Plot", plotOutput("Hist"))
      )
      
    )
    
  )
  
)

##################################################
# Define server logic required to draw a histogram
server <- function(input, output) {

  # Autorisons une reponse depuis le server pour afficher les donnees dans le pannel principal
  # Utilisons renderDT a la place rendertable pour un tableau interactif
  output$iris_data <- renderDT({
    iris
  })
  
  # Resume statistique
  output$Summary <- renderPrint({
    summary(iris)
  })
  
  # Statistique descriptive
  output$Describe <- renderPrint({
    describe(iris)
  })
  
  # Histogramme
  output$Hist <- renderPlot({
    hist(iris[, input$Vars], main = "Histogramme", xlab = input$Vars)
  })
  
}


######################
# Run the application 
shinyApp(ui = ui, server = server)
