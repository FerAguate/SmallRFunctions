create_color_vector <- function(vector, colors = c('#1B9E77', '#D95F02')){
  as.character(factor(vector, levels = unique(vector), labels = colors))  
}
