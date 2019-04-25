fersource <- function(myfunction){
  eval(parse(text = RCurl::getURL('https://raw.githubusercontent.com/FerAguate/SmallRFunctions/master/code_urls.R', ssl.verifypeer = FALSE)))
  functions <- gsub('.R', '', sapply(strsplit(code_urls, '/master/'), function(x) x[2]))
  if(myfunction[1] == 'all') myfunction <- functions
  for(fun in myfunction){
    myfunction_pos <- grep(paste0('^', fun, '$'), functions, ignore.case = T)[1]
    if(is.na(myfunction_pos)) stop('Function not found. Options are: ', paste(functions, collapse = ' '))
    text_function <- RCurl::getURL(code_urls[myfunction_pos], ssl.verifypeer = FALSE)
    eval(parse(text = text_function), envir = globalenv())
  }
}
