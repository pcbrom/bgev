.onAttach <- function(libname, pkgname) {
  if (!capabilities('long.double')) {options(matprod = 'internal')}
}
