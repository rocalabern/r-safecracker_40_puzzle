plotly_puzzle <- function(c_Layers, c_angles) {

  fig <- plot_ly(
      type = 'scatterpolar',
      mode = 'lines'
    ) 
  
  for (i in 1:length(c_Layers)) {
    for (l in 1:length(c_Layers[[i]])) {
      layer <- c_Layers[[i]][[l]]
      for (n in 1:length(layer$val)) {
        if (!is.na(layer$val[n])) {
          fig <- plotly_add_number(fig, layer$r, n, layer$val[n])  
        }  
      }
    }
  }
  fig <- plotly_add_center(fig)
  fig <- fig %>%
    layout(
      polar = list(
        radialaxis = list(
          visible = F,
          range = c(0,5)
        ),
        angularaxis = list(
          visible = F
        )
      ),
      showlegend = F
    )
  
  return(fig)
}
