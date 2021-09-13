#' Bimodal Generalized Extreme Value: Quantile Function
#'
#' @param p Probability.
#' @param mu First location parameter.
#' @param sigma Scale parameter.
#' @param delta Second location parameter.
#' @param initial Starting point of range in desired quantile.
#' @param final Starting point of range in desired quantile.
#' @return Vector.
#' @examples
#' curve(pbgev(x, csi = 0, mu = 0, sigma = 1, delta = 2), xlim = c(-5, 5))
#' (value <- qbgev(p = .25, csi = 0, mu = 0, sigma = 1, delta = 2))
#' (value <- qbgev(p = .25, csi = 1, mu = 0, sigma = 1, delta = 2))
#' pbgev(value, mu = -2, sigma = 1, delta = -1)
#' @export

qbgev <- function(p, csi, mu, sigma, delta) {

  if (csi != 0 & sigma > 0 & delta >= -1) {

    index <- mu + ((-log(p))^(-csi) - 1) / csi

    if (index > 0) {

      yy <- (mu / sigma + ((-log(p))^(-csi) - 1) / (sigma * csi) )^( 1 / (delta + 1))

    } else {

      yy <- ((-1)^((2 + delta) / (1 + delta))) *
        (mu / sigma + ((-log(p))^(-csi) - 1) /
           (sigma * csi))^(1 / (delta + 1))

      # problema:
      # (-1)^((2 + delta) / (1 + delta))

    }

  } else {

    print("Undefined values! csi != 0 & sigma > 0 & delta >= -1")
    return(NaN)

  }

  return(yy)

}

qbgev <- Vectorize(qbgev, 'p')
