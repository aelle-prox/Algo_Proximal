## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
# Load package
library(AlgoProximal)
library(glmnet)

set.seed(123)
N <- 200
P <- 40

# Design matrix
X_test <- matrix(rnorm(N * P), N, P)

# True coefficients (length must match P)
beta_vrai <- c(2.5, -1.5, 0.8, -0.4, 1.2, rep(0, P - 5))

# Response variable
y_test <- X_test %*% beta_vrai + rnorm(N, 0, 0.5)

lambda_test <- 0.1

# ---- Reference solution (glmnet) ----
fit_ref <- glmnet(X_test, y_test, alpha = 1)
beta_ref <- as.vector(coef(fit_ref, s = lambda_test))[-1]

# ---- Our ISTA solution ----
resultat_ista <- ista_lasso(
  X = X_test,
  y = y_test,
  lambda = lambda_test,
  max_iter = 1000,
  tol = 1e-4
)

beta_ista <- resultat_ista$coefficients

# ---- Results analysis ----
comparaison <- data.frame(
  Reel = beta_vrai,
  glmnet_Ref = round(beta_ref, 4),
  ProxLasso_ISTA = round(beta_ista, 4)
)

cat("Comparism table of coefficients (ISTA vs glmnet):\n")
print(comparaison)
cat("\nMax difference (precision) between ISTA and glmnet:",
    max(abs(beta_ista - beta_ref)))

