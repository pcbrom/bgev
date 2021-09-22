#' Generalized Extreme Value: T2. Second derivative of T0
#'
#' @param x Domain, x in R.
#' @param sigma Scale parameter, sigma > 0.
#' @param delta Second location parameter, delta >= -1.
#' @return Vector.
#' @examples
#' T2(x = 2, sigma = 1, delta = 1)
#' @export

T2 <- function(x, sigma, delta) {

  if(delta >= -1 & sigma > 0) {

    return((delta * (delta + 1) * sigma * abs(x)^delta) / x)

  } else {

    print("Undefined values! sigma > 0 & delta >= -1")
    return(NaN)

  }

}

T2 <- Vectorize(T2, 'x')
