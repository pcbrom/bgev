#' Bimodal Generalized Extreme Value: Density Function
#'
#' @param x Domain.
#' @param csi Shape parameter.
#' @param mu Location parameter.
#' @param sigma Scale parameter.
#' @param delta Second location parameter.
#' @return Vector.
#' @importFrom bgumbel dbgumbel
#' @examples
#' dbgev(x = 2, csi = 0, mu = 1, sigma = 1, delta = 1)
#' curve(dbgev(x, csi = 0, mu = 0, sigma = 1, delta = 2), xlim = c(-5, 10))
#' integrate(dbgev, csi = 0, mu = 1, sigma = 1, delta = 1, lower = -5, upper = 0)
#' dbgev(x = 2, csi = 1, mu = 0, sigma = 1, delta = 2)
#' curve(dbgev(x, csi = 1, mu = 0, sigma = 1, delta = 2), xlim = c(-1, 5))
#' @export

dbgev <- function(x, csi, mu, sigma, delta){

  if (csi == 0) {

    y <- dbgumbel(x, mu = mu, sigma = sigma, delta = delta)

  } else {

    y <- (delta + 1) *
      (abs(x)^delta) *
      (1 + csi * (x * abs(x)^delta - mu / sigma))^(-(1 / csi) - 1) *
      exp(-(1 + csi * ((x * abs(x)^delta - mu / sigma)))^(-1 / csi))

    y <- ifelse(y < 0 | is.infinite(y) | is.na(y) | is.nan(y), 0, y)

  }

  return(y)

}

dbgev <- Vectorize(dbgev, 'x')
