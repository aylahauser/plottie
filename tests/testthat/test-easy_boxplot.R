test_that("easy_boxplot returns a ggplot object", {
  plot <- easy_boxplot(mtcars, x = "cyl", y = "mpg", color = "gear")
  expect_s3_class(plot, "ggplot")
})

test_that("easy_boxplot errors when y is not numeric", {
  expect_error(easy_boxplot(iris, x = "Species", y = "Species"))
})
