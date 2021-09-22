#' Generalized Extreme Value: T0
#'
#' @param x Domain, x in R.
#' @param sigma Scale parameter, sigma > 0.
#' @param delta Second location parameter, delta >= -1.
#' @return Vector.
#' @examples
#' T0(x = 2, sigma = 1, delta = 1)
#' @export

T0 <- function(x, sigma, delta) {

  if(delta >= -1 & sigma > 0) {

    return(sigma * x * abs(x)^delta)

  } else {

    print("Undefined values! sigma > 0 & delta >= -1")
    return(NaN)

  }

}

T0 <- Vectorize(T0, 'x')
