# options(warn=2, error=browser, shiny.error=browser)
# debug(httpuv::service)
library(shiny)
library(plotly)
# library(shinyBS)

shinyServer(function(input, output, session) {
  sessionEnvironment = environment()
  
  v <- reactiveValues(
    c_angles = c_angles_default,
    c_totals = calc_totals(c_Layers, c_angles_default)
  )
  
  observeEvent(input$b_4_Left, {
    v$c_angles <- v$c_angles + c(0,0,0,+1)
    v$c_totals <- calc_totals(c_Layers, v$c_angles)
  })
  observeEvent(input$b_4_Right, {
    v$c_angles <- v$c_angles + c(0,0,0,-1)
    v$c_totals <- calc_totals(c_Layers, v$c_angles)
  })
  observeEvent(input$b_3_Left, {
    v$c_angles <- v$c_angles + c(0,0,+1,0)
    v$c_totals <- calc_totals(c_Layers, v$c_angles)
  })
  observeEvent(input$b_3_Right, {
    v$c_angles <- v$c_angles + c(0,0,-1,0)
    v$c_totals <- calc_totals(c_Layers, v$c_angles)
  })
  observeEvent(input$b_2_Left, {
    v$c_angles <- v$c_angles + c(0,+1,0,0)
    v$c_totals <- calc_totals(c_Layers, v$c_angles)
  })
  observeEvent(input$b_2_Right, {
    v$c_angles <- v$c_angles + c(0,-1,0,0)
    v$c_totals <- calc_totals(c_Layers, v$c_angles)
  })
  observeEvent(input$b_1_Left, {
    v$c_angles <- v$c_angles + c(+1,0,0,0)
    v$c_totals <- calc_totals(c_Layers, v$c_angles)
  })
  observeEvent(input$b_1_Right, {
    v$c_angles <- v$c_angles + c(-1,0,0,0)
    v$c_totals <- calc_totals(c_Layers, v$c_angles)
  })  
  
  source('server/sev_safecracker40puzzle.R', local = TRUE)
  
  toListen <- reactive({
    list(
      input$b_4_Left,
      input$b_4_Right,
      input$b_3_Left,
      input$b_3_Right,
      input$b_2_Left,
      input$b_2_Right,
      input$b_1_Left,
      input$b_1_Right
    )
  })  
    
  observeEvent(toListen(), 
  {
    bModal <- NULL
    if (min(v$c_totals) == 40 && min(v$c_totals) == 40) {
      bModal <- showModal(modalDialog(
        title = "Happy Birtdahy!!!",
        "Congratulations! Puzzle solved! Per molts anys geintans!!!",
        icon = icon("birthday-cake"),
        easyClose = TRUE,
        footer = NULL
      ))
    }
    return(bModal)
  })
  
})