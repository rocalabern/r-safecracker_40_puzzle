library(shiny)
library(shinythemes)
library(htmlwidgets)
# library(shinyBS)

niceThemes = c("cerulean", "cosmo", "flatly", "spacelab")
selectedTheme = niceThemes[4]

shinyUI(navbarPage(theme = shinytheme(selectedTheme), 

      windowTitle="SafeCracker Puzzle 40",
      
      title="SafeCracker 40",
      
      tabPanel("Puzzle 40", source('ui/tab_safecracker40puzzle.R', local = TRUE)$value),
      
      tabPanel("help", source('ui/tab_help.R', local = TRUE)$value)
      
  )
)