#' Generalized Extreme Value: Density Function
#'
#' @param x Domain.
#' @param csi Shape parameter.
#' @param mu Location parameter.
#' @param sigma Scale parameter.
#' @return Vector.
#' @examples
#' dgev(x = 2, csi = 0, mu = 1, sigma = 1)
#' curve(dgev(x, csi = 0, mu = 1, sigma = 1), xlim = c(-5, 10), ylim= c(0, .4))
#' integrate(dgev, csi = 0, mu = 1, sigma = 1, lower = -5, upper = 0)
#' @export

dgev <- function(x, csi, mu, sigma) {

  if (csi == 0) {

    fdp <- (1 / sigma) * exp(-(x - mu) / sigma - exp(-(x - mu) / sigma))

  } else {

    fdp <- ((1 / sigma) * (1 + csi * ((x - mu) / sigma))^(-(1 / csi) - 1)) *
      exp(-(1 + csi * ((x - mu) / sigma))^(-1 / csi))

  }

  return(fdp)
}

dgev <- Vectorize(dgev, 'x')
