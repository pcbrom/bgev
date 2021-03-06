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
#' (value <- qbgev(p = .25, csi = 1, mu = 2, sigma = 1, delta = 2, initial = 1, final = 2))
#' pbgev(value, csi = 1, mu = 2, sigma = 1, delta = 2)
#' curve(pbgev(x, csi = .1, mu = 2, sigma = 1, delta = 2), xlim = c(-5, 5))
#' (value <- qbgev(p = .5, csi = .1, mu = 2, sigma = 1, delta = 2, initial = 0, final = 3))
#' pbgev(value, csi = .1, mu = 2, sigma = 1, delta = 2)
#' @export

qbgev <- function(p, csi, mu, sigma, delta, initial, final) {

  if (csi != 0 & sigma > 0 & delta >= -1) {

    cte <- p
    fx <- function(p) (pbgev(p, csi = csi, mu = mu, sigma = sigma, delta = delta) - cte)^2
    yy <- optimise(f = fx, lower = initial, upper = final, maximum = FALSE)$minimum

  } else {

    print("Undefined values! csi != 0 & sigma > 0 & delta >= -1")
    return(NaN)

  }

  return(yy)

}

qbgev <- Vectorize(qbgev, 'p')
