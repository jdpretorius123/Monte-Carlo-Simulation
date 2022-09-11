monteCarloPi <- function(numDarts){
  inCircle = 0
  
  for (i in 1:numDarts){
    x = runif(1, min = 0, max = 1)
    y = runif(1, min = 0, max = 1)
    
    d = sqrt(x^2 + y^2)
    
    if (d <= 1){
      inCircle = inCircle + 1
    }
  }
  
  pi = 4 * (inCircle/numDarts)
  return(pi)
}

monteCarloPi(100)
