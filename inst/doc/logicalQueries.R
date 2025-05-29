## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(
    echo = TRUE, 
    tidy.opts = list(width.cutoff = 65),
    tidy = FALSE)

set.seed(12314159)

imageDirectory <- "./images/logic"
dataDirectory <- "data"

## ----library_loon, eval = FALSE, echo = TRUE, fig.align="center", fig.width = 6, fig.height = 4, out.width = "75%", warning=FALSE, message=FALSE----
# library(loon)

## ----new variates-------------------------------------------------------------
data(mtcars, package = "datasets")

mtcars$country <- c("Japan", "Japan", "Japan", "USA", "USA", "USA", "USA", 
                    "Germany", "Germany", "Germany", "Germany", "Germany", 
                    "Germany", "Germany", "USA", "USA", "USA", "Italy", 
                    "Japan", "Japan", "Japan", "USA", "USA", "USA", "USA", 
                    "Italy", "Germany", "UK", "USA", "Italy", "italy", "Sweden")
mtcars$continent <- c("Asia", "Asia", "Asia", "North America", "North America", 
                      "North America", "North America", "Europe", "Europe", 
                      "Europe", "Europe", "Europe", "Europe", "Europe",  
                      "North America", "North America", "North America", 
                      "Europe", "Asia", "Asia", "Asia", "North America", 
                      "North America", "North America", "North America", 
                      "Europe", "Europe", "Europe", "North America", 
                      "Europe", "Europe", "Europe" )
mtcars$company <- c("Mazda", "Mazda", "Nissan", "AMC", "AMC", "Chrysler", 
                    "Chrysler", "Mercedes", "Mercedes", "Mercedes", "Mercedes",
                    "Mercedes", "Mercedes", "Mercedes", "GM", "Ford", 
                    "Chrysler", "Fiat", "Honda", "Toyota", "Toyota", "Chrysler", 
                    "AMC", "GM", "GM", "Fiat", "Porsche", "Lotus", "Ford", 
                    "Ferrari", "Maserati", "Volvo")

mtcars$Engine <- factor(c("V-shaped", "Straight")[mtcars$vs +1], 
                        levels = c("V-shaped", "Straight"))
mtcars$Transmission <- factor(c("automatic", "manual")[mtcars$am +1], 
                              levels = c("automatic", "manual"))

mtcars$vs <- NULL  # These are redundant now
mtcars$am <- NULL  # 

## ----define variable types----------------------------------------------------
varTypes <- split(names(mtcars), 
                  sapply(mtcars, 
                         FUN = function(x){
                             if(is.factor(x)|is.character(x)){ 
                                 "categorical"
                                  } else {"numeric"} } ))

## ----histograms of categorical variates, eval = FALSE-------------------------
# for (varName in varTypes$categorical) {
#     assign(paste0("h_", varName),
#            l_hist(mtcars[ , varName], showFactors = TRUE,
#                   xlabel = varName, title = varName,
#                   linkingGroup = "Motor Trend"))
# }

## ----eval = FALSE-------------------------------------------------------------
# p <- with(mtcars, l_plot(disp, cyl,
#                          xlabel = "engine displacement", ylabel = "number of cylinders",
#                          title = "1974 Motor Trend cars",
#                          linkingGroup = "Motor Trend",
#                          size = 10, showScales = TRUE,
#                          itemLabel = rownames(mtcars), showItemLabels = TRUE
#                          ))

## ----eval = FALSE-------------------------------------------------------------
# data <- data.frame(A = sample(c(rnorm(10), NA), 10, replace = FALSE),
#                    B = sample(c(rnorm(10), NA), 10, replace = FALSE),
#                    C = sample(c("firebrick", "steelblue", NA), 10, replace = TRUE),
#                    D = sample(c(1:10, NA), 10, replace = FALSE))
# p_test <- l_plot(x = data$A, y = data$B, color = data$C, linkingGroup = "test missing")
# h_test <- l_hist(x = data$D, color = data$C, linkingGroup = "test missing")

## ----eval = FALSE-------------------------------------------------------------
# p_test["selected"] <- (data$A > 0)

## ----eval = FALSE-------------------------------------------------------------
# LogVal <- data$A > data$B
# p["selected"] <- logVal[1 + as.numeric(p_test["linkingKey"])]

