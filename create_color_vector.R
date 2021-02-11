#' @title create_color_vector
#' @description Creates a vector of colors matching each category of the imput vector.
#' @usage create_color_vector(vector, ...)
#' @arguments vector = a vector of numbers or characters with more than one category.
#' @arguments colors = colors for each category in increasing order.
#' @details Function useful when adding colors by category in the base function 'plot'.
#' @example x <- rnorm(1000)
#' @example plot(x, col = create_color_vector(x > 0))
#' @author Fernando Aguate

create_color_vector <- function(vector, colors = c('#1B9E77', '#D95F02')){
  if(length(colors) < length(unique(vector))) colors <- rainbow(length(unique(vector)), s = .9)
  as.character(factor(vector, levels = unique(vector), labels = colors))  
}
