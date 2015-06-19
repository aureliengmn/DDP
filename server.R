library(pgmm)
library(ggplot2)
data(olive)
col <- colnames(subset(olive, select = -c(Area, Region)))
list_area <- c(1:9)


shinyServer(function(input, output) {
  

  output$plot <- renderPlot({
    oli <- subset(olive, Area %in% input$Area_sel, c(input$Variable1, input$Variable2, "Area"))
    oli$Area <- as.factor(oli$Area)
    qplot(x=oli[,1], y=oli[,2], data=oli,colour=Area, xlab=input$Variable1, ylab=input$Variable2)
    })
  
  
  output$mean <- renderPrint({
    oli <- subset(olive, Area %in% input$Area_sel, c(input$Variable1, input$Variable2, "Area"))
    m1 <- aggregate(oli[,1], by=list(oli$Area), mean)
    m2 <- aggregate(oli[,2], by=list(oli$Area), mean)
    print(setNames(cbind(m1, m2[,2]), c("Area",input$Variable1, input$Variable2)))
    })

    
})

