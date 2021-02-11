aguatesource <- function(myfunction){
  eval(parse(text = RCurl::getURL('https://raw.githubusercontent.com/FerAguate/SmallRFunctions/master/code_urls.R', ssl.verifypeer = FALSE)))
  functions <- gsub('.R', '', sapply(strsplit(code_urls, '/master/'), function(x) x[2]))
  if(myfunction[1] == 'all') myfunction <- functions                                   
  require(roxygen2)
  require(tools)
for(fun in myfunction){
  myfunction_pos <- grep(paste0('^', fun, '$'), functions, ignore.case = T)[1]
  if(is.na(myfunction_pos)) stop('Function not found. Options are: ', paste(functions, collapse = ' '))
  text_function <- RCurl::getURL(code_urls[myfunction_pos], ssl.verifypeer = FALSE)
  write(text_function, file = 'tmp.txt')
  sourcefile <- 'tmp.txt'
  source_env <- roxygen2::env_file(sourcefile)
  rd_blocks <- roxygen2::parse_file(sourcefile, source_env)
  help_topics <- roxygen2::roclet_process(roxygen2::rd_roclet(), rd_blocks, source_env, dirname(sourcefile))
  topic <- names(rd_code)[1L]
  help_text <- rd_code[[topic]]
  rd <- tools::parse_Rd(textConnection(help_text))
  tools::Rd2HTML(rd, out = paste0(fun, '.html'))
  viewer <- getOption('viewer')
  cat(paste0('To open help, use function viewer(', paste0('"', fun, '.html', '"'), ')'))
  eval(parse(text = text_function), envir = globalenv())
}
}
