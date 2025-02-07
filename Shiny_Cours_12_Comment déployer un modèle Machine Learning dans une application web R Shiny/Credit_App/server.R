#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)
library(shinydashboard)


# Define server logic required to draw a histogram
function(input, output, session) {

  model <- readRDS("Credit_scoring.rds")
  #model <- readRDS("E:\\WORLD\\PERSO\\Programmation\\GitHub\\Shiny_In_R\\Shiny_Cours_12_Comment déployer un modèle Machine Learning dans une application web R Shiny\\Credit_scoring.rds")

  prediction <- reactive({

    predict(
      model,
      data.frame(
        "person_age" = input$var1,
        "person_income" = input$var2,
        "person_home_ownership" = input$var3,
        "person_emp_length" = input$var4,
        "loan_intent" = input$var5,
        "loan_grade" = input$var6,
        "loan_amnt" = input$var7,
        "loan_int_rate" = input$var8,
        "loan_percent_income" = input$var9,
        "cb_person_default_on_file" = input$var10,
        "cb_person_cred_hist_length" = input$var11
      ),
      type = "raw"
    )
  })

  prediction_lebal <- reactive({
    ifelse(prediction() == "0", "Eligible aux credits", "Non eligible aux credits")
  })

  prediction_Prob <- reactive({

    predict(
      model,
      data.frame(
        "person_age" = input$var1,
        "person_income" = input$var2,
        "person_home_ownership" = input$var3,
        "person_emp_length" = input$var4,
        "loan_intent" = input$var5,
        "loan_grade" = input$var6,
        "loan_amnt" = input$var7,
        "loan_int_rate" = input$var8,
        "loan_percent_income" = input$var9,
        "cb_person_default_on_file" = input$var10,
        "cb_person_cred_hist_length" = input$var11
      ),
      type = "prob"
    )
  })
  

  output$Score_prediction <- renderValueBox({
    valueBox(
      value = paste(round(100 * prediction_Prob()$`1`, 0), "%"),
      subtitle = prediction_lebal()
    )
  })
  
}
