# this tutorial was take from https://blogs.baylor.edu/rlatentvariable/sample-page/r-syntax/
# 

#Chapter 1: Introduction to R

#Input data using c() function

# create new dataset
newData <- c(4,5,3,6,9)

#Input covariance matrix

# load lavaan
library(lavaan)
# input covariances
example.cor <- lower2full(c(1, 0.85, 1, 0.84, 0.61, 1, 0.68, 0.59, 0.41, 1))
# name the rows and columns
rownames(example.cor) <- colnames(example.cor)  <- c("Var1", "Var2", "Var3", "Var4") 


##Summary statistics

# load the MLBPitching2011 dataset from the BaylorEdPsych package
library(BaylorEdPsych)
data(MLBPitching2011) 
# summary statistics
summary(MLBPitching2011$ERAP)
library(psych)
describe(MLBPitching2011$ERAP) 
# frequency of each value of ERAP variable
table(MLBPitching2011$ERAP) 
# frequency table
# make cut points for frequency table groupings--here I used 50
boundaries <- seq(0,550,50) 
# frequency table
table(cut(MLBPitching2011$ERAP, boundaries))
# relative frequency table
table(cut(MLBPitching2011$ERAP, boundaries)) / length(MLBPitching2011$ERAP)

# Pearson correlations for losses (L) and Age
cor(MLBPitching2011$Age,MLBPitching2011$L)
# Spearman correlation
cor(MLBPitching2011$Age,MLBPitching2011$L, method="spearman")

# covariance for losses (L) and Age
cov(MLBPitching2011$Age,MLBPitching2011$L)

##Statistical tests

# uses BaylorEdPsych package's MLBPitching2011 data

# Z test
library(TeachingDemos)
z.test(na.omit(MLBPitching2011$WLP), mu=0.50, stdev=sqrt(.08))

# one sample t-test
t.test(MLBPitching2011$WLP, mu=.50, alternative="two.sided", conf.level=.95)
# independent samples t-test
t.test(WLP~Lg, data=MLBPitching2011, na.rm=TRUE, var.equal=TRUE) 
# dependent samples t-test
t.test(MLBPitching2011$W, MLBPitching2011$L, paired=TRUE)

# homogeneity of variance tests
# F-test
var.test(WLP[Lg=="NL"], WLP[Lg=="AL"], na.rm=TRUE) 
# Bartlett's Test
bartlett.test(WLP,Lg) 
library(car) 
# Levene's test
leveneTest(WLP, Lg,center="mean") 
# Brown-Forsyth Test 
leveneTest(WLP,Lg,center="median")


