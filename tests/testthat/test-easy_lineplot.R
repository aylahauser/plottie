test_that("easy_lineplot returns a ggplot object", {
  plot <- easy_lineplot(mtcars, x = "wt", y = "mpg", color = "cyl")
  expect_s3_class(plot, "ggplot")
})

test_that("easy_lineplot errors when x is not in dataset", {
  expect_error(easy_lineplot(mtcars, x = "nonexistent", y = "mpg", color = "cyl"))
})
