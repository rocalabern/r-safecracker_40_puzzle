sidebarLayout(

  sidebarPanel(
    div(
      tags$text("Layer 4  "),
      actionButton("b_4_Left",  "Left"),
      actionButton("b_4_Right", "Right"),
      tags$hr()
    ),
  
    div(
      tags$text("Layer 3  "),
      actionButton("b_3_Left",  "Left"),
      actionButton("b_3_Right", "Right"),
      tags$hr()
    ),
  
    div(
      tags$text("Layer 2  "),
      actionButton("b_2_Left",  "Left"),
      actionButton("b_2_Right", "Right"),
      tags$hr()
    ),
  
    div(
      tags$text("Layer 1  "),
      actionButton("b_1_Left",  "Left"),
      actionButton("b_1_Right", "Right"),
      tags$hr()
    )
  ),

  mainPanel(
    plotlyOutput('puzzle')
  )
)
  