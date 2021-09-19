output$puzzle <- renderPlotly({

  message(v$c_angles)
  message(v$c_totals)
      
  fig <- plotly_puzzle(c_Layers, v$c_angles, v$c_totals)
  
  fig <- fig %>% layout(height = 800, width = 800)
  
  return (fig)
})

