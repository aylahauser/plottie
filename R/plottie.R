



easy_boxplot <- function(dataset, x, y, color, fill, ...){

  independent <- dataset$x
  dependent <- dataset$y

  if (is.character(dependent) == TRUE | is.logical(dependent) == TRUE){
    stop("A boxplot uses a continuous variable on the Y-axis.")
  }

  boxplot <- ggplot(data = dataset,
                    mapping = aes(x = independent,
                                  y = dependent)) +
    geom_boxplot()
}
