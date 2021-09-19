calc_totals <- function(c_Layers, c_angles) {

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
  
  return(c_totals)
  
}