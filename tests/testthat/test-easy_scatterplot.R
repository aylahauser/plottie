test_that("easy_scatterplot returns a ggplot object", {
  plot <- easy_scatterplot(mtcars, x = "wt", y = "mpg")
  expect_s3_class(plot, "ggplot")
})

test_that("easy_scatterplot throws error when x is not in dataset", {
  expect_error(easy_scatterplot(mtcars, x = "nonexistent", y = "mpg"))
})
