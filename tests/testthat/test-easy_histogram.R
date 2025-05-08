test_that("easy_histogram returns a ggplot object", {
  plot <- easy_histogram(mtcars, x = "mpg")
  expect_s3_class(plot, "ggplot")
})

test_that("easy_histogram errors when x is not numeric", {
  mtcars$cyl <- as.character(mtcars$cyl)
  expect_error(easy_histogram(mtcars, x = "cyl"))
})
