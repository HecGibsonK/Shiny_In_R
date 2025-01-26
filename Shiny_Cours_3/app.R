#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)

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
      "Voici le panneau principal ou on affiche les sorties",
      tableOutput("iris_data")
      
    )
    
  )
  
)

##################################################
# Define server logic required to draw a histogram
server <- function(input, output) {
  
  # Autorisons une reponse depuis le server pour afficher les donnees dans le pannel principal
  output$iris_data <- renderTable({
    iris
  })
}


######################
# Run the application 
shinyApp(ui = ui, server = server)
