#' Bimodal Generalized Extreme Value: Distribution Function
#'
#' @param q Quantile.
#' @param csi Shape parameter.
#' @param mu Location parameter.
#' @param sigma Scale parameter.
#' @param delta Second location parameter.
#' @param lower.tail 	Logical; if TRUE (default), probabilities are P(X <= x) otherwise, P(X > x).
#' @return Vector.
#' @importFrom bgumbel pbgumbel
#' @examples
#' pbgev(0, csi = 0, mu = 0, sigma = 1, delta = 2)
#' pbgev(0, csi = 0, mu = 0, sigma = 1, delta = 2, lower.tail = FALSE)
#' pbgev(0, csi = 1, mu = 0, sigma = 1, delta = 2)
#' pbgev(0, csi = 1, mu = 0, sigma = 1, delta = 2, lower.tail = FALSE)
#' integrate(dbgev, csi = 0, mu = 0, sigma = 1, delta = 2, lower = -Inf, upper = 0)
#' integrate(dbgev, csi = 1, mu = 0, sigma = 1, delta = 2, lower = -Inf, upper = 0)
#' curve(pbgev(x, csi = 0, mu = 0, sigma = 1, delta = 2), xlim = c(-5, 10))
#' curve(pbgev(x, csi = 1, mu = 0, sigma = 1, delta = 2), xlim = c(-5, 10))
#' @export

pbgev <- function(q, csi, mu, sigma, delta, lower.tail = TRUE) {

  if (csi == 0) {

    fda <- pbgumbel(q = q, mu = mu, sigma = sigma, delta = delta, lower.tail = lower.tail)

  } else {

    T.bg <- function(q, sigma, delta) sigma * q * abs(q)^delta

    fda <- pgev(
      q = T.bg(q = q, sigma = sigma, delta = delta),
      csi = csi,
      mu = mu,
      sigma = sigma
    )

    fda <- ifelse(lower.tail, fda, 1 - fda)

  }

  return(fda)
}

pbgev <- Vectorize(pbgev, 'q')
