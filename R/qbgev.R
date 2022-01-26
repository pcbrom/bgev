#' Bimodal Generalized Extreme Value: Quantile Function
#'
#' @param p Probability.
#' @param csi Shape parameter.
#' @param mu Location parameter.
#' @param sigma Scale parameter.
#' @param delta Second location parameter.
#' @param initial Starting point of range in desired quantile.
#' @param final Starting point of range in desired quantile.
#' @return Vector.
#' @examples
#' curve(pbgev(x, csi = 1, mu = 2, sigma = 1, delta = 2), xlim = c(-5, 5))
#' (value <- qbgev(p = .25, csi = 1, mu = 2, sigma = 1, delta = 2))
#' pbgev(value, csi = 1, mu = 2, sigma = 1, delta = 2)
#' curve(pbgev(x, csi = .1, mu = 2, sigma = 1, delta = 2), xlim = c(-5, 5))
#' (value <- qbgev(p = .5, csi = .1, mu = 2, sigma = 1, delta = 2))
#' pbgev(value, csi = .1, mu = 2, sigma = 1, delta = 2)
#' @export

qbgev <- function(p, csi, mu, sigma, delta) {

  if (csi != 0 & sigma > 0 & delta >= -1) {

    index <- mu + ((-log(p))^(-csi) - 1) / csi
    partial <- (mu / sigma + ((-log(p))^(-csi) - 1) / (sigma * csi) )^( 1 / (delta + 1))

    if (index > 0) {

      yy <- partial

    } else {

      yy <- ((-1)^((2 + delta) / (1 + delta))) * partial

    }

  } else {

    print("Undefined values! csi != 0 & sigma > 0 & delta >= -1")
    return(NaN)

  }

  return(yy)

}

qbgev <- Vectorize(qbgev, 'p')
