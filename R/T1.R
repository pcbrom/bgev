#' Generalized Extreme Value: T1. First derivative of T0
#'
#' @param x Domain, x in R.
#' @param sigma Scale parameter, sigma > 0.
#' @param delta Second location parameter, delta >= -1.
#' @return Vector.
#' @examples
#' T1(x = 2, sigma = 1, delta = 1)
#' @export

T1 <- function(x, sigma, delta) {

  if(delta >= -1 & sigma > 0) {

    return((delta + 1) * sigma * abs(x)^delta)

  } else {

    print("Undefined values! sigma > 0 & delta >= -1")
    return(NaN)

  }

}

T1 <- Vectorize(T1, 'x')
