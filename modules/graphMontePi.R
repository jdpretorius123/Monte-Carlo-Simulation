library(ggplot2)

graphMontePi <- function(numDarts){
  X <- c()
  Y <- c()
  Color <- c()
  
  for (i in 1:numDarts){
    x = runif(1, min = -1, max = 1)
    y = runif(1, min = -1, max = 1)
    
    d = sqrt(x^2 + y^2)
    
    if (d <= 1){
      color = "inCircle"
    }
    else{
      color = "outCircle"
    }
    
    X <- c(X,x)
    Y <- c(Y,y)
    Color <- c(Color, color)
  }
  
  data <- data.frame(X,Y,Color)

  ggplot(data, aes(x = X, y = Y, colour = Color)) +
    geom_point(size = 3) +
    scale_color_manual(values = c(inCircle = "blue", outCircle = "#e4ae39")) +
    theme(plot.background = element_rect(fill = "#f8f8ff", colour = "#f8f8ff"),
          panel.background = element_rect(fill = "#f8f8ff", colour = "#f8f8ff"),
          panel.grid.major = element_blank(),
          panel.grid.minor = element_blank(),
          axis.title.y = element_blank(),
          axis.text.y = element_blank(),
          axis.title.x = element_blank(),
          axis.text.x = element_blank(),
          axis.ticks = element_blank(),
          legend.position = "none")
}

graphMontePi(10000)
