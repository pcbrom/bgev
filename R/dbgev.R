#' Bimodal Generalized Extreme Value: Density Function
#'
#' @param x Domain, x in R.
#' @param csi Shape parameter, csi != 0.
#' @param mu Location parameter, mu in R.
#' @param sigma Scale parameter, sigma > 0.
#' @param delta Second location parameter, delta >= -1.
#' @return Vector.
#' @examples
#' dbgev(x = 2, csi = 1, mu = 1, sigma = 1, delta = 1)
#' curve(dbgev(x, csi = -2, mu = -1, sigma = 1, delta = -.9), xlim = c(0, 10))
#' integrate(dbgev, csi = 0, mu = 1, sigma = 1, delta = 1, lower = -5, upper = 0)
#' dbgev(x = 2, csi = 1, mu = 0, sigma = 1, delta = 2)
#' curve(dbgev(x, csi = 1, mu = 0, sigma = 1, delta = 2), xlim = c(-1, 5))
#' @export

dbgev <- function(x, csi, mu, sigma, delta){

  if (csi != 0 & sigma > 0 & delta >= -1) {

    y <- sigma *
      (delta + 1) *
      abs(x)^delta *
      (1 + csi * (sigma * x * abs(x)^delta - mu))^(-1 / csi - 1) *
      exp(-(1 + csi * (sigma * x * abs(x)^delta - mu))^(-1 / csi))

    # Temos problemas numericos para serem testados
    # 1. Montar um grid com x, csi, mu, sigma, delta e avaliar os resultados NaN, Inf e -Inf
    # 2. Criar uma regra de aproximação nas regioes inconsistentes de modo que a solucao seja numerica.
    # 3. Avaliar se essa regra de aproximacao implica em algum problema matematico.

  } else {

    print("Undefined values! csi != 0 & sigma > 0 & delta >= -1")
    return(NaN)

  }

  return(y)

}

dbgev <- Vectorize(dbgev, 'x')
