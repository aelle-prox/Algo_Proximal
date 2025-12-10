test_that("ista_lasso gives results close to glmnet",{
  #1.Generation of the test data
  set.seed(42)
  X <- matrix(rnorm(100*5),100,5)
  beta_true <- c(2,-3,0,0,1) # True coefficients,two are zeros
  y <- X %*% beta_true +rnorm(100,0,0.5)

  #2.Reference solution(glmnet)
  library(glmnet)
  fit_glmnet <- glmnet(X,y,alpha =1,lambda =0.1,standardize =FALSE ,intercept =FALSE)
  beta_glmnet <- as.vector(coef(fit_glmnet ,s=0.1))[-1] # we exclide the intercept

  # 3.Our ISTA solution
  fit_ista <- ista_lasso(X, y ,lambda = 0.1 ,max_iter=5000)
  beta_ista <- fit_ista$coefficients

  # Verification
  # The absolute error must be weak
  expect_true(max(abs(beta_ista -beta_glmnet)) < 0.1)
})
