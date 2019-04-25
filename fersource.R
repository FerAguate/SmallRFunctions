fersource <- function(myfunction){
  for(fun in myfunction){
  eval(parse(text = RCurl::getURL('https://raw.githubusercontent.com/FerAguate/SmallRFunctions/master/code_urls.R', ssl.verifypeer = FALSE)))
  myfunction_pos <- grep(paste0('^', fun, '$'), sapply(strsplit(code_urls, '/master/'), function(x) x[2]), ignore.case = T)[1]
  if(length(myfunction_pos) == 0) stop('Function not found')
  text_function <- RCurl::getURL(code_urls[myfunction_pos], ssl.verifypeer = FALSE)
  eval(parse(text = text_function), envir = globalenv())
  }
}
