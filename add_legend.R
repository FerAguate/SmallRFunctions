#' @title add_legend
#' @description adds legend to a plot
#' @param legylim vector with y limits
#' @param legxlim vector with x limits
#' @param leglab character vector of labels (include title)
#' @param legtyp character vector indicating type of label. 't' is for title, 's' is for symbol, and 'l' is for line.
#' @param legpch vector of either symbol type (pch) or line type (lty)
#' @param legcol vector of colors for each label
#' @param legxali x axis alignment (default = 1) of non-title labels. 
#' @param legline line length proportion for line-type labels.
#' @param legcex legend size
#' @author Fernando Aguate
#' @examples
#' plot(1:10, 1:10, cex = 0)
#' points(1:10, 1:10 - 1, pch = 3)
#' points(1:10, 1:10 + 1, pch = 2)
#' abline(0, 1, col = 2)
#' add_legend(legylim = c(2, 4), legxlim = c(8, 10))

add_legend <- function(legylim, legxlim,
                       leglab = c('Symbol:', 'min', 'mean', 'max'),
                       legtyp = c('t', 's', 'l', 's'),
                       legpch = c(1, 3, 1, 2),
                       legcol = c(1, 1, 2, 1),
                       legxali = 1,
                       legline = 1.01,
                       legcex = 1){
  
  legran <- seq(max(legylim), min(legylim), length.out = length(leglab))
  legx <- mean(legxlim) * legxali
  
  for (j in 1:length(leglab)) {
    text(switch((legtyp[j] == 't') + 1, legx, min(legxlim)), legran[j], 
         labels = leglab[j], pos = 4, cex = legcex)
    if (legtyp[j] == 's')
      points(legx, legran[j], pch = legpch[j], col = legcol[j], cex = legcex)
    if (legtyp[j] == 'l')
      lines(x = c(legx * (1 - (legline - 1)), legx * legline), 
            y = rep(legran[j], 2), col = legcol[j], lty = legpch[j], lwd = legcex)
  }
}
