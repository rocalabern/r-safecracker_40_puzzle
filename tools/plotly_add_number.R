plotly_add_number <- function(fig, layer, r, pos_alpha, number, layer_rotation, b_underline = FALSE) {
  
  alpha <- (pos_alpha %% rows) * alpha_section + (layer_rotation %% 16) * alpha_section
  c_r <- c(r, r, r+1, r+1, r)
  c_theta <- c(alpha, alpha+alpha_section, alpha+alpha_section, alpha, alpha)
  color <- c_colors[1 + ((r + pos_alpha) %% 2) + (2*(layer-1))]
  color_line <- c_colors_line[layer]
  
  if (b_underline) {
    number_text <- paste0('<br>',as.character(number),'<br>', '¯¯')
  } else {
    number_text <- number
  }  
  
  
  fig <- fig %>%
  add_trace(
    r = c_r,
    theta = c_theta,
    fill = 'toself',
    fillcolor = color,
    line = list(
      color = color_line
    )
  ) %>% 
  add_trace(
    r = r+0.5, 
    theta = alpha + alpha_section/2,
    mode = "text",
    text = number_text,
    textfont = list(color = '#000000', size = 14)
  )
  return(fig)
} 
