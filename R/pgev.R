#' Generalized Extreme Value: Distribution Function
#'
#' @param q Quantile.
#' @param csi Shape parameter.
#' @param mu Location parameter.
#' @param sigma Scale parameter.
#' @param lower.tail 	Logical; if TRUE (default), probabilities are P(X <= x) otherwise, P(X > x).
#' @return Vector.
#' @examples
#' pgev(0, csi = 0, mu = 1, sigma = 1)
#' integrate(dbgev, csi = 0, mu = 1, sigma = 1, lower = -Inf, upper = 0)
#' pgev(0, csi = 0, mu = 1, sigma = 1, lower.tail = FALSE)
#' curve(pgev(x, csi = 0, mu = 1, sigma = 1), xlim = c(-5, 10))
#' @export

pgev <- function(q, csi, mu, sigma, lower.tail = TRUE) {

  if (csi == 0) {

    fda <- exp(-exp(-(q - mu) / sigma))

  } else {

    fda <- exp(-(1 + csi * (q - mu) / sigma)^(-1 / sigma))

  }

  fda <- ifelse(lower.tail, fda, 1 - fda)

  return(fda)
}

pgev <- Vectorize(pgev, 'q')
