add_legend_bottom_right <- function(legylim, legxlim,
                                    leglab = c('Symbol:', 'min', 'mean', 'max', 'other'), 
                                    legtyp = c('t', 's', 'l', 's', 'l'), 
                                    legpch = c(NA, 3, 1, 4, 2), 
                                    legcol = c(1, 1, 1, 1, 6), 
                                    legpos = c(.7, .85), 
                                    leg_xali = 1.11, 
                                    legcex = 1, 
                                    legxline = 8){
  # legylim: y limits
  # legxlim: x limits
  # leglab: labels
  # legtyp: type. t = title, s = symbol, l = line
  # legpch: pch or lty
  # legcol: color
  # legpos: Bottom left corner, proportion of x and y axes
  # leg_xali: left indentation
  # legcex: legend size
  # legxline: x axis line length
  leglow <- (legylim[2] - legylim[1]) * legpos[2] + legylim[1]
  legran <- seq(legylim[2], leglow, length.out = length(leglab))
  legxran <- seq(legxlim[1], legxlim[2], length.out = as.numeric(legxlim[2] - legxlim[1]))
  legxt <- legxran[round(length(legxran) * legpos[1])]
  legx <- legxran[round(length(legxran) * legpos[1] * leg_xali)]
  for (j in 1:length(leglab)) {
    text(switch((legtyp[j] == 't') + 1, legx, legxt), legran[j], 
         labels = leglab[j], pos = 4, cex = legcex)
    if (legtyp[j] == 's')
      points(legx, legran[j], pch = legpch[j], col = legcol[j], cex = legcex)
    if (legtyp[j] == 'l')
      lines(c(legx - round(legxline / 2), legx + round(legxline / 2)), rep(legran[j], 2), lty = legpch[j], col = legcol[j], cex = legcex)
  }
}
