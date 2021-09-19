library(dplyr)
library(ggplot2)
library(plotly)

layer_to_print <- 4
radius_center <- max(1, layer_to_print-1)

rows <- 16
alpha_section <- 360/rows
c_colors <- c('#FFAA70', '#FFDF70')

L1 <- list(
  list(
    r = 1,
    val = c(6, NA, 13, NA, 3, NA, 3, NA, 6, NA, 10, NA, 10, NA, 10, NA)
  )
)

L2 <- list(
  list(
    r = 2,
    val = c(10, NA, 2,  NA, 22, NA, 2,  NA, 17, NA, 15, NA, 14, NA, 5, NA)
  ),
  list(
    r = 1,
    val = c( 1,  6,  10, 6,  10, 2,  6,  10, 4,  1,  5,  5,  4,  8,  6,  3)
  )
)

L3 <- list(
  list(
    r = 3,
    val = c(16, NA, 17, NA, 2, NA, 2, NA, 10, NA, 15, NA, 6, NA, 9, NA)
  ),
  list(
    r = 2,
    val = c(11, 27, 14, 5, 5, 7, 8, 24, 8, 3, 6, 15, 22, 6, 1, 1)
  )
)

L4 <- list(
  list(
    r = 4,
    val = c(2, 15, 23, 19, 3, 2, 3, 27, 20, 11, 27, 10, 19, 10, 13, 10)
  ),
  list(
    r = 3,
    val = c(22, 9, 5, 10, 5, 1, 24, 2, 10, 9, 7, 3, 12, 24, 10, 9)
  )
)

c_Layers <- list(L1=L1, L2=L2, L3=L3, L4=L4)
c_angles <- c(0, 0, 0, 0)


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
    )
  ) %>% 
  add_trace(
    r = r+0.5, 
    theta = alpha + alpha_section/2,
    mode = "text",
    text = paste0('<br>',as.character(number),'<br>', '¯¯'),
    textfont = list(color = '#000000', size = 14)
    # textangle=-90+alpha + alpha_section/2
  )
  return(fig)
} 

p_center <- function(fig, radius_center = 1) {
  color <- c_colors[1]
  fig <- fig %>%
  add_trace(
    r = rep(radius_center, 17),
    theta = 0:16 * alpha_section,
    fill = 'toself',
    fillcolor = color,
    line = list(
      color = 'black'
    )
  ) 
  return(fig)
} 

fig <- plot_ly(
    type = 'scatterpolar',
    mode = 'lines'
  ) 

for (i in 1:length(c_Layers)) {
  for (l in 1:length(c_Layers[[i]])) {
    i = layer_to_print
    layer <- c_Layers[[i]][[l]]
    for (n in 1:length(layer$val)) {
      if (!is.na(layer$val[n])) {
        fig <- p_number(fig, layer$r, n, layer$val[n])  
      }  
    }
  }
}
fig <- p_center(fig, radius_center = radius_center)
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

fig

# library(webshot)
# library(widgetframe)
# webshot("sn.html", "simpleNetwork.png")
# browseVignettes("widgetframe")
# frameWidget(fig)

