#' Bimodal Generalized Extreme Value: Distribution Function
#'
#' @param q Quantile.
#' @param csi Shape parameter.
#' @param mu Location parameter.
#' @param sigma Scale parameter.
#' @param delta Second location parameter.
#' @param lower.tail 	Logical; if TRUE (default), probabilities are P(X <= x) otherwise, P(X > x).
#' @return Vector.
#' @examples
#' pbgev(2, csi = 1, mu = 2, sigma = 1, delta = 2)
#' pbgev(2, csi = 1, mu = 2, sigma = 1, delta = 2, lower.tail = FALSE)
#' curve(pbgev(x, csi = 1, mu = 2, sigma = 1, delta = 2), xlim = c(-1, 10))
#' @export

pbgev <- function(q, csi, mu, sigma, delta, lower.tail = TRUE) {

  if (csi == 0 | sigma <= 0 | delta < -1) {
    print("Undefined values! csi != 0 & sigma > 0 & delta >= -1")
    return(NaN)
  }

  value <- sign(mu - 1/csi) * (abs(mu - 1/csi) / sigma)^(1 / (delta + 1))

  if (csi > 0) {
    if (q < value) {
      cdf <- 0
    } else {
      cdf <- pgev(q = T0(x = q, sigma = sigma, delta = delta), csi = csi, mu = mu, sigma = sigma)
      # cdf <- -(1 + csi * (sigma * q * abs(q)^delta - mu)^(1/csi))
    }
  } else if (csi < 0) {
    if (q < value) {
      cdf <- pgev(q = T0(x = q, sigma = sigma, delta = delta), csi = csi, mu = mu, sigma = sigma)
      # cdf <- -(1 + csi * (sigma * q * abs(q)^delta - mu)^(1/csi))
    } else {
      cdf <- 1
    }
  }

  cdf <- ifelse(lower.tail, cdf, 1 - cdf)

  return(cdf)

}

pbgev <- Vectorize(pbgev, 'q')
