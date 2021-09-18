# options(warn=2, error=browser, shiny.error=browser)
# debug(httpuv::service)
library(shiny)
library(plotly)
# library(shinyBS)

shinyServer(function(input, output, session) {
  sessionEnvironment = environment()
  
  v <- reactiveValues(c_angles = c(0, 0, 0, 0))
  
  observeEvent(input$b_4_Left, {
    v$c_angles <- v$c_angles + c(0,0,0,+1)
  })
  observeEvent(input$b_4_Right, {
    v$c_angles <- v$c_angles + c(0,0,0,-1)
  })
  observeEvent(input$b_3_Left, {
    v$c_angles <- v$c_angles + c(0,0,+1,0)
  })
  observeEvent(input$b_3_Right, {
    v$c_angles <- v$c_angles + c(0,0,-1,0)
  })
  observeEvent(input$b_2_Left, {
    v$c_angles <- v$c_angles + c(0,+1,0,0)
  })
  observeEvent(input$b_2_Right, {
    v$c_angles <- v$c_angles + c(0,-1,0,0)
  })
  observeEvent(input$b_1_Left, {
    v$c_angles <- v$c_angles + c(+1,0,0,0)
  })
  observeEvent(input$b_1_Right, {
    v$c_angles <- v$c_angles + c(-1,0,0,0)
  })  
  
  source('server/sev_safecracker40puzzle.R', local = TRUE)
  
})