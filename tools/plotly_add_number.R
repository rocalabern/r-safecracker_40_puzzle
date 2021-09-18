plotly_add_number <- function(fig, r, pos_alpha, number) {
  
  alpha <- (pos_alpha %% rows) * alpha_section
  c_r <- c(r, r, r+1, r+1, r)
  c_theta <- c(alpha, alpha+alpha_section, alpha+alpha_section, alpha, alpha)
  color <- c_colors[1 + (r + pos_alpha) %% 2]
  
  fig <- fig %>%
  add_trace(
    r = c_r,
    theta = c_theta,
    fill = 'toself',
    fillcolor = color,
    line = list(
      color = 'black'
    )
  ) %>% 
  add_trace(
    r = r+0.5, 
    theta = alpha + alpha_section/2,
    mode = "text",
    text = paste0('<br>',as.character(number),'<br>', '¯¯'),
    textfont = list(color = '#000000', size = 14)
  )
  return(fig)
} 
