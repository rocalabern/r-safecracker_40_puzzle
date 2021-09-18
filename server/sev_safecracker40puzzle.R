output$puzzle <- renderPlotly({
  
  fig <- plotly_puzzle(c_Layers, c_angles)
  
  fig <- fig %>% layout(height = 800, width = 800)
  
  return (fig)
})

