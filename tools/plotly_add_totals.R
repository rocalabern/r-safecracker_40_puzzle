plotly_add_totals <- function(fig, c_Layers, c_angles) {

  c_totals <- rep(0, 16)
  
  for (dir in 0:15) {
    total <- rep(as.numeric(NA), 4)
    for (i in 1:length(c_Layers)) {
      for (l in 1:length(c_Layers[[i]])) {
        r <- c_Layers[[i]][[l]]$r
        val <- c_Layers[[i]][[l]]$val[ 1 +((dir-c_angles[i]) %% 16)]
        if (is.na(total[r]) && !is.na(val)) {
          total[r] <- val
        }
      }
    }
    c_totals[1+dir] <- sum(total)
  }
  
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