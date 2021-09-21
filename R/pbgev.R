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
#' pbgev(0, csi = 1, mu = 2, sigma = 1, delta = 2)
#' pbgev(0, csi = 1, mu = 2, sigma = 1, delta = 2, lower.tail = FALSE)
#' curve(pbgev(x, csi = 1, mu = 2, sigma = 1, delta = 2), xlim = c(-5, 10))
#' @export

pbgev <- function(q, csi, mu, sigma, delta, lower.tail = TRUE) {

  if (csi != 0 & sigma > 0 & delta >= -1) {

    y <- sigma * q * abs(q)^delta

    if (csi == 0) {

      cdf <- exp(- exp(-(y - mu) / sigma))

    } else {

      cdf <- exp(-(1 + csi * ((y - mu) / sigma)^(-1 / csi)))

    }

    cdf <- ifelse(lower.tail, cdf, 1 - cdf)

  } else {

    print("Undefined values! csi != 0 & sigma > 0 & delta >= -1")
    return(NaN)

  }

  return(cdf)

}

pbgev <- Vectorize(pbgev, 'q')
