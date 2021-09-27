#' Bimodal Generalized Extreme Value: Density Function
#'
#' @param x Domain, x in R.
#' @param csi Shape parameter, csi != 0.
#' @param mu Location parameter, mu in R.
#' @param sigma Scale parameter, sigma > 0.
#' @param delta Second location parameter, delta >= -1.
#' @return Vector.
#' @examples
#' dbgev(x = -2, csi = -1, mu = 1, sigma = 1, delta = 1)
#' curve(dbgev(x, csi = -1, mu = 1, sigma = 1, delta = 1), xlim = c(-3, 2))
#' integrate(dbgev, csi = -1, mu = 1, sigma = 1, delta = 1, lower = -Inf, upper = Inf)
#' @export

dbgev <- function(x, csi, mu, sigma, delta){

  if (csi == 0 | sigma <= 0 | delta < -1) {
    print("Undefined values! csi != 0 & sigma > 0 & delta >= -1")
    return(NaN)
  }

  value <- sign(mu - 1/csi) * (abs(mu - 1/csi) / sigma)^(1 / (delta + 1))

  if (csi > 0) {
    if (x >= value) {
      y <- dgev(
        x = T0(x = x, sigma = sigma, delta = delta),
        csi = csi,
        mu = mu,
        sigma = sigma
      ) * T1(x = x, sigma = sigma, delta = delta)
    } else {
      y <- 0
    }
  } else if (csi < 0) {
    if (x < value) {
      y <- dgev(
        x = T0(x = x, sigma = sigma, delta = delta),
        csi = csi,
        mu = mu,
        sigma = sigma
      ) * T1(x = x, sigma = sigma, delta = delta)
    } else {
      y <- 0
    }
  }

  return(y)

}

dbgev <- Vectorize(dbgev, 'x')
