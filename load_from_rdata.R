#' @title load_from_rdata
#' @description Loads one object from a RData file.
#' @usage load_get(f, ...)
#' @param f a connection or a character string giving the name of the file to load.
#' @param index integer indicating the position of the object to load. By default = 1 (reference to the first object in the RData file).

load_from_rdata <- function(f, index = 1){
  env <- new.env()
  nm <- load(f, env)[index]
  env[[nm]]
}
