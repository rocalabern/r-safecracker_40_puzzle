plotly_add_totals <- function(fig, c_Layers, c_angles) {

  c_totals <- calc_totals(c_Layers, c_angles)
  
  for (dir in 0:15) {
    alpha <- (alpha_section * (1+dir)) %% 360
    fig <- fig %>%
    add_trace(
      r = 5+0.2, 
      theta = alpha + alpha_section/2,
      mode = "text",
      text = c_totals[1+dir],
      textfont = list(color = '#000000', size = 14)
    )
  }
  
  return(fig)
  
}