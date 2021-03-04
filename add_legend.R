#' @title add_legend
#' @description adds a legend to a plot
#' @param legylim vector with y limits
#' @param legxlim vector with x limits
#' @param leglab character vector of labels (include title)
#' @param legtyp character vector indicating type of label. 't' is for title, 's' is for symbol, and 'l' is for line. By default, the first label is 't' and the rest are 's'.
#' @param legpch vector of either symbol type (pch) or line type (lty). By default, all are pch = 1.
#' @param legcol vector of colors for each label. By default, all are col = 1.
#' @param legxali x axis alignment of non-title labels. By default, the centered alignment = 1.
#' @param legline line length proportion for line-type labels. Increasing values indicate longer lines (1.01 by default).
#' @param legcex legend size of text and symbols (1 by default).
#' @param leglwd legend line width (1 by default).
#' @author Fernando Aguate
#' @examples
#' plot(1:10, 1:10, cex = 0)
#' points(1:10, 1:10 - 1, pch = 3)
#' points(1:10, 1:10 + 1, pch = 2)
#' abline(0, 1, col = 2)
#' add_legend(legylim = c(2, 4), legxlim = c(8, 10), legtyp = c('t','s','l','s'), legpch = c(1, 3, 1, 2), legcol = c(1,1,2,1))

add_legend <- function(legylim = c(0, 1), legxlim = c(0, 1),
                       leglab = c('Symbol:', 'min', 'mean', 'max'),
                       legtyp = 't',
                       legpch = 1,
                       legcol = 1,
                       legxali = 1,
                       legline = 1.01,
                       legcex = 1,
                       leglwd = 1){
  if (length(legtyp) < length(leglab)) legtyp <- c(legtyp, rep('s', length(leglab) - length(legtyp)))
  if (length(legpch) < length(leglab)) legpch <- c(legpch, rep(1, length(leglab) - length(legpch)))
  if (length(legcol) < length(leglab)) legcol <- c(legcol, rep(1, length(leglab) - length(legcol)))
  if (length(legcex) < length(leglab)) legcex <- c(legcex, rep(legcex[1], length(leglab) - length(legcex)))
  if (length(leglwd) < length(leglab)) leglwd <- c(leglwd, rep(leglwd[1], length(leglab) - length(leglwd))) 
  
  legran <- seq(max(legylim), min(legylim), length.out = length(leglab))
  legx <- mean(legxlim) * legxali
  
  for (j in 1:length(leglab)) {
    text(switch((legtyp[j] == 't') + 1, legx, min(legxlim)), legran[j], 
         labels = leglab[j], pos = 4, cex = legcex[j])
    if (legtyp[j] == 's')
      points(legx, legran[j], pch = legpch[j], col = legcol[j], cex = legcex[j])
    if (legtyp[j] == 'l')
      lines(x = c(legx * (1 - (legline - 1)), legx * legline), 
            y = rep(legran[j], 2), col = legcol[j], lty = legpch[j], lwd = leglwd[j])
  }
}
