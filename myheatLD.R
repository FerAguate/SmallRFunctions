#' @title Heatmap of LD blocks
#' @description Creates a heatmap of LD blocks. 
#' @param LDmat correlation squared matrix. cor(X)^2
#' @param Xpos vector with base pair positions matching colnames in LDmat
#' @param Dmat discovery (TRUE or FALSE) matrix or data frame. nrow(Dmat) must be equal to ncol(LDmat). This is to compare results against different tests (in columns).
#' @param QTLs character vector with QTL rs IDs.
#' @param grid boolean, true will plot a grid; false by default.
#' @param cex.text text size, by default = 0.7
#' @param title (optional) plot title
#' @author Fernando Aguate

myheatLD <- function(LDmat, Xpos, Dmat, QTLs, grid = FALSE, cex.text = .7, title = '') {
  if(nrow(LDmat) != ncol(LDmat)) stop('LDmat must be a square matrix')
  if(nrow(LDmat) != length(Xpos)) stop('Xpos must be a vector of the same length as ncol of LDmat')
  if(nrow(LDmat) < 5) stop('LDmat must have more than 5 SNPs to plot')
  limitX <- nrow(LDmat) + 1 + (ncol(Dmat)*2)
  limitY <- nrow(LDmat)
  plot(1:limitX, c(1:limitY, rep(limitY + 2, limitX-limitY)), type='n',axes=FALSE,ann=FALSE)
  title(main = title, xlab='Physical length (kbp)', ylab='')
  # Color Scale
  colscale <- cut(LDmat, seq(0,1,0.01))
  colkey <- topo.colors(100)
  levels(colscale) <- colkey
  colscale <- as.character(colscale)
  colmat <- matrix(colscale, ncol = ncol(LDmat))
  # Plot heatmap
  for (i in 1:nrow(LDmat)) {
    for (j in 1:nrow(LDmat)) {
      if (i < j) polygon(i - c(1,1,0,0), j - c(1,0,0,1), col = colmat[i,j], border = F)
      if (i == j) polygon(i - c(1,1,0,0), j - c(1,0,0,1), col = 0, border = 'grey40')
    }
  }
  # The grid
  if (grid) {
    for (i in 1:nrow(LDmat)){
      lines(rep(i-1, 2), c(i, nrow(LDmat)), col = 'grey')
      lines(c(0, i-1), rep(i-1, 2), col = 'grey')
    }
  }
  # color key
  colorkey_xpos <- seq(nrow(LDmat) - 5, nrow(LDmat), length.out = 101)
  colorkey_ypos <- 2
  for (i in 1:100)
    polygon(rep(c(colorkey_xpos[i],colorkey_xpos[i+1]), each = 2), 
            rep(colorkey_ypos, 4) + c(0,1,1,0), col = colkey[i], border = F)
  text(min(colorkey_xpos), colorkey_ypos - 1, '0', cex = cex.text)
  text(max(colorkey_xpos), colorkey_ypos - 1, '1', cex = cex.text)
  text(mean(colorkey_xpos), colorkey_ypos + 2, expression('R'^2 ~ 'Color key:'), cex = cex.text)
  # Add QTLs
  for (i in QTLs) {
    cQTL <- colnames(LDmat) %in% i
    if(!any(cQTL)) stop('The QTL is not in the colnames of LDmat')
    wQTL <- which(cQTL)-1
    polygon(wQTL + c(0,0,1,1), wQTL + c(0,1,1,0), col = 'black', border = F)
    text(wQTL+.5, wQTL+.5, '-> QTL', pos = 4, cex = cex.text)
    lines(rep(wQTL+.5,2), c(0,limitY), col = 'black')
  }
  # Add discoveries
  for (j in 1:ncol(Dmat)){
    dis_xpos <- nrow(LDmat)+(j*2)
    text(dis_xpos, limitY + 1, colnames(Dmat)[j], cex = cex.text, srt = 90)
    for (i in which(Dmat[,j])) {
      dcol <- ifelse(i %in% which(colnames(LDmat) %in% QTLs), 1, 2) # color for true and false discoveries
      polygon(dis_xpos + c(-.5,-.5,.5,.5), i + c(0,-1,-1,0), col = dcol, border = F)
      if(!i %in% which(colnames(LDmat) %in% QTLs)) lines(c(0, limitX), rep(i-.5, 2), col = dcol)
    }
  }
  
  # X axis: physical distance (every 5 SNPs or so)
  xaxis <- c(1, which(1:ncol(LDmat) %% 5 == 0))
  kbpos <- Xpos[xaxis] / 1000
  axis(1, xaxis-.5, labels = F)
  xat <- vector()
  xlab <- vector()
  for (i in seq_along(xaxis)[-1]) {
    xat[i-1] <- mean(xaxis[c(i-1,i)])
    xlab[i-1] <- round(abs(kbpos[i] - kbpos[i-1]), 1)
  }
  axis(1, xat-.5, labels = xlab, cex.axis = cex.text, tick = F)
}
