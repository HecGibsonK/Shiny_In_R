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
  h1("Leçon numero 1 sur Shiny"),
  h4("Par Dr. Hector Gibson Kinmanhon HOUANKPO")
)

##################################################
# Define server logic required to draw a histogram
server <- function(input, output) {
  
}


######################
# Run the application 
shinyApp(ui = ui, server = server)
