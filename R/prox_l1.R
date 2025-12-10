#' @title Proximal Operator For l1 Norm(Soft-Thresholding)
#' @description Implement the operation sign(x) * pmax(0,abs(x)-tau)
#' @param x A numerical vector on which we apply the operator.
#' @param tau The effectif threshold(lambda * step_size)
#'
#' @return A resultant numerical vector
#' @export
prox_l1 <- function(x,tau){
  #
  return(sign(x)*pmax(0,abs(x)-tau))
}
