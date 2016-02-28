---
title       : Decision Tree on IRIS
subtitle    : 
author      : Fiaz Shaik
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Contents

1. Introductiont to "iris" data
2. Decision Tree building
3. Prediction

--- .class #id 

## Iris Data

- Iris data is standard data set available in R package "datasets"
- Iris data set gives the measurements in centimeters of the variables sepal length and width and petal length and width, respectively, for 50 flowers from each of 3 species of iris. The species are Iris setosa, versicolor, and virginica.
- Execute following R commands to know more about iris data set

```r
require(datasets)
data(iris)
str(iris)
```

--- 

## Decision Tree

- We will build a decision tree model to find out Species of flowers from their  sepal length and width and petal length and width
- For this we use following R package "rpart" and following commands to to build a decision tree

```r
attach(iris)
Data.Iris=as.data.frame(iris)
Data.Iris=Data.Iris[complete.cases(Data.Iris),]
require(rpart)
Dec.Tree<- rpart(Species~., data=Data.Iris)
```

--- 

## Checking for new data set

- Following R code predicts the Species of flower from any new data point Test_Data

```r
Test_Data=Test_Data=data.frame(Sepal.Length=0.5, Sepal.Width=1,Petal.Length=2, Petal.Width=3)
Prediction<-predict(Dec.Tree,Test_Data,type = "class")
cat("The predicted Species is:", as.character(Prediction))
```

- The entire code deployed using shiny app in the following page where one can play with different input parameters and see the predicted class of flower


