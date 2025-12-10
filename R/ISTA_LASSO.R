#' @title Solver LASSO by ISTA Proximal Algorithm
#' @description Implement the ISTA loop to minimise the LASSO objectif
#' @param X Predicator matrice
#' @param y Vector of responses
#' @param lambda The LASSO regularisation parameter
#' @param max_iter Number of iterations
#' @param tol Convergence tolerance
#'
#' @return A list which contains the final coeffiients and the number of iterations
#' @export
ista_lasso <- function(X ,y ,lambda, max_iter=1000 ,tol=1e-4){
  # 1. Calculate the time step
  L <- calculate_lipschitz_const(X)
  step_size <- 1/L

  # 2.Initiation
  P <- ncol(X)
  beta <- rep(0,P)

  for(k in 1:max_iter){
    beta_old <- beta

    # 3.The Gradient Loss Step(Smooth Part)
    grad <- grad_loss(X,y,beta)
    # Calculate the intermediate point beta_tilde
    beta_grad <- beta -step_size*grad

    # 4.The Proximal Operator Step(Non-Smooth Part)
    tau <- lambda *step_size # Definition of the effectif threshold
    beta <- prox_l1(beta_grad,tau)

    # 5.Convergence Verification(stop condition)
    diff_norm <- sum((beta -beta_old)^2) # The square difference of the l2 norm

    if(diff_norm < tol){
      break
    }
  }
  return(list(
    coefficients = as.vector(beta),
    iterations = k
  ))
}
