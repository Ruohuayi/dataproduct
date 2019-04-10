library(shiny)

shinyServer(function(input, output) {
    model1<-lm(mpg~wt,data=mtcars)
##Model 1 and prediction 1.    
    model1pred <- reactive({
      wtInput<-input$weight
      predict(model1, newdata = data.frame(wt = wtInput))
    })

    output$plotWt <- renderPlot({
        plot(mtcars$wt, mtcars$mpg, xlab = "Weight", 
             ylab = "Miles Per Gallon", bty = "n", pch = 16,
             xlim = c(1,6), ylim = c(10, 40))
    abline(model1, col = "red", lwd = 2)
    points(input$weight,model1pred(), col="blue",pch=16,cex=2)
    
    output$pred1<-renderText({
      model1pred()
    })
  })
    
##Model 2 and prediction 2.    
    model2<- lm(mpg~hp,data=mtcars)
    
    model2pred<- reactive({
      hpInput<-input$hp
      predict(model2, newdata= data.frame(hp=hpInput))
    })
    
    output$plotHp<- renderPlot({
      plot(mtcars$hp, mtcars$mpg, xlab= "Horsepower",
           ylab = "Miles Per Gallon", bty="n", pch=16,
           xlim = c(50,340), ylim=c(10, 40))
      abline(model2, col = "blue", lwd=2)
      points(input$hp, model2pred(), col="red", pch=16, cex=2)
      
      output$pred2<-renderText({
        model2pred()
      })
    })
})
