create_color_vector <- function(vector, colors = c('#1B9E77', '#D95F02')){
  if(length(colors) < length(unique(vector))) colors <- rainbow(length(unique(vector)), s = .9)
  as.character(factor(vector, levels = unique(vector), labels = colors))  
}
