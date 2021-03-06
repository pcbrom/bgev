% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/qbgev.R
\name{qbgev}
\alias{qbgev}
\title{Bimodal Generalized Extreme Value: Quantile Function}
\usage{
qbgev(p, csi, mu, sigma, delta)
}
\arguments{
\item{p}{Probability.}

\item{mu}{First location parameter.}

\item{sigma}{Scale parameter.}

\item{delta}{Second location parameter.}

\item{initial}{Starting point of range in desired quantile.}

\item{final}{Starting point of range in desired quantile.}
}
\value{
Vector.
}
\description{
Bimodal Generalized Extreme Value: Quantile Function
}
\examples{
curve(pbgev(x, csi = 0, mu = 0, sigma = 1, delta = 2), xlim = c(-5, 5))
(value <- qbgev(p = .25, csi = 0, mu = 0, sigma = 1, delta = 2))
(value <- qbgev(p = .25, csi = 1, mu = 0, sigma = 1, delta = 2))
pbgev(value, mu = -2, sigma = 1, delta = -1)
}
