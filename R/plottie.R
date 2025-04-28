#' @title Quickly creating a scatterplot
#' @description
#' Given two numeric variables from a data frame, the `easy_scatterplot()` function provides a simpler
#' way to create scatterplots without manually writing full ggplot2 code.
#' Users can customize the setting of the scatterplot by adding additional arguments.
#' @param darataset The data frame providing the data for the plot.
#' @param x The variable name to be used for the x-axis (the independent variable).
#' @param y The variable name to be used for the y-axis (the dependent variable).
#' @param color A categorical variable to color the points.
#' @param ... Additional ggplot2 arguments passed to `geom_point()`, such as `size`, `alpha`, etc.
#' @importFrom ggplot2 aes_string geom_point theme_minimal
#' @return A ggplot2 scatterplot object.
#' @examples
#' easy_scatterplot(mtcars, x = "wt", y = "mpg", color = "cyl", size = 3, alpha = 0.5)
#' @export
easy_scatterplot <- function(dataset, x, y, color = NULL, ...) {
  if (!x %in% names(dataset)) {
    stop("The variable x is not in the dataset.")
  }
  if (!y %in% names(dataset)) {
    stop("The variable y is not in the dataset.")
  }
  if (!is.null(color) && !(color %in% names(dataset))) {
    stop("The color variable is not in the dataset.")
  }
  if (!is.numeric(dataset[[x]]) || !is.numeric(dataset[[y]])) {
    stop("Both x and y must be numeric for a scatterplot.")
  }

  scatterplot <- ggplot2::ggplot(
    dataset,
    ggplot2::aes_string(x = x, y = y, color = color)
  ) +
    ggplot2::geom_point(...) +
    ggplot2::theme_minimal()

  return(scatterplot)
}

#' @title Quickly creating a barplot
#' @description
#' Given one categorical variable from a data frame, the `easy_barplot()` function provides a simpler
#' way to create barplots without manually writing full ggplot2 code.
#' Users can customize the setting of the barplot by adding additional arguments.
#' @param darataset The data frame providing the data for the plot.
#' @param x The variable name to be used for the x-axis.
#' @param fill A categorical variable to fill the bars.
#' @param ... Additional arguments passed to `geom_bar()`, such as `size`, `alpha`, etc.
#' @importFrom ggplot2 aes_string geom_bar theme_minimal
#' @return A ggplot2 barplot object.
#' @examples
#' easy_barplot(mtcars, x = "cyl")
#' @export
easy_barplot <- function(dataset, x, fill = NULL, ...) {
  if (!x %in% names(dataset)) {
    stop("The variable x is not in the dataset.")
  }
  if (!is.null(fill) && !(fill %in% names(dataset))) {
    stop("The fill variable is not in the dataset.")
  }
  if (!is.factor(dataset[[x]]) && !is.character(dataset[[x]])) {
    warning("X is not categorical and will be converted to factor.")
    dataset[[x]] <- as.factor(dataset[[x]])
  }

  barplot <- ggplot2::ggplot(
    data = dataset,
    ggplot2::aes_string(x = x, fill = fill)
  ) +
    ggplot2::geom_bar(...) +
    ggplot2::theme_minimal()

  return(barplot)
}

#' @title Quickly creating a histogram
#' @description
#' Given one numeric variable from a data frame, the `easy_histogram()` function provides a simpler
#' way to create histograms without manually writing full ggplot2 code.
#' Users can customize the setting of the histogram by adding additional arguments.
#' @param darataset The data frame providing the data for the plot.
#' @param x The variable name to be used for the x-axis.
#' @param fill A categorical variable to fill the histogram.
#' @param ... Additional arguments passed to `geom_histogram()`, such as `size`, `alpha`, etc.
#' @importFrom ggplot2 aes_string geom_histogram theme_minimal
#' @return A ggplot2 histogram object.
#' @examples
#' easy_histogram(mtcars, x = "mpg", fill = "cyl")
#' @export
easy_histogram <- function(dataset, x, fill = NULL, ...) {
  if (!x %in% names(dataset)) {
    stop("The variable x is not in the dataset.")
  }
  if (!is.null(fill) && !(fill %in% names(dataset))) {
    stop("The fill variable is not in the dataset.")
  }
  if (!is.numeric(dataset[[x]])) {
    stop("x must be numeric for a histogram.")
  }

  histogram <- ggplot2::ggplot(
    data = dataset,
    ggplot2::aes_string(x = x, fill = fill)
  ) +
    ggplot2::geom_histogram(...) +
    ggplot2::theme_minimal()

  return(histogram)
}
