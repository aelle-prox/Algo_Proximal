#' @title Proximal Operator For l1 Norm(Soft-Thresholding)
#' @description Implement the operation sign(x) * pmax(0,abs(x)-tau)
#' @param x A numerical vector on which we apply the operator.
#' @param tau The effectif threshold(lambda * step_size)
#'
#' @return A resultant numerical vector
#' @export
prox_l1 <- function(x,tau){
<<<<<<< HEAD
  if(!is.numeric(x)) stop("x should be numerique")
  sign(x) * pmax(abs(x) - tau ,0)
=======
  #
  return(sign(x)*pmax(0,abs(x)-tau))
>>>>>>> 6c01aca08b4c7bb6e255f142cba02db1a5204a47
}
