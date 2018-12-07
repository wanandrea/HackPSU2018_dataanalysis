#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(ggplot2)
library(scales)
library(shiny)

# Define UI for application that draws a histogram
ui<-shinyUI(fluidPage(
  
  # Application title
  titlePanel("HackPSU Submission Data Analytics"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(

       selectInput("graph", "Choose a graph to view:", 
                   choices = c("academic_year", "gender", "major", "coding_experience","race")),
       submitButton("Graph it")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      tabsetPanel(
        tabPanel("Graph Viewer", plotOutput("selected_graph")
    )
  )
))))

