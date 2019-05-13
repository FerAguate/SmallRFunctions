load_get <- function(f, index = 1){
  env <- new.env()
  nm <- load(f, env)[index]
  env[[nm]]
}
