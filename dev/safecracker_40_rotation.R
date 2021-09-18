rm(list=ls())
library(plotly)

source('tools/load_tools.R', encoding = "utf8")
load_tools('tools')

c_angles <- c(0, 0, 0, 0)

fig <- plotly_puzzle(c_Layers, c_angles)
# fig <- fig %>% layout(height = 800, width = 800)

runApp()