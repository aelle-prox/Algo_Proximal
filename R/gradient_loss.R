#' @title The Loss Gradient function for least squares
#' @description Calculate the gradient of the smooth term for ISTA iteration
#' @param X Predicator matrice
#' @param y Vector of responses
#' @param beta Vector current coefficient
#'
#' @return A numerical vector ,gradient of f(beta)
#' @export
grad_loss <- function(X,y,beta){
  N <- nrow(X)
  residues <- X %*%beta-y
  gradient <- (t(X) %*% residues)/N
  return(as.vector(gradient))
}
