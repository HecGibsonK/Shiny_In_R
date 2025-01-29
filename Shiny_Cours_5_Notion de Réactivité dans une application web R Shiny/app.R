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
  
  # Le titre de l'application
  titlePanel("L'application pour montrer la reactivite"),
  
  sidebarLayout(
    
    sidebarPanel(
      numericInput("Num1", "Choisir le 1er numero", value = 0),
      numericInput("Num2", "Choisir le 2em numero", value = 0)
    ),
    
    mainPanel(
      textOutput("Rendu")
    )
    
  )

)

##################################################
# Define server logic required to draw a histogram
server <- function(input, output) {
  
  # La somme des nombres
  Somme <- reactive({
    input$Num1 + input$Num2
  })
  
  # La moyenne des nombres
  Moyenne <- reactive({
    #Somme() / 2
    #mean(input$Num1:input$Num2)
    mean(c(input$Num1,input$Num2))
  })
  
  output$Rendu <- renderText({
    paste("La somme des nombres est egale a ", Somme(),
          "La moyenne des nombres est egale a", Moyenne()
    )
  })
  
  
}


######################
# Run the application 
shinyApp(ui = ui, server = server)
