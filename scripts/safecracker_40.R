# runApp ----
library(shiny)
runApp()

# Test local ----
rm(list=ls())
library(plotly)

source('tools/load_tools.R', encoding = "utf8")
load_tools('tools')

c_angles <- c(-9, -4, 4, 0) # solution
c_angles <- c(0, 0, 0, 0)
c_totals <- calc_totals(c_Layers, c_angles)
fig <- plotly_puzzle(c_Layers, c_angles, c_totals)
# fig <- fig %>% layout(height = 800, width = 800)
fig

c_angles
c_totals
