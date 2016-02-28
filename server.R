
server<-function(input,output,session){
        output$Result<-renderPrint({
                attach(iris)
                Data.Iris=as.data.frame(iris)
                Data.Iris=Data.Iris[complete.cases(Data.Iris),]
                require(rpart)
                Dec.Tree<- rpart(Species~., data=Data.Iris)
                #Test_Data=data.frame(Sepal.Length=0.5, Sepal.Width=1,Petal.Length=2, Petal.Width=3)
                Test_Data=data.frame(Sepal.Length=input$Sepal.Length, Sepal.Width=input$Sepal.Width,Petal.Length=input$Petal.Length, Petal.Width=input$Petal.Width)
                Prediction<-predict(Dec.Tree,Test_Data,type = "class")
                cat("The predicted Species is:", as.character(Prediction))

        })
        output$plot<-renderPlot({
                attach(iris)
                Data.Iris=as.data.frame(iris)
                Data.Iris=Data.Iris[complete.cases(Data.Iris),]
#                 require(tree)
#                 Dec.Tree<- tree(Species~., data=Data.Iris)
                #                 plot(Dec.Tree)
                #                 text(Dec.Tree,pretty = 0)
                require(rpart)
                Dec.Tree<-rpart(Species~., data=Data.Iris,control=rpart.control(minsplit = 5))
                plot(Dec.Tree)
                text(Dec.Tree,pretty = 0)
                 #require(rattle)
                #fancyRpartPlot(Dec.Tree)

        }
        )
}
#shinyApp(shinyUI,server)



