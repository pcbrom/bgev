#' Generalized Extreme Value: Tinv. Inverse function of T0
#'
#' @param x Domain, x in R.
#' @param sigma Scale parameter, sigma > 0.
#' @param delta Second location parameter, delta >= -1.
#' @return Vector.
#' @examples
#' Tinv(x = 2, sigma = 1, delta = 1)
#' @export

Tinv <- function(x, sigma, delta) {

  if(delta >= -1 & sigma > 0) {

    if (x >= 0) {
      y <- (x / sigma)^(1 / (delta + 1))
    } else {
      y <- -(-x / sigma)^(1 / (delta + 1))
    }
    return(y)

  } else {

    print("Undefined values! sigma > 0 & delta >= -1")
    return(NaN)

  }

}

Tinv <- Vectorize(Tinv, 'x')
