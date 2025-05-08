test_that("plot_helper returns scatter/line for numeric x and y", {
  result <- plot_helper(mtcars, x = "wt", y = "mpg")
  expect_match(result, "scatterplot|line plot")
})

test_that("plot_helper returns box/bar for categorical x and numeric y", {
  result <- plot_helper(iris, x = "Species", y = "Sepal.Length")
  expect_match(result, "boxplot|bar graph")
})
