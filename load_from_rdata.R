#' @title create_color_vector
#' @description Creates a vector of colors matching each category of the imput vector.
#' @usage create_color_vector(vector, ...)
#' @arguments vector = a vector of numbers or characters with more than one category.
#' @arguments colors = colors for each category in increasing order.
#' @details Function useful when adding colors by category in the base function 'plot'.
#' @example x <- rnorm(1000)
#' @example plot(x, col = create_color_vector(x > 0))
#' @author Fernando Aguate

load_get <- function(f, index = 1){
  env <- new.env()
  nm <- load(f, env)[index]
  env[[nm]]
}
