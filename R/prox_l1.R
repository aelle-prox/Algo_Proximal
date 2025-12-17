#' @title Proximal Operator For l1 Norm (Soft-Thresholding)
#' @description Implements the operation sign(x) * pmax(0, abs(x) - tau)
#' @param x A numerical vector on which we apply the operator.
#' @param tau The effective threshold (lambda * step_size)
#' @return A resultant numerical vector
#' @export
prox_l1 <- function(x, tau){
  if(!is.numeric(x)) stop("x should be numeric")
  return(sign(x) * pmax(0, abs(x) - tau))
}


