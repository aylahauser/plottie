
#' @title Quickly Create a Boxplot
#' @description
#' Given one discrete variable and one numeric variable, the `easy_boxplot()` function provides a simpler way to display a boxplot in the Rstudio plot window without manually writing the full ggplot2 code.
#' Users can customize the setting of the boxplot by adding additional arguments.
#' @param dataset The name of the data frame providing the data for the plot.
#' @param x The variable name to be used for the x-axis (the independent variable).
#' @param y The variable name to be used for the y-axis (the dependent variable).
#' @param color A categorical variable to be used to color the plot.
#' @param ... Additional ggplot2 arguments passed to `geom_point()`, such as `size`, `alpha`, etc.
#' @importFrom ggplot2 ggplot geom_boxplot theme_minimal aes theme element_text
#' @return A ggplot2 boxplot displayed in Rstudio plot window.
#' @examples
#' easy_boxplot(mpg, x = "model", y = "hwy", color = "blue")
#' @export
easy_boxplot <- function(dataset, x, y, color, ...){
  if (!x %in% names(dataset)) {
    stop("The variable x is not in the dataset.")
  }
  if (!y %in% names(dataset)) {
    stop("The variable y is not in the dataset.")
  }

  if (!color %in% names(dataset)) {
    stop("The color variable is not in the dataset.")
  }

  if (!(is.character(dataset[[x]]) || is.factor(dataset[[x]]) || is.logical(dataset[[x]])) ||
      !is.numeric(dataset[[y]])) {
    stop("x must be a character, factor, or logical, and y must be numeric for a boxplot.")
  }

  boxplot <- ggplot2::ggplot(data = dataset,
                    mapping = ggplot2::aes(x = .data[[x]],
                                  y = .data[[y]],
                                  color = .data[[color]])) +
    ggplot2::geom_boxplot() +
    ggplot2::theme_minimal() +
    ggplot2::theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

  return(boxplot)
}

#' @title Quickly Create a Lineplot
#' @description
#' Given two numeric variables, the `easy_lineplot()` function provides a simpler way to display a lineplot in the Rstudio plot window without manually writing the full ggplot2 code.
#' Users can customize the setting of the lineplot by adding additional arguments.
#' @param dataset The name of the data frame providing the data for the plot.
#' @param x The variable name to be used for the x-axis (the independent variable).
#' @param y The variable name to be used for the y-axis (the dependent variable).
#' @param color A categorical variable to be used to color the plot.
#' @param ... Additional ggplot2 arguments passed to `geom_point()`, such as `size`, `alpha`, etc.
#' @return A ggplot2 lineplot displayed in Rstudio plot window.
#' @importFrom ggplot2 ggplot geom_line theme_minimal aes theme element_text
#' @examples
#' easy_lineplot(mpg, x = "cty", y = "hwy", color = "blue")
#' @export
easy_lineplot <- function(dataset, x, y, color, ...){

  if (!x %in% names(dataset)) {
    stop("The variable x is not in the dataset.")
  }
  if (!y %in% names(dataset)) {
    stop("The variable y is not in the dataset.")
  }
  if (!color %in% names(dataset)) {
    stop("The color variable is not in the dataset.")
  }

  if (!is.numeric(dataset[[x]]) & !is.numeric(dataset[[y]])) {
    stop("Both x and y must be numeric for a scatterplot.")
  }

  lineplot <- ggplot2::ggplot(data = dataset,
                             mapping = ggplot2::aes(x = .data[[x]],
                                                    y = .data[[y]],
                                                    color = .data[[color]])) +
    ggplot2::geom_line() +
    ggplot2::theme_minimal() +
    ggplot2::theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
  return(lineplot)
}

#' @title Quickly Create a Scatterplot
#' @description
#' Given two numeric variables from a data frame, the `easy_scatterplot()` function provides a simpler
#' way to create scatterplots without manually writing full ggplot2 code.
#' Users can customize the setting of the scatterplot by adding additional arguments.
#' @param dataset The data frame providing the data for the plot.
#' @param x The variable name to be used for the x-axis (the independent variable).
#' @param y The variable name to be used for the y-axis (the dependent variable).
#' @param color A categorical variable to color the points.
#' @param ... Additional ggplot2 arguments passed to `geom_point()`, such as `size`, `alpha`, etc.
#' @importFrom ggplot2 aes_string geom_point theme_minimal theme element_text
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
    ggplot2::theme_minimal() +
    ggplot2::theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

  return(scatterplot)

}

#' @title Quickly Create a Barplot
#' @description
#' Given one categorical variable from a data frame, the `easy_barplot()` function provides a simpler
#' way to create barplots without manually writing full ggplot2 code.
#' Users can customize the setting of the barplot by adding additional arguments.
#' @param dataset The data frame providing the data for the plot.
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

#' @title Quickly Create a Histogram
#' @description
#' Given one numeric variable from a data frame, the `easy_histogram()` function provides a simpler
#' way to create histograms without manually writing full ggplot2 code.
#' Users can customize the setting of the histogram by adding additional arguments.
#' @param dataset The data frame providing the data for the plot.
#' @param x The variable name to be used for the x-axis.
#' @param fill A categorical variable to fill the histogram.
#' @param ... Additional arguments passed to `geom_histogram()`, such as `size`, `alpha`, etc.
#' @importFrom ggplot2 aes_string geom_histogram theme_minimal theme element_text
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
    ggplot2::theme_minimal() +
    ggplot2::theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
  return(histogram)

}

#' @title Plot Helper
#' @description
#' Uses inserted dataset, x-value, and y-value to return a suggestion on what type of plot the user should make with the inserted variable types.
#' @param dataset The name of the data frame providing the data for the plot.
#' @param x The variable name to be used for the x-axis (the independent variable).
#' @param y The variable name to be used for the y-axis (the dependent variable).
#' @return A character string.
#' @examples
#' plot_helper(mpg, x = "cty", y = "hwy")
#' @export
plot_helper <- function(dataset, x, y) {
  if (!x %in% names(dataset)) {
    stop("The variable x is not in the dataset.")
  }
  if (!y %in% names(dataset)) {
    stop("The variable y is not in the dataset.")
  }

  type_x <- dataset[[x]]
  type_y <- dataset[[y]]

  if (is.numeric(type_x) && is.numeric(type_y)) {
    return("Since both the independent and dependent variables are continuous, the best plots to create would either be a scatterplot or a line plot. See help pages for easy_scatterplot() and easy_lineplot() for more information.")
  }

  if ((is.logical(type_x) || is.character(type_x)) && is.numeric(type_y)) {
    return("Since the independent variable is discrete and the dependent variable is continuous, the best plots to create would either be a boxplot or a bar graph. See help pages for easy_boxplot() and easy_barplot() for more information.")
  }

  return("No suitable plot suggestion found for the given variable types.")
}

