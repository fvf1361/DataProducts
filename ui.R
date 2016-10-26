#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

shinyUI(fluidPage(
  
  # Application title
  titlePanel("Exploratoy Analysis of Father-Son Dataset"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      h3("Father-Son height modeling"),
      p("In this app a simple modeling analysis is done. The objective of this modeling is to estimate the height of a son, given the height of his father."),
      p("The predictive model is developed by using existing data. The user can specify whether the regression line is displayed or not."),
      p("Once the user is happy with the performance of the model, they can input the father's height to get an estimate of the son's height by clicking on the button."),
      
      sliderInput("inmodel",
                   "1- Select the range of heights to use for regression:",
                   min = 59,
                   max = 76,
                   value = c(66,70)),
      checkboxInput("checkbox", "Display regression line", value = TRUE),
      sliderInput("estimated",
                  "2- What is the height of the father?",
                  min = 59,
                  max = 76,
                  value = 63),
      p("The regression line is derived using the selected data range, and changes accordingly. The user can turn the regression line on or off by activating the checkbox"),
      p("The vertical line shows the value of father's height for which the son's height is predicted. The red dot shows the predicted value."),
      p("The exact predicted value and 95% confidence interval for the predicted son's height is shown below the chart and is updated automatically")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("distPlot"),
       verbatimTextOutput("text1"),
       verbatimTextOutput("text2")
    )
  )
))
