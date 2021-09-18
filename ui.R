library(shiny)
library(shinythemes)
library(htmlwidgets)
# library(shinyBS)

niceThemes = c("cerulean", "cosmo", "flatly", "spacelab")
selectedTheme = niceThemes[4]

shinyUI(navbarPage(theme = shinytheme(selectedTheme), 

      windowTitle="Safe Cracker 40 Puzzle",
      
      title="Safe Cracker 40",
      
      tabPanel("Puzzle 40", source('ui/tab_safecracker40puzzle.R', local = TRUE)$value)
      
  )
)