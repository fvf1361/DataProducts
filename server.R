#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    library(UsingR)
    data("father.son")
    fs <- as.data.frame(father.son)
    
    
  output$distPlot <- renderPlot({
    
    xmin <- min(input$inmodel)
    xmax <- max(input$inmodel)
    fs <- fs[(father.son$fheight>=xmin)&(father.son$fheight<=xmax),]
    x <- fs$fheight
    y <- fs$sheight
    plot(x,y, xlab = "father's height (inches)", ylab = "son's height (inches)", xlim = c(58, 77), ylim = c(58,80), pch=19, col="blue")
    abline(v=input$estimated, lwd=2, col="red")
    fit1 <- lm(y~x)
    a <- fit1$coefficients[2]
    b <- fit1$coefficients[1]
    if (input$checkbox==TRUE){
        abline(reg=fit1, lwd = 2, col="black")
        points(input$estimated, a*input$estimated+b, pch=16, cex=2, col="red")
        }
    
    })
  
 
  output$text1 <- renderText({
      xmin <- min(input$inmodel)
      xmax <- max(input$inmodel)
      fs <- fs[(father.son$fheight>=xmin)&(father.son$fheight<=xmax),]
      x <- fs$fheight
      y <- fs$sheight
      plot(x,y, xlab = "father's height (inches)", ylab = "son's height (inches)", xlim = c(58, 77), ylim = c(58,80), pch=19, col="blue")
      abline(v=input$estimated, lwd=2, col="red")
      fit1 <- lm(y~x)
      newx <- data.frame(x=input$estimated)
      prd <- predict(fit1, newx, interval="predict")
      txt1 <- paste("The estimated son's height is: ", prd[1])
      txt2 <- paste("The 95% confidence interval for the estimated son's height is: ", prd[2], "to ", prd[3])
      txt1
  })

  output$text2 <- renderText({
      xmin <- min(input$inmodel)
      xmax <- max(input$inmodel)
      fs <- fs[(father.son$fheight>=xmin)&(father.son$fheight<=xmax),]
      x <- fs$fheight
      y <- fs$sheight
      plot(x,y, xlab = "father's height (inches)", ylab = "son's height (inches)", xlim = c(58, 77), ylim = c(58,80), pch=19, col="blue")
      abline(v=input$estimated, lwd=2, col="red")
      fit1 <- lm(y~x)
      newx <- data.frame(x=input$estimated)
      prd <- predict(fit1, newx, interval="predict")
      txt1 <- paste("The estimated son's height is: ", prd[1])
      txt2 <- paste("The 95% confidence interval for the estimated son's height is: ", prd[2], "to ", prd[3])
      txt2
  })
})
