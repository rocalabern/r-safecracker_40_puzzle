# options(warn=2, error=browser, shiny.error=browser)
# debug(httpuv::service)
library(shiny)
library(plotly)
# library(shinyBS)

shinyServer(function(input, output, session) {
  sessionEnvironment = environment()
  
  source('server/sev_safecracker40puzzle.R', local = TRUE)
  
})