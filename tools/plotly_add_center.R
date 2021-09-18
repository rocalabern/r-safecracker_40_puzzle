plotly_add_center <- function(fig, radius = 1) {
  color <- c_colors[1]
  fig <- fig %>%
  add_trace(
    r = rep(radius, 17),
    theta = 0:16 * alpha_section,
    fill = 'toself',
    fillcolor = color,
    line = list(
      color = 'black'
    )
  ) 
  return(fig)
} 