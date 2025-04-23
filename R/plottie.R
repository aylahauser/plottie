#' @title Create a Boxplot
#' @description
#' Uses inserted variables and data set to create a boxplot that will be displayed in the RStudio plot window.
#'
#' @importFrom ggplot2 ggplot geom_boxplot theme_minimal
#' @export
easy_boxplot <- function(dataset, x, y, color, ...){

  independent <- dataset$x
  dependent <- dataset$y

  if (is.character(dependent) == TRUE | is.logical(dependent) == TRUE){
    stop("A boxplot uses a continuous variable on the Y-axis.")
  }
  boxplot <- ggplot2::ggplot(data = dataset,
                    mapping = aes(x = independent,
                                  y = dependent,
                                  color = color)) +
    ggplot2::geom_boxplot() +
    ggplot2::theme_minimal()
  return(boxplot)
}

easy_lineplot <- function(dataset, x, y, color, ...){

  independent <- dataset$x
  dependent <- dataset$y

  if (is.character(dependent) == TRUE | is.logical(dependent) == TRUE){
    stop("A lineplot uses a continuous variable on the Y-axis.")
  }
  lineplot <- ggplot2::ggplot(data = dataset,
                             mapping = aes(x = independent,
                                           y = dependent,
                                           color = color)) +
    ggplot2::geom_line() +
    ggplot2::theme_minimal()
  return(lineplot)
}



