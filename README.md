<<<<<<< HEAD

<!-- README.md is generated from README.Rmd. Please edit that file -->

# AlgoProximal

<!-- badges: start -->
<!-- badges: end -->

The goal of AlgoProximal is to **solve the LASSO regression
problem** using the Iterative Shrinkage-Thresholding Algorithm

## Installation

You can install the development version of AlgoProximal like so:

``` r
# Ensure that you have all the developping tools
# install.packages("devtools")
devtools::install_github("aelle-prox/Algo_Proximal")
library(AlgoProximal)
# Alternatively,if you use Rstudio:
# Build >Install and Restart
```

## Methodology:L’algorithme ISTA

The package solve the objectif function of
LASSO,
$$J(\beta)=f(\beta) +g(\beta)$$

1.**Smooth Part(Loss step gradient) :**Minimisation of the least squares
error by alternating two steps

$$\tilde{\beta} = \beta^k -\gamma \nabla f(\beta^k)$$

2.  **Non smooth part(Proximal operator) :**Application of the \*\* soft
    thresholding operation\*\*

The key fonctions to implement are
:grad_loss,calculate_lipschitz_const(),prox_l1().

This package is concieved for;

- Students which need to understand proximal algorithm

- Teachers in statistics and automatique learning

- Claire implementation of proximal algorithm in R

## Example

This is how create a LASSO modele and obtain their coefficients

``` r
# Charge the package and its fonctions
library(devtools)
#> Loading required package: usethis
load_all()
#> ℹ Loading AlgoProximal
# If the package is install:library(AlgoProximal)

# 1.Simulation of data(4 predictors,the two last are Zeros)
set.seed(123)
N <- 100
P <- 4
X <- matrix(rnorm(N *P),N ,P)
y <- X%*% c(3,-2,0,0) + rnorm(N,0,0.5)

# 2.Define the regularisation parameter
lambda_test <- 0.2

# 3.Execution of the ISTA solver
# max_iter and tol are fixed to ensure convergence
resultat_lasso <- ista_lasso(X=X,
                             y=y,
                             lambda=lambda_test,
                             max_iter=5000,
                             tol=1e-4)

#Paste the obtained coefficients
cat(" Predicts coefficients( the third and forth must be close to zero) :\n ")
#>  Predicts coefficients( the third and forth must be close to zero) :
#> 
print(round(resultat_lasso$coefficients,4))
#> [1]  2.6678 -1.8782  0.0000  0.0000
```

## References

-Tibshirani,R(1996).Regression shrinkage and Selection via the LASSO.

## Library

This package is distributes via the licence MIT

## Author

Github :devtools::https://github.com/aelle-prox


=======

<!-- README.md is generated from README.Rmd. Please edit that file -->


