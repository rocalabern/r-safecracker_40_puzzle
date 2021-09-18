plotly_puzzle <- function(c_Layers, c_angles, b_underline = FALSE) {

  fig <- plot_ly(
      type = 'scatterpolar',
      mode = 'lines'
    ) 
  
  for (i in length(c_Layers):1) {
    for (l in 1:length(c_Layers[[i]])) {
      layer <- c_Layers[[i]][[l]]
      layer_rotation <- c_angles[i]
      for (n in 1:length(layer$val)) {
        if (!is.na(layer$val[n])) {
          fig <- plotly_add_number(fig, i, layer$r, n, layer$val[n], layer_rotation, b_underline)  
        }  
      }
    }
  }
  fig <- plotly_add_center(fig)
  fig <- plotly_add_totals(fig, c_Layers, c_angles)
  fig <- fig %>%
    layout(
      polar = list(
        radialaxis = list(
          visible = F,
          range = c(0,5.5)
        ),
        angularaxis = list(
          visible = F
        )
      ),
      showlegend = F
    )
  
  return(fig)
}
