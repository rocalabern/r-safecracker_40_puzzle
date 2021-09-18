output$puzzle <- renderPlotly({

  message(v$c_angles)
      
  fig <- plotly_puzzle(c_Layers, v$c_angles)
  
  fig <- fig %>% layout(height = 800, width = 800)
  
  return (fig)
})

