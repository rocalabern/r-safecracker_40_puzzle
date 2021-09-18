library(dplyr)
library(ggplot2)
library(plotly)

rows <- 16
alpha_section <- 360/rows
c_colors <- c('#FFAA70', '#FFDF70')

p_number <- function(fig, r, pos_alpha, number) {
  
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
    ),
    text = number,
    hovertemplate = "%{text}"
  ) 
  return(fig)
}  

fig <- plot_ly(
    type = 'scatterpolar',
    mode = 'lines'
  ) 
fig <- fig %>% p_number(3, 4, 1)
# for (i in 1:16) fig <- fig %>% p_number(2, i, 1)
# for (i in 1:16) fig <- fig %>% p_number(3, i, 1)
# for (i in 1:16) fig <- fig %>% p_number(4, i, 1)
# for (i in 1:16) fig <- fig %>% p_number(5, i, 1)
fig %>% add_markers()
fig <- fig %>%
  layout(
    polar = list(
      radialaxis = list(
        visible = T,
        range = c(0,6)
      )
    ),
    showlegend = F
  )

fig
