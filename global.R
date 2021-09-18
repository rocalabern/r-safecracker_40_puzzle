rm(list=ls())
library(plotly)

source('tools/load_tools.R', encoding = "utf8")
load_tools('tools')

plotly_puzzle(c_Layers, c_angles)
