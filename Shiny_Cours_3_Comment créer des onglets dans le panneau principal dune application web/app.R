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

##################################################
# Define UI for application that draws a histogram
ui <- fluidPage(
  
  sidebarLayout(
    
    sidebarPanel(
      "Voici la barre laterale ou se trouve les inputs",
      
      # On peut permettre a l'utilisateur de saisir des donnees
      numericInput("age", "Quel est votre age?", value = 11, min = 1, step = 1)
    ),
    
    mainPanel(
      h1("Voici le panneau principal ou on affiche les sorties"),
      tabsetPanel(
        tabPanel("age", textOutput("age_sortie")),
        tabPanel("Data", DTOutput("iris_data"))
      )
      
    )
    
  )
  
)

##################################################
# Define server logic required to draw a histogram
server <- function(input, output) {
  
  output$age_sortie <- renderText({
    paste("Vous avez", input$age, "ans")
  })
  
  # Autorisons une reponse depuis le server pour afficher les donnees dans le pannel principal
  # Utilisons renderDT a la place rendertable pour un tableau interactif
  output$iris_data <- renderDT({
    iris
  })
}


######################
# Run the application 
shinyApp(ui = ui, server = server)
