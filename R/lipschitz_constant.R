#' @title Lipschitz Constant For Least Squares
#' @description Calculate L =max(eigen(X^T X /N)),to define the time step 1/L
#' @param X predicator matrice
#'
#' @return The lipschitz constant
#' @export
calculate_lipschitz_const <- function(X){
  X <- as.matrix(X)
  N <- nrow(X) # Number of predicators
  M <- (t(X) %*% X)/N
  L <- max(eigen(M)$values)
  # A small term for robustness
  return(L +1e-6)
}
