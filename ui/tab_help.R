fluidPage(
  title = "Help",
  fluidRow(
    column(width = 4,
      htmltools::img(src="safecracker_40.jpg", width="512", height="512")
    ),
    column(width = 3, offset = 2,
      htmltools::h1("SafeCracker 40 Puzzle"),
      htmltools::br(),
      htmltools::hr(),
      htmltools::div(
        htmltools::h5("SafeCracker 40 Puzzle is a normally wooden puzzle made by 4 layers. Each layer with 16 columns. The objective of the puzzle is to rotate those 4 layers until all 16 columns sum up to 40, each of them, all at the same time!")
      ),
      htmltools::br(),
      htmltools::hr(),      
      htmltools::div(
        htmltools::h5("App creacted by Roc and Noemi with love for Kume, Marc C., Marc A., Marius. Happy 40's!!"),
        htmltools::h5("Thanks to Tyler Rinker which posted in his blog 'TRinker's R Blog' about the puzzle, and shared the layers structure."),
        htmltools::h5("Take a look to his blog and the his post about how to find the solution of this puzzle in R here :"),
        tags$a(href = "https://trinkerrstuff.wordpress.com/2015/05/30/1646/amp/", "TRinker's R Blog - Cracking Safe Cracker with R")
      ),      
    )
  )
)