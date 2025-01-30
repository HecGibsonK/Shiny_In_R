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
  h1("2eme Application iris"),
  
  sidebarLayout(
    
    sidebarPanel(
      
      h3("Voici la barre laterale ou se trouve les inputs"),
      selectInput("Plot_type", 
                  "Choisir le type de graphique", 
                  choices = c("Histogramme", "Scatter plot")),
      selectInput("Vars", "Choisir une variable :", choices = names(iris)),
      
      conditionalPanel(
        condition = "input.Plot_type == 'Scatter plot'",
        selectInput("Vars2", "Choisir une 2eme variable :", choices = names(iris))
      )
    ),
    
    mainPanel(
      
      h3("Voici le panneau principal ou on affiche les sorties"),
      tabsetPanel(
        tabPanel("Data", DTOutput("iris_data"),
                 downloadButton("save_data", "Save to csv")),
        tabPanel("Resume", verbatimTextOutput("Summary")),
        tabPanel("Stat_Desc", verbatimTextOutput("Describe")),
        tabPanel("Plot",
                 conditionalPanel(
                   condition = "input.Plot_type == 'Histogramme'",
                   plotOutput("Hist")
                 ),
                 conditionalPanel(
                   condition = "input.Plot_type == 'Scatter plot'",
                   plotOutput("nuage")
                 )
        )
      )
      
    )
    
  )
  
)

##################################################
# Define server logic required to draw a histogram
server <- function(input, output) {
  
  df <- reactive({
    iris
  })

  # Autorisons une reponse depuis le server pour afficher les donnees dans le pannel principal
  # Utilisons renderDT a la place rendertable pour un tableau interactif
  output$iris_data <- renderDT({
    df()
  })
  
  # Sauvegarde de la df au format csv
  output$save_data <- downloadHandler(
    filename <- function(){
      paste("data_", Sys.Date(), ".csv", sep = ",")
    },
    content <- function(file){
      write.csv(df(), file)
    }
  )
  
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
  
  # Nuage de points
  output$nuage <- renderPlot({
    plot(iris[, input$Vars], iris[, input$Vars2],
         xlab = input$Vars, ylab = input$Vars2)
  })
  
}


######################
# Run the application 
shinyApp(ui = ui, server = server)
