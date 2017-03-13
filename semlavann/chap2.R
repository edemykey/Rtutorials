##Chapter 2: Path Models and Analysis

##Example: Path Analysis using lavaan

# create a correlation matrix
library(lavaan)
regression.cor <- lower2full(c(1.0,0.20,1,0.24,0.30,1,0.70,0.80,0.30,1))
# name the variables in the matrix
colnames(regression.cor) <- rownames(regression.cor) <- c("X1", "X2", "X3", "Y") 

# model syntax
regression.model <-'
# structural model for Y
Y ~ a*X1 + b*X2 + c*X3 
# label the residual variance of Y
Y ~~ z*Y 
'
# fit the model
regression.fit <- sem(regression.model, sample.cov=regression.cor, sample.nobs=1000)
summary(regression.fit, rsquare=TRUE)