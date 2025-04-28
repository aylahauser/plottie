#' @title Create a Boxplot
#' @description
#' Uses inserted variables,color and data set to create a boxplot that will be displayed in the RStudio plot window.
#' @importFrom ggplot2 ggplot geom_boxplot theme_minimal aes()
#' @export
easy_boxplot <- function(dataset, x, y, color, ...){

  boxplot <- ggplot2::ggplot(data = dataset,
                    mapping = ggplot2::aes(x = .data[[x]],
                                  y = .data[[y]])) +
    ggplot2::geom_boxplot(color = color) +
    ggplot2::theme_minimal()
  return(boxplot)
}

#' @title Create a Lineplot
#' @description
#' Uses inserted variables,color, and data set to create a lineplot that will be displayed in the RStudio plot window.
#' @importFrom ggplot2 ggplot geom_line theme_minimal aes()
#' @export
easy_lineplot <- function(dataset, x, y, color, ...){

  lineplot <- ggplot2::ggplot(data = dataset,
                             mapping = ggplot2::aes(x = .data[[x]],
                                                    y = .data[[y]])) +
    ggplot2::geom_line(color = color) +
    ggplot2::theme_minimal()
  return(lineplot)
}


#' @title Plot Helper
#' @description
#' Uses inserted dataset, x-value, and y-value to return a suggestion on what type of plot the user should make with the inserted variable types.
#' @export
plot_helper <- function(dataset, x, y, ...){
  x <- dataset[[x]]
  y <- dataset[[y]]

  type_x <- x[1]
  type_y <- y[1]

  #checking for scatter plot or line chart:
  if(is.numeric(type_x) == TRUE & is.numeric(type_y) == TRUE){
    return("Since both the independent and dependent variables are continuous, the best plots to create would either be a scatterplot or a line plot. See help pages for easy_scatterplot() and easy_lineplot() for more information.")
  }


  if(is.logical(type_x) == TRUE | is.character(type_x) == TRUE & is.numeric(type_y) == TRUE)
    return("Since the independent variable is discrete and the dependent variable is continuous, the best plots to create would either be a boxplot or a bar graph. See help pages for easy_boxplot() and easy_bargraph() for more information.")
}


